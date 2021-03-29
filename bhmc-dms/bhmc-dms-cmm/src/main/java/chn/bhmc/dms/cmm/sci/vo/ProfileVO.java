package chn.bhmc.dms.cmm.sci.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ProfileVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 2. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 17.     Kang Seok Han     최초 생성
 * </pre>
 */

public class ProfileVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5767805029842614141L;

    /**
     * IP
     */
    private String ipNm;

    /**
     * 접속성공여부(Y/N)
     */
    private String contYn;

    /**
     * 실행일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;

    /**
     * @return the ipNm
     */
    public String getIpNm() {
        return ipNm;
    }

    /**
     * @param ipNm the ipNm to set
     */
    public void setIpNm(String ipNm) {
        this.ipNm = ipNm;
    }

    /**
     * @return the contYn
     */
    public String getContYn() {
        return contYn;
    }

    /**
     * @param contYn the contYn to set
     */
    public void setContYn(String contYn) {
        this.contYn = contYn;
    }

    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

}
