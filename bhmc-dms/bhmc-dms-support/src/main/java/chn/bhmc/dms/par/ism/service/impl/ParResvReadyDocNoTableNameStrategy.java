package chn.bhmc.dms.par.ism.service.impl;

import chn.bhmc.dms.core.support.idgen.TableNameStrategy;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 부품예류 키 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 8. 14.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 8. 14.     In Bo Shim      최초 생성
 * </pre>
 */
public class ParResvReadyDocNoTableNameStrategy implements TableNameStrategy {

    /*
     * @see chn.bhmc.dms.core.support.idgen.TableNameStrategy#makeTableName(java.lang.String)
     */
    @Override
    public String makeTableName(String originalTableName) {
        return originalTableName + LoginUtil.getDlrCd();
    }


}