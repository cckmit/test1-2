package chn.bhmc.dms.mob.api.crm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

public class ExhiHallReportSearchVO extends SearchVO{

	

	private static final long serialVersionUID = -6611565954893744186L;


	
	private String sDlrCd;
	private String sStartDt;
	private String sEndDt;
	private String sStartDtm;//月份
	private String sEndDtm;//结束月份

	
	public String getsDlrCd() {
		return sDlrCd;
	}
	public void setsDlrCd(String sDlrCd) {
		this.sDlrCd = sDlrCd;
	}
	public String getsStartDt() {
		return sStartDt;
	}
	public void setsStartDt(String sStartDt) {
		this.sStartDt = sStartDt;
	}
	public String getsEndDt() {
		return sEndDt;
	}
	public void setsEndDt(String sEndDt) {
		this.sEndDt = sEndDt;
	}
	public String getsStartDtm() {
		return sStartDtm;
	}
	public void setsStartDtm(String sStartDtm) {
		this.sStartDtm = sStartDtm;
	}
	public String getsEndDtm() {
		return sEndDtm;
	}
	public void setsEndDtm(String sEndDtm) {
		this.sEndDtm = sEndDtm;
	}
	
	
	
	
	
	
	
	
}
