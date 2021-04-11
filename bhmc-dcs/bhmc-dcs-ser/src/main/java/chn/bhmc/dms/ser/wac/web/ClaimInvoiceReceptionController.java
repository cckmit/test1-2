package chn.bhmc.dms.ser.wac.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.ser.svi.service.LaborCodeManageService;
import chn.bhmc.dms.ser.svi.vo.LtsModelSearchVO;
import chn.bhmc.dms.ser.wac.service.ClaimInvoiceReceptionService;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceDetailSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceSearchVO;
/**
 * 
 *<p>Title:索赔发票接收</p>
 * @author wangc 2021年4月7日23:00:52
 * @param
 * @return
 */
@Controller
public class ClaimInvoiceReceptionController extends HController{
	//索赔发票接收业务层
	@Resource(name="claimInvoiceReceptionService")
	ClaimInvoiceReceptionService claimInvoiceReceptionService;
	//页面下拉选框业务层
	@Resource(name="commonCodeService")
	CommonCodeService commonCodeService;
		
	
	 /**
	  * 
	  *<p>Title:索赔发票接收页面跳转</p>
	  * @author wangc
	  * @serialData 2021年4月8日
	  * @method 
	  * 1、页面时间赋值，
	  * 2、页面下拉选赋值
	  * 3、返回页面路径
	  * @param model
	  * @return String
	  * @throws Exception
	  */
	 @RequestMapping(value="/ser/wac/claimlnvoice/selectClaimInvoiceReceptionMain.do")
	 public String selectLaborManageMain(Model model)throws Exception{
		 String langCd = LocaleContextHolder.getLocale().getLanguage();
		 //1、页面时间赋值
		 model.addAttribute("invcsFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), "yyyy-MM-dd") );//结算报表年月日开始时间
	     model.addAttribute("invcsToDt", DateUtil.getDate("yyyy-MM-dd"));//结算报表年月日结束时间
		 //2、页面下拉选赋值
	     model.addAttribute("receiptTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SEF1004", null, LocaleContextHolder.getLocale().getLanguage()));//开票状态
	     model.addAttribute("trsfTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SEF1005", null, LocaleContextHolder.getLocale().getLanguage()));//快递状态

	     
		 return "/ser/wac/claimlnvoice/selectClaimInvoiceReceptionMain";
	 }
	 
	   /**
	    * 
	    *<p>Title:获取索赔发票结算单列表数据</p>
	    * @author wangc
		* @serialData 2021年4月8日
		* @method 
		* 1、查询列表数量
		* 2、查询列表数据
	    * @param searchVO
	    * @return SearchResult
	    * @throws Exception
	    */
	   @RequestMapping(value = "/ser/wac/claimlnvoice/selectClaimInvoiceReception.do", method = RequestMethod.POST)
	   @ResponseBody
	   public SearchResult selectClaimInvoiceReception(@RequestBody ClaimInvoiceSearchVO searchVO)throws Exception{

	        SearchResult result = new SearchResult();
	        
	        result.setTotal(claimInvoiceReceptionService.selectClaimInvoiceReceptionForInvoiceByInvoiceCnt(searchVO)); //1、查询列表数量
	        if(result.getTotal() != 0){
	            result.setData(claimInvoiceReceptionService.selectClaimInvoiceReceptionForInvoiceByInvoicel(searchVO));//2、查询列表数据
	        }

	      return result;

	   }
	   
	   
	   
	   /**
	    * 
	    *<p>Title:获取索赔发票单列表数据</p>
	    * @author wangc
		* @serialData 2021年4月8日
		* @method 
		* 1、查询列表数量
		* 2、查询列表数据（根据备注单号进行查询）
	    * @param searchVO
	    * @return SearchResult
	    * @throws Exception
	    */
	   @RequestMapping(value = "/ser/wac/claimlnvoice/selectClaimInvoiceDetail.do", method = RequestMethod.POST)
	   @ResponseBody
	   public SearchResult selectClaimInvoiceDetail(@RequestBody ClaimInvoiceDetailSearchVO searchVO)throws Exception{

	        SearchResult result = new SearchResult();
	        
	        result.setTotal(claimInvoiceReceptionService.selectClaimInvoiceDetailForInvoiceByInvoiceCnt(searchVO)); //1、查询列表数量
	        if(result.getTotal() != 0){
	            result.setData(claimInvoiceReceptionService.selectClaimInvoiceDetailForInvoiceByInvoicel(searchVO));//2、查询列表数据
	        }

	      return result;

	   }
	   /**
	    * 
	    *<p>Title:退票操作</p>
	    * @author wangc
	    * @serialData 2021年4月8日
		* @method 
		* 1、退票业务操作
	    * @param searchVO
	    * @return String
	    */
	   @RequestMapping(value = "/ser/wac/claimlnvoice/refundClaimInvoiceReception.do", method = RequestMethod.POST)
	   @ResponseBody
	   public String refundClaimInvoiceReception(@RequestBody ClaimInvoiceSearchVO searchVO){
		   String result = "success";//返回退票结果
		   try{
			   result = claimInvoiceReceptionService.refundClaimInvoiceReception(searchVO);//1、退票业务操作
		   }catch(Exception e){
			   System.out.println(e.getMessage());
			   result = e.getMessage();
		   }		   
		   return 	result;   
	   }
	   
	   
	   
	   /**
	    * 
	    *<p>Title:收票操作</p>
	    * @author wangc
	    * @serialData 2021年4月8日
		* @method 
		* 1、收票业务操作
	    * @param searchVO
	    * @return String
	    */
	   @RequestMapping(value = "/ser/wac/claimlnvoice/takerClaimInvoiceReception.do", method = RequestMethod.POST)
	   @ResponseBody
	   public String takerClaimInvoiceReception(@RequestBody String invcNo){
		   String result = "success";//返回退票结果
		   try{
			   result = claimInvoiceReceptionService.takerClaimInvoiceReception(invcNo);//1、收票业务操作
		   }catch(Exception e){
			   System.out.println(e.getMessage());
			   result = e.getMessage();
		   }	   
		   return 	result;   
	   }
	 
}
