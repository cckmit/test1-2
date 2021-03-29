package chn.bhmc.dms.crm.dmm.service;

import java.util.List;

import chn.bhmc.dms.crm.dmm.vo.MembershipSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipSupportService.java
 * @Description : 멤버십 서비스
 * @author Lee In Moon
 * @since 2016.09.03.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.09.03.     Lee In Moon     최초 생성
 * </pre>
 */

public interface MembershipSupportService {


    /** support
     * 멤버십 기본정보를 조회한다.
     * @param MembershipSearchVO
     */
    public MembershipVO selectMembershipInfoByKey(MembershipSearchVO searchVO) throws Exception;


    /** 20160903 / 이인문 / support 로 이동
     * 타시스템에서 사용 : 멤버십 가입정보를 조회한다.
     * @param MembershipSearchVO
     * @return 등록된 목록수
     */
    public List<MembershipVO> selectMembershipJoinCondition(MembershipSearchVO searchVO) throws Exception;

    /** 20160903 / 이인문 / support 로 이동
     * 타시스템에서 사용 : 멤버십 포인트정보를 조회한다.
     * @param MembershipSearchVO
     * @return 등록된 포이트정보
     */
    public MembershipVO selectMembershipPointInfo(MembershipSearchVO searchVO) throws Exception;



}
