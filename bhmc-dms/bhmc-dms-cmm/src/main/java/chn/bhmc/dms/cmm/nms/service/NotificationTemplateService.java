package chn.bhmc.dms.cmm.nms.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.cmm.nms.vo.NotificationTemplateSaveVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTemplateSearchVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTemplateVO;

/**
 * 알림정책 메세지템플릿 관리 서비스
 *
 * @ClassName   : NotificationTemplateService.java
 * @Description : 알림정책 메세지템플릿을 관리한다.
 * @author Kang Seok Han
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.     Kang Seok Han     최초 생성
 * </pre>
 */

public interface NotificationTemplateService {


    /**
     * 알림정책 메세지템플릿 정보를 등록한다.
     * @param notificationTemplateVO 등록할 정보가 담긴 NotificationTemplateVO
     * @return 등록된 목록수
     */
    public int insertNotificationTemplate(NotificationTemplateVO notificationTemplateVO) throws Exception;

    /**
     * 알림정책 메세지템플릿 정보를 삭제한다.
     * @param notificationTemplateVO 삭제할 정보가 담긴 NotificationTemplateVO
     * @return 삭제된 목록수
     */
    public int deleteNotificationTemplate(NotificationTemplateVO notificationTemplateVO) throws Exception;

    /**
     * 알림정책 메세지템플릿 정보를 등록/수정/삭제 처리한다.
     * @param notificationTemplateSaveVO
     */
    public void multiNotificationTemplates(NotificationTemplateSaveVO notificationTemplateSaveVO) throws Exception;

    /**
     * Key에 해당하는 알림정책 메세지템플릿 정보를 조회한다.
     * @param alrtPolicyGrpId 알림정책 그룹 ID
     * @param alrtPolicyId 알림정책 ID
     * @param mesgTmplGrpId 메세지템플릿 그룹 ID
     * @param mesgTmplTp 메세지템플릿 유형
     * @return 조회한 알림정책 메세지템플릿 정보
     */
    public NotificationTemplateVO selectNotificationTemplateByKey(
            @Param("alrtPolicyGrpId") String alrtPolicyGrpId,
            @Param("alrtPolicyId") String alrtPolicyId,
            @Param("mesgTmplGrpId") String mesgTmplGrpId,
            @Param("mesgTmplTp") String mesgTmplTp) throws Exception;

    /**
     * 조회 조건에 해당하는 알림정책 메세지템플릿 정보를 조회한다.
     * @param searchVO 조회 조건을 포함하는 NotificationTemplateSearchVO
     * @return 조회 목록
     */
    public List<NotificationTemplateVO> selectNotificationTemplatesByCondition(NotificationTemplateSearchVO searchVO) throws Exception;

}
