package com.hanbit.team04.core.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.hanbit.team04.core.dao.BongBoardDao;
import com.hanbit.team04.core.vo.BongBoardPage;
import com.hanbit.team04.core.vo.BongBoardVO;
import com.hanbit.team04.core.vo.BongCommentVO;
import com.hanbit.team04.core.vo.BongFileVO;

@Component
public class BoardService {
	@Autowired
	private BongBoardDao dao;
	public void setDao(BongBoardDao dao) {
		this.dao = dao;
	}

	public BongBoardPage makePage(int requestPage){

		final int COUNT_PER_PAGE=3;
		int messageTotalCount = dao.selectTotalCount();
		if(messageTotalCount==0){
			return new BongBoardPage();
		}
		int startRow = (requestPage-1)*COUNT_PER_PAGE;
		List<BongBoardVO> articleList = dao.selectList(startRow, COUNT_PER_PAGE);

		for(BongBoardVO article:articleList){
			article.setCommentCount(dao.selectCommentCount(article.getbId()));
			article.setLastCommentWriter(dao.selectLastCommentWriter(article.getbId()));
		}

		int pageTotalCount =  messageTotalCount/COUNT_PER_PAGE;
		if(messageTotalCount%COUNT_PER_PAGE!=0){
			pageTotalCount++;
		}
		int startPage = (requestPage-1)/10*10+1;
		int endPage = startPage+9;
		if(endPage>pageTotalCount){
			endPage=pageTotalCount;
		}

		return new BongBoardPage(articleList, requestPage, startPage, endPage, pageTotalCount);

	}

	public int writeArticle(BongBoardVO article){
		if(dao.insert(article)>0){
			article.setbRef(article.getbId());
			article.setbReStep(0);
			article.setbReLevel(0);
			dao.updateRe(article);

			if (article.getMyFiles() != null && article.getMyFiles().size() > 0) {
				String savePath = "c:/uploaded_file";

				File dir = new File(savePath);
				if(!dir.exists())
					dir.mkdirs();

				for (MultipartFile file : article.getMyFiles()) {
					File savedFile = new File(savePath + "/" + new Random().nextInt(1000000));
					try {
						file.transferTo(savedFile);

						BongFileVO fileInfo = new BongFileVO();

						fileInfo.setBfOriginalName(file.getOriginalFilename());
						fileInfo.setBfSavedPath(savedFile.getAbsolutePath());
						fileInfo.setbId(article.getbId());

						dao.insertFile(fileInfo);

						System.out.println("-------upload-------");
						System.out.println("�����̸� : " + file.getOriginalFilename());
						System.out.println("������ : " + savedFile.getAbsolutePath());
						System.out.println("--------------------");

					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			} else {
				System.out.println("���� ����");
			}
		}
		return article.getbId();
	}

	public int writeReply(BongBoardVO article, int parentId){
		BongBoardVO parent = dao.select(parentId);
		article.setbRef(parent.getbRef());
		article.setbReLevel(parent.getbReLevel()+1);
		article.setbReStep(parent.getbReStep());
		dao.updateReStep(article);
		article.setbReStep(parent.getbReStep()+1);
		dao.insert(article);
		return article.getbId();
	}

	public BongBoardVO readArticle(int bId, boolean rc){
		BongBoardVO article = null;
		if(rc==true){
			dao.updateReadCount(bId);
		}
		article = dao.select(bId);
		article.setCommentList(dao.selectCommentList(bId));

		article.setFileInfoList(dao.selectFileList(bId));
		return article;
	}

	public int modify(BongBoardVO n_article){
		BongBoardVO origin = dao.select(n_article.getbId());
		int result=0;

		if(origin!=null && origin.getbPassword().equals(n_article.getbPassword())){
			result=dao.update(n_article);
		}
		return result;
	}

	public int delete(int articleId, String loginId){
		BongBoardVO origin = dao.select(articleId);
		int result=0;
		if(origin.getbWriter().equals(loginId)){
			result = dao.delete(articleId);
		}
		return result;
	}

	public int writeComment(BongCommentVO comment){
		return dao.insertComment(comment);
	}

	public BongFileVO readFileInfo(int bfId){
		return dao.selectFile(bfId);
	}

	public List<BongBoardVO> makeCurrentArticleList(){
		int currentArticleCount = 3;
		return dao.selectCurrentArticle(currentArticleCount);
	}
}
