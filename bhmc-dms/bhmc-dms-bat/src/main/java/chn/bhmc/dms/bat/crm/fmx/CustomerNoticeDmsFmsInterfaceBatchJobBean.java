package chn.bhmc.dms.bat.crm.fmx;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.crm.cif.service.BatIfCustomerInfoDmsService;
import chn.bhmc.dms.bat.crm.fmx.service.BatIfCustomerNoticeDmsFmsService;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomerInfoRelDmsDcsInterfaceBatchJobBean
 * @Description : DMS-FMS 转介绍客户购车通知接口
 * @author LEE YANYONG
 * @since 2020. 4. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 19.     LEE YANYONG     
 * </pre>
 */

public class CustomerNoticeDmsFmsInterfaceBatchJobBean extends BaseJobBean {
	
	@Autowired
	BatIfCustomerNoticeDmsFmsService batIfCustomerNoticeDmsFmsService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
        	batIfCustomerNoticeDmsFmsService.selectCustomerNoticeDmsFms();

        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}