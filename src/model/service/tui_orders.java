package model.service;

import java.sql.ResultSet;

import javax.servlet.http.HttpSession;


import model.DAO.DB;
import model.pojo.both_orderss;

public class tui_orders {
	public int main(HttpSession session) {
		DB as=new DB();
		as.getConn();
		ResultSet rs=null;
		try {
			String sql="select orders.order_id,USER_login.name from orders,USER_login where orders.order_sate='待退' and orders.user_id=USER_login.user_id";
			as.cPtmt(sql);
			rs=as.queryDb();
			int i=0;
			while(rs.next())
			{
				System.out.println("404");
				both_orderss ss=new both_orderss();
				ss.setorder_id(rs.getString("order_id"));
				ss.setname(rs.getString("name"));
				session.setAttribute("tui_orders_"+i,ss);
				System.out.println(rs.getString("order_id"));
				i++;
			}
			session.setAttribute("tui_orders_ii",i);
			System.out.println(i);
			as.closePtmt();
			as.closeConn();
			return i;
		} catch (Exception e) {
			// TODO: handle exception
		}
		as.closePtmt();
		as.closeConn();
		return -1;
	}
}
