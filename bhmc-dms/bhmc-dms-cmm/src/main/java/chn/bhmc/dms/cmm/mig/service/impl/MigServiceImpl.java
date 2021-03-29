package chn.bhmc.dms.cmm.mig.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.mig.vo.MigVO;

import chn.bhmc.dms.cmm.mig.service.MigService;
import chn.bhmc.dms.cmm.mig.service.dao.MigDAO;
import chn.bhmc.dms.cmm.mig.vo.MigCheckSearchVO;
import chn.bhmc.dms.cmm.mig.vo.MigNdmsComInitLogVO;
import chn.bhmc.dms.cmm.mig.vo.MigProcLogVO;
import chn.bhmc.dms.cmm.mig.vo.MigTgtInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MigServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 12. 7.
 * @version 1.0
 * @see
 * @Modification Information * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 7.     Kang Seok Han     최초 생성
 * </pre>
 */
@Service("migService")
public class MigServiceImpl extends HService implements MigService {

    @Resource(name="migDAO")
    MigDAO migDAO;

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#insertOrUpdateDealer(java.lang.String, java.lang.String)
     */
    @Override
    public void insertOrUpdateDealer(String useCenterDmsYn, String dlrCd) throws Exception {
        migDAO.insertOrUpdateDealer(useCenterDmsYn, dlrCd);
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#insertOrUpdateStorage(java.util.List)
     */
    @Override
    public void insertOrUpdateStorage(String dlrCd) throws Exception {
        migDAO.insertOrUpdateStorage(dlrCd);
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#insertOrUpdateSystemInfo(java.util.List)
     */
    @Override
    public void insertOrUpdateSystemInfo() throws Exception {
        migDAO.insertOrUpdateSystemInfo();
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#insertOrUpdateCountry()
     */
    @Override
    public void insertOrUpdateCountry() throws Exception {
        migDAO.insertOrUpdateCountry();
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#insertOrUpdateLang()
     */
    @Override
    public void insertOrUpdateLang() throws Exception {
        migDAO.insertOrUpdateLang();
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#insertOrUpdateCurrency()
     */
    @Override
    public void insertOrUpdateCurrency() throws Exception {
        migDAO.insertOrUpdateCurrency();
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#insertOrUpdateZipCode()
     */
    @Override
    public void insertOrUpdateZipCode() throws Exception {
        migDAO.insertOrUpdateZipCode();
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#insertOrUpdateDistCode()
     */
    @Override
    public void insertOrUpdateDistCode() throws Exception {
        migDAO.insertOrUpdateDistCode();
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#insertOrUpdateUnitInfo()
     */
    @Override
    public void insertOrUpdateUnitInfo() throws Exception {
        migDAO.insertOrUpdateUnitInfo();
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#insertOrUpdateDateInfo()
     */
    @Override
    public void insertOrUpdateDateInfo() throws Exception {
        migDAO.insertOrUpdateDateInfo();
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#insertOrUpdateTimeZone()
     */
    @Override
    public void insertOrUpdateTimeZone() throws Exception {
        migDAO.insertOrUpdateTimeZone();
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#insertOrUpdateCommonCode()
     */
    @Override
    public void insertOrUpdateCommonCode() throws Exception {
        migDAO.insertOrUpdateCommonCode();
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#insertOrUpdateMessageSource()
     */
    @Override
    public void insertOrUpdateMessageSource() throws Exception {
        migDAO.insertOrUpdateMessageSource();
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#insertOrUpdateMessageTemplate()
     */
    @Override
    public void insertOrUpdateMessageTemplate() throws Exception {
        migDAO.insertOrUpdateMessageTemplate();
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#insertOrUpdateUser(java.lang.String)
     */
    @Override
    public void insertOrUpdateUser(String dlrCd) throws Exception {
        migDAO.insertOrUpdateUser(dlrCd);
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#insertOrUpdateAuthority()
     */
    @Override
    public void insertOrUpdateAuthority() throws Exception {
        migDAO.insertOrUpdateAuthority();
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#insertOrUpdateDivision()
     */
    @Override
    public void insertOrUpdateDivision() throws Exception {
        migDAO.insertOrUpdateDivision();
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#insertOrUpdateOffice()
     */
    @Override
    public void insertOrUpdateOffice() throws Exception {
        migDAO.insertOrUpdateOffice();
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#insertOrUpdateCastle()
     */
    @Override
    public void insertOrUpdateCastle() throws Exception {
        migDAO.insertOrUpdateCastle();
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#insertOrUpdateCity()
     */
    @Override
    public void insertOrUpdateCity() throws Exception {
        migDAO.insertOrUpdateCity();
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#insertOrUpdateTask()
     */
    @Override
    public void insertOrUpdateTask() throws Exception {
        migDAO.insertOrUpdateTask();
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#insertOrUpdateDepartment()
     */
    @Override
    public void insertOrUpdateDepartment() throws Exception {
        migDAO.insertOrUpdateDepartment();
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#updateMigNdmsComInit(java.lang.String, java.lang.String)
     */
    @Override
    public void updateMigNdmsComInit(MigVO migVO) throws Exception {
        migDAO.updateMigNdmsComInit(migVO);
    }


    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#updateMigProcMain(java.lang.String)
     */
    @Override
    public void updateMigProcMain(String dlrCd) throws Exception {
        migDAO.updateMigProcMain(dlrCd);
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#selectMigProcLogList(java.lang.String)
     */
    @Override
    public List<MigProcLogVO> selectMigProcLogList(String dlrCd, int skipRows) throws Exception {
        return migDAO.selectMigProcLogList(dlrCd, skipRows);
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#updateMigNdmsInsert(java.lang.String)
     */
    @Override
    public void updateMigNdmsInsert(MigVO migVO) throws Exception {
        String dlrCd = migVO.getDlrCd();

        String migPrgStat = migDAO.selectMigPrgStat(dlrCd);
        if("P".equals(migPrgStat)){
            throw processException("Progress GDMS Mig.");
        }else{
            migDAO.updateMigNdmsInsert(dlrCd);
        }
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.updateMigAfeterProcInsert(java.lang.String)
     */
    @Override
    public void updateMigAfeterProcInsert(MigVO migVO) throws Exception {
        migDAO.updateMigAfeterProcInsert(migVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.updateMigDcsDmsProcInsert(java.lang.String)
     */
    @Override
    public void updateMigDcsDmsProcInsert(MigVO mivVO) throws Exception {
        migDAO.updateMigDcsDmsProcInsert(mivVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.selectMigTargetList(java.lang.String)
     */
    public List<MigTgtInfoVO> selectMigTargetList(MigTgtInfoVO migTgtInfoVO) throws Exception{
        return migDAO.selectMigTargetList(migTgtInfoVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#selectMigNdmsInsertLogList(int)
     */
    @Override
    public List<MigNdmsComInitLogVO> selectMigNdmsLogList(int skipRows) throws Exception {
        return migDAO.selectMigNdmsLogList(skipRows);
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#selectMigNdmsInsertLogList(int)
     */
    @Override
    public List<MigNdmsComInitLogVO> selectMigCheckList(MigCheckSearchVO searchVO) throws Exception {
        return migDAO.selectMigCheckList(searchVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#multiMigCheckInfo(migVO)
     */
    @Override
    public void multiMigCheckInfo(MigVO migVO) throws Exception{
        migDAO.multiMigCheckInfo(migVO);
    }
}
