package chn.bhmc.dms.par.cpm.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.core.util.FileUtils;
import org.jxls.common.Context;
import org.jxls.transform.jexcel.JexcelTransformer;
import org.jxls.util.JxlsHelper;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.icu.text.SimpleDateFormat;

import able.com.exception.BizException;
import able.com.vo.HMap;
import able.com.web.HController;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.context.WebAppContext;
import chn.bhmc.dms.core.context.WebContext;
import chn.bhmc.dms.core.datatype.DownloadVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.event.DownloadEvent;
import chn.bhmc.dms.core.event.ExcelDownloadEvent;
import chn.bhmc.dms.core.support.excel.ExtJexcelTransformer;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.support.excel.JxlsUtils;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoDetailService;
import chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoHeaderService;
import chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoDetailVO;
import chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoHeaderVO;
import chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoSearchVO;
import chn.bhmc.dms.par.cpm.vo.Employee;

/**
 * AdvanceReceivedInfo Controller
 *
 * @author In Bo Shim
 * @since 2016. 05. 23.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 23.     In Bo Shim      최초 생성
 * </pre>
 */
@Controller
public class AdvanceReceivedInfoController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 선수금헤더 서비스
     */
    @Resource(name="advanceReceivedInfoHeaderService")
    AdvanceReceivedInfoHeaderService advanceReceivedInfoHeaderService;

    /**
     * 선수금상세 서비스
     */
    @Resource(name="advanceReceivedInfoDetailService")
    AdvanceReceivedInfoDetailService advanceReceivedInfoDetailService;

    /**
     * 선수금 헤더 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cpm/advanceReceivedInfo/selectAdvanceReceivedInfoMain.do", method = RequestMethod.GET)
    public String selectadvanceReceivedInfoMain(Model model) throws Exception {

        // 공통코드 : 선수금유형
        model.addAttribute("preAmtTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR501", null, LocaleContextHolder.getLocale().getLanguage()));
        //dlrCd
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());


        return "/par/cpm/advanceReceivedInfo/selectAdvanceReceivedInfoMain";

    }

    /**
     * 선수금 제시금액 수정.
     * @param advanceReceivedInfoHeaderVO - 선수금 AdvanceReceivedInfoHeaderVO
     * @return
     */
    @RequestMapping(value = "/par/cpm/advanceReceivedInfo/updateAdvanceReceivedInfoHeader.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateAdvanceReceivedInfoHeader(@RequestBody AdvanceReceivedInfoHeaderVO advanceReceivedInfoHeaderVO) throws Exception{

        advanceReceivedInfoHeaderService.updateAdvanceReceivedInfoHeader(advanceReceivedInfoHeaderVO);

        return true;
    }

    /**
     * 선수금 헤더 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AdvanceReceivedInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/par/cpm/advanceReceivedInfo/selectAdvanceReceivedInfoHeaderByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public AdvanceReceivedInfoHeaderVO selectAdvanceReceivedInfoHeaderByKey(@RequestBody AdvanceReceivedInfoSearchVO searchVO) throws Exception{

        AdvanceReceivedInfoHeaderVO advanceReceivedInfoHeaderVO = advanceReceivedInfoHeaderService.selectAdvanceReceivedInfoHeaderByKey(searchVO.getsDlrCd());

        if(advanceReceivedInfoHeaderVO == null){
            advanceReceivedInfoHeaderVO = new AdvanceReceivedInfoHeaderVO();
        }

        return advanceReceivedInfoHeaderVO;

    }

    /**
     * 선수금 상세 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AdvanceReceivedInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/par/cpm/advanceReceivedInfo/selectAdvanceReceivedInfoDetails.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAdvanceReceivedInfoDetails(@RequestBody AdvanceReceivedInfoSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        // 딜러코드
        searchVO.setsDlrCd(searchVO.getsDlrCd());
        result.setTotal(advanceReceivedInfoDetailService.selectAdvanceReceivedInfoDetailsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(advanceReceivedInfoDetailService.selectAdvanceReceivedInfoDetailsByCondition(searchVO));
        }

        return result;

    }
    
    
    /**
     * Java Excel API wangc 2021年5月18日17:06:24 新版的excel导出功能
     *
     * @param params
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cpm/advanceReceivedInfo/excelDownloadFreedom.do", method = RequestMethod.GET)
    public void excelDownloadFreedom(@RequestParam HMap params, HttpServletRequest request, HttpServletResponse response) throws Exception {
        //서비스 체크
        if (!params.containsKey("beanName")) {
            throw new BizException(messageSource.getMessage("global.error.invalidRequest", null, LocaleContextHolder.getLocale()));
        } else if (!params.containsKey("templateFile")) {
            throw new BizException(messageSource.getMessage("global.error.invalidRequest", null, LocaleContextHolder.getLocale()));
        } else if (!params.containsKey("fileName")) {
            throw new BizException(messageSource.getMessage("global.error.invalidRequest", null, LocaleContextHolder.getLocale()));
        }

        String templateFile = (String)params.get("templateFile");
        String fileName = (String)params.get("fileName");

        templateFile = templateFile.replace(".xlsx", ".xls");
        fileName = fileName.replace(".xlsx", ".xls");

        //파라메터 공백제거
        for( Object key : params.keySet() ){
            Object value = params.get(key);
            if(value instanceof String){
                params.put(key, StringUtils.trim(value.toString()));
            }
        }


        String destFolderPath = WebContext.getInitParameter("JXLS_TEMP_FOLDER") + "/" + DateUtil.getDate("yyyyMMdd");
        FileUtils.mkdir(new File(destFolderPath), true);

        InputStream is = null;
        OutputStream os = null;
        File destFile = new File(destFolderPath + "/" + fileName);

        try {
            is = new FileInputStream(new File(request.getServletContext().getRealPath("/WEB-INF/resources/excelDownloadTemplate/jexcel/" + templateFile)));//this.getClass().getClassLoader().getResourceAsStream("excelTemplate/" + templateFile);
            os = new FileOutputStream(destFile);

            AdvanceReceivedInfoSearchVO searchVO = new AdvanceReceivedInfoSearchVO();

            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
            
            List<AdvanceReceivedInfoDetailVO> list = advanceReceivedInfoDetailService.selectAdvanceReceivedInfoDetailsByCondition(searchVO);
            
            Map<String , Object> model=new HashMap<String , Object>();
            
            
            model.put("dpstAmt", 10.10);//保证金
            model.put("calcAmt", 10.11);//工程中
            model.put("balAmt" , 10.12);//实际金额
            model.put("lmtAmt" , 10.13);//提示金额
            
            model.put("items", list);//信息数据
                
            
            
            
            JxlsUtils.exportExcel(is, os, model);
            os.close();

        } catch(Exception e) {
            e.printStackTrace();
            throw new BizException(messageSource.getMessage("global.error.failedCreateExcel", null, LocaleContextHolder.getLocale()));
        } finally {
            if(is != null){
                try {
                    is.close();
                }catch(IOException e){ e.printStackTrace(); }
            }

            if(os != null){
                try {
                    os.close();
                }catch(IOException e){ e.printStackTrace(); }
            }
        }

        

       
    }
    
    
    public static List<Employee> generateSampleEmployeeData() {
        List<Employee> employees = new ArrayList<Employee>();
        employees.add( new Employee("Elsa", new Date(), 0, 0) );
        employees.add( new Employee("Oleg", new Date(), 2300, 0.25) );
        employees.add( new Employee("Neil", new Date(), 2500, 0.00) );
        employees.add( new Employee("Maria", new Date(), 1700, 0.15) );
        employees.add( new Employee("John", new Date(), 2800, 0.20) );
        return employees;
    }
}
