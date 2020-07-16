package com.jhta.airqnq.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.ChatLogVo;
import com.jhta.airqnq.vo.SliderVo;

@Repository
public class EpOnlineDao {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	private final String NAMESPACE ="com.jhta.mybatis.mapper.epOnlineMapper";
	
	public List<SliderVo> outslider(){
		return sql.selectList(NAMESPACE+".outslider");
	}
	public SliderVo inslider(int hinum){
		return sql.selectOne(NAMESPACE+".inslider",hinum);
	}
	public List<SliderVo> inSeoul(){ 
		return sql.selectList(NAMESPACE+".inSeoul");
	}
	public List<SliderVo> within6(){
		return sql.selectList(NAMESPACE+".within6");
	}
	public List<SliderVo> cheap(){
		return sql.selectList(NAMESPACE+".cheap");
	}
	public List<SliderVo> beststar(){
		return sql.selectList(NAMESPACE+".beststar");
	}
	public int findRoom(HashMap<String, Object> hash) {
		System.out.println(sql.selectOne(NAMESPACE+".findRoom",hash)+"값은?");
		return sql.selectOne(NAMESPACE+".findRoom",hash);
	}
	public List<ChatLogVo> chatlog(int number){
		return sql.selectList(NAMESPACE+".chatLog",number);
	}
	public int addChat(HashMap<String, Object> hash) {
		return sql.insert(NAMESPACE+".addChat",hash);
	}
}
