package chn.bhmc.dms.par.pcm.service;

import java.util.List;

import chn.bhmc.dms.par.pcm.vo.ClaimVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdItemVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PurcInterfaceService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ju Won Lee
 * @since 2016. 3. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 6.     Ju Won Lee     최초 생성
 * </pre>
 */

public interface PurcInterfaceService {
    /**
     *구매오더  전송 시 인터페이스 정보를 등록한다.
     * @param purcOrdItemVO - 등록할 정보가 담긴 PurcOrdItemVO
     * @return 등록된 목록수
     */
    public int createOrdInterface(List<PurcOrdItemVO> list, PurcOrdVO purcOrdVO) throws Exception;

    /**
     *클레임  전송 시 인터페이스 정보를 등록한다.
     * @param claimVO - 등록할 정보가 담긴 claimVO
     * @return 등록된 목록수
     */
    public void createClaimInterface(ClaimVO claimVO) throws Exception;

    /**
     * 조회조건에 해당하는 구매오더 전송 제한 횟수를 조회한다.(딜러+창고(PDC)+년월+오더유형 => MAX(36))
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회목록 수
     */
    public int selectPurcOrdInterfaceLmitCnt(PurcOrdVO purcOrdVO) throws Exception;



}