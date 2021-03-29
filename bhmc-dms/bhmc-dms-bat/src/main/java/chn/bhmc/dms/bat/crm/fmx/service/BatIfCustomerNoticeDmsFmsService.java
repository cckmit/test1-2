package chn.bhmc.dms.bat.crm.fmx.service;

import chn.bhmc.dms.bat.crm.cif.vo.BatCustomerInfoVO;
import chn.bhmc.dms.core.support.camel.Data;

//import java.util.List;

//import chn.bhmc.dms.bat.ser.ro.vo.BatIfRepairOrderSearchVO;
//import chn.bhmc.dms.bat.ser.ro.vo.BatIfRepairOrderVO;
//import chn.bhmc.dms.bat.ser.ro.vo.BatRepairOrderVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatIfCustomerInfoDmsService
 * @Description : DMS-FMS 转介绍客户购车通知接口
 * @author LEE YANYONG
 * @since 2020. 4. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2020. 4. 3.     LEE YANYONG     최초 생성
 * </pre>
 */

public interface BatIfCustomerNoticeDmsFmsService {

    /**
     * DMS - FMS 转介绍客户购车通知接口
     * @param null
     * @return Count
     */
    public int selectCustomerNoticeDmsFms() throws Exception;

}