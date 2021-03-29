package chn.bhmc.dms.bat.crm.fmx.service.dao;

import java.util.HashMap;
import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.bat.crm.cif.vo.BatCustomerInfoSearchVO;
import chn.bhmc.dms.bat.crm.cif.vo.BatCustomerInfoVO;

//import chn.bhmc.dms.bat.par.pcm.vo.BatInvcSearchVO;
//import chn.bhmc.dms.bat.par.pcm.vo.BatInvcVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatCustomerNoticeDAO
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

@Mapper("batCustomerNoticeDAO")
public interface BatCustomerNoticeDAO {

    /**
     * DMS-FMS 转介绍客户购车通知接口
     * @param null
     * @return Count
     */
    public void selectCustomerNoticeDmsFms(HashMap<String, Object> map) throws Exception;

}
