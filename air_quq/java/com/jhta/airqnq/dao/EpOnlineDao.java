package com.jhta.airqnq.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.AdminInfoVo;
import com.jhta.airqnq.vo.ChatLogVo;
import com.jhta.airqnq.vo.ReviewVo;
import com.jhta.airqnq.vo.SliderVo;

@Repository
public class EpOnlineDao {

	@Autowired
	private SqlSessionTemplate sql;

	private final String NAMESPACE = "com.jhta.mybatis.mapper.epOnlineMapper";

	public SliderVo outslider(int hinum) {
		return sql.selectOne(NAMESPACE + ".outslider", hinum);
	}

	public List<SliderVo> inslider(int hinum) {
		return sql.selectList(NAMESPACE + ".inslider", hinum);
	}

	public List<SliderVo> inSeoul() {
		return sql.selectList(NAMESPACE + ".inSeoul");
	}

	public List<SliderVo> within6() {
		return sql.selectList(NAMESPACE + ".within6");
	}

	public List<SliderVo> cheap() {
		return sql.selectList(NAMESPACE + ".cheap");
	}

	public List<SliderVo> beststar() {
		return sql.selectList(NAMESPACE + ".beststar");
	}

	public int findRoom(HashMap<String, Object> hash) {
		return sql.selectOne(NAMESPACE + ".findRoom", hash);
	}

	public List<ChatLogVo> chatlog(int n) {
		return sql.selectList(NAMESPACE + ".chatLog", n);
	}

	public int addChat(HashMap<String, Object> hash) {
		return sql.insert(NAMESPACE + ".addChat", hash);
	}

	public int addcontent(HashMap<String, Object> hash) {
		return sql.insert(NAMESPACE + ".addcontent", hash);
	}

	public List<AdminInfoVo> hostinfo(HashMap<String, Object> hash) {
		return sql.selectList(NAMESPACE + ".hostInfo", hash);
	}

	public List<AdminInfoVo> userinfo(HashMap<String, Object> hash) {
		return sql.selectList(NAMESPACE + ".userInfo", hash);
	}

	public int count(HashMap<String, Object> hash) {
		return sql.selectOne(NAMESPACE + ".count", hash);
	}

	public List<SliderVo> randInfo() {
		return sql.selectList(NAMESPACE + ".randInfo");
	}

	public List<ReviewVo> ReviewSelect(int hinum) {
		return sql.selectList(NAMESPACE + ".ReviewSelect", hinum);
	}

	public int maxChatNo() {
		return sql.selectOne(NAMESPACE + ".maxChatNo");
	}
}