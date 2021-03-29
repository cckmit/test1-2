package chn.bhmc.dms.crm.dmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.dmm.vo.CardIssueSearchVO;
import chn.bhmc.dms.crm.dmm.vo.CardIssueVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CardIssueDAO.java
 * @Description : 카드발급 이력 DAO
 * @author Kim Hyun Ho
 * @since 2016. 5. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 12.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Mapper("cardIssueDAO")
public interface CardIssueDAO {
    /**
     * 카드발급이력  정보를 등록한다.
     * @param cardIssueVO - 등록할 정보가 담긴 CardIssueVO
     * @return 등록된 목록수
     */
    public int insertCardIssue(CardIssueVO cardIssueVO) throws Exception;

    /**
     * 카드발급이력  정보를 조회한다.
     * @param cardIssueSearchVO - 조회할 정보가 담긴 CardIssueSearchVO
     * @return 등록된 정보
     */
    public CardIssueVO selectCardIssueByKey(CardIssueSearchVO cardIssueSearchVO) throws Exception;

    /**
     * 멤버십 충전카드 이력정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CardIssueSearchVO
     * @return
     */
    public int selectCardHissByConditionCnt(CardIssueSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 멤버십 충전카드 이력정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CardIssueSearchVO
     * @return 조회 목록
     */
    public List<CardIssueVO> selectCardHissByCondition(CardIssueSearchVO searchVO) throws Exception;


    /**
     * 멤버십 충전카드목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CardIssueSearchVO
     * @return
     */
    public int selectRechargeCardsByConditionCnt(CardIssueSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 멤버십 충전카드 목록정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CardIssueSearchVO
     * @return 조회 목록
     */
    public List<CardIssueVO> selectRechargeCardsByCondition(CardIssueSearchVO searchVO) throws Exception;
}