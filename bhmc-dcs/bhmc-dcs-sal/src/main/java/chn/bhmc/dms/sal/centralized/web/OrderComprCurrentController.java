package chn.bhmc.dms.sal.centralized.web;

import javax.servlet.http.HttpServletRequest;
import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.sal.centralized.service.OrderComprCurrentService;
import chn.bhmc.dms.sal.centralized.vo.BaseJSON;
import chn.bhmc.dms.sal.centralized.vo.SumOrderCntSearchVO;
import chn.bhmc.dms.sal.centralized.vo.VehicleSpecSearchVO;
import chn.bhmc.dms.sal.orc.service.SumOrderCntService;
import chn.bhmc.dms.sal.orm.service.BtoCreateOrderService;
import chn.bhmc.dms.sal.orm.service.BtoSearchOrderService;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * 订单综合现况 Comprehensive status of orders
 *
 * @author Jia Ming
 * @since 2019. 4. 5.
 * @version 1.0
 *     
 */

@Controller
@RequestMapping(value = "/salesInter/sal/orderComprCurrent")
public class OrderComprCurrentController extends HController {

    /**
     * 종합오더현황-딜러
     */
    @Resource(name="sumOrderCntService")
    SumOrderCntService sumOrderCntService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 금융 상품 관리 서비스
     */
    @Resource(name="btoCreateOrderService")
    BtoCreateOrderService btoCreateOrderService;

    /**
     * BTO 주문조회 서비스
     */
    @Resource(name="btoSearchOrderService")
    BtoSearchOrderService btoSearchOrderService;
    
    /**
     * 订单综合现况数据 贾明2019-4-8
     */
    @Resource(name="orderComprCurrentService")
    OrderComprCurrentService orderComprCurrentService;
   

    /**
     * DMS端订单综合现况功能查询页数据接口，贾明2019-4-5
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectOrderComprCurrentMain.do", method = RequestMethod.GET,produces = "application/json; charset=utf-8")
    @ResponseBody
    public BaseJSON selectOrderComprCurrentMain(Model model,HttpServletRequest request) throws Exception{
    	 BaseJSON baseJSON = new BaseJSON();
    	try {
        	//String langCd = LocaleContextHolder.getLocale().getLanguage();
            String langCd =request.getParameter("sLangCd"); //"zh";//
           
            //  订单类型  : SAL137  订单类型 : SAL137
            model.addAttribute("ordTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL137", null, langCd));

            // BTO订购状态 BTO주문상태 : SAL135
            model.addAttribute("btoOrdStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL135", null, langCd));

            // 订购状态 주문상태 : SAL150
            model.addAttribute("ordStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL150", null, langCd));

            // 工厂  하치장 : SAL211
            model.addAttribute("vinmVlocDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL211", null, langCd));
            // 주차정보 订单周期
            BtoCreateOrderSearchVO searchVO = new BtoCreateOrderSearchVO();
            searchVO.setsOrdTp("N1");
            model.addAttribute("ordYyMmPridInfo", btoSearchOrderService.selectWeekRemark(searchVO));

            //车种
            VehicleSpecSearchVO vehicleSpecSearchVO  = new VehicleSpecSearchVO();
            model.addAttribute("carLineCdInfo", orderComprCurrentService.selectCarlineCombo(vehicleSpecSearchVO));
            baseJSON.setResultCode(200);
            baseJSON.setResultMsg("success");
            baseJSON.setResult(model);
		} catch (Exception e) {
			 baseJSON.setResultCode(500);
			 baseJSON.setResultMsg("failed");
		}

        return baseJSON;
    }
    
    /**
     * DMS端订单综合现况功能查询按钮接口，贾明2019-4-5
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectSumOrderCntDlrs.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectSumOrderCntDlrs(@RequestBody SumOrderCntSearchVO searchVO) throws Exception {
    	BaseJSON baseJSON = new BaseJSON();
    	SearchResult result = new SearchResult();
    	try {
    		  result.setTotal(orderComprCurrentService.selectSumOrderCntDlrsByConditionCnt(searchVO));
    	      if(result.getTotal() != 0){
    	           result.setData(orderComprCurrentService.selectSumOrderCntDlrsByConditionForNew(searchVO));
    	      }
    	      baseJSON.setResult(result);
    	      baseJSON.setResultCode(200);
              baseJSON.setResultMsg("success");
		} catch (Exception e) {
			 baseJSON.setResultCode(500);
			 baseJSON.setResultMsg("failed");
		}
    	
        return baseJSON;
    }
    
    
    /**
     * 综合订单现状-详细信息
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectSumOrderCntDlrSubs.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectSumOrderCntDlrSubs(@RequestBody SumOrderCntSearchVO searchVO) throws Exception {
    	BaseJSON baseJSON = new BaseJSON();
    	SearchResult result = new SearchResult();
    	try {
	        result.setTotal(orderComprCurrentService.selectSumOrderCntDlrSubsByConditionCnt(searchVO));
	        if(result.getTotal() != 0){
	            result.setData(orderComprCurrentService.selectSumOrderCntDlrSubsByCondition(searchVO));
	        }
	        baseJSON.setResult(result);
  	        baseJSON.setResultCode(200);
            baseJSON.setResultMsg("success");
    	} catch (Exception e) {
			 baseJSON.setResultCode(500);
			 baseJSON.setResultMsg("failed");
		}
        return baseJSON;
    }
    

}
