package chn.bhmc.dms.sal.cmm.service;

import java.util.ArrayList;
import java.util.Map;


/**
 * sales 공통서비스
 *
 * @author KIM JINSUK
 * @since 2018. 01. 08.
 * @version 1.0
 * @see <pre>
 *
 *       수정일                         수정자                              수정내용
 *  ----------------    ------------    ---------------------------
 *   2018. 01. 08.       KIM JINSUK            최초 생성
 * </pre>
 */

public interface SalesSQLLabService {

    // select SQL
    public Map<String, ArrayList<?>> callSendSQLRun(String sSql)throws Exception;

    // update , insert SQL
    public Map<String, ArrayList<?>> callSendUpdateSQL(String sSql)throws Exception;


    public void setException(String msgKey, String[] msgKey2)throws Exception;
}
