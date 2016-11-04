package com.hanbit.team04.core.mapper;

import java.util.List;

import com.hanbit.team04.core.vo.BongFileVO;

public interface BongFileMapper {
	public int insert(BongFileVO fileInfo);
	public BongFileVO select(int bfId);
	public List<BongFileVO> selectList(int bId);
}
