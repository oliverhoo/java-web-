package model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.DAO.*;
public class DB {
	ItemsDAO idao =new ItemsDAO();
	private Connection conn = null;
	private PreparedStatement ptmt = null;
	private ResultSet rs=null;
	public void getConn() {
		String url = "jdbc:sqlserver://localhost:1433; DatabaseName=Bussiness";
		String user = "sa";
		String password = "123";
		try {
			// 加载驱动
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			// 获取数据库连接
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//int   --- Integer
	//boolean----Boolean
	public void cPtmt(String sql,Object... params ) {
		//想：sql中有问号，有几个，看情况，
		
		try {
			// 创建语句对象
			ptmt = conn.prepareStatement(sql);
			// 把问号补充上
			for(int i=0;i<params.length;i++) {
				ptmt.setObject(i+1, params[i]);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/* select  DQL----executeQuery()
	 * insert delete update   DML-----executeUpdate()
	 */
	public int updateDb() {
		int lnum=0;
		try {
			lnum=ptmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lnum;
	}
	public ResultSet queryDb() {
		try {
			rs=ptmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public void closeRs(ResultSet rs) {
		try {
			if(rs !=null) {
				rs.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void closePtmt() {
		try {
			if(ptmt !=null) {
				ptmt.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void closeConn() {
		try {
			if(conn !=null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public String getOrderId(String userid)
	//获取订单号  orderid   userid|递增数
	{
		String id=null;
		int a=0;
		int max=0;
		getConn();
		String sqlString = "select * from orders where USER_id=?"; 
		cPtmt(sqlString,userid);
		ResultSet rSet=null;
		rSet=queryDb();
		try {
			while (rSet.next()) {
				String[] ss=rSet.getString("order_id").split("\\|");
				//将order 进行分解 获取userId后面自动添加的数据
				System.out.println("ss[0]"+ss[0]);
				a=Integer.parseInt(ss[1]);
				if(max<=a) max=a;
				System.out.println("订单"+a);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		max=max+1;
		System.out.println("max"+max);
		id=userid+"|"+Integer.toString(max);
		System.out.println("id"+id);
		return id;
	}
	public String[] activity(String type)
	//用于提取活动的id号一共6个 全部随机抽取
	//type 1时为排行  返回items 的id 2时为品牌特卖 返回picture 数组
	{
		ResultSet rs =null;
		String[] aStrings=null;
		aStrings=new String[100];
		
		
		String[] returnStrings=new String[6];
		int[] a=null;int i=0;
		getConn();		

		if(type.equals("1"))
		//提取出表内所有活动的
			//sku 商品号
		{
			String sqlString="select * from goods";
			cPtmt(sqlString);
			rs=queryDb();
			try {
				while(rs.next())
				{
					aStrings[i]=rs.getString("sku");//是库中所有的sku号
					i++;
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();

			}
			i--;
			a=idao.randomCommon(0,i,6);//随机抽取库中的6个的sku
			
			for(int j=0;j<6;j++)
			{
				returnStrings[j]=aStrings[a[j]];
			}
			
			return returnStrings;
		}
		if(type.equals("2"))
		{
			String sqlString="select * from brands";
			cPtmt(sqlString);
			rs=queryDb();
			try {
				while(rs.next())
				{
					aStrings[i++]=rs.getString("picture");
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				System.out.println("活动id提取中");
			}
			i--;
			a=idao.randomCommon(0,i,6);//随机抽取库中的6个

			for(int j=0;j<6;j++)
			{

				returnStrings[j]=aStrings[a[j]];
			}
			
			return returnStrings;
		}
		return returnStrings;
	}
	
	public static void main(String[] args) {
		DB dbhleper=new DB();
		try {
			dbhleper.getConn();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("出错");
		}
		if(dbhleper.conn!=null)
		System.out.println("成功");
		String idString=null;
		System.out.println("生成的id"+idString);
		
	}
	
	
	public String getmaxSKU(String type1,String type2)
	{
		String id=null;
		int a=0;
		int max=0;
		getConn();
		String sqlString = "select  max(sku)as SKU from goods where type1=? and type2=?"; 
		cPtmt(sqlString,type1,type2);
		ResultSet rSet=null;
		rSet=queryDb();
		try {
			rSet.next();
				String sst=rSet.getString("SKU");
				sst=sst.substring(2);
				System.out.println(sst);
				a=Integer.parseInt(sst);
				if(max<a) 
					max=a;
		} catch (Exception e) {
			// TODO: handle exception
		}
		max++;
		id=type1+type2+Integer.toString(max);
		System.out.println("zzxc"+id);
		return id;
	}
}
