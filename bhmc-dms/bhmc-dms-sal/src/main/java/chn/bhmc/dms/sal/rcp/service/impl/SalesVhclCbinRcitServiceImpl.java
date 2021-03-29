package chn.bhmc.dms.sal.rcp.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;

import able.com.service.HService;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.BlobVO;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.RegularExpressionService;
import chn.bhmc.dms.sal.cmm.service.SalesCommonCamelService;
import chn.bhmc.dms.sal.rcp.service.SalesVhclCbinRcitService;
import chn.bhmc.dms.sal.rcp.service.dao.SalesVhclCbinRcitDAO;
import chn.bhmc.dms.sal.rcp.vo.InvoiceVO;
import chn.bhmc.dms.sal.rcp.vo.SalesVhclCbinRcitSearchVO;
import chn.bhmc.dms.sal.rcp.vo.SalesVhclCbinRcitVO;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.ser.cmm.service.VehOfCustInfoService;

/**
 * <pre>
 * 영수증관리 &gt; 기동차통일영수증관리
 * </pre>
 *
 * @ClassName : SalesVhclCbinRcitServiceImpl.java
 * @Description : 영수증관리 > 기동차통일영수증관리
 * @author chibeom.song
 * @since 2017. 2. 17.
 * @version 1.0
 * @see
 * @Modification Information
 *
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 17.     chibeom.song     최초 생성
 * </pre>
 */
@Service("salesVhclCbinRcitService")
public class SalesVhclCbinRcitServiceImpl extends HService implements SalesVhclCbinRcitService, JxlsSupport {

    /**
     * VIN Master 정보
     */
    @Autowired
    VehicleMasterService vehicleMasterService;

    /**
     *
     */
    @Autowired
    VehOfCustInfoService vehOfCustInfoService;

    @Autowired
    SalesCommonCamelService salesCommonCamelService;

    /**
     * 영수증관리 > 기동차통일영수증관리 DAO
     */
    @Resource(name = "salesVhclCbinRcitDAO")
    SalesVhclCbinRcitDAO salesVhclCbinRcitDAO;

    /**
     * R19092301306 在<机动车统一发票管理>的提交功能中增加对扫描数据“证件号码”的校验。校验规则同客户信息录入模块增加客户时对身份证号的验证。贾明  2019-9-24
     */
    @Autowired
    RegularExpressionService regularExpressionService;
    
    /**
     * 조회 조건에 해당하는 영수증관리 > 기동차통일영수증관리 정보를 조회한다.
     */
    @Override
    public List<SalesVhclCbinRcitVO> selectSalesVehicleCombineReceiptSearchData(SalesVhclCbinRcitSearchVO searchVO) throws Exception {
        return salesVhclCbinRcitDAO.selectSalesVehicleCombineReceiptSearchData(searchVO);
    }

    /**
     * 조회 조건에 해당하는 영수증관리 > 기동차통일영수증관리 총 갯수를 조회한다.
     */
    @Override
    public int selectSalesVehicleCombineReceiptSearchCnt(SalesVhclCbinRcitSearchVO searchVO) throws Exception {
        return salesVhclCbinRcitDAO.selectSalesVehicleCombineReceiptSearchCnt(searchVO);
    }

    /**
     * 성(우편번호) 목록을 조회한다.
     */
    @Override
    public List<SalesVhclCbinRcitVO> selectProvinceInfoList(SalesVhclCbinRcitSearchVO searchVO) throws Exception {

        String provinceCd = searchVO.getsProvince();
        searchVO.setsProvince(provinceCd);
        return salesVhclCbinRcitDAO.selectProvinceInfoList(searchVO);
    }

    /**
     * 성(우편번호) 목록을 조회한다.
     */
    @Override
    public List<SalesVhclCbinRcitVO> selectProvinceInfoList(String provinceCd) throws Exception {

        SalesVhclCbinRcitSearchVO searchVO = new SalesVhclCbinRcitSearchVO();
        searchVO.setsProvince(provinceCd);

        return selectProvinceInfoList(searchVO);
    }

    /**
     * 영수증관리 > 기동차통일영수증관리 데이터를 등록한다.
     */
    @Override
    public int insertSalesVehicleCombineReceiptSave(SalesVhclCbinRcitVO salesVhclCbinRcitVO) throws Exception {

        int result = 0;
        String userId = LoginUtil.getUserId();

        salesVhclCbinRcitVO.setRegUsrId(userId);
        salesVhclCbinRcitVO.setUpdtUsrId(userId);
        salesVhclCbinRcitVO.setDlrCd(LoginUtil.getDlrCd());

        salesVhclCbinRcitVO.setReceiptImg(salesVhclCbinRcitVO.getScanBlob());
        /**
         * 检验发票提交时 证件号码 是符合 身份证号 、组织机构代码标准
         * R19092301306 在<机动车统一发票管理>的提交功能中增加对扫描数据“证件号码”的校验。校验规则同客户信息录入模块增加客户时对身份证号的验证。贾明 start 2019-9-24
         */
        /**
         * 81 发票在提交的时候，客户验证还需要再增加一个客户类型是护照的验证和士兵类型的验证。 目前都不做校验 2020-5-6 贾明
         String idNumberFift = "FALSE";
	   	 String idNumberEigh = "FALSE";
	   	 String organCode = "FALSE";
	   	if (StringUtils.isNotEmpty(salesVhclCbinRcitVO.getScanSsnCrnNo())) {
	   		//证件号码 15位
	   		if (salesVhclCbinRcitVO.getScanSsnCrnNo().length() == 15) {
	   			idNumberFift = regularExpressionService.selectRegularExpressionByRegiNo15Digit(salesVhclCbinRcitVO.getScanSsnCrnNo());
	           } 
	   		//证件号码 18位
	   		if (salesVhclCbinRcitVO.getScanSsnCrnNo().length() == 18) {
	   			idNumberEigh = regularExpressionService.selectRegularExpressionByRegiNo18Digit(salesVhclCbinRcitVO.getScanSsnCrnNo());
	           }
	   		//组织机构代码标准
	   		organCode = regularExpressionService.selectRegularExpressionByCorpNo(salesVhclCbinRcitVO.getScanSsnCrnNo());
	   	}
	   	//judUnSociCreo
	   	if("false".equals(salesVhclCbinRcitVO.getJudUnSociCreo()) && "FALSE".equals(idNumberFift) && "FALSE".equals(idNumberEigh) && "FALSE".equals(organCode)){
	   		throw processException("crm.info.regExpSsnCrnNo");
	   	}
	   	**/
	    /**
         * 检验发票提交时 证件号码 是符合 身份证号 、组织机构代码标准
         * R19092301306 在<机动车统一发票管理>的提交功能中增加对扫描数据“证件号码”的校验。校验规则同客户信息录入模块增加客户时对身份证号的验证。贾明 end 2019-9-24
         */
        /*
         * // 스캔한 이미지 파일을 읽어 온다.
         * File receiptFile = new File(salesVhclCbinRcitVO.getScanFileImgDir());
         * salesVhclCbinRcitVO.setReceiptImg(FileUtils.readFileToByteArray(
         * receiptFile));
         * FileUtils.writeByteArrayToFile(new
         * File("D:/data/webapps/BHMC-DMS-WEB/FILE_UPLOAD_PATH/2016/04/26/save.jpg"
         * ), salesVhclCbinRcitVO.getReceiptImg());
         */

        int cnt = salesVhclCbinRcitDAO.selectSaleVehicleCombineReceiptCnt(salesVhclCbinRcitVO);

        if (cnt > 0) {
            throw processException("sal.err.dupReceipt");
        }
        
        //CSR 67 发票提交时对（ 发票代码+发票号码）进行唯一性校验  贾明 2020-3-19 start
        int receiptNOCnt = salesVhclCbinRcitDAO.selectSaleVehicleCombineReceiptNOCnt(salesVhclCbinRcitVO);
        
        if (receiptNOCnt > 0) {
            throw processException("sal.err.dupReceipt");
        }
       //CSR 67 发票提交时对（ 发票代码+发票号码）进行唯一性校验  贾明 2020-3-19 END
        
       //CSR 95 不同店上传同一张发票，DCS均接收并覆盖，增加校验不允许重复上传 贾明 2020-5-20 start
        Map<String, Object> messag = new HashMap<String, Object>();
        messag.put("I_VIN_NO", salesVhclCbinRcitVO.getVinNo());
        messag.put("I_RECEIPT_NO", salesVhclCbinRcitVO.getScanRcptNo());
        Data receiveData = salesCommonCamelService.executeCamelClentSearchResult(messag,"SAL253");
        boolean receiRe  =  false;
        receiRe  =  (receiveData.getFooter().getIfResult().equals("Z")) ? true : false;
        List<InvoiceVO> invoiceVO = new ArrayList<InvoiceVO>();
        if(receiRe){
        	invoiceVO = receiveData.readMessages(InvoiceVO.class);
        	if(invoiceVO.size() > 0){
			    throw processException("global.info.promptInfo", new String[]{messageSource.getMessage("sal.err.invoiceSubmitted", new String[]{invoiceVO.get(0).getDlrCd()}, LocaleContextHolder.getLocale())});
        	}
        	
        } else {
        	 String interNum = "SAL253";
        	 throw processException("global.info.promptInfo", new String[]{messageSource.getMessage("sal.err.invoiceInfoCheck", new String[]{interNum}, LocaleContextHolder.getLocale())});
        	 //throw processException("sal.err.invoiceInfoCheck");
        }
       //CSR 95 不同店上传同一张发票，DCS均接收并覆盖，增加校验不允许重复上传 贾明 2020-5-20 END
        
        String pattern = "yyyy-MM-dd HH:mm:ss";
        Date toDate = DateUtil.convertToTimestamp(DateUtil.convertToString( new Date() ,pattern) ,pattern);

        salesVhclCbinRcitVO.setRegDt(toDate);
        salesVhclCbinRcitVO.setUpdtDt(toDate);

        // 본테이블에 데이터 저장 原有写SA_0501T表入注掉  贾明 2019-11-11 
        //result = salesVhclCbinRcitDAO.insertSalesVehicleCombineReceiptSave(salesVhclCbinRcitVO);
        // 본테이블에 blob이미지 저장 SA_0501T 表 图片数据原有写入注掉  贾明 2019-11-11
        //salesVhclCbinRcitDAO.updateSalesVehicleCombineReceiptImg(salesVhclCbinRcitVO);
        
        // R19111100817 一台车提交了两个不同号的发票，应该显示两行，目前只显示了一行。同时希望可以像<新能源补贴申请审核>页面类似的，可显示全部和最新的数据 贾明 2019-11-11 start
        result = salesVhclCbinRcitDAO.insertSalesInvoiceInformationSave(salesVhclCbinRcitVO);
        salesVhclCbinRcitDAO.updateSalesInvoiceInformationImg(salesVhclCbinRcitVO);
        // R19111100817 一台车提交了两个不同号的发票，应该显示两行，目前只显示了一行。同时希望可以像<新能源补贴申请审核>页面类似的，可显示全部和最新的数据 贾明 2019-11-11 end
        
        // 히스토리 테이블에 데이터 저장
        //salesVhclCbinRcitDAO.insertSalesVehicleCombineReceiptHistSave(salesVhclCbinRcitVO);


        // 此处注释，需要在发票系统返回校验信息后做保修日期变更
        //String warrantyUpdtCd = salesVhclCbinRcitDAO.selectVehicleMasterUpdtCd(salesVhclCbinRcitVO);
        //if (!warrantyUpdtCd.equals("B")) {
            //salesVhclCbinRcitDAO.updateSalesVehicleMasterSave(salesVhclCbinRcitVO);
            // 차량마스터 변경 프로시저 호출
            //VehOfCustInfoVO vehOfCustInfoVO = new VehOfCustInfoVO();
            //vehOfCustInfoVO.setCarId(salesVhclCbinRcitVO.getCarId());
            //vehOfCustInfoService.vinMasterChangeCall(vehOfCustInfoVO);
        //}

        // IS 테이블에 데이터 저장
        //salesVhclCbinRcitDAO.insertSalesVehicleCombineReceiptSaveIs(salesVhclCbinRcitVO);
        // 본테이블에 blob이미지 저장
        //salesVhclCbinRcitDAO.updateSalesVehicleCombineReceiptImgIs(salesVhclCbinRcitVO);

        //TODO [권기현] EAI 연동 테스트 2017-07-18
        try{
             //Camel InterFace Header Info
             Map<String, Object> message = new HashMap<String, Object>();

             message.put("CAR_ID", salesVhclCbinRcitVO.getCarId());
             message.put("VIN_NO",salesVhclCbinRcitVO.getVinNo());
             message.put("VIN_NO1",salesVhclCbinRcitVO.getVinNo().substring(0, 11));
             message.put("VIN_NO2",salesVhclCbinRcitVO.getVinNo().substring(11, 17));
             message.put("DLR_CD", salesVhclCbinRcitVO.getDlrCd());
             message.put("TAXPAYER_ID_CD", salesVhclCbinRcitVO.getScanPayTaxPinNo());
             message.put("RECEIPT_NO", salesVhclCbinRcitVO.getScanRcptNo());
             message.put("RECEIPT_CD", salesVhclCbinRcitVO.getScanRcptCd());
             message.put("RECEIPT_CUST_NM", salesVhclCbinRcitVO.getScanCustInfo());
             message.put("SSN_CRN_NO", salesVhclCbinRcitVO.getScanSsnCrnNo());
             message.put("RECEIPT_ISS_DT", salesVhclCbinRcitVO.getScanRcptPubDt());
             message.put("SCAN_VIN_NO", salesVhclCbinRcitVO.getScanVinNo());
             message.put("SUM_AMT", salesVhclCbinRcitVO.getScanTaxIncPrice());
             message.put("CERT_NO", salesVhclCbinRcitVO.getScanCertNo());
             message.put("ENGN_NO", salesVhclCbinRcitVO.getScanEngNo());
             message.put("SUM_INC_TAX", salesVhclCbinRcitVO.getScanTaxIncPrice());
             message.put("SUM_EXC_TAX", salesVhclCbinRcitVO.getScanTaxExcPrice());

             message.put("TAX_RT", salesVhclCbinRcitVO.getScanTaxRate().replace("%", ""));

             message.put("TAX_AMT", salesVhclCbinRcitVO.getScanTaxAmt());
             message.put("MERCH_NM", salesVhclCbinRcitVO.getScanSaleCmpnNm());
             message.put("ADDR",  salesVhclCbinRcitVO.getScanSaleCmpnAddr());
             message.put("RECEIPT_IMG",  new String(salesVhclCbinRcitVO.getReceiptImg(),"UTF-8"));
             message.put("TMR_CD",  salesVhclCbinRcitVO.getTmrCd());
             message.put("EVAL_RSLT_CD",  salesVhclCbinRcitVO.getEvalRsltCd());
             message.put("ERR_UP_CD",  salesVhclCbinRcitVO.getErrUpCd());
             message.put("REG_USR_ID",  salesVhclCbinRcitVO.getRegUsrId());
             message.put("REG_DT",  DateUtil.convertToDateTimeString(salesVhclCbinRcitVO.getRegDt()));
             message.put("UPDT_USR_ID", LoginUtil.getUserId());
             message.put("UPDT_DT", DateUtil.getDate("yyyy-MM-dd HH:mm:ss"));
             message.put("IF_REG_DT", DateUtil.getDate("yyyy-MM-dd HH:mm:ss") );
             message.put("SDLR_CD",  salesVhclCbinRcitVO.getSdlrCd());
             message.put("TAX_CHK_YN",  "N");
             message.put("REMARK",  salesVhclCbinRcitVO.getRemark());
             message.put("TEMP_C01",  salesVhclCbinRcitVO.getTempCd01());
             message.put("TEMP_C02",  salesVhclCbinRcitVO.getTempCd02());
             message.put("TEMP_C03",  salesVhclCbinRcitVO.getTempCd03());
             message.put("TEMP_C04",  salesVhclCbinRcitVO.getTempCd04());
             message.put("TEMP_C05",  salesVhclCbinRcitVO.getTempCd05());
             message.put("TEMP_N01",  salesVhclCbinRcitVO.getTempN01());
             message.put("TEMP_N02",  salesVhclCbinRcitVO.getTempN02());
             message.put("TEMP_N03",  salesVhclCbinRcitVO.getTempN03());
             message.put("TEMP_N04",  salesVhclCbinRcitVO.getTempN04());
             message.put("TEMP_N05",  salesVhclCbinRcitVO.getTempN05());
             message.put("ORD_DLR_CD",  salesVhclCbinRcitVO.getOrdDlrCd());
             message.put("TAX_SUNG_CD",  salesVhclCbinRcitVO.getTaxSungCd());
             message.put("SDLR_TP",  salesVhclCbinRcitVO.getSdlrTp());
             message.put("SDLR_NM",  salesVhclCbinRcitVO.getSdlrNm());
             message.put("TEL_NO",  salesVhclCbinRcitVO.getTelNo()); //crs 37 发票上传扫描信息显示的画面，在 证件号码 后面增加 手机号码 ，取合同上的客户手机号，允许修改，校验手机号为11位数字。提交给发票系统，发票初审不通过时可修 贾明 2019-12-11 查找合同客户表的电话
             // R19111100817 一台车提交了两个不同号的发票，应该显示两行，目前只显示了一行。同时希望可以像<新能源补贴申请审核>页面类似的，可显示全部和最新的数据 贾明 2019-11-11 start
             message.put("IDEN_INFO","Y");//增加个标识，Y代表 新增加的上传的  N 代表修改时上传的
             // R19111100817 一台车提交了两个不同号的发票，应该显示两行，目前只显示了一行。同时希望可以像<新能源补贴申请审核>页面类似的，可显示全部和最新的数据 贾明 2019-11-11 END

             salesCommonCamelService.executeCamelClent(message,"SAL170");

        }catch(Exception e){
            log.error(e.getMessage(),e);
            throw e;
        }

        return result;
    }

    /**
     * 영수증관리 > 기동차통일영수증관리 이력 데이터를 등록한다.
     */
    @Override
    public int insertSalesVehicleCombineReceiptHistSave(SalesVhclCbinRcitVO salesVhclCbinRcitVO) throws Exception {

        String userId = LoginUtil.getUserId();

        salesVhclCbinRcitVO.setRegUsrId(userId);
        salesVhclCbinRcitVO.setUpdtUsrId(userId);

        return salesVhclCbinRcitDAO.insertSalesVehicleCombineReceiptHistSave(salesVhclCbinRcitVO);
    }

    /**
     * 영수증관리 > 기동차통일영수증관리 데이터를 등록한다.
     */
    @Override
    public void multiSalesVehicleCombineReceiptGridSave(BaseSaveVO<SalesVhclCbinRcitVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for (SalesVhclCbinRcitVO salesVhclCbinRcitVO : obj.getInsertList()) {
            salesVhclCbinRcitVO.setRegUsrId(userId);
            insertSalesVehicleCombineReceiptGridSave(salesVhclCbinRcitVO);
        }

        for (SalesVhclCbinRcitVO salesVhclCbinRcitVO : obj.getUpdateList()) {
            salesVhclCbinRcitVO.setUpdtUsrId(userId);
            updateSalesVehicleCombineReceiptGridSave(salesVhclCbinRcitVO);
        }

    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertSalesVehicleCombineReceiptGridSave(SalesVhclCbinRcitVO salesVhclCbinRcitVO) throws Exception {
        SalesVhclCbinRcitVO obj = selectSalesVehicleCombineReceiptGridSaveByKey(salesVhclCbinRcitVO.getVinNo());

        if (obj != null) {
            throw processException("global.err.duplicate");
        }

        return salesVhclCbinRcitDAO.insertSalesVehicleCombineReceiptGridSave(salesVhclCbinRcitVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateSalesVehicleCombineReceiptGridSave(SalesVhclCbinRcitVO salesVhclCbinRcitVO) throws Exception {

        return salesVhclCbinRcitDAO.updateSalesVehicleCombineReceiptGridSave(salesVhclCbinRcitVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public SalesVhclCbinRcitVO selectSalesVehicleCombineReceiptGridSaveByKey(String vinNo) throws Exception {
        return salesVhclCbinRcitDAO.selectSalesVehicleCombineReceiptGridSaveByKey(vinNo);
    }

    /**
     * 기동차통일영수증관리 > 영수증 업로드 > VIN 총 갯수를 조회한다.
     */
    @Override
    public int selectVinNoSearchPopupSearchCnt(SalesVhclCbinRcitSearchVO searchVO) throws Exception {
        return salesVhclCbinRcitDAO.selectVinNoSearchPopupSearchCnt(searchVO);
    }

    /**
     * 기동차통일영수증관리 > 영수증 업로드 > VIN 정보를 조회한다.
     */
    @Override
    public List<SalesVhclCbinRcitVO> selectVinNoSearchPopupSearchData(SalesVhclCbinRcitSearchVO searchVO)
            throws Exception {
        return salesVhclCbinRcitDAO.selectVinNoSearchPopupSearchData(searchVO);
    }

    /**
     * 기동차통일영수증관리 > 영수증 업로드 > 2급딜러 정보 cnt 조회
     */
    @Override
    public int selectSecondDealerSearchCnt(SalesVhclCbinRcitSearchVO searchVO) throws Exception {
        return salesVhclCbinRcitDAO.selectSecondDealerSearchCnt(searchVO);
    }

    /**
     * 기동차통일영수증관리 > 영수증 업로드 > 2급딜러 정보 조회
     */
    @Override
    public List<SalesVhclCbinRcitVO> selectSecondDealerSearchData(SalesVhclCbinRcitSearchVO searchVO) throws Exception {
        return salesVhclCbinRcitDAO.selectSecondDealerSearchData(searchVO);
    }

    /**
     * 기동차통일영수증관리 > 영수증 관리 > 영수증 명세 조회
     */
    @Override
    public SalesVhclCbinRcitVO selectReceiptDetailPopupSearchData(SalesVhclCbinRcitSearchVO searchVO) throws Exception {
        return salesVhclCbinRcitDAO.selectReceiptDetailPopupSearchData(searchVO);
    }

    /**
     * 기동차통일영수증관리 > 영수증 관리 > 영수증 명세 조회
     */
    @Override
    public SalesVhclCbinRcitVO selectReceiptImageSearchData(SalesVhclCbinRcitSearchVO searchVO) throws Exception {
        return salesVhclCbinRcitDAO.selectReceiptImageSearchData(searchVO);
    }

    /**
     * 기동차통일영수증관리 > 영수증 관리 > 영수증 이미지를 조회
     *
     * @param carId
     * @return
     */
    @Override
    public BlobVO selectSalesVehicleCombineReceiptImg(String carId) throws Exception {
        return salesVhclCbinRcitDAO.selectSalesVehicleCombineReceiptImg(carId);
    }

    @Override
    public String selectDealerSungStr(SalesVhclCbinRcitSearchVO searchVO) throws Exception {
        return salesVhclCbinRcitDAO.selectDealerSungStr(searchVO);
    }

    /**
     * 엑셀 다운로드
     * @param list
     * @throws Exception
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        Date sCustSaleStDt = null;
        Date sCustSaleEtDt = null;
        Date sReceiptStDt = null;
        Date sReceiptEdDt = null;
        Date sUploadStDt = null;
        Date sUploadEdDt = null;

        SalesVhclCbinRcitSearchVO searchVO = new SalesVhclCbinRcitSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        if(params.get("sCustSaleStDt") != null){
            sCustSaleStDt = DateUtil.convertToDate((String)params.get("sCustSaleStDt"), "yyyyMMdd");
        }

        if(params.get("sCustSaleEtDt") != null){
            sCustSaleEtDt = DateUtil.convertToDate((String)params.get("sCustSaleEtDt"), "yyyyMMdd");
        }

        if(params.get("sReceiptStDt") != null){
            sReceiptStDt = DateUtil.convertToDate((String)params.get("sReceiptStDt"), "yyyyMMdd");
        }

        if(params.get("sReceiptEdDt") != null){
            sReceiptEdDt = DateUtil.convertToDate((String)params.get("sReceiptEdDt"), "yyyyMMdd");
        }

        if(params.get("sUploadStDt") != null){
            sUploadStDt = DateUtil.convertToDate((String)params.get("sUploadStDt"), "yyyyMMdd");
        }

        if(params.get("sUploadEdDt") != null){
            sUploadEdDt = DateUtil.convertToDate((String)params.get("sUploadEdDt"), "yyyyMMdd");
        }

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        searchVO.setsCustSaleStDt(sCustSaleStDt);
        searchVO.setsCustSaleEdDt(sCustSaleEtDt);
        searchVO.setsReceiptStDt(sReceiptStDt);
        searchVO.setsReceiptEdDt(sReceiptEdDt);
        searchVO.setsUploadStDt(sUploadStDt);
        searchVO.setsUploadEdDt(sUploadEdDt);

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        List<SalesVhclCbinRcitVO> list = salesVhclCbinRcitDAO.selectSalesVehicleCombineReceiptSearchData(searchVO);

        context.putVar("items", list);
    }

	@Override
	public int updateVehicleUnifiedInvoiceinfo(SalesVhclCbinRcitVO salesVhclCbinRcitVO) throws Exception {
		int result = 0;
		String userId = LoginUtil.getUserId();
        salesVhclCbinRcitVO.setUpdtUsrId(userId);
        salesVhclCbinRcitVO.setDlrCd(LoginUtil.getDlrCd());
        String pattern = "yyyy-MM-dd HH:mm:ss";
        Date toDate = DateUtil.convertToTimestamp(DateUtil.convertToString( new Date() ,pattern) ,pattern);
        salesVhclCbinRcitVO.setUpdtDt(toDate);
        result = salesVhclCbinRcitDAO.updateVehicleUnifiedInvoiceinfo(salesVhclCbinRcitVO);
        SalesVhclCbinRcitVO obj = salesVhclCbinRcitDAO.selectSalesInvoiceInformationInfo(salesVhclCbinRcitVO);
        //SalesVhclCbinRcitVO obj = selectSalesVehicleCombineReceiptGridSaveByKey(salesVhclCbinRcitVO.getVinNo());
        try{
             //Camel InterFace Header Info SAL170 发送信息
             Map<String, Object> message = new HashMap<String, Object>();

             message.put("CAR_ID", obj.getCarId());
             message.put("VIN_NO",obj.getVinNo());
             message.put("VIN_NO1",obj.getVinNo().substring(0, 11));
             message.put("VIN_NO2",obj.getVinNo().substring(11, 17));
             message.put("DLR_CD", obj.getDlrCd());
             message.put("TAXPAYER_ID_CD", obj.getTaxpayerIdCd());
             message.put("RECEIPT_NO", obj.getReceiptNo());
             message.put("RECEIPT_CD", obj.getReceiptCd());
             message.put("RECEIPT_CUST_NM", obj.getReceiptCustNm());
             message.put("SSN_CRN_NO", obj.getSsnCrnNo());
             message.put("RECEIPT_ISS_DT", salesVhclCbinRcitVO.getScanRcptPubDt());// getscanRcptPubDtDateUtil.convertToDateTimeString(obj.getReceiptIssDt())
             message.put("SCAN_VIN_NO", obj.getScanVinNo());
             message.put("SUM_AMT", obj.getSumAmt());
             message.put("CERT_NO", obj.getCertNo());
             message.put("ENGN_NO", obj.getEngnNo());
             message.put("SUM_INC_TAX", obj.getSumAmt());
             message.put("SUM_EXC_TAX", obj.getSumExcTax());

             message.put("TAX_RT", obj.getTaxRt().replace("%", ""));

             message.put("TAX_AMT", obj.getTaxAmt());
             message.put("MERCH_NM", obj.getMerchNm());
             message.put("ADDR",  obj.getAddr());
             //message.put("RECEIPT_IMG",  new String(obj.getReceiptImg(),"UTF-8"));// 修改时不传发票图片
             message.put("TMR_CD",  obj.getTmrCd());
             message.put("EVAL_RSLT_CD",  obj.getEvalRsltCd());
             message.put("ERR_UP_CD",  obj.getErrUpCd());
             message.put("REG_USR_ID",  obj.getRegUsrId());
             message.put("REG_DT",  DateUtil.convertToDateTimeString(obj.getRegDt()));
             message.put("UPDT_USR_ID", LoginUtil.getUserId());
             message.put("UPDT_DT", DateUtil.getDate("yyyy-MM-dd HH:mm:ss"));
             message.put("IF_REG_DT", DateUtil.getDate("yyyy-MM-dd HH:mm:ss") );
             message.put("SDLR_CD",  obj.getSdlrCd());
             message.put("TAX_CHK_YN",  "N");
             message.put("REMARK",  obj.getRemark());
             message.put("TEMP_C01",  obj.getTempCd01());
             message.put("TEMP_C02",  obj.getTempCd02());
             message.put("TEMP_C03",  obj.getTempCd03());
             message.put("TEMP_C04",  obj.getTempCd04());
             message.put("TEMP_C05",  obj.getTempCd05());
             message.put("TEMP_N01",  obj.getTempN01());
             message.put("TEMP_N02",  obj.getTempN02());
             message.put("TEMP_N03",  obj.getTempN03());
             message.put("TEMP_N04",  obj.getTempN04());
             message.put("TEMP_N05",  obj.getTempN05());
             message.put("ORD_DLR_CD",  obj.getOrdDlrCd());
             message.put("TAX_SUNG_CD",  obj.getTaxSungCd());
             message.put("SDLR_TP",  obj.getSdlrTp());
             message.put("SDLR_NM",  obj.getSdlrNm());
             message.put("TEL_NO",  obj.getTelNo()); //crs 37 发票上传扫描信息显示的画面，在 证件号码 后面增加 手机号码 ，取合同上的客户手机号，允许修改，校验手机号为11位数字。提交给发票系统，发票初审不通过时可修 贾明 2019-12-11 查找合同客户表的电话
             // R19111100817 一台车提交了两个不同号的发票，应该显示两行，目前只显示了一行。同时希望可以像<新能源补贴申请审核>页面类似的，可显示全部和最新的数据 贾明 2019-11-11 start
             message.put("IDEN_INFO","N");//增加个标识，Y代表 新增加的上传的  N 代表修改时上传的N
             // R19111100817 一台车提交了两个不同号的发票，应该显示两行，目前只显示了一行。同时希望可以像<新能源补贴申请审核>页面类似的，可显示全部和最新的数据 贾明 2019-11-11 END

             salesCommonCamelService.executeCamelClent(message,"SAL170");
        }catch(Exception e){
            log.error(e.getMessage(),e);
            throw e;
        }

        return result;
		
	}
	
    /**
     * NO 31 DMS端车辆主信息的发票展示逻辑确定如下：1、车辆对应的发票，只有初审通过状态，没有复核通过的情况，那就以最新审核通过展示；2、有复核通过的发票，那就展示最新复核通过的。
     * 贾明 2019-11-28 
     */
	@Override
	public SalesVhclCbinRcitVO selectVehicleInfoMotorVehInvo(SalesVhclCbinRcitSearchVO searchVO) throws Exception {
		return salesVhclCbinRcitDAO.selectVehicleInfoMotorVehInvo(searchVO);
	}

	
	/**
	 * crs 37 发票上传扫描信息显示的画面，在“证件号码”后面增加“手机号码”，取合同上的客户手机号，允许修改，校验手机号为11位数字。提交给发票系统，发票初审不通过时可修 贾明 2019-12-11 查找合同客户表的电话
	 */
	@Override
	public SalesVhclCbinRcitVO selectContractNoSearchTelData(SalesVhclCbinRcitSearchVO searchVO) throws Exception {
		return salesVhclCbinRcitDAO.selectContractNoSearchTelData(searchVO);
	}
}
