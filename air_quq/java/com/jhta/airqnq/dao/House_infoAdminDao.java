package com.jhta.airqnq.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.Apply_infoVo;
import com.jhta.airqnq.vo.HouseInfoVo;

@Repository
public class House_infoAdminDao {
	@Autowired
	private SqlSessionTemplate sqlsessiontemplate;
	
	private final String NAMESPACE="com.jhta.airqnq.mapper.HostInfoMapper";
	
	public List<HouseInfoVo> HouseSelect(HashMap<String, Object> map) {
		return sqlsessiontemplate.selectList(NAMESPACE+".hostselectpaging", map);
	}
	
	public int HouseCnt(HashMap<String, Object> map) {
		return sqlsessiontemplate.selectOne(NAMESPACE+".hostcnt", map);
	}
	
	public HouseInfoVo HostOne(int hinum) {
		return sqlsessiontemplate.selectOne(NAMESPACE+".hostone", hinum);
	}
	
	public String HouseImgOne(HashMap<String, Object> map) {
		return sqlsessiontemplate.selectOne(NAMESPACE+".houseimg", map);
	}
	
	public List<String> HouseImglist(HashMap<String, Object> map){
		return sqlsessiontemplate.selectList(NAMESPACE+".houseimg", map);
	}
	
	public Apply_infoVo HinumSelect(int hinum) {
		return sqlsessiontemplate.selectOne(NAMESPACE+".applyselect", hinum);
	}
	
	public List<HouseInfoVo> Okhouseinfo(){
		return sqlsessiontemplate.selectList(NAMESPACE+".okhouseinfo");
	}
	
	

}
