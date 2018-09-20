package model.service;

import java.sql.ResultSet;

import model.DAO.DB;

public class setlevel {
	public boolean setlevel1(String chuji,String gaoji,String VIP) {
		DB as=new DB();
		ResultSet re=null;
		try {
			int a=Integer.parseInt(chuji);
			int b=Integer.parseInt(gaoji);
			int c=Integer.parseInt(VIP);
			as.getConn();
			String sql="update dengji set chuji=?,gaoji=?,VIP=? where id=1";
			as.cPtmt(sql,a,b,c);
			int g=as.updateDb();
			if(g==1)
			{
				try {
					System.out.println(c);
					String sll="select user_id,sum_money from USER_information";
					as.cPtmt(sll);
					re=as.queryDb();
					while (re.next()) {
						System.out.println("准备");
						String dd=re.getString("user_id");
						System.out.println(dd);
						String ee=re.getString("sum_money");
						int ss=Integer.parseInt(ee);
						System.out.println(ss);
						System.out.println("558");
						System.out.println(c);
						if(ss>c)
						{
							String sdd="update USER_information set rate='VIP会员' where user_id="+dd;
							as.cPtmt(sdd);
							as.updateDb();
						}
						else {
							if(ss>b) {
								String sdd="update USER_information set rate='高级会员' where user_id="+dd;
								as.cPtmt(sdd);
								as.updateDb();
							}
							else {
								if(ss>a) {
									String sdd="update USER_information set rate='初级会员' where user_id="+dd;
									as.cPtmt(sdd);
									as.updateDb();
								}
								else {
									String sdd="update USER_information set rate='基础会员' where user_id="+dd;
									as.cPtmt(sdd);
									as.updateDb();
								}
							}
						}
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
				as.closePtmt();
				as.closeConn();
				re.close();
				return true;
			}
			else
			{
				as.closePtmt();
				as.closeConn();
				re.close();
				return false;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		as.closePtmt();
		as.closeConn();
		return false;
	}
}
