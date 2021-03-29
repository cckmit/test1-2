package chn.bhmc.dms.bat.mis.web;

import javax.annotation.*;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import able.com.web.*;
import chn.bhmc.dms.bat.mis.service.*;

@Controller
public class BatchDayDataCollectJobTestController extends HController {

    @Resource(name="batchDayDataCollectJobBeanService")
    BatchDayDataCollectJobBeanService batchDayDataCollectJobBeanService;

    /**
     * MIS 호출
     * @return chn.bhmc.dms.bat.crm.cso.service
     */
    @RequestMapping(value = "/bat/mis/selectDayDataCollectJob.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectDayDataCollectJob() throws Exception {
    	batchDayDataCollectJobBeanService.selectDayDataCollectJob();
    	return 0;

    }

}