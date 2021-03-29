package chn.bhmc.dms.bat.sal.div.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TracticsDeliveryPreMonthDelDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 6. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 6. 6.     Ki hyun Kwon     최초 생성
 * </pre>
 */
@Mapper("tracticsDeliveryPreMonthDelDAO")
public interface TracticsDeliveryPreMonthDelDAO {


    /**
     *
     * 이전 전략 출고 신청 , 거절건 삭제
     *
     * @param day
     * @return
     * @throws Exception
     */
    public int updateTracticsDelivery(int day)throws Exception;
    
    /**
    * @Description: 改相应的车辆的str_yn
    * @param: @param day
    * @param: @return
    * @param: @throws Exception    设定文件 
    * @return int    返回类型 
    * @throws 
    * @author: niuyue
    * @date: 2020年8月4日
     */
    public int updateStrYnByVinno(int day)throws Exception;
}
