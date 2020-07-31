package com.jhta.airqnq.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.airqnq.dao.ConvenDao;
import com.jhta.airqnq.dao.HostInfoDao;
import com.jhta.airqnq.dao.HostInfoImageDao;
import com.jhta.airqnq.dao.HouseSearchDao;
import com.jhta.airqnq.vo.ConvenDetailVo;
import com.jhta.airqnq.vo.HouseImgVo;
import com.jhta.airqnq.vo.HouseInfoVo;
import com.jhta.airqnq.vo.HouseSearchVo;
import com.jhta.airqnq.vo.MainHouseInfoVo;

@Service
public class HostInfoService {
	@Autowired
	private HostInfoDao hostInfoDao;
	@Autowired
	private HostInfoImageDao hostInfoImageDao;
	@Autowired
	private HouseSearchDao houstSearchDao;
	@Autowired
	private ConvenDao convenDao;
	
	//하우스번호구하기
	public int selectHouseNumber(int menum) {
		return hostInfoDao.selectHouseNumber(menum);
	}
	
	public int insertHouseImg(HouseImgVo vo) {
		return hostInfoImageDao.insertHouseImg(vo);
	}
	
	public int insertHouse(HouseInfoVo vo) {
		return hostInfoDao.insertHouse(vo);
	}
	
	
	//하우스 정보 리스트 가져오기
	public List<HouseInfoVo> getHouseInfoList(HouseInfoVo vo){
		return hostInfoDao.getHouseInfoList(vo);
	}

	//하우스 이미지 가져오기
	public String getHouseImg(int hinum) {
		return hostInfoDao.getHouseImg(hinum);
	}
	
	public List<MainHouseInfoVo> getMainHouseInfoList(HouseSearchVo vo){
		return hostInfoDao.getMainHouseInfoList(vo);
	}
	
	//검색된 하우스 전체 글개수
	public int getSearchCount(HouseSearchVo vo) {
		return houstSearchDao.getSearchCount(vo);
	}
	
	//모든 하우스 전체글 개수
	public int getSearchCount() {
		return houstSearchDao.getSearchCount();
	}
	
	
	//트렌젝션 처리
	public int insert(int menum, String pool, String paking, String wifi, String washer, String kitchen, String etc, HouseInfoVo hvo,
			HttpSession session, MultipartFile[] file1) {
		
		int result = insertHouse(hvo);
		
		if(result > 0) {
			
			//하우스 번호 가져오기
			int hinum = selectHouseNumber(menum);
			System.out.println(hinum + "<<<<<<<<<<<<<<<<<<< 하우스번호");
			
			convenDao.insertConven(hinum);
			int conum = convenDao.selectConvenNumber(hinum);
			ConvenDetailVo vo = new ConvenDetailVo(0, conum, Integer.parseInt(pool), Integer.parseInt(paking),
					Integer.parseInt(wifi), Integer.parseInt(washer), Integer.parseInt(kitchen), etc);
			
			insertConvenDetail(vo);
	
			
			int cnt = 1;
		
		
		
			for(MultipartFile f : file1) {
				//전송된 파일명
				String orgfilename = f.getOriginalFilename();
				
				//실제 저장할 파일명(중복되지 않도록)
				String savefileName = UUID.randomUUID() + "_" + orgfilename;
//				//업로드할 폴더 경로 얻어오기
				String uploadPath = session.getServletContext().getRealPath("resources/img/house_img");
				
				System.out.println(uploadPath);
				try {
//					//전송된 파일을 읽어오는 스트림 
					InputStream fis = f.getInputStream(); 
					
//					//전송된 파일을 서버에 복사(업로드) 하기위한 출력 스트림
					FileOutputStream fos = new FileOutputStream(uploadPath + "//" + savefileName);
//					
//					//파일복사하기
					FileCopyUtils.copy(fis, fos);
					fis.close();
					fos.close();
					
//					//실제 DB에 넣기
					HouseImgVo ivo = new HouseImgVo(0, hinum, savefileName, "n", cnt);
					insertHouseImg(ivo);
					System.out.println("DB에 이미지 등록됨");
					
					cnt++;
					
				} catch(IOException io) {
					System.out.println(io.getMessage());
				}
			}
		} else {
			System.out.println("호스트 등록 에러!");
		}
		
		return result;
	}
	
	public int insertConven(int hinum) {
		return convenDao.insertConven(hinum);
	}
	
	public int insertConvenDetail(ConvenDetailVo vo) {
		return convenDao.insertConvenDetail(vo);
	}
	
	public int selectConvenNumber(int hinum) {
		return convenDao.selectConvenNumber(hinum);
	}
	
	//모든 하우스정보 검색
	public List<HouseInfoVo> selectHouseAll(HashMap<String, Object> map){
		return hostInfoDao.selectHouseAll(map);
	}
}
