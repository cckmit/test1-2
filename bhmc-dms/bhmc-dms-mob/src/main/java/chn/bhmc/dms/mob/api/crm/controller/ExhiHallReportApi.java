package chn.bhmc.dms.mob.api.crm.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.mob.api.crm.service.ExhiHallReportService;
import chn.bhmc.dms.mob.api.crm.vo.ExhiHallReportSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.ExhiHallReportVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.mob.config.BaseJSON;

@RestController
@RequestMapping(value = "api/crm/exhiHallReport")
@Api("CRM--报表接口")
public class ExhiHallReportApi {
	
	
	   @Resource(name = "exhiHallReportService")
	   ExhiHallReportService exhiHallReportService;

	/**
	 * 展厅 报表比率
	 * 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 */
	    @ApiOperation("展厅")
	    @RequestMapping(value = "/selectExhiHallReporList.do",  method = RequestMethod.GET)
	    public BaseJSON selectExhiHallReporList(Model model, HttpServletRequest request) throws Exception {
	    	Date date = new Date();
	    	ExhiHallReportSearchVO exhSearchVO = new ExhiHallReportSearchVO();
	    	String langCd = LocaleContextHolder.getLocale().getLanguage();
	    	String endDt = DateUtil.getDate("yyyy-MM-dd");//当前系统时间
	        String startDt = DateUtil.convertToDateString(DateUtil.getFirstDateOfMonth(date));//当月第一天
	        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
	        exhSearchVO.setsLangCd(langCd);
	        exhSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
	        exhSearchVO.setsStartDt(startDt);
	        exhSearchVO.setsStartDtm(startDt.substring(0, 7));
	        exhSearchVO.setsEndDt(endDt);
	        exhSearchVO.setsEndDtm(endDt.substring(0, 7));
	        
	        //试驾率
	        List<ExhiHallReportVO> teDrRaList  = exhiHallReportService.selectTestDriveRate(exhSearchVO);
	        model.addAttribute("teDrRaList", teDrRaList);
	        //再次进店率
	        List<ExhiHallReportVO> agStRaList  = exhiHallReportService.selectAgainStoreRate(exhSearchVO);
	        model.addAttribute("agStRaList", agStRaList);
	        //首次留档率
	        List<ExhiHallReportVO> inReList  = exhiHallReportService.selectInitialRetentionrate(exhSearchVO);
	        model.addAttribute("inReList", inReList);
	        
	        //成交率
	        List<ExhiHallReportVO> effiList  = exhiHallReportService.selectEfficiency(exhSearchVO);
	        model.addAttribute("effiList", effiList);
	        
	        //首次留档率
	        List<ExhiHallReportVO> recRateList  = exhiHallReportService.selectReceptionTimeSatisfyRate(exhSearchVO);
	        model.addAttribute("recRateList", recRateList);
	        
	        BaseJSON baseJSON=new BaseJSON();
	        baseJSON.setResult(model);
	        return baseJSON;
	    }
	    
	   

	    	
		

}
