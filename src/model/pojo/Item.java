package model.pojo;

import java.lang.Thread.State;



public class Item {
	private int type1;//一位数字
	private int type2;//一位数字
	private int id;
	private int state;
	private String name;
	private int price;
	private int number;
	private String picture;
	
	public Item(int type1,int type2,int id,int state,String name,int price,int number, String picture) {
		// TODO Auto-generated constructor stub
		this.type1=type1;
		this.type2=type2;
		this.id=id;
		this.state=state;
		this.name=name;
		this.price=price;
		this.number=number;
		this.picture=picture;
	}
	public Item()
	{
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getType1() {
		return type1;
	}
	public void setType1(int type1) {
		this.type1 = type1;
	}
	public int getType2() {
		return type2;
	}
	public void setType2(int type2) {
		this.type2 = type2;
	}

	public void reduce()
	{
		this.number--;
	}
	
	public static void main(String[] args) {
		Item c1=new Item();
		Item c2=new Item();
		c1.setId(1101);
		c1.setName("dd");
		
		c2.setId(1101);
		c2.setName("dd");
		System.out.println("是否相同"+c1.equals(c2));
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return this.getId()+this.getName().hashCode();

	}
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		if(this==obj)
		{
			return true;
		}
		if(obj instanceof Item)
		{
			Item i =(Item)obj;
			if(this.getId()==i.getId() && this.getName().equals(i.getName()))
			{
				return true;
			}
			else {
					return false;
			}
		}
		else {
					return false;
			}
		}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
}
