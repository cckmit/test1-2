package chn.bhmc.dms.sal.cmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.sal.cmm.vo.SaleSQLViewVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserInfoDAO
 * @Description : 사용자 DAO
 * @author Kang Seok Han
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("salesSQLDAO")
public interface SalesSQLDAO {

    /**
     * {@inheritDoc}
     */
    public List<DealerVO> selectDealersByCondition(SaleSQLViewVO viewVO) throws Exception;

}
