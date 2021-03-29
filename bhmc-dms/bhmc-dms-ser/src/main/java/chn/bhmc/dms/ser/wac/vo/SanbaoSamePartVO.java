package chn.bhmc.dms.ser.wac.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoSamePartVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 9. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 14.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class SanbaoSamePartVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3574710256250115247L;

    /**
     * 차대번호
     */
    public String vinNo;

    /**
     * LTS MODEL NM
     */
    public String ltsModelNm;

    /**
     * 차종코드
     */
    public String carlineCd;

    /**
     * 품목그룹코드
     */
    public String itemGrpCd;

    /**
     * 품목그룹명
     */
    public String itemGrpNm;

    /**
     * 품목항목코드
     */
    public String itemAtcCd;

    /**
     * 동일하지 교환조건
     */
    public int sameFauExchTermVal;

    /**
     * 발생건수
     */
    public int occrCnt;

    /**
     * 동일하자 여부
     */
    public String itemGrpYn;

    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }

    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    /**
     * @return the ltsModelNm
     */
    public String getLtsModelNm() {
        return ltsModelNm;
    }

    /**
     * @param ltsModelNm the ltsModelNm to set
     */
    public void setLtsModelNm(String ltsModelNm) {
        this.ltsModelNm = ltsModelNm;
    }

    /**
     * @return the carlineCd
     */
    public String getCarlineCd() {
        return carlineCd;
    }

    /**
     * @param carlineCd the carlineCd to set
     */
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
    }

    /**
     * @return the itemGrpCd
     */
    public String getItemGrpCd() {
        return itemGrpCd;
    }

    /**
     * @param itemGrpCd the itemGrpCd to set
     */
    public void setItemGrpCd(String itemGrpCd) {
        this.itemGrpCd = itemGrpCd;
    }

    /**
     * @return the itemGrpNm
     */
    public String getItemGrpNm() {
        return itemGrpNm;
    }

    /**
     * @param itemGrpNm the itemGrpNm to set
     */
    public void setItemGrpNm(String itemGrpNm) {
        this.itemGrpNm = itemGrpNm;
    }

    /**
     * @return the itemAtcCd
     */
    public String getItemAtcCd() {
        return itemAtcCd;
    }

    /**
     * @param itemAtcCd the itemAtcCd to set
     */
    public void setItemAtcCd(String itemAtcCd) {
        this.itemAtcCd = itemAtcCd;
    }



    /**
     * @return the sameFauExchTermVal
     */
    public int getSameFauExchTermVal() {
        return sameFauExchTermVal;
    }

    /**
     * @param sameFauExchTermVal the sameFauExchTermVal to set
     */
    public void setSameFauExchTermVal(int sameFauExchTermVal) {
        this.sameFauExchTermVal = sameFauExchTermVal;
    }

    /**
     * @return the occrCnt
     */
    public int getOccrCnt() {
        return occrCnt;
    }

    /**
     * @param occrCnt the occrCnt to set
     */
    public void setOccrCnt(int occrCnt) {
        this.occrCnt = occrCnt;
    }

    /**
     * @return the itemGrpYn
     */
    public String getItemGrpYn() {
        return itemGrpYn;
    }

    /**
     * @param itemGrpYn the itemGrpYn to set
     */
    public void setItemGrpYn(String itemGrpYn) {
        this.itemGrpYn = itemGrpYn;
    }



}
