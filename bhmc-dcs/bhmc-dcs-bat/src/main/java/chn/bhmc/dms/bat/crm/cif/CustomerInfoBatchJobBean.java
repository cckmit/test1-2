package chn.bhmc.dms.bat.crm.cif;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.crm.cif.service.CustomerInfoToFmsService;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.cmm.service.BatchSalesService;

/**
生成给粉丝的客户接口表
*/
public class CustomerInfoBatchJobBean  extends BaseJobBean{
	

	@Autowired 
	CustomerInfoToFmsService customerInfoToFmsService;
	@Autowired
	BatchSalesService batchSalesService;
	@Override
	protected void executeJob(JobExecutionContext context)
			throws JobExecutionException {
	        try {
	        	 customerInfoToFmsService.insertCustomerInfoToFms();
	        } catch (Exception e){
	            throw new JobExecutionException(e.getMessage(), e);
	        }
	}

}
