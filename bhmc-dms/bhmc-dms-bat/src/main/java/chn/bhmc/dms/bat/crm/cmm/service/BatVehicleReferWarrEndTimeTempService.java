package chn.bhmc.dms.bat.crm.cmm.service;


public interface BatVehicleReferWarrEndTimeTempService {

   /**
    *  贾明 定时把 保修结束日期保存到 CR_1008T 表中， CRS NO 36 CRM车辆基准信息查询时，根据保修结束日期查询太慢 2019-12-10
    * @throws Exception
    */
	 public void selectVehicleReferWarrEndTimeTemp() throws Exception;


}