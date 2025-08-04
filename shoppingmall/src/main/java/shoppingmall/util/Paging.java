package shoppingmall.util;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@Data
public class Paging {
	private int totalRecord;
	private int pageSize=10;
	private int totalPage;
	private int blockSize=10;
	private int currentPage=1;
	private int firstPage;
	private int lastPage;
	private int curPos;
	private int num;
	
	public void init(List list, HttpServletRequest request) {
		totalRecord=list.size();
		totalPage = (int)Math.ceil((float)totalRecord/pageSize) ; 
		if(request.getParameter("currentPage") !=null) {
			currentPage= Integer.parseInt(request.getParameter("currentPage"));
		}
		firstPage = currentPage - (currentPage-1)%blockSize;
		lastPage  = firstPage + (blockSize-1);
		curPos = (currentPage-1)*pageSize;
		num = totalRecord-curPos;
		
		log.debug("totalRecord="+totalRecord);
		log.debug("totalPage="+totalPage);
		log.debug("currentPage="+currentPage);
		log.debug("firstPage="+firstPage);
		log.debug("lastPage="+lastPage);
		log.debug("curPos="+curPos);
		log.debug("num="+num);
	}
	
	public void init(int totalRecord, int currentPage) {
		this.totalRecord = totalRecord;
		totalPage = (int) Math.ceil((float) totalRecord / pageSize);
		this.currentPage = currentPage;
		firstPage = currentPage - (currentPage - 1) % blockSize;
		lastPage = firstPage + (blockSize - 1);
		curPos = (currentPage - 1) * pageSize;
		num = totalRecord - curPos;

		/*
		log.debug("totalRecord=" + totalRecord);
		log.debug("totalPage=" + totalPage);
		log.debug("currentPage=" + currentPage);
		log.debug("firstPage=" + firstPage);
		log.debug("lastPage=" + lastPage);
		log.debug("curPos=" + curPos);
		log.debug("num=" + num);
		*/
	}
}