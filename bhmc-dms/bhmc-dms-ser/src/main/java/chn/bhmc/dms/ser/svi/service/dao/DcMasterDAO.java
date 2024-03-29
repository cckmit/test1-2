package chn.bhmc.dms.ser.svi.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.svi.vo.DcDetailVO;
import chn.bhmc.dms.ser.svi.vo.DcMasterSearchVO;
import chn.bhmc.dms.ser.svi.vo.DcMasterVO;

/**
 * <pre>
 * 할인관리 처리에 대한 mapper class
 * </pre>
 *
 * @ClassName   : DcMasterDAO.java
 * @Description : 할인관리 DAO
 * @author Yin Xueyuan
 * @since 2016. 2. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 16.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Mapper("dcMasterDAO")
public interface DcMasterDAO {

    /**
     * 할인관리 정보를 등록한다.
     * @param dcMasterVO - 등록할 정보가 담긴 dcMasterVO
     * @return 등록된 목록수
     */
    public int insertDcMaster (DcMasterVO dcMasterVO)throws Exception;

    /**
     * 할인관리 상세 정보를 등록한다.
     * @param dcMasterVO - 등록할 정보가 담긴 dcMasterVO
     * @return
     */
    public int insertDcDetail (DcDetailVO dcDetailVO)throws Exception;

    /**
     * 할인관리 정보를 수정한다.
     * @param dcMasterVO - 수정할 정보가 담긴 dcMasterVO
     * @return 수정된 목록수
     */
    public int updateDcMaster(DcMasterVO dcMasterVO)throws Exception;

    /**
     * 할인관리 상세  정보를 수정한다.
     * @param dcMasterVO - 수정할 정보가 담긴 dcMasterVO
     * @return
     */
    public int updateDcDetail(DcDetailVO dcDetailVO)throws Exception;

    /**
     * 할인관리 정보를 삭제한다.
     * @param dcMasterVO - 삭제할 정보가 담긴 dcMasterVO
     * @return 삭제된 목록수
     */
    public int deleteDcMaster(DcMasterVO dcMasterVO)throws Exception;

    /**
     * 할인관리 상세 정보를 삭제한다.
     * @param dcMasterVO - 삭제할 정보가 담긴 dcMasterVO
     * @return 삭제된 목록수
     */
    public int deleteDcDetail(DcDetailVO dcDetailVO)throws Exception;

    /**
     * 조회 조건에 해당하는 할인관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DcMasterSearchVO
     * @return 조회 목록
     */
    public List<DcMasterVO> selectDcMasterByCondition(DcMasterSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 할인관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DcMasterSearchVO
     * @return
     */
    public int selectDcMasterByConditionCnt(DcMasterSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 할인관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DcMasterSearchVO
     * @return 조회 목록
     */
    public List<DcDetailVO> selectDcDetailByCondition(DcMasterSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 할인관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DcMasterSearchVO
     * @return
     */
    public int selectDcDetailByConditionCnt(DcMasterSearchVO searchVO)throws Exception;

    public List<DcMasterVO> selectEtcDcTargetByCondition(DcMasterSearchVO searchVO)throws Exception;

    public int selectEtcDcTargetByConditionCnt(DcMasterSearchVO searchVO)throws Exception;

    public DcDetailVO selectDcDetailByKey(DcMasterSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 할인관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 dcMasterSearchVO
     * @return
     */
    public int selectDcAuthByConditionCnt(DcMasterSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 할인관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DcMasterSearchVO
     * @return 조회 목록
     */
    public List<DcMasterVO> selectDcAuthByCondition(DcMasterSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 최대 부품할인률을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 dcMasterSearchVO
     * @return
     */
    public List<DcMasterVO> selectParMaxDcRateByCondition(DcMasterSearchVO searchVO) throws Exception;
}
