package chn.bhmc.dms.sal.orc.service;

import java.util.List;

import chn.bhmc.dms.sal.orc.vo.CommonCodeListVO;
import chn.bhmc.dms.sal.orc.vo.SumOrderCntSearchVO;
import chn.bhmc.dms.sal.orc.vo.SumOrderCntSubVO;
import chn.bhmc.dms.sal.orc.vo.SumOrderCntVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SumOrderCntService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Jin Suk Kim
 * @since 2016. 3. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 15.     Jin Suk Kim     최초 생성
 * </pre>
 */

public interface SumOrderCntService {

    /**
     * 종합오더현황-딜러 조회
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectSumOrderCntDlrsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception;
    public List<SumOrderCntVO> selectSumOrderCntDlrsByCondition(SumOrderCntSearchVO searchVO) throws Exception;

    /**
     * 종합오더현황-딜러 세부조회
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectSumOrderCntDlrSubsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception;
    public List<SumOrderCntSubVO> selectSumOrderCntDlrSubsByCondition(SumOrderCntSearchVO searchVO) throws Exception;

    public int selectSumOrderCntDlrsAsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception;
    public List<SumOrderCntVO> selectSumOrderCntDlrsAsByCondition(SumOrderCntSearchVO searchVO) throws Exception;
	public List<SumOrderCntVO> selectSumOrderCntDlrsByConditionForNew(SumOrderCntSearchVO searchVO) throws Exception;
	/**
	 * 订单综合现况从DCS取数据展示页数据 贾明 2019-4-5
	 * @return
	 */
	public CommonCodeListVO selectSumOrderCntDlrSalesInterfaceCommonCodeValues(String langCd) throws Exception;
	
	/**
	 * 订单综合现况从DCS取数据 查询按钮接口 贾明 2019-4-5
	 * @param searchVO
	 * @return
	 * @throws Exception
	 */
	public CommonCodeListVO selectSumOrderCntSalesInterfaceDlrs(SumOrderCntSearchVO searchVO) throws Exception;
	
	 /**
     * 订单综合现况--详细信息接口贾明 2019-4-10 
     * @param searchVO
     * @return
     * @throws Exception
     */
    public CommonCodeListVO selectSumOrderCntSalesInterfaceDlrSubs(SumOrderCntSearchVO searchVO) throws Exception;
}
