package com.hanbit.team04.core.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hanbit.team04.core.mapper.BongBoardMapper;
import com.hanbit.team04.core.mapper.BongCommentMapper;
import com.hanbit.team04.core.mapper.BongFileMapper;
import com.hanbit.team04.core.vo.BongBoardVO;
import com.hanbit.team04.core.vo.BongCommentVO;
import com.hanbit.team04.core.vo.BongFileVO;

@Component
public class BongBoardDao {
	@Autowired
	private SqlSessionTemplate session;
	public void setSession(SqlSessionTemplate session) {
		this.session = session;
	}

	public int insert(BongBoardVO article){
		BongBoardMapper mapper = session.getMapper(BongBoardMapper.class);
		return mapper.insert(article);
	}
	public int update(BongBoardVO article){
		BongBoardMapper mapper = session.getMapper(BongBoardMapper.class);
		return mapper.update(article);
	}

	public int updateRe(BongBoardVO article){
		BongBoardMapper mapper = session.getMapper(BongBoardMapper.class);
		return mapper.updateRe(article);
	}

	public int updateReStep(BongBoardVO article){
		BongBoardMapper mapper = session.getMapper(BongBoardMapper.class);
		return mapper.updateReStep(article);
	}

	public int updateReadCount(int BongBoardVOId){
		BongBoardMapper mapper = session.getMapper(BongBoardMapper.class);
		return mapper.updateReadCount(BongBoardVOId);
	}
	public int delete(int BongBoardVOId){
		BongBoardMapper mapper = session.getMapper(BongBoardMapper.class);
		return mapper.delete(BongBoardVOId);
	}
	public int selectTotalCount(){
		BongBoardMapper mapper = session.getMapper(BongBoardMapper.class);
		return mapper.selectTotalArticleCount();
	}
	public BongBoardVO select(int BongBoardVOId){
		BongBoardMapper mapper = session.getMapper(BongBoardMapper.class);
		return mapper.select(BongBoardVOId);
	}
	public List<BongBoardVO> selectList(int startRow, int countPerPage){
		Map<String, Integer> paramMap = new HashMap<>();
		paramMap.put("startRow", startRow+1);
		paramMap.put("endRow", startRow+countPerPage);
		BongBoardMapper mapper = session.getMapper(BongBoardMapper.class);
		return mapper.selectList(paramMap);
	}

	public List<BongBoardVO> selectCurrentArticle(int currentArticleCount){
		BongBoardMapper mapper = session.getMapper(BongBoardMapper.class);
		return mapper.selectCurrentArticle(currentArticleCount);
	}
///////////////////////////////////////////////////////////////////////////////
	public int insertComment(BongCommentVO comment){
		BongCommentMapper mapper = session.getMapper(BongCommentMapper.class);
		return mapper.insertComment(comment);
	}
	public List<BongCommentVO> selectCommentList(int bId){
		BongCommentMapper mapper = session.getMapper(BongCommentMapper.class);
		return mapper.selectCommentList(bId);
	}
	public int selectCommentCount(int bId){
		BongCommentMapper mapper = session.getMapper(BongCommentMapper.class);
		return mapper.selectCommentCount(bId);
	}
	public String selectLastCommentWriter(int bId){
		BongCommentMapper mapper = session.getMapper(BongCommentMapper.class);
		return mapper.selectLastCommentWriter(bId);
	}
////////////////////////////////////////////////////////////////////////////////
	public int insertFile(BongFileVO fileInfo){
		BongFileMapper mapper = session.getMapper(BongFileMapper.class);
		return mapper.insert(fileInfo);
	}
	public BongFileVO selectFile(int bfId){
		BongFileMapper mapper = session.getMapper(BongFileMapper.class);
		return mapper.select(bfId);
	}
	public List<BongFileVO> selectFileList(int bId){
		BongFileMapper mapper = session.getMapper(BongFileMapper.class);
		return mapper.selectList(bId);
	}
}
