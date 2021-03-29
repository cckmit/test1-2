package chn.bhmc.dms.bat.crm.cmm;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.crm.cmm.service.BatVehicleReferWarrEndTimeTempService;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;


public class BatVehiReferWaEndBatchJobBean extends BaseJobBean {
	
	@Autowired
	BatVehicleReferWarrEndTimeTempService batVehicleReferWarrEndTimeTempService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
        	batVehicleReferWarrEndTimeTempService.selectVehicleReferWarrEndTimeTemp();
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}