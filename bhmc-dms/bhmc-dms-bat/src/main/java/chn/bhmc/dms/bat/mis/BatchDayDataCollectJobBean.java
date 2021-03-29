package chn.bhmc.dms.bat.mis;

import org.quartz.*;
import org.springframework.beans.factory.annotation.*;

import chn.bhmc.dms.bat.mgr.service.*;
import chn.bhmc.dms.bat.mis.service.*;
/**
 * <pre>
 * [BatchJob] 고객정보(MS_1004T_2016)
 * </pre>
 *
 * @ClassName   : BatchDayCrmStatusJobBean.java
 * @Description : [BatchJob] 고객정보(MS_1004T_2016)
 * @author chibeom.song
 * @since 2016. 9. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 25.   kjlee     최초 생성
 * </pre>
 */

public class BatchDayDataCollectJobBean extends BaseJobBean {

	@Autowired
	BatchDayDataCollectJobBeanService batchDayDataCollectJobBeanService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
        	batchDayDataCollectJobBeanService.selectDayDataCollectJob();
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}