package model.DAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.pojo.orders;
import model.*;

public class orderdao {

	public String[] getAlladdress(String userId)
	//通过用户id获取所有的地址信息
	{
		if(!ifAddress(userId))
		{
			insertAddress(userId, "空", "空", "空", "空", "空", "空");
		}
		String [] address=new String[6];
		DB dBhelperDb =new DB();
		dBhelperDb.getConn();
		String Sql="select * from address where user_id=?";
		dBhelperDb.cPtmt(Sql, userId);
		ResultSet rSet=dBhelperDb.queryDb();
		try {
			while (rSet.next()) {
				address[0]=rSet.getString("address1");
				address[1]=rSet.getString("address2");
				address[2]=rSet.getString("address3");
				address[3]=rSet.getString("address4");
				address[4]=rSet.getString("address5");
				address[5]=rSet.getString("address6");
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return address;
	}
	public boolean changeAddress(String userid,String type,String change)
	// type 是选择改变哪个值 change 新的地址
	{
		if(!ifAddress(userid))
		{
			insertAddress(userid, "空", "空", "空", "空", "空", "空");
		}
			DB dBhelperDb =new DB();
			dBhelperDb.getConn();
			String Sql="update address set "+type+"='"+change+"' where user_id ='"+userid+"'";
			dBhelperDb.cPtmt(Sql);
			System.out.println(Sql+type+change+userid);
			if(dBhelperDb.updateDb()==1)
			{
				return true;
			}
			return false;
	}
	
	public boolean insertAddress(String id,String a,String b,String c,String d,String e,String f)
	{
	//用于插入地址
		DB dBhelperDb =new DB();
		dBhelperDb.getConn();
		if(ifAddress(id))
		{
			String Sql=" insert into address values(?,?,?,?,?,?,?)";
			dBhelperDb.cPtmt(Sql,id,a,b,c,d,e,f);
			try {
				dBhelperDb.updateDb();
			} catch (Exception ex) {
				// TODO: handle exception
				ex.printStackTrace();
				System.out.println("插入地址出错");
			}
			return true;
		}
		return false;
	}
	public boolean ifAddress(String id)
	//用于判断用户是否创造了地址表
	{
		DB dBhelperDb =new DB();
		dBhelperDb.getConn();
		String sqlString="select * from address";
		dBhelperDb.cPtmt(sqlString);
		try {
			ResultSet rSet=dBhelperDb.queryDb();
			while (rSet.next()) {
				String useridString=rSet.getString("user_id");
				if(id.equals(useridString))
				{
					return true;
				}
				
			}
		} catch (Exception ex) {
			// TODO: handle exception
			ex.printStackTrace();
		}
		return false;
	}
	public orders getAddress(String orderId)//根据OraderID查询地址
	{
		DB dBhelperDb =new DB();
		ResultSet rs =null;
		try {
			dBhelperDb.getConn();
			String sql ="select order_address from order where order_id=?";
			dBhelperDb.cPtmt(sql, orderId);
			rs=dBhelperDb.queryDb();
			
			if (rs.next()) {
				orders order1 =new orders();
				String raddress=rs.getString("order_address");
				order1.setOrder_address(raddress);
				return order1;
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
	public orders getordersById(String orderId)//根据ID查询信息
	{
		DB dBhelperDb =new DB();
		ResultSet rs =null;
		try {
			dBhelperDb.getConn();
			String sql ="select * from orders where order_id=?";
			dBhelperDb.cPtmt(sql, orderId);
			rs=dBhelperDb.queryDb();
			
			if (rs.next()) {
				orders order1=new orders();
				
				String order_id=rs.getString("order_id");
				String USER_id=rs.getString("USER_id");
				String SKU_id=rs.getString("SKU_id");
				String SKU_name=rs.getString("SKU_name");
				String SKU_number=rs.getString("SKU_number");
				String SKU_MONEY=rs.getString("SKU_MONGEY");
				String order_sate=rs.getString("order_sate");
				String SUN_MONEY=rs.getString("SUN_MONEY");
				String order_address=rs.getString("order_address");
				
				
				order1.setOrder_id(order_id);
				order1.setUSER_id(USER_id);
				order1.setSKU_id(SKU_id);
				order1.setSKU_name(SKU_name);
				order1.setSKU_number(SKU_number);
				order1.setSUN_MONEY(SKU_MONEY);
				order1.setOrder_sate(order_sate);
				order1.setSUN_MONEY(SUN_MONEY);
				order1.setOrder_address(order_address);
				
				
				return order1;
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

	
	public ArrayList<orders> selectAllorder() {//查询订单所有信息
		ArrayList<orders> orderss = new ArrayList<orders>();
		DB dbhelper=new DB();
		dbhelper.getConn();
		String sql="select * FROM jaja.orders";
		dbhelper.cPtmt(sql);
		ResultSet rs=dbhelper.queryDb();
		try {
			while(rs.next()){
				
				orders order1=new orders();
				
				String order_id=rs.getString("order_id");
				String USER_id=rs.getString("USER_id");
				String SKU_id=rs.getString("SKU_id");
				String SKU_name=rs.getString("SKU_name");
				String SKU_number=rs.getString("SKU_number");
				String SKU_MONGEY=rs.getString("SKU_MONGEY");
				String order_sate=rs.getString("order_sate");
				String SUN_MONEY=rs.getString("SUN_MONEY");
				String order_address=rs.getString("order_address");
				
				
				order1.setOrder_id(order_id);
				order1.setUSER_id(USER_id);
				order1.setSKU_id(SKU_id);
				order1.setSKU_name(SKU_name);
				order1.setSKU_number(SKU_number);
				order1.setSKU_MONGEY(SKU_MONGEY);
				order1.setOrder_sate(order_sate);
				order1.setSUN_MONEY(SUN_MONEY);
				order1.setOrder_address(order_address);
				
				orderss.add(order1);
				
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			dbhelper.closePtmt();
			dbhelper.closeConn();
			dbhelper.closeRs(rs);
		}
		return orderss;	
	}
	public int deleteorder(String orderId) {
		
		DB dbhelper=new DB();//根据ID删除
		dbhelper.getConn();
		String sql = "delete from jaja.orders where orderId=?";
		dbhelper.cPtmt(sql,orderId);
		int result = dbhelper.updateDb();
		dbhelper.closeConn();
		return result;
	}
	
	public int insertOrder(orders orderr) {
		int result=0;//插入信息
		DB dbhelper=new DB();
		dbhelper.getConn();
		String sql="insert into  values('"+orderr.getOrder_id()+"'," +
				"'"+orderr.getUSER_id()+"','"+orderr.getSKU_id()+"','"+orderr.getSKU_name()+"','"+orderr.getSKU_number()+"','"+orderr.getSKU_MONGEY()+"','"+orderr.getOrder_sate()+"','"+orderr.getSUN_MONEY()+"'," +
						"'"+orderr.getOrder_address()+"')";
		dbhelper.cPtmt(sql);
		result=dbhelper.updateDb();
		dbhelper.closeConn();
		return result;
	}
}
