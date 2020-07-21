package com.jhta.airqnq.pageUtil;

public class PageUtilForMySql {
	private int pageNum;
	private int startRow;
	private int totalPageCount;
	private int startPageNum;
	private int endPageNum;
	private int rowBlockCount;
	private int pageBlockCount;
	private int totalRowCount;
	
	public PageUtilForMySql() {}
	
	public PageUtilForMySql(int pageNum,int totalRowCount,
			int rowBlockCount,int pageBlockCount) {
		this.pageNum=pageNum;//현재페이지넘버
		this.totalRowCount=totalRowCount;//총 글 갯수
		this.rowBlockCount=rowBlockCount;//한페이지에 보여질 글의 갯수-받
		this.pageBlockCount=pageBlockCount;//한페이지에 보여질 페이지의 갯수-받
		startRow=(pageNum-1)*rowBlockCount;//시작행
		totalPageCount=(int)Math.ceil(totalRowCount/(double)rowBlockCount);//전체페이지갯수
		startPageNum=(pageNum-1)/pageBlockCount*pageBlockCount+1;//시작페이지 숫자
		endPageNum=startPageNum+pageBlockCount-1;//끝페이지 숫자
		if(totalPageCount<endPageNum) {
			endPageNum=totalPageCount; 
		}
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}

	public int getEndPageNum() {
		return endPageNum;
	}

	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}

	public int getRowBlockCount() {
		return rowBlockCount;
	}

	public void setRowBlockCount(int rowBlockCount) {
		this.rowBlockCount = rowBlockCount;
	}

	public int getPageBlockCount() {
		return pageBlockCount;
	}

	public void setPageBlockCount(int pageBlockCount) {
		this.pageBlockCount = pageBlockCount;
	}

	public int getTotalRowCount() {
		return totalRowCount;
	}

	public void setTotalRowCount(int totalRowCount) {
		this.totalRowCount = totalRowCount;
	}
	
}
