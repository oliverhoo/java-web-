package model.DAO;

import model.pojo.User;

public class userinfodao {
	public int updateinfo(User user) {
		DB dbhelper=new DB();
		dbhelper.getConn();
		String sql = "update user_login set name='"+user.getUser_name()+"',PASSWORD='"+ user.getPassword()+"' where user_id='"+ user.getUeser_Id()+"'";
		System.out.println(sql);
		dbhelper.cPtmt(sql);
		int result = dbhelper.updateDb();
		dbhelper.closeConn();
		return result;
	}
	public int inserinfo(User user) {
		DB dbhelper=new DB();
		dbhelper.getConn();
		String a = user.getUeser_Id();
		String b = user.getUser_name();
		String c = user.getPassword();
		
		String Sql="insert into user_login values(?,?,?)";
		dbhelper.cPtmt(Sql,a,b,c);
		int result=0;
		try {
			result =dbhelper.updateDb();
		} catch (Exception ex) {
			// TODO: handle exception
			ex.printStackTrace();
		}
		dbhelper.closeConn();
		return result;
	}
}
