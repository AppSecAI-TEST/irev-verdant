package ireveal.domain;

public class Product {
	private String productname;
	private int productid;
	private String version;
	private String ptype;
	private String imagefilename;
	private Boolean bwithcp;
	private String prodmodel;
	
	public String getProdmodel() {
		return prodmodel;
	}
	public void setProdmodel(String prodmodel) {
		this.prodmodel = prodmodel;
	}
	public Boolean getBwithcp() {
		return bwithcp;
	}
	public void setBwithcp(Boolean bwithcp) {
		this.bwithcp = bwithcp;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getPtype() {
		return ptype;
	}
	public void setPtype(String ptype) {
		this.ptype = ptype;
	}
	public String getImagefilename() {
		return imagefilename;
	}
	public void setImagefilename(String imagefilename) {
		this.imagefilename = imagefilename;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}	

}
