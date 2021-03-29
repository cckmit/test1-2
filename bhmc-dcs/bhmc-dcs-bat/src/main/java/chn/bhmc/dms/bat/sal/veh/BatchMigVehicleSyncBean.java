package chn.bhmc.dms.bat.sal.veh;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

/**
 * @ClassName   : BatchGdmsRfidCopyBean.java
 * @Description : VIN
 * @author
 * @since 2017. 6. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 6. 7.                            최초 생성
 * </pre>
 */

public class BatchMigVehicleSyncBean extends BaseJobBean {

    /*
     * @see chn.bhmc.dms.bat.mgr.service.BaseJobBean#executeJob(org.quartz.JobExecutionContext)
     */
    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        // TODO Auto-generated method stub

    }

	//@Autowired
	//BatchVehRfidResetService batchVehRfidResetService;
/*
    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
            //BatchStockDailyService batchStockDailyService = getBean(BatchStockDailyService.class);
            batchVehRfidResetService.callBatCallRfidCopyProcess();
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
*/
}