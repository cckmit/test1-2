package chn.bhmc.dms.bat.crm.cif.service.dao;

import able.com.mybatis.Mapper;

@Mapper("customerInfoToFmsDAO")
public interface CustomerInfoToFmsDAO {
	
	public void insertCustomerInfoToFms()throws Exception;
}
