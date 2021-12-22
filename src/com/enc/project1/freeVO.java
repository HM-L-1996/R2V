package com.enc.project1;

public class freeVO {
	private int free_num;
	private int usernum;	
	private String free_title;	
	private String free_article;	
	private String free_date;	
	private int free_watch;
	public freeVO(){
		
	}
	public freeVO(int free_num, int usernum, String free_title, String free_article, String free_date, int free_watch){
		this.free_num=free_num;
		this.usernum=usernum;
		this.free_title=free_title;
		this.free_article=free_article;
		this.free_date=free_date;
		this.free_watch=free_watch;
	}
	public int getFree_num() {
		return free_num;
	}
	public void setFree_num(int free_num) {
		this.free_num = free_num;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public String getFree_title() {
		return free_title;
	}
	public void setFree_title(String free_title) {
		this.free_title = free_title;
	}
	public String getFree_article() {
		return free_article;
	}
	public void setFree_article(String free_article) {
		this.free_article = free_article;
	}
	public String getFree_date() {
		return free_date;
	}
	public void setFree_date(String free_date) {
		this.free_date = free_date;
	}
	public int getFree_watch() {
		return free_watch;
	}
	public void setFree_watch(int free_watch) {
		this.free_watch = free_watch;
	}
}
