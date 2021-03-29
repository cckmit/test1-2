package chn.bhmc.dms.sal.orc.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.sal.orc.vo.CommonCodeListVO;
import chn.bhmc.dms.sal.orc.vo.SumOrderCntSearchVO;
import chn.bhmc.dms.sal.orc.vo.SumOrderCntSubVO;
import chn.bhmc.dms.sal.orc.vo.SumOrderCntVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SumOrderCntDAO
 * @Description : 종합오더현황 DAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.15     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("sumOrderCntDAO")
public interface SumOrderCntDAO {

    /**
     * 조회 조건에 해당하는 종합오더현황-딜러 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */

    public List<SumOrderCntVO> selectSumOrderCntDlrsByCondition(SumOrderCntSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 종합오더현황-딜러 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return
     */
    public int selectSumOrderCntDlrsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 종합오더현황-딜러 세부 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    public List<SumOrderCntSubVO> selectSumOrderCntDlrSubsByCondition(SumOrderCntSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 종합오더현황-딜러 세부 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return
     */
    public int selectSumOrderCntDlrSubsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception;

    public int selectSumOrderCntDlrsAsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception;
    public List<SumOrderCntVO> selectSumOrderCntDlrsAsByCondition(SumOrderCntSearchVO searchVO) throws Exception;

	public List<SumOrderCntVO> selectSumOrderCntDlrsByConditionForNew(SumOrderCntSearchVO searchVO);
	
	/**
	 * 订单综合现况从DCS取数据展示页数据 贾明 2019-4-4
	 * @return
	 */
	public CommonCodeListVO selectSumOrderCntDlrSalesInterfaceCommonCodeValues(String langCd);
	
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