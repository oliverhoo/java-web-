package model.service;

import java.sql.ResultSet;



import model.DAO.DB;
import model.pojo.shangpin;

public class shang_goods {
	public String main(shangpin tt) {
		String a=tt.getbiaoti();
		String c=tt.getjiage();
		String d=tt.getkucun();
		String type1=tt.gettype1();
		String type2=tt.gettype2();
		int cc=Integer.parseInt(c);
		int dd=Integer.parseInt(d);
		DB as=new DB();
		String b=null,zz=null,x=null;String aa="0";
		String bbbs=null;int g=0;
		try {
			as.getConn();
			try {
				
				/*String sqll="select max(SKU)as SKU FROM GOODS";
				as.cPtmt(sqll);
				re=as.queryDb();
				System.out.println(s);
				re.next();
				b=re.getString("SKU");
				System.out.println(b);
				s=Integer.parseInt(b)+1;
				b=String.format("%09d",s);*/
				type1="1";
				type2="1";
				
				b=as.getmaxSKU(type1, type2);
				zz="C://Users//暗暗//Documents//Tencent Files//1198605200//FileRecv//Business//WebRoot//images//"+b+".jpg";
				x="C://Users//暗暗//Documents//Tencent Files//1198605200//FileRecv//Business//WebRoot//images//"+b+"_2.jpg";
				bbbs=b+".jpg";
				System.out.println(x);
			} catch (Exception e2) {
				// TODO: handle exception
			}
			try {
				as.closePtmt();
				String sql="insert into goods values(?,?,?,?,?,?,?,?)";
				System.out.println(x);
				as.cPtmt(sql,b,0,cc,dd,a,1,1,bbbs);
				g=as.updateDb();
				if(g==1)
				{String zzx=zz+","+x+","+b;
					as.closePtmt();
					as.closeConn();
					System.out.println(zzx);
					return zzx;//上架成功
				}
				else {
					as.closePtmt();
					as.closeConn();
					return aa;//上架失败
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		} 
		catch (Exception e2) {
			// TODO: handle exception
		}
		as.closePtmt();
		as.closeConn();
		return aa;
	}
}
