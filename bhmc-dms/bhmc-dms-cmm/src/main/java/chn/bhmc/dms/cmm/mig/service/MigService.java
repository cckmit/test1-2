package chn.bhmc.dms.cmm.mig.service;

import java.util.List;

import chn.bhmc.dms.cmm.mig.vo.MigVO;

import chn.bhmc.dms.cmm.mig.vo.MigCheckSearchVO;

import chn.bhmc.dms.cmm.mig.vo.MigTgtInfoVO;

import chn.bhmc.dms.cmm.mig.vo.MigNdmsComInitLogVO;
import chn.bhmc.dms.cmm.mig.vo.MigProcLogVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MigService.java
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

public interface MigService {

    /**
     * 딜러정보 업데이트
     * DCS 딜러정보를 DB링크를 통하여 DMS 딜러정보를 등록/수정 하고 딜러마스터 정보의 SYS_OWNER_YN, USE_CENTER_DMS_YN 값을 변경한다.
     * CM_0101T
     * @param useCenterDmsYn 센터 DMS 사용딜러 여부
     *          'Y' 인 경우 딜러코드에 해당하는 USE_CENTER_DMS_YN 필드값을 'Y'로 변경하고, 딜러정보 테이블의 전체 목록의 SYS_OWNER_YN 필드값을 'N'로 변경한다.
     *          'N' 인 경우 딜러코드에 해당하는 SYS_OWNER_YN 필드값을 'Y'로 변경하고, 딜러정보 테이블의 전체 목록의 USE_CENTER_DMS_YN 필드값을 'N'로 변경한다.
     * @param dlrCd 딜러코드
     * @throws Exception
     */
    public void insertOrUpdateDealer(String useCenterDmsYn, String dlrCd) throws Exception;

    /**
     * 창고정보 업데이트
     * 기초 창고정보를 등록 또는 수정한다.
     * CM_0104T
     * @param dlrCd
     * @throws Exception
     */
    public void insertOrUpdateStorage(String dlrCd) throws Exception;

    /**
     * 시스템설정 정보 업데이트
     * DCS 시스템설정 정보를 DB링크를 통하여 DMS 시스템설정 정보를 등록/수정한다.
     * CM_0201T
     * @throws Exception
     */
    public void insertOrUpdateSystemInfo() throws Exception;

    /**
     * 국가정보 업데이트
     * DCS 국가정보를 DB링크를 통하여 DMS 국가정보를 등록/수정한다.
     * CM_0202T
     * @throws Exception
     */
    public void insertOrUpdateCountry() throws Exception;

    /**
     * 언어정보 업데이트
     * DCS 언어정보를 DB링크를 통하여 DMS 언어정보를 등록/수정한다.
     * CM_0203T
     * @throws Exception
     */
    public void insertOrUpdateLang() throws Exception;

    /**
     * 통화정보 업데이트
     * DCS 통화정보를 DB링크를 통하여 DMS 통화정보를 등록/수정한다.
     * CM_0204T
     * @throws Exception
     */
    public void insertOrUpdateCurrency() throws Exception;

    /**
     * 우편번호정보 업데이트
     * DCS 우편번호정보를 DB링크를 통하여 DMS 우편번호정보를 등록/수정한다.
     * CM_0205T
     * @throws Exception
     */
    public void insertOrUpdateZipCode() throws Exception;

    /**
     * 지역코드정보 업데이트
     * DCS 지역코드정보를 DB링크를 통하여 DMS 지역코드정보를 등록/수정한다.
     * CM_0206T
     * @throws Exception
     */
    public void insertOrUpdateDistCode() throws Exception;

    /**
     * 단위정보 업데이트
     * DCS 단위정보를 DB링크를 통하여 DMS 단위정보를 등록/수정한다.
     * CM_0207T
     * @throws Exception
     */
    public void insertOrUpdateUnitInfo() throws Exception;

    /**
     * 날짜정보 업데이트
     * DCS 날짜정보를 DB링크를 통하여 DMS 날짜정보를 등록/수정한다.
     * CM_0212T
     * @throws Exception
     */
    public void insertOrUpdateDateInfo() throws Exception;

    /**
     * 타입존정보 업데이트
     * DCS 타임존, 타임존텍스트 정보를 DB링크를 통하여 DMS 타임존, 타임존텍스트 정보를 등록/수정한다.
     * CM_0213T, CM_0214T
     * @throws Exception
     */
    public void insertOrUpdateTimeZone() throws Exception;

    /**
     * 공통코드정보 업데이트
     * DCS 공통코드그룹,공통코드그룹텍스트,공통코드,공통코드텍스트 정보를 DB링크를 통하여 DMS 공통코드그룹,공통코드그룹텍스트,공통코드,공통코드텍스트에 등록/수정한다.
     * CM_0301T, CM_0302T, CM_0303T, CM_0304T
     * @throws Exception
     */
    public void insertOrUpdateCommonCode() throws Exception;

    /**
     * 메세지소스정보 업데이트
     * DCS 메세지소스 정보를 DB링크를 통하여 DMS 메세지소스 정보를 등록/수정한다.
     * CM_0501T
     * @throws Exception
     */
    public void insertOrUpdateMessageSource() throws Exception;

    /**
     * 메세지템플릿 정보 업데이트
     * DCS 메세지템플릿 정보를 DB링크를 통하여 DMS 메세지템플릿 정보를 등록/수정한다.
     * CM_0601T, CM_0602T
     * @throws Exception
     */
    public void insertOrUpdateMessageTemplate() throws Exception;

    /**
     * 사용자 정보 업데이트
     * DCS 사용자 정보를 DB링크를 통하여 DMS 사용자 정보를 등록/수정한다.
     * 딜러코드에 해당하는 딜러 사용자 목록만을 적용한다.
     * CM_0801T
     * @throws Exception
     */
    public void insertOrUpdateUser(String dlrCd) throws Exception;

    /**
     * 권한 정보 업데이트
     * DCS 권한 정보를 DB링크를 통하여 DMS 권한 정보를 등록/수정한다.
     * SYS_CD가 'D'인 목록만을 적용한다.
     * CM_0804T, CM_0803T, CM_0805T, CM_0809T, CM_0810T, CM_0808T
     * @throws Exception
     */
    public void insertOrUpdateAuthority() throws Exception;

    /**
     * 알림 정보 업데이트
     * DCS 알림 정보를 DB링크를 통하여 DMS 알림 정보를 등록/수정한다.
     * CM_2101T, CM_2102T, CM_2104T
     * @throws Exception
     *
    public void insertOrUpdateNotification() throws Exception;
    */


    /**
     * 사업부정보 업데이트
     * DCS 사업부정보를 DB링크를 통하여 DMS 사업부정보를 등록/수정한다.
     * CM_2501T
     * @throws Exception
     */
    public void insertOrUpdateDivision() throws Exception;

    /**
     * 사무소정보 업데이트
     * DCS 사무소정보를 DB링크를 통하여 DMS 사무소정보를 등록/수정한다.
     * CM_2601T
     * @throws Exception
     */
    public void insertOrUpdateOffice() throws Exception;

    /**
     * 성정보 업데이트
     * DCS 성정보를 DB링크를 통하여 DMS 성정보를 등록/수정한다.
     * CM_2701T
     * @throws Exception
     */
    public void insertOrUpdateCastle() throws Exception;

    /**
     * 도시정보 업데이트
     * DCS 도시정보를 DB링크를 통하여 DMS 도시정보를 등록/수정한다.
     * CM_3201T
     * @throws Exception
     */
    public void insertOrUpdateCity() throws Exception;

    /**
     * 직무정보 업데이트
     * DCS 직무정보를 DB링크를 통하여 DMS 직무정보를 등록/수정한다.
     * CMP_TP가 10인 목록만 적용한다.
     * CM_2801T
     * @throws Exception
     */
    public void insertOrUpdateTask() throws Exception;

    /**
     * 부서정보 업데이트
     * DCS 부서정보를 DB링크를 통하여 DMS 부서정보를 등록/수정한다.
     * CMP_TP가 10인 목록만 적용한다.
     * CM_3401T
     * @throws Exception
     */
    public void insertOrUpdateDepartment() throws Exception;

    /**
     * 기초정보 프로시저 실행
     * @param dlrCd 딜러코드
     * @param useCenterDmsYn 센터DMS 사용여부
     * @throws Exception
     */
    public void updateMigNdmsComInit(MigVO migVO) throws Exception;

    /**
     * 마이그레이션 프로시저 호출
     * DCS DB에서 마이그레이션 작업을 수행한다.
     * @param dlrCd
     * @throws Exception
     */
    public void updateMigProcMain(String dlrCd) throws Exception;

    /**
     * 마이그레이션 프로시저 실행 로그 조회
     * @param dlrCd 딜러코드
     * @param skipRows 로그조회시 스킵할 목록수
     * @return
     * @throws Exception
     */
    public List<MigProcLogVO> selectMigProcLogList(String dlrCd, int skipRows) throws Exception;

    /**
     * 마이그레이션 프로시저 호출
     * DCS DB에서 수행된 마이그레이션 데이터를 신규 딜러로 이관한다.
     * @param dlrCd
     * @throws Exception
     */
    public void updateMigNdmsInsert(MigVO migVO) throws Exception;

    /**
     * 마이그레이션 후행 프로시저 호출
     * DCS DB에서 수행된 마이그레이션 데이터를 보정한다.
     * @param dlrCd
     * @throws Exception
     */
    public void updateMigAfeterProcInsert(MigVO migVO) throws Exception;

    /**
     * 마이그레이션 후행 프로시저 호출(DCS->DMS)
     * DCS DB에서 수행된 마이그레이션 데이터를 전송한다.
     * @param dlrCd
     * @throws Exception
     */
    public void updateMigDcsDmsProcInsert(MigVO migVO) throws Exception;

    /**
     * 마이그레이션 대상 Job List 조회
     * @param
     * @return
     * @throws Exception
     */
    public List<MigTgtInfoVO> selectMigTargetList(MigTgtInfoVO migTgtInfoVO) throws Exception;

    /**
     * 마이그레이션 데이터를 신규 딜러로 이관 실행 로그 조회
     * @param skipRows 로그조회시 스킵할 목록수
     * @return
     * @throws Exception
     */
    public List<MigNdmsComInitLogVO> selectMigNdmsLogList(int skipRows) throws Exception;

    /**
     * 마이그레이션 체크 목록 조회
     * @param MigCheckSearchVO
     * @return MigNdmsComInitLogVO
     * @throws Exception
     */
    public List<MigNdmsComInitLogVO> selectMigCheckList(MigCheckSearchVO searchVO) throws Exception;

    /**
     * 마이그레이션 검증 실행
     * @param MigCheckSearchVO
     * @return MigNdmsComInitLogVO
     * @throws Exception
     */
    public void multiMigCheckInfo(MigVO migVO) throws Exception;
}
