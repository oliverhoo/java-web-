package model.service;
import model.DAO.DB;
import model.pojo.shangpin;
import model.service.shang_goods;;
public class huo_goods {
	public String main(shangpin tt,String starttime,String stoptime) {
		shang_goods sss=new shang_goods();
		String zsx=sss.main(tt);String g="0";
		String start=starttime.replace(";", " ");
		String stop=stoptime.replace(";", " ");
		String[] arr=zsx.split(",");
		DB as=new DB();
		try {
			as.getConn();
			String sqll="insert into goods_time values(?,?,?)";
			System.out.println(start);
			as.cPtmt(sqll,arr[2],start,stop);
			int a=as.updateDb();
			System.out.println(start);
			if(a==1)
			{
				as.closePtmt();
				as.closeConn();
				return zsx;
			}else {
				as.closePtmt();
				as.closeConn();
				return g;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		as.closePtmt();
		as.closeConn();
		return g;
	}
}
