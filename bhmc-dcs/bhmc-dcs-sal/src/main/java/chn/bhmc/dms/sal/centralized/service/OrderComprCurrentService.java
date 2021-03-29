package chn.bhmc.dms.sal.centralized.service;

import java.util.List;

import chn.bhmc.dms.sal.centralized.vo.SumOrderCntSearchVO;
import chn.bhmc.dms.sal.centralized.vo.SumOrderCntSubVO;
import chn.bhmc.dms.sal.centralized.vo.SumOrderCntVO;
import chn.bhmc.dms.sal.centralized.vo.VehicleSpecSearchVO;
import chn.bhmc.dms.sal.centralized.vo.VehicleSpecVO;

public interface OrderComprCurrentService {
	
	/**
	 * 车种 贾明 2019-4-8 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 */
	 public List<VehicleSpecVO> selectCarlineCombo(VehicleSpecSearchVO searchVO) throws Exception;
	 
	 /**
	  * 
	  * @param searchVO
	  * @return
	  * @throws Exception
	  */
	public  int selectSumOrderCntDlrsByConditionCnt(SumOrderCntSearchVO searchVO)  throws Exception;
	
	/**
	 * 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 */
	public  List<SumOrderCntVO> selectSumOrderCntDlrsByConditionForNew(SumOrderCntSearchVO searchVO)  throws Exception;
	
	/**
	 * 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 */
	public int selectSumOrderCntDlrSubsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception;
	
	/**
	 * @param searchVO
	 * @return
	 * @throws Exception
	 */
    public List<SumOrderCntSubVO> selectSumOrderCntDlrSubsByCondition(SumOrderCntSearchVO searchVO) throws Exception;
}
