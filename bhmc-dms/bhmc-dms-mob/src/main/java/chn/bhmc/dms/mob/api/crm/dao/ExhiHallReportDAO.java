package chn.bhmc.dms.mob.api.crm.dao;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.ExhiHallReportSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.ExhiHallReportVO;
import able.com.mybatis.Mapper;

@Mapper("exhiHallReportDAO")
public interface ExhiHallReportDAO {
	
	/**
	 * 试驾率
	 * @param searchVO
	 * @return
	 */
	public List<ExhiHallReportVO> selectTestDriveRate(ExhiHallReportSearchVO searchVO) ;
	/**
	 *  再次进店率
	 * @param searchVO
	 * @return
	 */
	public List<ExhiHallReportVO> selectAgainStoreRate(ExhiHallReportSearchVO searchVO) ;
	
	/**
	 * 首次留档率
	 * 
	 * @param searchVO
	 * @return
	 */
	public List<ExhiHallReportVO> selectInitialRetentionrate(ExhiHallReportSearchVO searchVO) ;
	/**
	 * 成交率
	 * @param searchVO
	 * @return
	 */
	public List<ExhiHallReportVO> selectEfficiency(ExhiHallReportSearchVO searchVO) ;
	
	/**
	 * 接待时长满足率
	 * @param searchVO
	 * @return
	 */
	public List<ExhiHallReportVO> selectReceptionTimeSatisfyRate(ExhiHallReportSearchVO searchVO) ;

}
