package model.service;

import java.sql.ResultSet;

import javax.servlet.http.HttpSession;


import model.DAO.DB;
import model.pojo.both_orderss;

public class both_backstage_order {
	public int main(HttpSession session) {
		DB as=new DB();
		as.getConn();
		ResultSet rs=null;
		try {
			String sql="select orders.*,USER_login.name from orders,USER_login where orders.USER_id=USER_login.USER_id";
			as.cPtmt(sql);
			rs=as.queryDb();
			int i=0;
			while(rs.next())
			{
				both_orderss ss=new both_orderss();
				ss.setname(rs.getString("name"));
				ss.setorder_id(rs.getString("order_id"));
				ss.setSKU_id(rs.getString("SKU_id"));
				ss.setSKU_number(rs.getString("SKU_number"));
				ss.setSKU_MONGEY(rs.getString("SKU_MONGEY"));
				ss.setorder_sate(rs.getString("order_sate"));
				ss.setSUN_MONEY(rs.getString("SUN_MONEY"));
				ss.setSKU_name(rs.getString("SKU_name"));
				session.setAttribute("both_orders_"+i,ss);
				i++;
			}
			session.setAttribute("both_orders_ii",i);
			return i;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return -1;
	}
}
