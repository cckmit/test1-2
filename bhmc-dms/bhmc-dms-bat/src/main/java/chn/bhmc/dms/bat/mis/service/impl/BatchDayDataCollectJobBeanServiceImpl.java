package chn.bhmc.dms.bat.mis.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.mis.service.BatchDayDataCollectJobBeanService;
import chn.bhmc.dms.bat.mis.service.dao.BatchDayDataCollectJobDAO;

/**
 * <pre>
 * [BatchJob] 고객정보(MS_1004T_2016)
 * </pre>
 *
 * @ClassName   : BatchDayDataCollectJobBeanServiceImpl
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
@Service("batchDayDataCollectJobBeanService")
public class BatchDayDataCollectJobBeanServiceImpl extends HService implements BatchDayDataCollectJobBeanService {

    /**
     * BatchDayCrmStatusJob DAO
     */
    @Resource(name="batchDayDataCollectJobDAO")
    BatchDayDataCollectJobDAO batchDayDataCollectJobDAO;

    @Override
    public int selectDayDataCollectJob() throws Exception {

        //BatchDayCrmStatusJobVO searchVO = new BatchDayCrmStatusJobVO();
    	batchDayDataCollectJobDAO.selectDayDataCollectJob();

        return 0;
    }

}
