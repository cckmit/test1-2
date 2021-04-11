package chn.bhmc.dms.ser.wac.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.ser.svi.vo.LtsModelSearchVO;
import chn.bhmc.dms.ser.wac.service.ClaimInvoiceReceptionService;
import chn.bhmc.dms.ser.wac.service.dao.ClaimInvoiceReceptionDao;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceDetailSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceDetailVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceVO;
/**
 * 
 *<p>Title:索赔发票接收</p>
 * @author wangc 2021年4月7日23:01:50
 * @param
 * @return
 */
@Service("claimInvoiceReceptionService")
public class ClaimInvoiceReceptionServiceImpl extends HService implements ClaimInvoiceReceptionService {
	@Resource(name="claimInvoiceReceptionDao")
	ClaimInvoiceReceptionDao claimInvoiceReceptionDAO;
	/**
	 * 
	 *<p>Title:查询结算单数量</p>
	 * @author wangc
	 * @serialData 2021年4月8日
	 * @param searchVO
	 * @return int
	 */
	@Override
	public int selectClaimInvoiceReceptionForInvoiceByInvoiceCnt(ClaimInvoiceSearchVO searchVO) {
		
		searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());//设置语言
		
		return claimInvoiceReceptionDAO.selectClaimInvoiceReceptionForInvoiceByInvoiceCnt(searchVO);
	}
	/**
	 * 
	 *<p>Title:查询结算单列表信息</p>
	 * @author wangc
	 * @serialData 2021年4月8日
	 * @param searchVO
	 * @return List<ClaimInvoiceVO>
	 */
	@Override
	public List<ClaimInvoiceVO> selectClaimInvoiceReceptionForInvoiceByInvoicel(ClaimInvoiceSearchVO searchVO) {
		
		searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());//设置语言
		
		
		return claimInvoiceReceptionDAO.selectClaimInvoiceReceptionForInvoiceByInvoicel(searchVO);
	}
	
	/**
	 * 
	 *<p>Title:查询发票单数量</p>
	 * @author wangc
	 * @serialData 2021年4月8日
	 * @param searchVO
	 * @return List<ClaimInvoiceVO>
	 */
	@Override
	public int selectClaimInvoiceDetailForInvoiceByInvoiceCnt(ClaimInvoiceDetailSearchVO searchVO) {
		searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());//设置语言
		return claimInvoiceReceptionDAO.selectClaimInvoiceDetailForInvoiceByInvoiceCnt(searchVO);
	}
	
	/**
	 * 
	 *<p>Title:查询发票单列表信息</p>
	 * @author wangc
	 * @serialData 2021年4月8日
	 * @param searchVO
	 * @return List<ClaimInvoiceDetailVO> 
	 */
	@Override
	public List<ClaimInvoiceDetailVO> selectClaimInvoiceDetailForInvoiceByInvoicel(
			ClaimInvoiceDetailSearchVO searchVO) {
		searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());//设置语言
		return claimInvoiceReceptionDAO.selectClaimInvoiceDetailForInvoiceByInvoicel(searchVO);
	}
	/**
    * 
    *<p>Title:退票操作</p>
    * @author wangc
    * @serialData 2021年4月8日
	* @method 
	* 1、开票状态变为已退票
    * 2、快递状态为已邮寄
    * 3、除已退票状态外，均可进行退票操作。点击退票前，需要填写退票信息。下发DMS
    * @param invcNo 索赔结算单信息
    * @return String
    */
	@Override
	public String refundClaimInvoiceReception(ClaimInvoiceSearchVO searchVO) {
		String result = "success";//返回退票结果
		String invcNo = searchVO.getInvcNo();// 索赔结算单信息
		//1、根据结算报表编号查询结算单信息
		List<ClaimInvoiceVO> claimInvoiceVOList = new ArrayList<ClaimInvoiceVO>();//接收根据结算单编号查询的结算单信息,怕一个结算单编号对应多个结算单，导致异常现象
		claimInvoiceVOList = claimInvoiceReceptionDAO.selectClaimInvoiceReceptionByInvcNo(invcNo);//根据结算报表编号查询结算单信息
		//2、判断结算单号是否存在多条
		if(claimInvoiceVOList.size()>1){
			 result = "根据结算单号查询出多条结算单信息！";
		}else{
			ClaimInvoiceVO claimInvoiceVO = claimInvoiceVOList.get(0);//正常就应该是一条索赔结算单信息
			//3、判断当前的开票状态是否是已退票状态，如果是，则不可以再退票，如果不是，才可以退票
			if("03".equals(claimInvoiceVO.getReceiptTp())){
				result = "当前结算单状态已退票，不可以重复退票！";
			}else{
				//4、修改开票状态变为已退票/快递状态为已邮寄等退票信息
				claimInvoiceVO.setReceiptTp("03");//已退票
				claimInvoiceVO.setTrsfTp("01");//已邮寄
				//退票原因
				claimInvoiceVO.setFailMsg(searchVO.getFailMsg());//退票备注
				claimInvoiceVO.setTrsfNo(searchVO.getTrsfNo());//快递单号
				claimInvoiceVO.setExpsCmpNm(searchVO.getExpsCmpNm());//快递公司
				claimInvoiceVO.setSenderNm(searchVO.getSenderNm());//寄件人
				claimInvoiceVO.setSenderTelno(searchVO.getSenderTelno());//寄件人联系电话
				int count = claimInvoiceReceptionDAO.updateClaimInvoiceReception(claimInvoiceVO);
			}
		}
		return result;
	}
	
	/**
    * 
    *<p>Title:收票操作</p>
    * @author wangc
    * @serialData 2021年4月8日
	* @method 
	* 1、开票状态为“已开票”
    * 2、快递状态为“车厂接收”
    * 3、下发DMS
    * @param invcNo 索赔结算单信息
    * @return String
    */
	@Override
	public String takerClaimInvoiceReception(String invcNo) {
		String result = "success";//返回收票结果
		//1、根据结算报表编号查询结算单信息
		List<ClaimInvoiceVO> claimInvoiceVOList = new ArrayList<ClaimInvoiceVO>();//接收根据结算单编号查询的结算单信息,怕一个结算单编号对应多个结算单，导致异常现象
		claimInvoiceVOList = claimInvoiceReceptionDAO.selectClaimInvoiceReceptionByInvcNo(invcNo);//根据结算报表编号查询结算单信息
		//2、判断结算单号是否存在多条
		if(claimInvoiceVOList.size()>1){
			 result = "根据结算单号查询出多条结算单信息！";
		}else{
			ClaimInvoiceVO claimInvoiceVO = claimInvoiceVOList.get(0);//正常就应该是一条索赔结算单信息
			//3、判断当前的开票状态是否是已退票状态，如果是，则不可以再退票，如果不是，才可以退票
			if("03".equals(claimInvoiceVO.getReceiptTp())){
				result = "当前结算单状态已退票，不可以在收票！";
			}else{
				//4、开票状态为“已开票”/快递状态为“车厂接收”
				claimInvoiceVO.setReceiptTp("01");//已开票
				claimInvoiceVO.setTrsfTp("02");//已邮寄
				int count = claimInvoiceReceptionDAO.updateClaimInvoiceReception(claimInvoiceVO);
			}
		}
		
		return null;
	}
	
	
}
