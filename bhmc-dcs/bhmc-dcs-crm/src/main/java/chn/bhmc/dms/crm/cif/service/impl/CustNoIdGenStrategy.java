package chn.bhmc.dms.crm.cif.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.AbstractIdGnrStrategyImpl;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustNoIdGenStrategy.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ju Won Lee
 * @since 2016. 1. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 16.     In Bo Shim     최초 생성
 * </pre>
 */

public class CustNoIdGenStrategy extends AbstractIdGnrStrategyImpl {


    @Override
    public String buildPrefix(String prefix) {
        return "C" + LoginUtil.getDlrCd() + LocalDate.now().toString("yyyyMM");
    }

//    @Override
//    public void setPrefix(String prefix) {
//        //고객번호 체계 ex) C + 딜러번호 + 년 + 월 + 5자리
//        super.setPrefix("C" + LoginUtil.getDlrCd() + LocalDate.now().toString("yyyyMM"));
//    }

}
