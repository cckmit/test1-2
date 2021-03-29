package chn.bhmc.dms.cmm.sci.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.sci.vo.ProfileSearchVO;
import chn.bhmc.dms.cmm.sci.vo.ProfileVO;

/**
 * 시스템설정에 관한 데이터처리 매퍼 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kang Seok Han            최초 생성
 * </pre>
 */

@Mapper("profileDAO")
public interface ProfileDAO {

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
