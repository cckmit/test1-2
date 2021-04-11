package chn.bhmc.dms.ser.wac.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceDetailSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceDetailVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceVO;

@Mapper("claimInvoiceReceptionDao")
public interface ClaimInvoiceReceptionDao {

	/**
	 * 
	 *<p>Title:查询结算单数量</p>
	 * @author wangc
	 * @param searchVO
	 * @return int
	 */
	int selectClaimInvoiceReceptionForInvoiceByInvoiceCnt(ClaimInvoiceSearchVO searchVO);
	/**
	 * 
	 *<p>Title:查询结算单数量</p>
	 * @author wangc
	 * @param searchVO
	 * @return List<ClaimInvoiceVO>
	 */
	List<ClaimInvoiceVO> selectClaimInvoiceReceptionForInvoiceByInvoicel(ClaimInvoiceSearchVO searchVO);
	
	/**
	 * 
	 *<p>Title:查询发票单数量</p>
	 * @author wangc
	 * @serialData 2021年4月8日
	 * @param searchVO
	 * @return List<ClaimInvoiceVO>
	 */
	int selectClaimInvoiceDetailForInvoiceByInvoiceCnt(ClaimInvoiceDetailSearchVO searchVO);
	
	/**
	 * 
	 *<p>Title:查询发票单列表信息</p>
	 * @author wangc
	 * @serialData 2021年4月8日
	 * @param searchVO
	 * @return List<ClaimInvoiceDetailVO> 
	 */
	List<ClaimInvoiceDetailVO> selectClaimInvoiceDetailForInvoiceByInvoicel(ClaimInvoiceDetailSearchVO searchVO);
	
	/**
	 * 
	 *<p>Title:根据结算报表编号查询结算单信息</p>
	 * @author wangc
	 * @param invcNo
	 * @return List<ClaimInvoiceVO>
	 */
	List<ClaimInvoiceVO> selectClaimInvoiceReceptionByInvcNo(String invcNo);
	
	
	/**
	 * 
	 *<p>Title:修改结算单开票状态以及快递状态</p>
	 * @author wangc
	 * @param
	 * @return
	 * @param claimInvoiceVO
	 * @return
	 */
	int updateClaimInvoiceReception(ClaimInvoiceVO claimInvoiceVO);

}
