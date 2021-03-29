package chn.bhmc.dms.mob.api.crm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;


public class ExhiHallReportVO extends  BaseVO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6029616126384731360L;

	private String name;//月份
	private String cnt;//分子 数
	private String den;//分母 数
	private String ratio;//比率
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public String getDen() {
		return den;
	}
	public void setDen(String den) {
		this.den = den;
	}
	public String getRatio() {
		return ratio;
	}
	public void setRatio(String ratio) {
		this.ratio = ratio;
	}
	
	
	
	
	
	
	
	
	
	
}
