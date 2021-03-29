package chn.bhmc.dms.sal.cmm.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.SearchResult;


/**
 * @ClassName   : SaleSQLViewVO
 * @Description : 판매 DMS - SQL view VO
 * @author Kim Jin Suk
 * @since 2016. 8. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2018. 01. 12.    Kim Jin Suk           최초 생성
 * </pre>
 */

public class SaleSQLViewVO extends SearchResult{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5000488204233041331L;

    private List<?> columnList = null;
    private List<?> noConnectIp = null;
    private String sSql = null;
    private String sOpenToDt = null;
    private String sOpenFromDt = null;

    /**
     * @return the columnList
     */
    public List<?> getColumnList() {
        return columnList;
    }

    /**
     * @param columnList the columnList to set
     */
    public void setColumnList(List<?> columnList) {
        this.columnList = columnList;
    }

    /**
     * @return the noConnectIp
     */
    public List<?> getNoConnectIp() {
        return noConnectIp;
    }

    /**
     * @param noConnectIp the noConnectIp to set
     */
    public void setNoConnectIp(List<?> noConnectIp) {
        this.noConnectIp = noConnectIp;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    /**
     * @return the sSql
     */
    public String getsSql() {
        return sSql;
    }

    /**
     * @param sSql the sSql to set
     */
    public void setsSql(String sSql) {
        this.sSql = sSql;
    }

    /**
     * @return the sOpenToDt
     */
    public String getsOpenToDt() {
        return sOpenToDt;
    }

    /**
     * @param sOpenToDt the sOpenToDt to set
     */
    public void setsOpenToDt(String sOpenToDt) {
        this.sOpenToDt = sOpenToDt;
    }

    /**
     * @return the sOpenFromDt
     */
    public String getsOpenFromDt() {
        return sOpenFromDt;
    }

    /**
     * @param sOpenFromDt the sOpenFromDt to set
     */
    public void setsOpenFromDt(String sOpenFromDt) {
        this.sOpenFromDt = sOpenFromDt;
    }

}
