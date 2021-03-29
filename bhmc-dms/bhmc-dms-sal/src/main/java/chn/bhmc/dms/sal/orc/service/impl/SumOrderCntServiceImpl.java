package chn.bhmc.dms.sal.orc.service.impl;


import java.util.*;

import javax.annotation.*;

import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.jxls.common.*;
import org.springframework.context.i18n.*;
import org.springframework.stereotype.*;

import able.com.service.*;
import able.com.vo.*;
import chn.bhmc.dms.core.support.excel.*;
import chn.bhmc.dms.core.util.*;
import chn.bhmc.dms.sal.orc.service.*;
import chn.bhmc.dms.sal.orc.service.dao.*;
import chn.bhmc.dms.sal.orc.vo.*;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderEtcVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SumOrderCntServiceImpl
 * @Description : 종합오더현황
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.15          최초 생성
 * </pre>
 */

@Service("sumOrderCntService")
public class SumOrderCntServiceImpl extends HService implements SumOrderCntService, JxlsSupport {

    /**
     * 종합오더현황 DAO 선언
     */
    @Resource(name="sumOrderCntDAO")
    SumOrderCntDAO sumOrderCntDAO;


    /**
     * 조회 조건에 해당하는 종합오더현황-딜러 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    @Override
    public List<SumOrderCntVO> selectSumOrderCntDlrsByCondition(SumOrderCntSearchVO searchVO) throws Exception{
        return sumOrderCntDAO.selectSumOrderCntDlrsByCondition(searchVO);
    }
    
    /**
     * 新增订单综合现况新统计逻辑service
     * @param searchVO 
     * @return 조회 목록
     */
    @Override
    public List<SumOrderCntVO> selectSumOrderCntDlrsByConditionForNew(SumOrderCntSearchVO searchVO) throws Exception{
        return sumOrderCntDAO.selectSumOrderCntDlrsByConditionForNew(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectSumOrderCntDlrsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception{
        return sumOrderCntDAO.selectSumOrderCntDlrsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 종합오더현황-딜러 세부 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    @Override
    public List<SumOrderCntSubVO> selectSumOrderCntDlrSubsByCondition(SumOrderCntSearchVO searchVO) throws Exception{
        return sumOrderCntDAO.selectSumOrderCntDlrSubsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectSumOrderCntDlrSubsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception{
        return sumOrderCntDAO.selectSumOrderCntDlrSubsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 종합오더현황-딜러 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    @Override
    public List<SumOrderCntVO> selectSumOrderCntDlrsAsByCondition(SumOrderCntSearchVO searchVO) throws Exception{
        return sumOrderCntDAO.selectSumOrderCntDlrsAsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectSumOrderCntDlrsAsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception{
        return sumOrderCntDAO.selectSumOrderCntDlrsAsByConditionCnt(searchVO);
    }

    /**
     * 엑셀다운로드
     **/
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {
        SumOrderCntSearchVO searchVO = new SumOrderCntSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
         }
        
        String sIdentification = jsonDataJudge(params.get("sIdentification"));
        String sComOderDetai = jsonDataJudge(params.get("sComOderDetai"));
       
        if(searchVO.issMainSubDivision()==true){ // true 일때가 메인 그리드 데이터 export
        	//20180919订单综合现况统计逻辑变更_下载逻辑变更 update by sunzq start
             /*if(searchVO.getStrOrdTp().equals("N1")||searchVO.getStrOrdTp().equals("AD")||searchVO.getStrOrdTp().equals("NS")||searchVO.getStrOrdTp().equals("N7")||searchVO.getStrOrdTp().equals("N5")){
                  List<SumOrderCntVO> list = selectSumOrderCntDlrsByCondition(searchVO); // 메인
                  context.putVar("items", list);
               }else{
                   List<SumOrderCntVO> list = selectSumOrderCntDlrsAsByCondition(searchVO); // 메인
                   context.putVar("items", list);
               }*/
        	List<SumOrderCntVO> list = selectSumOrderCntDlrsByConditionForNew(searchVO); // 메인
            context.putVar("items", list);
        	//20180919订单综合现况统计逻辑变更_下载逻辑变更 update by sunzq end
            }else if(sIdentification.equals("orderSalesInter")){
            	CommonCodeListVO   commonCodeListVO = selectSumOrderCntSalesInterfaceDlrs(searchVO); 
            	List<SumOrderCntVO> list = commonCodeListVO.getSumOrderCntListVO();
            	context.putVar("items", list);
            }else if(sComOderDetai.equals("comOderDetai")) {
            	CommonCodeListVO   commonCodeListVO =  selectSumOrderCntSalesInterfaceDlrSubs(searchVO);
            	List<SumOrderCntSubVO> list = commonCodeListVO.getSumOrderCntSubListVO();
            	context.putVar("items", list);
            }else{
            	//R19092902175 订单综合详情  明细查询修改 贾明 2019-10-9  详细情况 下载功能  start
            	if(!StringUtils.isBlank(params.get("sOrdStartDt").toString())){
                    String sOrdStartDt = params.get("sOrdStartDt").toString();
                    Date ordStartDt = DateUtil.convertToDate(sOrdStartDt);
                    searchVO.setsOrdStartDt(ordStartDt);
                }
                if(!StringUtils.isBlank(params.get("sOrdEndDt").toString())){
                    String sOrdEndDt = params.get("sOrdEndDt").toString();
                    Date ordEndDt = DateUtil.convertToDate(sOrdEndDt);
                    searchVO.setsOrdEndDt(ordEndDt);
                }
              //R19092902175 订单综合详情  明细查询修改 贾明 2019-10-9  详细情况 下载功能 end
            	List<SumOrderCntSubVO> list = selectSumOrderCntDlrSubsByCondition(searchVO);  // 서브
                context.putVar("items", list);
            }

    }
    public static void main(String[] args) {
    	
	}
    

	@Override
	public CommonCodeListVO selectSumOrderCntDlrSalesInterfaceCommonCodeValues(String langCd)
			throws Exception {
		
		CommonCodeListVO  commonCodeListVO = new CommonCodeListVO();
		List<OrderTypeVO> arrOrderTypeListVO = new ArrayList<OrderTypeVO>();//订单类型
		List<OrderStatusVO> arrOrderStatListVO = new ArrayList<OrderStatusVO>();//订购状态
		List<BtoOrdStatCdVO> arrBtoOrdStatCdVO = new ArrayList<BtoOrdStatCdVO>();//BTO订购状态信息
		List<VinmVlocVO>  arrVinmVlocVO  = new  ArrayList<VinmVlocVO>();//工厂信息实体类
		
		List<BtoCreateOrderEtcVO>  arrBtoCreateOrderEtcVO  = new  ArrayList<BtoCreateOrderEtcVO>();//订单周期实体类
		List<VehicleSpecVO>  arrVehicleSpecVO  = new  ArrayList<VehicleSpecVO>();//车种实体类
		
		//String url = "http://localhost:8081/bhmc-dcs-web/salesInter/sal/orderComprCurrent/selectOrderComprCurrentMain.do";
 		 String url = "http://10.125.211.140/salesInter/sal/orderComprCurrent/selectOrderComprCurrentMain.do";
         String params = "sLangCd="+langCd;
 		 HttpGet request =  new HttpGet(url+"?"+params);
         CloseableHttpClient httpClient = HttpClientBuilder.create().build();

         try{

             //StringEntity requestEntity = new StringEntity(BrandToJosn, "UTF-8");
             request.addHeader("content-type", "application/x-www-form-urlencoded");
             //request.setEntity(requestEntity);
             
             HttpResponse response = httpClient.execute(request);
             HttpEntity responseEntity = response.getEntity();
             String responseText = EntityUtils.toString(responseEntity, "UTF-8");

             log.debug("==RECEIVE DATA==");
             log.debug(responseText);

             Object obj = JSONValue.parseWithException(responseText);
             JSONObject jsonRecvData = (JSONObject)obj;
             JSONObject  orderResult = (JSONObject) jsonRecvData.get("result");
             String resultMsg = jsonRecvData.get("resultMsg").toString();
             JSONObject jsonM = (JSONObject)orderResult;
             if("success".equals(resultMsg)){
            	 //订单类型  start ordTpDSarrays 
                 JSONArray ordTpDSarray = (JSONArray) jsonM.get("ordTpDS");
                 System.out.println("result的值"+orderResult);
                 JSONObject ordTpDSjobj = null;
                 OrderTypeVO orderTypeListVO = new OrderTypeVO();
               if(ordTpDSarray != null){
                     int iSize = ordTpDSarray.size();
                     for(int j = 0; j < iSize; j++){
                    	 ordTpDSjobj = (JSONObject) ordTpDSarray.get(j);
                         orderTypeListVO = new OrderTypeVO();
                         orderTypeListVO.setCmmCd(ordTpDSjobj.get("cmmCd").toString());
                         orderTypeListVO.setCmmCdNm(ordTpDSjobj.get("cmmCdNm").toString());
                         orderTypeListVO.setCmmGrpCd(ordTpDSjobj.get("cmmGrpCd").toString());
                         orderTypeListVO.setCmmGrpCdNm(ordTpDSjobj.get("cmmGrpCdNm").toString());
                         orderTypeListVO.setUseYn(ordTpDSjobj.get("useYn").toString());
                         arrOrderTypeListVO.add(orderTypeListVO);
                     }
                 }
               //订单类型 end
               
             //订购状态  start ordStatCdDSarray 
               JSONArray ordStatCdDSarray = (JSONArray) jsonM.get("ordStatCdDS");
               System.out.println("result的值"+orderResult);
               JSONObject ordStatCdDSjobj = null;
               OrderStatusVO orderStatusVO = new OrderStatusVO();
              if(ordStatCdDSarray != null){
                   int iSize = ordStatCdDSarray.size();
                   for(int j = 0; j < iSize; j++){
                	   ordStatCdDSjobj = (JSONObject) ordStatCdDSarray.get(j);
                	   orderStatusVO = new OrderStatusVO();
                	   orderStatusVO.setCmmCd(ordStatCdDSjobj.get("cmmCd").toString());
                	   orderStatusVO.setCmmCdNm(ordStatCdDSjobj.get("cmmCdNm").toString());
                	   orderStatusVO.setCmmGrpCd(ordStatCdDSjobj.get("cmmGrpCd").toString());
                	   orderStatusVO.setCmmGrpCdNm(ordStatCdDSjobj.get("cmmGrpCdNm").toString());
                	   orderStatusVO.setUseYn(ordStatCdDSjobj.get("useYn").toString());
                	   arrOrderStatListVO.add(orderStatusVO);
                   }
               }
             //订购状态 end
               
              //BTO订购状态  start ordStatCdDSarray 
              JSONArray btoOrdStatCdDSarray = (JSONArray) jsonM.get("btoOrdStatCdDS");
              System.out.println("result的值"+orderResult);
              JSONObject btoOrdStatCdDSjobj = null;
              BtoOrdStatCdVO btoOrdStatCdVO = new BtoOrdStatCdVO();
             if(btoOrdStatCdDSarray != null){
                  int iSize = btoOrdStatCdDSarray.size();
                  for(int j = 0; j < iSize; j++){
                	  btoOrdStatCdDSjobj = (JSONObject) btoOrdStatCdDSarray.get(j);
                	  btoOrdStatCdVO = new BtoOrdStatCdVO();
                	  btoOrdStatCdVO.setCmmCd(btoOrdStatCdDSjobj.get("cmmCd").toString());
                	  btoOrdStatCdVO.setCmmCdNm(btoOrdStatCdDSjobj.get("cmmCdNm").toString());
                	  btoOrdStatCdVO.setCmmGrpCd(btoOrdStatCdDSjobj.get("cmmGrpCd").toString());
                	  btoOrdStatCdVO.setCmmGrpCdNm(btoOrdStatCdDSjobj.get("cmmGrpCdNm").toString());
                	  btoOrdStatCdVO.setUseYn(btoOrdStatCdDSjobj.get("useYn").toString());
                	  arrBtoOrdStatCdVO.add(btoOrdStatCdVO);
                  }
              }
            //BTO订购状态  end
             
           //工厂   start ordStatCdDSarray 
             JSONArray vinmVlocDSarray = (JSONArray) jsonM.get("vinmVlocDS");
             System.out.println("result的值"+orderResult);
             JSONObject vinmVlocDSjobj = null;
             VinmVlocVO vinmVlocVO = new VinmVlocVO();
            if(vinmVlocDSarray != null){
                 int iSize = vinmVlocDSarray.size();
                 for(int j = 0; j < iSize; j++){
                	 vinmVlocDSjobj = (JSONObject) vinmVlocDSarray.get(j);
                	 vinmVlocVO = new VinmVlocVO();
                	 vinmVlocVO.setCmmCd(vinmVlocDSjobj.get("cmmCd").toString());
                	 vinmVlocVO.setCmmCdNm(vinmVlocDSjobj.get("cmmCdNm").toString());
                	 vinmVlocVO.setCmmGrpCd(vinmVlocDSjobj.get("cmmGrpCd").toString());
                	 vinmVlocVO.setCmmGrpCdNm(vinmVlocDSjobj.get("cmmGrpCdNm").toString());
                	 vinmVlocVO.setUseYn(vinmVlocDSjobj.get("useYn").toString());
                	 arrVinmVlocVO.add(vinmVlocVO);
                 }
             }
           //工厂   end
            
          //订单周期   start ordYyMmPridInfo 
            JSONArray ordYyMmPridInfoArray = (JSONArray) jsonM.get("ordYyMmPridInfo");
            System.out.println("result的值"+orderResult);
            JSONObject ordYyMmPridInfoJobj = null;
            BtoCreateOrderEtcVO btoCreateOrderEtcVO = new BtoCreateOrderEtcVO();
           if(ordYyMmPridInfoArray != null){
                int iSize = ordYyMmPridInfoArray.size();
                for(int j = 0; j < iSize; j++){
                	ordYyMmPridInfoJobj = (JSONObject) ordYyMmPridInfoArray.get(j);
                	btoCreateOrderEtcVO = new BtoCreateOrderEtcVO();
                	btoCreateOrderEtcVO.setBtoYmwCd(ordYyMmPridInfoJobj.get("btoYmwCd").toString());
                	btoCreateOrderEtcVO.setBtoYmwNm(ordYyMmPridInfoJobj.get("btoYmwNm").toString());
                	btoCreateOrderEtcVO.setPfpExamDt(ordYyMmPridInfoJobj.get("pfpExamDt").toString());
               	    arrBtoCreateOrderEtcVO.add(btoCreateOrderEtcVO);
                }
            }
          //订单周期  end
           
           //车种  start carLineCdInfo 
           JSONArray carLineCdInfoArray = (JSONArray) jsonM.get("carLineCdInfo");
           System.out.println("result的值"+orderResult);
           JSONObject carLineCdInfoJobj = null;
           VehicleSpecVO vehicleSpecVO = new VehicleSpecVO();
          if(carLineCdInfoArray != null){
               int iSize = carLineCdInfoArray.size();
               for(int j = 0; j < iSize; j++){
            	   carLineCdInfoJobj = (JSONObject)carLineCdInfoArray.get(j);
            	   vehicleSpecVO = new VehicleSpecVO();
            	   vehicleSpecVO.setCarlineCd(carLineCdInfoJobj.get("carlineCd").toString());
            	   vehicleSpecVO.setCarlineEnNm(carLineCdInfoJobj.get("carlineEnNm").toString());
            	   vehicleSpecVO.setCarlineNm(carLineCdInfoJobj.get("carlineNm").toString());
            	   vehicleSpecVO.setCarlineNmNc(carLineCdInfoJobj.get("carlineNmNc").toString());
            	   vehicleSpecVO.setModelCnt(Integer.parseInt(carLineCdInfoJobj.get("modelCnt").toString()));
            	   arrVehicleSpecVO.add(vehicleSpecVO);
               }
           }
          //车种  end
          commonCodeListVO.setOrderTypeListVO(arrOrderTypeListVO);
          commonCodeListVO.setOrderStatuslistVO(arrOrderStatListVO);
          commonCodeListVO.setBtoOrdStatCdListVO(arrBtoOrdStatCdVO);
          commonCodeListVO.setVinmVlocListVO(arrVinmVlocVO);
          commonCodeListVO.setOrdYyMmPridInfoListVO(arrBtoCreateOrderEtcVO);
          commonCodeListVO.setCarLineCdInfoListVO(arrVehicleSpecVO);
          System.out.println("数据"+messageSource.getMessage("ser.lbl.roDocNo", null, LocaleContextHolder.getLocale()));
         }else if("failed".equals(resultMsg)){
        	 //throw processException("global.btn.failed");
        	 //throw processException("global.info.alreadyCont", new String[]{messageSource.getMessage("ser.lbl.roDocNo", null, LocaleContextHolder.getLocale())});
        	 throw processException("par.lbl.ifErrMsgParam", new String[]{messageSource.getMessage("global.lbl.orderStatus", null, LocaleContextHolder.getLocale())});
         }
           
         }catch (Exception e) {
             log.error(e.getMessage(), e);
         }finally{
             try{
                 httpClient.close();
             }catch(Exception e){}
         }
 		
         return commonCodeListVO;
	}
     

	@SuppressWarnings("unchecked")
	@Override
	public CommonCodeListVO selectSumOrderCntSalesInterfaceDlrs(SumOrderCntSearchVO searchVO) throws Exception {
		CommonCodeListVO  commonCodeListVO = new CommonCodeListVO();
		List<SumOrderCntVO>  sumOrderCntListVO = new ArrayList<SumOrderCntVO>();
		//String url = "http://localhost:8081/bhmc-dcs-web/salesInter/sal/orderComprCurrent/selectSumOrderCntDlrs.do";
		String url = "http://10.125.211.140/salesInter/sal/orderComprCurrent/selectSumOrderCntDlrs.do";
		HttpPost request =  new HttpPost(url);
        CloseableHttpClient httpClient = HttpClientBuilder.create().build();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("firstIndex",searchVO.getFirstIndex());
        jsonObject.put("lastIndex",searchVO.getLastIndex());
        jsonObject.put("pageIndex",searchVO.getPageIndex());
        jsonObject.put("recordCountPerPage",searchVO.getRecordCountPerPage());
        jsonObject.put("sCarlineCd",searchVO.getsCarlineCd());
        jsonObject.put("sDlrCd",searchVO.getsDlrCd());
        jsonObject.put("sExtColorCd",searchVO.getsExtColorCd());
        jsonObject.put("sFscCd",searchVO.getsFscCd());
        jsonObject.put("sIntColorCd",searchVO.getsIntColorCd());
        jsonObject.put("sModelCd",searchVO.getsModelCd());
        jsonObject.put("sOcnCd",searchVO.getsOcnCd());
        jsonObject.put("sOrdEndFormatDt",searchVO.getsOrdEndFormatDt());//searchVO.getsOrdEndDt()
        jsonObject.put("sOrdPrid",searchVO.getsOrdPrid());
        jsonObject.put("sOrdStartFormatDt",searchVO.getsOrdStartFormatDt());//searchVO.getsOrdStartDt()
        jsonObject.put("sOrdsTp",searchVO.getsOrdsTp());
        jsonObject.put("strOrdTp",searchVO.getStrOrdTp());
        
        //jsonObject.put("KEY2", );
        try {
        	StringEntity requestEntity = new StringEntity(jsonObject.toString(), "UTF-8");
            //request.addHeader("content-type", "application/x-www-form-urlencoded");
        	request.addHeader("content-type", "application/json;charset=utf-8");
            request.setEntity(requestEntity);
            HttpResponse response = httpClient.execute(request);
            HttpEntity responseEntity = response.getEntity();
            String responseText = EntityUtils.toString(responseEntity, "UTF-8");
           

            log.debug("==RECEIVE DATA==");
            log.debug(responseText);
            Object obj = JSONValue.parseWithException(responseText);
            JSONObject jsonRecvData = (JSONObject)obj;
            JSONObject  orderResult = (JSONObject) jsonRecvData.get("result");
            String resultMsg = jsonRecvData.get("resultMsg").toString();
            JSONObject totalVal = (JSONObject)orderResult;
            commonCodeListVO.setTotal(Long.parseLong(totalVal.get("total").toString())) ;
            JSONObject jsonM = (JSONObject)orderResult;
            if("success".equals(resultMsg)){
            	JSONArray array = (JSONArray) jsonM.get("data");
            	JSONObject jobj = null;
            	SumOrderCntVO sumOrderCntVO = new SumOrderCntVO();
            	 if(array != null){
            		 int iSize = array.size();
            		 for(int j = 0; j < iSize; j++){
            			 jobj = (JSONObject) array.get(j);
            			 sumOrderCntVO = new SumOrderCntVO();
            			 sumOrderCntVO.setCarlineCd(jsonDataJudge(jobj.get("carlineCd")));
            			 sumOrderCntVO.setCarlineNm(jsonDataJudge(jobj.get("carlineNm")));
            			 sumOrderCntVO.setCnclQty(Integer.parseInt(jobj.get("cnclQty").toString()));
            			 sumOrderCntVO.setDlrCd(jsonDataJudge(jobj.get("dlrCd")));
            			 sumOrderCntVO.setDlrCnclQty(Integer.parseInt(jobj.get("dlrCnclQty").toString()));
            			 sumOrderCntVO.setDlrInQty(Integer.parseInt(jobj.get("dlrInQty").toString()));
            			 sumOrderCntVO.setDlrOutQty(Integer.parseInt(jobj.get("dlrOutQty").toString()));
            			 sumOrderCntVO.setDlrSaleQty(Integer.parseInt(jobj.get("dlrSaleQty").toString()));
            			 sumOrderCntVO.setErrorCount(Integer.parseInt(jobj.get("errorCount").toString()));
            			 sumOrderCntVO.setExtColorCd(jsonDataJudge(jobj.get("extColorCd")));
            			 sumOrderCntVO.setExtColorNm(jsonDataJudge(jobj.get("extColorNm")));
            			 sumOrderCntVO.setFinalConfQty(Integer.parseInt(jobj.get("finalConfQty").toString()));
            			 sumOrderCntVO.setFinalQty(Integer.parseInt(jobj.get("finalQty").toString()));
            			 sumOrderCntVO.setFstConfirmQty(Integer.parseInt(jobj.get("fstConfirmQty").toString()));
            			 sumOrderCntVO.setGateOutQty(Integer.parseInt(jobj.get("gateOutQty").toString()));
            			 sumOrderCntVO.setIntColorCd(jsonDataJudge(jobj.get("intColorCd")));
            			 sumOrderCntVO.setIntColorNm(jsonDataJudge(jobj.get("intColorNm")));
            			 sumOrderCntVO.setMissSetQty(Integer.parseInt(jobj.get("missSetQty").toString()));
            			 sumOrderCntVO.setModelCd(jsonDataJudge(jobj.get("modelCd")));
            			 sumOrderCntVO.setModelNm(jsonDataJudge(jobj.get("modelNm")));
            			 sumOrderCntVO.setnOrdQty(Integer.parseInt(jobj.get("nOrdQty").toString()));
            			 sumOrderCntVO.setNonAlocQty(Integer.parseInt(jobj.get("nonAlocQty").toString()));
            			 sumOrderCntVO.setOcnCd(jsonDataJudge(jobj.get("ocnCd")));
            			 sumOrderCntVO.setOcnNm(jsonDataJudge(jobj.get("ocnNm")));
            			 //sumOrderCntVO.setOrdGradeCd(jobj.get("ordGradeCd").toString());
            			 sumOrderCntVO.setOrdQty(Integer.parseInt(jobj.get("ordQty").toString()));
            			 sumOrderCntVO.setOrdTp(jsonDataJudge(jobj.get("ordTp")));
            			 sumOrderCntVO.setOrdTpNm(jsonDataJudge(jobj.get("ordTpNm")));
            			 sumOrderCntVO.setOrdYyMmDt(jsonDataJudge(jobj.get("ordYyMmDt")));
            			 sumOrderCntVO.setPdiQty(Integer.parseInt(jobj.get("pdiQty").toString()));
            			 sumOrderCntVO.setRegUsrId(jsonDataJudge(jobj.get("regUsrId")));
            			 sumOrderCntVO.setScndConfirmQty(Integer.parseInt(jobj.get("scndConfirmQty").toString()));
            			 sumOrderCntVO.setScndParIsffAdjQty(Integer.parseInt(jobj.get("scndParIsffAdjQty").toString()));
            			 sumOrderCntVO.setSrchTotCnt(Integer.parseInt(jobj.get("srchTotCnt").toString()));
            			 sumOrderCntVO.setSumTotalQty(Integer.parseInt(jobj.get("sumTotalQty").toString()));
            			 sumOrderCntVO.setTranMissQty(Integer.parseInt(jobj.get("tranMissQty").toString()));
            			 sumOrderCntVO.setVinQty(Integer.parseInt(jobj.get("vinQty").toString()));
            			 sumOrderCntVO.setWeek(jsonDataJudge(jobj.get("week")));
            			 sumOrderCntVO.setWtOrdQty(Integer.parseInt(jobj.get("wtOrdQtys").toString()));
            			 sumOrderCntVO.setYyMm(jsonDataJudge(jobj.get("yyMm")));
            			 sumOrderCntListVO.add(sumOrderCntVO);
            		 }
            	 }
            	 commonCodeListVO.setSumOrderCntListVO(sumOrderCntListVO);
            }else if("failed".equals(resultMsg)){
           	 //throw processException("global.btn.failed");
           	 //throw processException("global.info.alreadyCont", new String[]{messageSource.getMessage("ser.lbl.roDocNo", null, LocaleContextHolder.getLocale())});
             throw processException("par.lbl.ifErrMsgParam", new String[]{messageSource.getMessage("global.lbl.orderStatus", null, LocaleContextHolder.getLocale())});
            }
            
		} catch (Exception e) {
			  log.error(e.getMessage(), e);
        }finally{
            try{
                httpClient.close();
            }catch(Exception e){}
        }
        return commonCodeListVO;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public CommonCodeListVO selectSumOrderCntSalesInterfaceDlrSubs(SumOrderCntSearchVO searchVO) throws Exception {
		CommonCodeListVO  commonCodeListVO = new CommonCodeListVO();
		List<SumOrderCntSubVO>  sumOrderCntSubListVO = new ArrayList<SumOrderCntSubVO>();
		//String url = "http://localhost:8081/bhmc-dcs-web/salesInter/sal/orderComprCurrent/selectSumOrderCntDlrSubs.do";
		String url = "http://10.125.211.140/salesInter/sal/orderComprCurrent/selectSumOrderCntDlrSubs.do";
		HttpPost request =  new HttpPost(url);
        CloseableHttpClient httpClient = HttpClientBuilder.create().build();
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setsLangCd(langCd);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("sDlrCd",searchVO.getsDlrCd());
        jsonObject.put("sOrdYyMmDt",searchVO.getsOrdYyMmDt());
        jsonObject.put("sOrdPrid",searchVO.getsOrdPrid());
        jsonObject.put("sOrdsTp",searchVO.getsOrdsTp());
        jsonObject.put("sCarlineCd",searchVO.getsCarlineCd());
        jsonObject.put("sModelCd",searchVO.getsModelCd());
        jsonObject.put("sOcnCd",searchVO.getsOcnCd());
        jsonObject.put("sExtColorCd",searchVO.getsExtColorCd());
        jsonObject.put("sIntColorCd",searchVO.getsIntColorCd());
        jsonObject.put("sOrdNo",searchVO.getsOrdNo());
        jsonObject.put("sregUsrId",searchVO.getSregUsrId());
        jsonObject.put("sordGradeCd",searchVO.getSordGradeCd());
        jsonObject.put("sLangCd",searchVO.getsLangCd());
        
        
        try {
        	StringEntity requestEntity = new StringEntity(jsonObject.toString(), "UTF-8");
            //request.addHeader("content-type", "application/x-www-form-urlencoded");
        	request.addHeader("content-type", "application/json;charset=utf-8");
            request.setEntity(requestEntity);
            HttpResponse response = httpClient.execute(request);
            HttpEntity responseEntity = response.getEntity();
            String responseText = EntityUtils.toString(responseEntity, "UTF-8");
            log.debug("==RECEIVE DATA==");
            log.debug(responseText);
            Object obj = JSONValue.parseWithException(responseText);
            JSONObject jsonRecvData = (JSONObject)obj;
            JSONObject  orderResult = (JSONObject) jsonRecvData.get("result");
            String resultMsg = jsonRecvData.get("resultMsg").toString();
            JSONObject totalVal = (JSONObject)orderResult;
            commonCodeListVO.setTotal(Long.parseLong(totalVal.get("total").toString())) ;
            JSONObject jsonM = (JSONObject)orderResult;
            if("success".equals(resultMsg)){
            	JSONArray array = (JSONArray) jsonM.get("data");
            	JSONObject jobj = null;
            	SumOrderCntSubVO sumOrderCntSubVO = new SumOrderCntSubVO();
            	 if(array != null){
            		 int iSize = array.size();
            		 for(int j = 0; j < iSize; j++){
            			 jobj = (JSONObject) array.get(j);
            			 sumOrderCntSubVO = new SumOrderCntSubVO();
            			 //sumOrderCntVO.setCarlineCd(jsonDataJudge(jobj.get("carlineCd")));
            			 sumOrderCntSubVO.setOrdTp(jsonDataJudge(jobj.get("ordTp")));
            			 sumOrderCntSubVO.setOrdStatCd(jsonDataJudge(jobj.get("ordStatCd")));
            			 sumOrderCntSubVO.setOrdDt(jsonDataJudge(jobj.get("ordDt")));
            			 sumOrderCntSubVO.setRegUsrId(jsonDataJudge(jobj.get("regUsrId")));
            			 sumOrderCntSubVO.setOrdSeq(jsonDataJudge(jobj.get("ordSeq")));
            			 sumOrderCntSubVO.setVinmVloc(jsonDataJudge(jobj.get("vinmVloc")));
            			 sumOrderCntSubVO.setInno(jsonDataJudge(jobj.get("inno")));
            			 sumOrderCntSubVO.setCarlineCd(jsonDataJudge(jobj.get("carlineCd")));
            			 sumOrderCntSubVO.setCarlineNm(jsonDataJudge(jobj.get("carlineNm")));
            			 sumOrderCntSubVO.setModelNm(jsonDataJudge(jobj.get("modelNm")));
            			 sumOrderCntSubVO.setOcnCd(jsonDataJudge(jobj.get("ocnCd")));
            			 sumOrderCntSubVO.setOcnNm(jsonDataJudge(jobj.get("ocnNm")));
            			 sumOrderCntSubVO.setExtColorCd(jsonDataJudge(jobj.get("extColorCd")));
            			 sumOrderCntSubVO.setExtColorNm(jsonDataJudge(jobj.get("extColorNm")));
            			 sumOrderCntSubVO.setIntColorCd(jsonDataJudge(jobj.get("intColorCd")));
            			 sumOrderCntSubVO.setVinNo(jsonDataJudge(jobj.get("vinNo")));
            			 sumOrderCntSubVO.setPdiDt(jsonDataJudge(jobj.get("pdiDt")));
            			 sumOrderCntSubVO.setVinDt(jsonDataJudge(jobj.get("vinDt")));
            			 sumOrderCntSubVO.setRetailDtStr(jsonDataJudge(jobj.get("retailDtStr")));
            			 sumOrderCntSubVO.setDlrGrDtStr(jsonDataJudge(jobj.get("dlrGrDtStr")));
            			 sumOrderCntSubVO.setCustSaleDtStr(jsonDataJudge(jobj.get("custSaleDtStr")));
            			 sumOrderCntSubVO.setOrdTpNm(jsonDataJudge(jobj.get("ordTpNm")));
            			 sumOrderCntSubVO.setOrdStatCdNm(jsonDataJudge(jobj.get("ordStatCdNm")));
            			 sumOrderCntSubListVO.add(sumOrderCntSubVO);
            		 }
            	 }
            	 commonCodeListVO.setSumOrderCntSubListVO(sumOrderCntSubListVO);
            }else if("failed".equals(resultMsg)){
           	 //throw processException("global.btn.failed");
           	 throw processException("par.lbl.ifErrMsgParam", new String[]{messageSource.getMessage("global.lbl.orderStatus", null, LocaleContextHolder.getLocale())});
            }
            
		} catch (Exception e) {
			  log.error(e.getMessage(), e);
        }finally{
            try{
                httpClient.close();
            }catch(Exception e){}
        }
        return commonCodeListVO;
		
	}
	
	/**
	 * json 数据空指针异常处理 贾明 2019-4-9
	 * @param data
	 * @return
	 */
	private static String jsonDataJudge(Object data){
		String result = "";
		if(null != data){
			result = data.toString();
		}
		return result;
		
	}

	
	
}
