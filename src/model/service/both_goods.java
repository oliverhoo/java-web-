package model.service;

import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import model.DAO.DB;
import model.pojo.shangpin;

public class both_goods {
	public int main(HttpSession session) {
		DB as=new DB();
		as.getConn();
		ResultSet rs=null;
		try {
			String sql="select * from goods";
			as.cPtmt(sql);
			rs=as.queryDb();
			int i=0;
			while(rs.next())
			{
				shangpin ss=new shangpin();
				ss.setbiaoti(rs.getString("name"));//
				ss.setjiage(rs.getString("money"));
				ss.setkucun(rs.getString("stock"));
				ss.setSKU(rs.getString("SKU"));//
				ss.setstate(rs.getString("state"));
				ss.settype1(rs.getString("type1"));
				ss.settype2(rs.getString("type2"));
				session.setAttribute("both_goods_"+i,ss);
				i++;
			}
			session.setAttribute("both_goods_ii",i);
			return i;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return -1;
	}
}
