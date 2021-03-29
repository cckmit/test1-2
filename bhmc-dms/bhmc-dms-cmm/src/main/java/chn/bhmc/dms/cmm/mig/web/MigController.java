package chn.bhmc.dms.cmm.mig.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.mig.service.MigService;
import chn.bhmc.dms.cmm.mig.vo.MigCheckSearchVO;
import chn.bhmc.dms.cmm.mig.vo.MigNdmsComInitLogVO;
import chn.bhmc.dms.cmm.mig.vo.MigProcLogVO;
import chn.bhmc.dms.cmm.mig.vo.MigTgtInfoVO;
import chn.bhmc.dms.cmm.mig.vo.MigVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MigController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 12. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 7.     Kang Seok Han     최초 생성
 * </pre>
 */
@Controller
public class MigController extends HController {

    @Resource(name="migService")
    MigService migService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 마이그레이션 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/mig/selectMigMain.do", method = RequestMethod.GET)
    public String selectMigMain(Model model) throws Exception {

       //멤버쉽 운영기준
        List<CommonCodeVO> membershipPolicyList = commonCodeService.selectCommonCodesByCmmGrpCd("CRM808", null, LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("membershipPolicyList", membershipPolicyList);

        return "/cmm/mig/selectMigMain";
    }

    /**
     *
     * @param migVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/mig/multiExecProgram.do", method = RequestMethod.POST)
    @ResponseBody
    public Boolean multiExecProgram(@RequestBody MigVO migVO) throws Exception {
        /*
        //딜러정보
        if("insertOrUpdateDealer".equals(migVO.getPid())){
            migService.insertOrUpdateDealer(migVO.getUseCenterDmsYn(), migVO.getDlrCd());
        //창고정보
        }else if("insertOrUpdateStorage".equals(migVO.getPid())){
            migService.insertOrUpdateStorage(migVO.getDlrCd());
        //시스템설정정보
        }else if("insertOrUpdateSystemInfo".equals(migVO.getPid())){
            migService.insertOrUpdateSystemInfo();
        //국가정보
        }else if("insertOrUpdateCountry".equals(migVO.getPid())){
            migService.insertOrUpdateCountry();
        //언어정보
        }else if("insertOrUpdateLang".equals(migVO.getPid())){
            migService.insertOrUpdateLang();
        //통화정보
        }else if("insertOrUpdateCurrency".equals(migVO.getPid())){
            migService.insertOrUpdateCurrency();
        //우편번호
        }else if("insertOrUpdateZipCode".equals(migVO.getPid())){
            migService.insertOrUpdateZipCode();
        //지역코드
        }else if("insertOrUpdateDistCode".equals(migVO.getPid())){
            migService.insertOrUpdateDistCode();
        //단위정보
        }else if("insertOrUpdateUnitInfo".equals(migVO.getPid())){
            migService.insertOrUpdateUnitInfo();
        //날짜데이터
        }else if("insertOrUpdateDateInfo".equals(migVO.getPid())){
            migService.insertOrUpdateDateInfo();
        //타임존
        }else if("insertOrUpdateTimeZone".equals(migVO.getPid())){
            migService.insertOrUpdateTimeZone();
        //공통코드
        }else if("insertOrUpdateCommonCode".equals(migVO.getPid())){
            migService.insertOrUpdateCommonCode();
        //메세지소스
        }else if("insertOrUpdateMessageSource".equals(migVO.getPid())){
            migService.insertOrUpdateMessageSource();
        //메세지템플릿
        }else if("insertOrUpdateMessageTemplate".equals(migVO.getPid())){
            migService.insertOrUpdateMessageTemplate();
        //사용자정보
        }else if("insertOrUpdateUser".equals(migVO.getPid())){
            migService.insertOrUpdateUser(migVO.getDlrCd());
        //권한정보
        }else if("insertOrUpdateAuthority".equals(migVO.getPid())){
            migService.insertOrUpdateAuthority();
        //사업부
        }else if("insertOrUpdateDivision".equals(migVO.getPid())){
            migService.insertOrUpdateDivision();
        //사무소
        }else if("insertOrUpdateOffice".equals(migVO.getPid())){
            migService.insertOrUpdateOffice();
        //성
        }else if("insertOrUpdateCastle".equals(migVO.getPid())){
            migService.insertOrUpdateCastle();
        //도시
        }else if("insertOrUpdateCity".equals(migVO.getPid())){
            migService.insertOrUpdateCity();
        //직무
        }else if("insertOrUpdateTask".equals(migVO.getPid())){
            migService.insertOrUpdateTask();
        //부서
        }else if("insertOrUpdateDepartment".equals(migVO.getPid())){
            migService.insertOrUpdateDepartment();
        }
        */

        //기초정보 적용
        if("updateMigNdmsComInit".equals(migVO.getPid())){
            migService.updateMigNdmsComInit(migVO);
        //마이그레이션 수행
//        }else if("updateMigProcMain".equals(migVO.getPid())){
//            migService.updateMigProcMain(migVO.getDlrCd());
        //마이그레이션 수행 데이터 DMS 반영
        }else if("updateMigNdmsInsert".equals(migVO.getPid())){
            migService.updateMigNdmsInsert(migVO);
        }else if("updateMigAfeterProcInsert".equals(migVO.getPid())){
            migService.updateMigAfeterProcInsert(migVO);
        }else if("updateMigDcsDmsProcInsert".equals(migVO.getPid())){
            migService.updateMigDcsDmsProcInsert(migVO);
        }

        return true;
    }

    /**
     * 마이그레이션 프로시저 실행 로그 조회
     * @param migVO
     * @return
     */
    @RequestMapping(value = "/cmm/mig/selectMigProcLogList.do", method = RequestMethod.POST)
    @ResponseBody
    public List<MigProcLogVO> selectMigProcLogList(@RequestBody MigVO migVO) throws Exception {
        return migService.selectMigProcLogList(migVO.getDlrCd(), migVO.getSkipRows());
    }



    /**
     * 마이그레이션 대상 Job List 조회
     * @param migVO
     * @return
     */
    @RequestMapping(value = "/cmm/mig/selectMigTargetList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMigTargetList(@RequestBody MigTgtInfoVO migTgtInfoVO) throws Exception {

        SearchResult result = new SearchResult();

        List<MigTgtInfoVO> migTargetList = migService.selectMigTargetList(migTgtInfoVO);

        result.setTotal(migTargetList.size());
        result.setData(migTargetList);

        return result;

    }

    /**
     * 기초정보 프로시저 실행 로그 조회
     * @param migVO
     * @return
     */
    @RequestMapping(value = "/cmm/mig/selectMigNdmsLogList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMigNdmsLogList(@RequestBody MigVO migVO) throws Exception {

        SearchResult result = new SearchResult();

        List<MigNdmsComInitLogVO> migNdmsComLogList = migService.selectMigNdmsLogList(migVO.getSkipRows());

        result.setTotal(migNdmsComLogList.size());
        result.setData(migNdmsComLogList);

        return result;

    }


    /**
     * 마이그레이션 체크 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/mig/selectMigCheckMain.do", method = RequestMethod.GET)
    public String selectMigCheckMain() throws Exception {
        return "/cmm/mig/selectMigCheckMain";
    }


    /**
     * 마이그레이션 체크 목록 조회
     * @param migVO
     * @return
     */
    @RequestMapping(value = "/cmm/mig/selectMigCheckList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMigCheckList(@RequestBody MigCheckSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        List<MigNdmsComInitLogVO> migNdmsComLogList = migService.selectMigCheckList(searchVO);

        result.setTotal(migNdmsComLogList.size());
        result.setData(migNdmsComLogList);

        return result;

    }

    /**
     * 마이그레이션 데이터 검증 실행
     * @param migVO
     * @return
     */
    @RequestMapping(value = "/cmm/mig/multiMigCheckInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public void multiMigCheckInfo(@RequestBody MigVO migVO) throws Exception {
        migService.multiMigCheckInfo(migVO);
    }
}
