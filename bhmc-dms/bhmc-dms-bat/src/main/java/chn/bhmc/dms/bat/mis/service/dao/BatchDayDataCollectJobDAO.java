package chn.bhmc.dms.bat.mis.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.bat.mis.vo.BatchDayCrmStatusJobVO;

/**
 * <pre>
 * [BatchJob] 고객정보(MS_1004T_2016)
 * </pre>
 *
 * @ClassName   : BatchDayCrmStatusJobDAO.java
 * @Description : [BatchJob] 고객정보(MS_1004T_2016)
 * @author chibeom.song
 * @since 2016. 9. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 25.   chibeom.song     최초 생성
 * </pre>
 */
@Mapper("batchDayDataCollectJobDAO")
public interface BatchDayDataCollectJobDAO {

    /**
     * [BatchJob] 고객정보(MS_1004T)
     * @param null
     * @return Count
     */
    public void selectDayDataCollectJob() throws Exception;

}
