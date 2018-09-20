package model.service;

import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import model.DAO.DB;
import model.pojo.user_inform;

public class both_users {
	public int main(HttpSession session) {
		DB as=new DB();
		as.getConn();
		ResultSet rs=null;
		System.out.println("2233");
		try {
			String sql="select USER_information.*,USER_login.name from  USER_information,USER_login where USER_information.USER_id=USER_login.USER_id";
			as.cPtmt(sql);
			rs=as.queryDb();
			int i=0;
			while(rs.next())
			{
				System.out.println("99");
				user_inform ss=new user_inform();
				ss.setuser_id(rs.getString("USER_id"));
				ss.setjingdou(rs.getString("JINGDOU"));
				ss.setsunmoney(rs.getString("sum_money"));
				ss.setrate(rs.getString("rate"));
				ss.setname(rs.getString("name"));
				session.setAttribute("both_users_"+i,ss);
				i++;
			}
			session.setAttribute("both_users_ii",i);
			System.out.println(i);
			return i;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return -1;
	}
}
