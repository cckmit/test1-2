package chn.bhmc.dms.cmm.sci.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ProfileSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 3. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 28.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class ProfileSearchVO extends SearchVO{



    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1266376113308761479L;


    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sFromDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sToDt;

    private String sIpNm;


    /**
     * @return the sFromDt
     */
    public Date getsFromDt() {
        return sFromDt;
    }

    /**
     * @param sFromDt the sFromDt to set
     */
    public void setsFromDt(Date sFromDt) {
        this.sFromDt = sFromDt;
    }

    /**
     * @return the sToDt
     */
    public Date getsToDt() {
        return sToDt;
    }

    /**
     * @param sToDt the sToDt to set
     */
    public void setsToDt(Date sToDt) {
        this.sToDt = sToDt;
    }

    /**
     * @return the sIpNm
     */
    public String getsIpNm() {
        return sIpNm;
    }

    /**
     * @param sIpNm the sIpNm to set
     */
    public void setsIpNm(String sIpNm) {
        this.sIpNm = sIpNm;
    }
}
