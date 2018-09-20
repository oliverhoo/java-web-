package model.service;

import model.DAO.DB;

public class tui1_orders {
	public int main(String[] ss) {
		int we=ss.length;
		try {
			DB co=new DB();
			co.getConn();
			String sql="update  orders set order_sate='已退' where order_id=?";
			for(int wq=0;wq<we;wq++) {
				System.out.println(ss[wq]);
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
