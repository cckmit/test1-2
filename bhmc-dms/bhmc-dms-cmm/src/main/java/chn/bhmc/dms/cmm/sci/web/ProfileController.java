package chn.bhmc.dms.cmm.sci.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.ProfileService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.ProfileSearchVO;
import chn.bhmc.dms.cmm.sci.vo.ProfileVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ProfileController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Kyung Mok
 * @since 2018. 7. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 7. 31.   Kim Kyung Mok    최초 생성
 * </pre>
 */
@Controller
public class ProfileController  extends HController{


    @Resource(name="profileService")
    ProfileService profileService;

    /**
     * 시스템 설정정보
     */
    @Resource(name = "systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 인터페이스 상태확인 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/cmm/sci/profile/selectAliveCheckMain.do", method = RequestMethod.GET)
    public String selectPreCheckListMain(Model model) throws Exception {

        //String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        model.addAttribute("dlrCd",  LoginUtil.getDlrCd());
        model.addAttribute("sToDt", sysDate);
        model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -3), dateFormat) );


        return "/cmm/sci/profile/selectAliveCheckMain";

    }

    /**
    *
    * 인터페이스 상태 조회
    *
    * @param searchVO - 인터페이스 상태조회
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/cmm/sci/profile/selectAliveStatusListMains.do" , method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPreCheckListMains(ProfileSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(profileService.selectAliveCheckListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(profileService.selectAliveCheckListByCondition(searchVO));
        }

        return result;
    }

    /**
    *
    * 실시간 상태조회를 한다.
    *
    * @param saveVO
    *            - 사전점검 항목 등록/수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
   @RequestMapping(value = "/cmm/sci/profile/aliveEaiCheck.do", method = RequestMethod.POST)
   @ResponseBody
   public String aliveEaiCheck() throws Exception {
       ProfileVO profileVO = new ProfileVO();
       profileVO.setIpNm("10.125.211.160");
       profileService.pingSearch(profileVO);

       return "OK";
   }

}
