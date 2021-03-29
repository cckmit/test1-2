package chn.bhmc.dms.sal.acc.service.impl;

import org.joda.time.LocalDate;

import egovframework.rte.fdl.idgnr.impl.strategy.EgovIdGnrStrategyImpl;

/**
 * 판매-경품판매관리 키 구현 클래스
 *
 * @author Jin Suk Kim
 * @since 2016. 6. 30.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일         수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 6. 30.     Jin Suk Kim        최초 생성
 * </pre>
 */
public class SalAccessoryMngIdGenStrategy extends EgovIdGnrStrategyImpl {

    /*
     * @see egovframework.rte.fdl.idgnr.impl.strategy.EgovIdGnrStrategyImpl#setPrefix(java.lang.String)
     */
    @Override
    public void setPrefix(String prefix) {
        super.setPrefix(prefix + LocalDate.now().toString("yyyy"));
    }


}