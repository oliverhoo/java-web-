package model.pojo;

import java.awt.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public class Cart {
	private HashMap<Item, Integer> goods;
	private double totalPrice;
	
	
	public Cart()
	{
		goods =new HashMap<Item, Integer>();
		totalPrice =0.0;
	}

	public HashMap<Item, Integer> getGoods() {
		return goods;
	}

	public void setGoods(HashMap<Item, Integer> goods) {
		this.goods = goods;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	/*public boolean addGoodsInCart(Items item,int number)
	{
		if(goods.containsKey(item))
		{
			goods.put(item,goods.get(item)+number);
		}
		else {
			goods.put(item, number);
		}
		caalTotalPrice();
		return true;
	}*/
	public boolean addGoodsInCart(Item item ,int number)
	//添加进入购物车 无法解决equals 方法不被调用
	{
		
		if(goods.containsKey(item))
		{
			System.out.println("执行相加");
			goods.put(item, goods.get(item)+number);
		}
		else
		{
			goods.put(item, number);
		}
		caalTotalPrice(); //重新计算购物车的总金额
		return true;
	}
	public boolean removeGoodsFromCart(Item item)
//	移除出购物车
	{
		
		try {
			goods.remove(item);
			System.out.println("删除成功3");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("就是删不掉！");
		}
		
		caalTotalPrice();
		return true;
	}
	public double caalTotalPrice()
	//算出总价格
	{
		double sum=0.0;
		//遍历hasmap
		Set<Item> keys =goods.keySet();
		Iterator<Item> it=keys.iterator();
		while(it.hasNext())
		{
			Item i=it.next();
			sum+=i.getPrice()*goods.get(i);
		}
		this.setTotalPrice(sum);
		return this.getTotalPrice();
	}
	public static void main(String[] args) {
		Cart cart=new Cart();
		Item c1=new Item();
		Item c2=new Item();
		c1.setId(1101);
		c1.setName("dd");
		c1.setNumber(2);
		c2.setId(1101);
		c2.setName("dd");
		c2.setNumber(5);
		HashMap<Item, Integer> aList=new HashMap<Item, Integer>();
		aList.put(c1, 2);
		
		System.out.println("是否相同"+aList.containsKey(c2));
	}
	
}
