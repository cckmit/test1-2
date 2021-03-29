package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.ExhiHallReportSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.ExhiHallReportVO;

public interface ExhiHallReportService {
	/**
	 * 试驾率
	 * @param searchVO
	 * @return
	 */
	public List<ExhiHallReportVO> selectTestDriveRate(ExhiHallReportSearchVO searchVO) throws Exception;
	/**
	 *  再次进店率
	 * @param searchVO
	 * @return
	 */
	public List<ExhiHallReportVO> selectAgainStoreRate(ExhiHallReportSearchVO searchVO) throws Exception;
	
	/**
	 * 首次留档率
	 * 
	 * @param searchVO
	 * @return
	 */
	public List<ExhiHallReportVO> selectInitialRetentionrate(ExhiHallReportSearchVO searchVO) throws Exception;
	/**
	 * 成交率
	 * @param searchVO
	 * @return
	 */
	public List<ExhiHallReportVO> selectEfficiency(ExhiHallReportSearchVO searchVO) throws Exception;
	
	/**
	 * 接待时长满足率
	 * @param searchVO
	 * @return
	 */
	public List<ExhiHallReportVO> selectReceptionTimeSatisfyRate(ExhiHallReportSearchVO searchVO) throws Exception;
}
