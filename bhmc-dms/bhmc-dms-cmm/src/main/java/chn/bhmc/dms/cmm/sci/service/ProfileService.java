package chn.bhmc.dms.cmm.sci.service;

import java.util.List;

import chn.bhmc.dms.cmm.sci.vo.ProfileSearchVO;
import chn.bhmc.dms.cmm.sci.vo.ProfileVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ProfileService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 3. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 29.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public interface ProfileService {

    /**
     * 사전점검 내역 리스트 수 조회
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectAliveCheckListByConditionCnt(ProfileSearchVO searchVO) throws Exception;

    /**
     * 사전점검 내역 리스트 조회
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<ProfileVO> selectAliveCheckListByCondition(ProfileSearchVO searchVO) throws Exception;

    /**
     * 프로시져 호출
     * @param proId
     * @throws Exception
     */
    public void pingSearch(ProfileVO profileVO) throws Exception;

}
