package com.enc.project1;

public class noticeVO {
	private int notice_num;
	private String notice_title;
	private String notice_article;
	private String notice_date;	
	private int notice_watch;
	public noticeVO(){
		
	}
	public noticeVO(
			int notice_num,String notice_title,String notice_article,String notice_date,int notice_watch
			){
		this.notice_num=notice_num;
		this.notice_title=notice_title;
		this.notice_article=notice_article;
		this.notice_date=notice_date;
		this.notice_watch=notice_watch;	
	}
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_article() {
		return notice_article;
	}
	public void setNotice_article(String notice_article) {
		this.notice_article = notice_article;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	public int getNotice_watch() {
		return notice_watch;
	}
	public void setNotice_watch(int notice_watch) {
		this.notice_watch = notice_watch;
	}
	
}
