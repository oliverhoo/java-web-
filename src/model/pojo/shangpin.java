package model.pojo;


public class shangpin {
	private String biaoti;
	private String jiage;
	private String kucun;
	
	private String SKU;
	private String state;
	private String type1;
	private String type2;
	public void setSKU(String SKU) {
		this.SKU=SKU;
	}	
	public String getSKU() {
		return SKU;
	}	
	public void setstate(String state) {
		this.state=state;
	}	
	public String getstate() {
		return state;
	}	
	public void settype1(String type1) {
		this.type1=type1;
	}	
	public String gettype1() {
		return type1;
	}	
	public void settype2(String type2) {
		this.type2=type2;
	}	
	public String gettype2() {
		return type2;
	}	
	
	
	public shangpin() {
		
	}
	public shangpin(String biaoti,String jiage,String kucun) {
		this.biaoti=biaoti;
		this.jiage=jiage;
		this.kucun=kucun;
	}
	public void setbiaoti(String biaoti) {
		this.biaoti=biaoti;
	}	
	public void setjiage(String jiage) {
		this.jiage=jiage;
	}	
	public void setkucun(String kucun) {
		this.kucun=kucun;
	}	
	public String getbiaoti() {
		return biaoti;
	}
	public String getjiage() {
		return jiage;
	}
	public String getkucun() {
		return kucun;
	}

	
}
