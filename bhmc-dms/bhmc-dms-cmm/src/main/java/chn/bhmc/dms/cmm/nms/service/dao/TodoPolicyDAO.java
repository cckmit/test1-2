package chn.bhmc.dms.cmm.nms.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.nms.vo.TodoPolicySaveVO;
import chn.bhmc.dms.cmm.nms.vo.TodoPolicySearchVO;
import chn.bhmc.dms.cmm.nms.vo.TodoPolicyVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TodoPolicyDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 10. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 4.     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("todoPolicyDAO")
public interface TodoPolicyDAO {

    /**
     * To-do 정책 정보를 등록한다.
     * @param todoPolicyVO - 등록할 정보가 담긴 TodoPolicyVO
     * @return 등록된 목록수
     */
    public int insertTodoPolicy(TodoPolicyVO todoPolicyVO);

    /**
     * To-do 정책 정보를 수정한다.
     * @param todoPolicyVO - 수정할 정보가 담긴 TodoPolicyVO
     * @return 수정된 목록수
     */
    public int updateTodoPolicy(TodoPolicyVO todoPolicyVO);

    /**
     * To-do 정책 정보를 삭제한다.
     * @param todoPolicyVO - 삭제할 정보가 담긴 TodoPolicyVO
     * @return 삭제된 목록수
     */
    public int deleteTodoPolicy(TodoPolicyVO todoPolicyVO);

    /**
     * Key에 해당하는 To-do 정책 정보를 조회한다.
     * @param todoPolicyId - To-do 정책 ID
     * @return 조회한 To-do 정책 정보
     */
    public TodoPolicyVO selectTodoPolicyByKey(String todoPolicyId);

    /**
     * To-do 정책 정보를 등록/수정/삭제 처리한다.
     * @param todoPolicySaveVO
     */
    public void multiTodoPolicies(TodoPolicySaveVO todoPolicySaveVO);

    /**
     * 조회 조건에 해당하는 To-do 정책 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TodoPolicySearchVO
     * @return 조회 목록
     */
    public List<TodoPolicyVO> selectTodoPoliciesByCondition(TodoPolicySearchVO searchVO);

    /**
     * 조회 조건에 해당하는 To-do 정책 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TodoPolicySearchVO
     * @return
     */
    public int selectTodoPoliciesByConditionCnt(TodoPolicySearchVO searchVO);
}
