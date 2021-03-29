package chn.bhmc.dms.bat.crm.cmm.service.impl;

import javax.annotation.Resource;
import able.com.service.HService;
import org.springframework.stereotype.Service;
import chn.bhmc.dms.bat.crm.cmm.service.BatVehicleReferWarrEndTimeTempService;
import chn.bhmc.dms.bat.crm.cmm.service.dao.BatVehicleReferWarrEndTimeTempDAO;


@Service("batVehicleReferWarrEndTimeTempServiceImpl")
public class BatVehicleReferWarrEndTimeTempServiceImpl extends HService implements BatVehicleReferWarrEndTimeTempService {
   
	
    @Resource(name="batVehicleReferWarrEndTimeTempDAO")
    BatVehicleReferWarrEndTimeTempDAO batVehicleReferWarrEndTimeTempDAO;

	@Override
	public void selectVehicleReferWarrEndTimeTemp() throws Exception {
		batVehicleReferWarrEndTimeTempDAO.selectVehicleReferWarrEndTimeTemp();	
	}

   

}
