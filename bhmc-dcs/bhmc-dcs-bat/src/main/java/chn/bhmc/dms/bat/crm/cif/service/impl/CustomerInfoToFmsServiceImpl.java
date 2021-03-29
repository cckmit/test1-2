package chn.bhmc.dms.bat.crm.cif.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.bat.crm.cif.service.CustomerInfoToFmsService;
import chn.bhmc.dms.bat.crm.cif.service.dao.CustomerInfoToFmsDAO;
@Service("customerInfoToFmsService")
public class CustomerInfoToFmsServiceImpl  extends HService implements CustomerInfoToFmsService{
	 
	@Resource(name="customerInfoToFmsDAO")
	CustomerInfoToFmsDAO customerInfoToFmsDAO;
	
	@Override
	public void insertCustomerInfoToFms() throws Exception {
		customerInfoToFmsDAO.insertCustomerInfoToFms();
	}

}
