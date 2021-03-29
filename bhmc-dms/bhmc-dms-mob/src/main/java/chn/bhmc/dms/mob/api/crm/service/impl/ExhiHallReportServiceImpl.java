package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.mob.api.crm.dao.ExhiHallReportDAO;
import chn.bhmc.dms.mob.api.crm.service.ExhiHallReportService;
import chn.bhmc.dms.mob.api.crm.vo.ExhiHallReportSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.ExhiHallReportVO;
import able.com.service.HService;

@Service("exhiHallReportService")
public class ExhiHallReportServiceImpl extends HService implements ExhiHallReportService {

	/**
	 * 展厅Dao
	 */
	@Resource(name = "exhiHallReportDAO")
	ExhiHallReportDAO exhiHallReportDAO;

	/**
	 * 试驾率
	 */
	@Override
	public List<ExhiHallReportVO> selectTestDriveRate(ExhiHallReportSearchVO searchVO) throws Exception {
		return exhiHallReportDAO.selectTestDriveRate(searchVO);
	}

	/**
	 * 再次进店率
	 */
	@Override
	public List<ExhiHallReportVO> selectAgainStoreRate(ExhiHallReportSearchVO searchVO) throws Exception {
		return exhiHallReportDAO.selectAgainStoreRate(searchVO);
	}

	/**
	 * 首次留档率
	 */
	@Override
	public List<ExhiHallReportVO> selectInitialRetentionrate(ExhiHallReportSearchVO searchVO) throws Exception {
		return exhiHallReportDAO.selectInitialRetentionrate(searchVO);
	}

	/**
	 * 成交率
	 */
	@Override
	public List<ExhiHallReportVO> selectEfficiency(ExhiHallReportSearchVO searchVO) throws Exception {
		return exhiHallReportDAO.selectEfficiency(searchVO);
	}

	/**
	 * 接待时长满足率
	 */
	@Override
	public List<ExhiHallReportVO> selectReceptionTimeSatisfyRate(ExhiHallReportSearchVO searchVO) throws Exception {
		return exhiHallReportDAO.selectReceptionTimeSatisfyRate(searchVO);
	}

}
