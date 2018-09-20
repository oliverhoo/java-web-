package model.service;

import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import model.DAO.DB;
import model.pojo.shangpin;

public class xia_goods {
	public int main(HttpSession session) {
		DB as=new DB();
		as.getConn();
		ResultSet rs=null;
		try {
			String sql="select SKU,name,state from goods";
			as.cPtmt(sql);
			rs=as.queryDb();
			int i=0;
			while(rs.next())
			{
				shangpin ss=new shangpin();
				ss.setSKU(rs.getString("SKU"));
				ss.setbiaoti(rs.getString("name"));
				ss.setstate(rs.getString("state"));
				session.setAttribute("xia_goods_"+i,ss);
				i++;
			}
			session.setAttribute("xia_goods_ii",i);
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
