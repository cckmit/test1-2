package chn.bhmc.dms.sal.centralized.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.centralized.service.OrderComprCurrentService;
import chn.bhmc.dms.sal.centralized.service.dao.OrderComprCurrentDAO;
import chn.bhmc.dms.sal.centralized.vo.SumOrderCntSearchVO;
import chn.bhmc.dms.sal.centralized.vo.SumOrderCntSubVO;
import chn.bhmc.dms.sal.centralized.vo.SumOrderCntVO;
import chn.bhmc.dms.sal.centralized.vo.VehicleSpecSearchVO;
import chn.bhmc.dms.sal.centralized.vo.VehicleSpecVO;
import able.com.service.HService;
/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OrderComprCurrentServiceImpl
 * @Description : 订单综合现况DMS接口 impl
 * @author Bong
 * @since 2016. 5. 26.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.26         Bong            최초 생성
 * </pre>
 */

@Service("orderComprCurrentService")
public class OrderComprCurrentServiceImpl extends HService implements OrderComprCurrentService{

	@Resource(name="orderComprCurrentDAO")
	OrderComprCurrentDAO orderComprCurrentDAO;
	
	@Override
	public List<VehicleSpecVO> selectCarlineCombo(VehicleSpecSearchVO searchVO) throws Exception {
		return orderComprCurrentDAO.selectCarlineCombo(searchVO);
	}
	
	@Override
	public int selectSumOrderCntDlrsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception {
		return orderComprCurrentDAO.selectSumOrderCntDlrsByConditionCnt(searchVO);
	}
	
	@Override
	public List<SumOrderCntVO> selectSumOrderCntDlrsByConditionForNew(SumOrderCntSearchVO searchVO) throws Exception {
		return orderComprCurrentDAO.selectSumOrderCntDlrsByConditionForNew(searchVO);
	}

	@Override
	public int selectSumOrderCntDlrSubsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception {
		return orderComprCurrentDAO.selectSumOrderCntDlrSubsByConditionCnt(searchVO);
	}

	@Override
	public List<SumOrderCntSubVO> selectSumOrderCntDlrSubsByCondition(SumOrderCntSearchVO searchVO) throws Exception {
		return orderComprCurrentDAO.selectSumOrderCntDlrSubsByCondition(searchVO);
	}
	
	

}
