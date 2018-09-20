package model.service;

import model.DAO.DB;

public class xia1_goods {
	public int main(String[] ss) {
		int we=ss.length;
		try {
			DB co=new DB();
			co.getConn();
			String sql="update  goods set STATE='1' where SKU=?";
			for(int wq=0;wq<we;wq++) {
				co.cPtmt(sql,ss[wq]);
				co.updateDb();
			}
			co.closePtmt();
			co.closeConn();
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}
}
