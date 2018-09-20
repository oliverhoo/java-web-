package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import javax.swing.Spring;







import model.pojo.Cart;
import model.pojo.Item;

public class ItemsDAO {
	public static int[] randomCommon(int min, int max, int n){ 
		//在min max 范围之内抽取n个重复的数字
		  if (n > (max - min + 1) || max < min) { 
		      return null; 
		    } 
		  int[] result = new int[n]; 
		  int count = 0; 
		  while(count < n) { 
		    int num = (int) (Math.random() * (max - min)) + min; 
		    boolean flag = true; 
		    for (int j = 0; j < n; j++) { 
		      if(num == result[j]){ 
		        flag = false; 
		        break; 
		      } 
		    } 
		    if(flag){ 
		      result[count] = num; 
		      count++; 
		    } 
		  } 
		  return result; 
		}

	public ArrayList<Item> getatcivityItem(String[] a)
	//String[] a 是今天排行榜上 商品的id
	//这些id 是随机从数据库内提取
	{
		
		ArrayList<Item> activitylist =new ArrayList<Item>();
		for(int i=0;i<a.length;i++)
		{
			Item item=getItemById(Integer.parseInt(a[i]));
			activitylist.add(item);
		}
		
		return activitylist;
	}
	
	public Item getItemById(int idInt)//根据id号获取商品信息
	{
		String id=Integer.toString(idInt);
		int idString= Integer.parseInt(id.substring(0, 1));
		int  idString2=Integer.parseInt(id.substring(1, 2));
		DB dBhelperDb =new DB();

		ResultSet rs =null;
		try {
			dBhelperDb.getConn();
			String sql ="select * from goods where sku=?";
			dBhelperDb.cPtmt(sql, id);
			rs=dBhelperDb.queryDb();
			
			if (rs.next()) {
				Item item =new Item();
				item.setType1(idString);
				item.setType2(idString2);
				item.setId(rs.getInt("sku"));
				item.setName(rs.getString("name"));
				item.setNumber(rs.getInt("stock"));
				item.setPicture(rs.getString("picture"));
				item.setPrice(rs.getInt("money"));
				item.setState(rs.getInt("state"));
				return item;
			}
			else{
				return null;
			}
		} catch (Exception ex) {
			// TODO: handle exception
			ex.printStackTrace();
			return null;
		}finally{
			dBhelperDb.closeConn();
			dBhelperDb.closePtmt();
			dBhelperDb.closeRs(rs);
		}
	}
	
	
	public ArrayList<Item> getViewList(String list)//获得cookie内容
	{
		ArrayList<Item> itemlist =new ArrayList<Item>();
		int iCount =5;
		if(list!=null && list.length()>0)
		{
			String[] arr =list.split(",");
			if(arr.length>=5)
			{
				for (int i =arr.length-1; i>=arr.length-iCount; i--)
				{
					itemlist.add(getItemById(Integer.parseInt(arr[i])));
				}
			}
			else 
			{
				for(int i=arr.length-1;i>=0;i--)
				{
					itemlist.add(getItemById(Integer.parseInt(arr[i])));
				}
			}
			return itemlist;
		}
		else {
			return null;
		}

	}
	
	public boolean CreateOder(Cart cart,String userId)
	//购物车结算
	{	
		DB dbhelper =new DB();
		String address=null;
		String orderid=dbhelper.getOrderId(userId);
		String skU_idsString=",";
		String skU_nameString=",";
		String sKU_moneyString=",";
		String sku_numberString=",";
		String sqlString2="select address1 from address where user_id=?";
		dbhelper.cPtmt(sqlString2,userId);
		ResultSet rs=dbhelper.queryDb();
		try {
			while (rs.next()) {
				address=rs.getString("address1");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		Set<Item> keys =cart.getGoods().keySet();
		Iterator<Item> it=keys.iterator();
		while(it.hasNext())
		{
			Item i=it.next();
			skU_idsString=skU_idsString+i.getId()+",";
			skU_nameString=skU_nameString+i.getName()+",";
			sKU_moneyString=sKU_moneyString+i.getPrice()+",";
			sku_numberString=sku_numberString+i.getNumber()+",";
		}

		dbhelper.getConn();
		String sql="insert into orders values(?,?,?,?,?,?,?,?,?)";
		dbhelper.cPtmt(sql,orderid,userId,skU_idsString,skU_nameString,sku_numberString,sKU_moneyString,"进行",cart.getTotalPrice(),address);
		try {
			dbhelper.updateDb();
			System.out.println("订单产生成功");
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("订单产生失败");
		}
		return false;
	}
}
