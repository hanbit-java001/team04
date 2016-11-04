package com.hanbit.team04.core.mapper;

import java.util.List;

import com.hanbit.team04.core.vo.BongCommentVO;

public interface BongCommentMapper {
	public int insertComment(BongCommentVO comment);
	public List<BongCommentVO> selectCommentList(int bId);
	public int selectCommentCount(int bId);
	public String selectLastCommentWriter(int bId);
}
