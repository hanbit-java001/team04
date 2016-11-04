package com.hanbit.team04.core.mapper;

import java.util.List;
import java.util.Map;

import com.hanbit.team04.core.vo.BongBoardVO;

public interface BongBoardMapper {
	public int selectTotalArticleCount();
	public int insert(BongBoardVO article);
	public int update(BongBoardVO article);
	public BongBoardVO select(int articleId);
	public int delete(int articleId);
	public List<BongBoardVO> selectList(Map<String, Integer> paramMap);//���������� ������ �� ��ȸ
	public int updateReadCount(int articleId);
	
	public List<BongBoardVO> selectCurrentArticle(int currentArticleCount);
	
	public int updateRe(BongBoardVO article);
	public int updateReStep(BongBoardVO article);
	
}
