package chn.bhmc.dms.cmm.cmp.service;

import java.util.List;

import chn.bhmc.dms.cmm.cmp.vo.DateBaDmsDownReVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;

/**
 * 딜러 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Kang Seok Han            최초 생성
 * </pre>
 */

public interface DealerService {

    /**
     * 딜러 정보를 수정한다.
     * @param dealerVO - 수정할 정보가 담긴 DealerVO
     * @return 수정된 목록수
     */
    public int updateDealer(DealerVO dealerVO) throws Exception;

    /**
     * Key에 해당하는 딜러 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 딜러 정보
     */
    public DealerVO selectDealerByKey(String dlrCd) throws Exception;


    /**
     * 딜러코드 또는 딜러명이 query를 포함하는 목록을 조회한다.
     * @param query 조회 텍스트
     * @param maxRows 최대 목록 수
     * @return
     */
    public List<DealerVO> selectDealersForSuggest(String query, int maxRows) throws Exception;

    /**
     * 조회 조건에 해당하는 딜러 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return 조회 목록
     */
    public List<DealerVO> selectDealersByCondition(DealerSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 딜러 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return
     */
    public int selectDealersByConditionCnt(DealerSearchVO searchVO) throws Exception;
    
    /**
     * 经销商信息 系统选项设置 中 增加 下载 DMS 数据库备份文件功能 贾明 2019-6-20
     * @param dateBaDmsDownReVO
     * @return
     * @throws Exception
     */
    public int insertDatabaseDmsBackupDownRecords(DateBaDmsDownReVO  dateBaDmsDownReVO ) throws Exception;
}