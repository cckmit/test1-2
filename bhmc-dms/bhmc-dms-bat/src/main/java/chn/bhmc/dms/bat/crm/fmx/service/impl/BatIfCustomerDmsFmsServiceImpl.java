package chn.bhmc.dms.bat.crm.fmx.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.bat.crm.cif.service.BatIfCustomerInfoDmsService;
import chn.bhmc.dms.bat.crm.cif.service.dao.BatAddressInfoDAO;
import chn.bhmc.dms.bat.crm.cif.service.dao.BatCustomerInfoDAO;
import chn.bhmc.dms.bat.crm.cif.service.dao.BatCustomerRelInfoDAO;
import chn.bhmc.dms.bat.crm.cif.vo.BatAddressInfoSearchVO;
import chn.bhmc.dms.bat.crm.cif.vo.BatCustomerInfoSearchVO;
import chn.bhmc.dms.bat.crm.cif.vo.BatCustomerInfoVO;
import chn.bhmc.dms.bat.crm.cif.vo.BatCustomerRelInfoVO;
import chn.bhmc.dms.bat.crm.cmm.vo.BatAddressInfoVO;
import chn.bhmc.dms.bat.crm.fmx.service.BatIfCustomerNoticeDmsFmsService;
import chn.bhmc.dms.bat.crm.fmx.service.dao.BatCustomerNoticeDAO;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * BatIfCustomerInfoDmsServiceImpl.java
 *
 * @Description : DMS-FMS 转介绍客户购车通知接口
 * @author LEE YANYONG
 * @since 2020. 4. 3.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kyo Jin LEE      최초 생성
 * </pre>
 */
@Service("batIfCustomerDmsFmsService")
public class BatIfCustomerDmsFmsServiceImpl extends HService implements BatIfCustomerNoticeDmsFmsService {


    /**
     * DAO
     */
    @Resource(name="batCustomerNoticeDAO")
    BatCustomerNoticeDAO batCustomerNoticeDAO;

    /**
     * Customer Member Management
     */
    @Resource(name="custNoIdgenService")
    EgovIdGnrService custNoIdgenService;

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /*
     * @see chn.bhmc.dms.bat.crm.cif.service.BatIfCustomerInfoDmsService#selectCustomerNoticeDmsFms()
     */
    @Override
    public int selectCustomerNoticeDmsFms() throws Exception {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("regUsrId", "SYSTEM");
        map.put("updtUsrId", "SYSTEM");

        batCustomerNoticeDAO.selectCustomerNoticeDmsFms(map);

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("CRM702");
        camelClient.sendRequest();

        return 0;
    }

}
