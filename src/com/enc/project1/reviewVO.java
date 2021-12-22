package com.enc.project1;

public class reviewVO {
	private int review_num;	
	private int usernum;	
	private int learn_num;	
	private String review_article;	
	private String review_date;	
	private int review_watch;
	
	public reviewVO(){
		
	}
	public reviewVO(int review_num, int usernum, int learn_num, String review_article, String review_date, int review_watch){
		this.review_num=review_num;
		this.usernum=usernum;
		this.learn_num=learn_num;
		this.review_article=review_article;
		this.review_date=review_date;
		this.review_watch=review_watch;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public int getLearn_num() {
		return learn_num;
	}
	public void setLearn_num(int learn_num) {
		this.learn_num = learn_num;
	}
	public String getReview_article() {
		return review_article;
	}
	public void setReview_article(String review_article) {
		this.review_article = review_article;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public int getReview_watch() {
		return review_watch;
	}
	public void setReview_watch(int review_watch) {
		this.review_watch = review_watch;
	}
}
