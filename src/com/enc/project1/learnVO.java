package com.enc.project1;

public class learnVO {
	private int learn_num;
	private String learn_title;
	private String learn_teacher;
	private int price;
	private int sale_price;
	private String image_link;
	private String learn_link;
	public learnVO() {	}
	public learnVO( int learn_num,String learn_title,String learn_teacher,String image_link,String learn_link,int sale_price,int price){
		this.learn_num = learn_num;
		this.learn_title = learn_title;
		this.learn_teacher = learn_teacher;
		this.image_link = image_link;
		this.learn_link = learn_link;
		this.sale_price = sale_price;
		this.price = price;
		
	}
	public int getLearn_num() {
		return learn_num;
	}
	public void setLearn_num(int learn_num) {
		this.learn_num = learn_num;
	}
	public String getLearn_title() {
		return learn_title;
	}
	public void setLearn_title(String learn_title) {
		this.learn_title = learn_title;
	}
	public String getLearn_teacher() {
		return learn_teacher;
	}
	public void setLearn_teacher(String learn_teacher) {
		this.learn_teacher = learn_teacher;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSale_price() {
		return sale_price;
	}
	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}
	public String getImage_link() {
		return image_link;
	}
	public void setImage_link(String image_link) {
		this.image_link = image_link;
	}
	public String getLearn_link() {
		return learn_link;
	}
	public void setLearn_link(String learn_link) {
		this.learn_link = learn_link;
	}
}
