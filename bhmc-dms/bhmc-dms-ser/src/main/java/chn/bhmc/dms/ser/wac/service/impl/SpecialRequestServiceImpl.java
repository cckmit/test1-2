package chn.bhmc.dms.ser.wac.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.ser.wac.service.SpecialRequestService;
import chn.bhmc.dms.ser.wac.service.dao.SpecialRequestDao;
import chn.bhmc.dms.ser.wac.vo.PwaSearchVO;
import chn.bhmc.dms.ser.wac.vo.PwaVO;
import chn.bhmc.dms.ser.wac.vo.SpecialRequestSearchVo;
import chn.bhmc.dms.ser.wac.vo.SpecialRequestVo;
/**  
 * @ClassName: SpecialRequestController
 * <p>Title:DMS特殊申请（保修工单确认申请） </p >
 * @Description: serviceImpl
 * @author wangc
 * @date 2021-03-29 02:55:01
*/ 
@Service("specialRequestService")
public class SpecialRequestServiceImpl extends HService implements SpecialRequestService , JxlsSupport{
	
	@Resource(name="specialRequestDao")
	SpecialRequestDao specialRequestDao;//DMS特殊申请
	
	/**
	 * 
	 * @MethodName: selectRates
	 * <p>Title: 返回工单列表结果信息</p >
	 * @Description: TODO
	 * @author wangc
	 * @param searchVO
	 * @return List<SpecialRequestVo>
	 * @date 2021-03-29 05:56:40 
	 * @param searchVO
	 * @return List<SpecialRequestSearchVo>
	 */
	@Override
	public List<SpecialRequestSearchVo> selectSpecialRequests(SpecialRequestSearchVo searchVO) {
		
		List<SpecialRequestSearchVo> listSpecialRequestSearchVo = new ArrayList<SpecialRequestSearchVo>();
		
		listSpecialRequestSearchVo = specialRequestDao.selectSpecialRequests(searchVO);
		
		return listSpecialRequestSearchVo;
	}
	/**
	 * 
	 * @MethodName: selectSpecialRequestForSpecialBySpecialCnt
	 * <p>Title: 申请工单列表数量</p >
	 * @Description: TODO
	 * @author wangc
	 * @param searchVO
	 * @return int
	 * @date 2021-03-30 03:50:20 
	 */
	@Override
	public int selectSpecialRequestForSpecialBySpecialCnt(SpecialRequestSearchVo searchVO) {
         
		searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());//设置语言
        
		return specialRequestDao.selectSpecialRequestForSpecialBySpecialCnt(searchVO);
	}
	/**
	 * 
	 * @MethodName: selectSpecialRequestForSpecialBySpecial
	 * <p>Title: 申请工单列表详细信息</p >
	 * @Description: TODO
	 * @author wangc
	 * @param searchVO
	 * @return List<SpecialRequestVo>
	 * @date 2021-03-30 03:50:59 
	 */
	@Override
	public List<SpecialRequestVo> selectSpecialRequestForSpecialBySpecial(SpecialRequestSearchVo searchVO) {

	     searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());//设置语言

	     return specialRequestDao.selectSpecialRequestForSpecialBySpecial(searchVO);
	}
	
	/**
	 * 
	 * @MethodName: addSpecialRequest
	 * <p>Title: 特殊申请的保存和申请</p >
	 * @Description:流程 
	 * 1、基础信息赋值
	 * 2、判断是保存还是提报
	 * 3、判断该工单是否存在申请单（提报）
	 * 4、更新保存操作/保存更新成提报或者新增一个提报
	 * @author wangc
	 * @param SpecialRequestVo
	 * @return String
	 * @date 2021-03-31 08:08:40 
	 */
	@Override
	public String addSpecialRequest(SpecialRequestVo addVO) {
		String result = "";//返回结果值
		int getNum = 0;//判断该工单是否存在申请单
		Date nowDate = new Date();//当前时间
		
		//1、基础信息查询及赋值 
		addVO.setRoUpdtDt(addVO.getRoDt());//工单修改时间
		addVO.setDlrCd(LoginUtil.getDlrCd());//店代码
		SpecialRequestVo workOrderVo = specialRequestDao.selectWorkOrder(addVO.getRoDocNo());//根据维修委托单号查询工单信息
		addVO.setCarRegNo(workOrderVo.getCarRegNo());//车牌号
		addVO.setVinNo(workOrderVo.getVinNo());//车辆识别码
		addVO.setRoDt(workOrderVo.getRoDt());//开单时间  
		addVO.setCarOwnerId(workOrderVo.getCarOwnerId());//车辆所有者ID
		addVO.setCarOwnerNm(workOrderVo.getCarOwnerNm());//车辆所有者名字
		addVO.setDriverId(workOrderVo.getDriverId());// 送修人id
		addVO.setDriverNm(workOrderVo.getDriverNm());//送修人姓名
		addVO.setDriverHpNo(workOrderVo.getDriverHpNo());//送修人手机号
		addVO.setFileDocNo(addVO.getFileDocNo());//上传文件ID
		addVO.setUpdtUserId(LoginUtil.getUserId());//修改人id
		addVO.setUpdtDt(nowDate);//修改时间
		//2、判断是保存还是提报
		if("00".equals(addVO.getReqStatCd())){
			addVO.setRegDt(nowDate);//录入日期 
			addVO.setRegUsrId(LoginUtil.getUserId());//录入人id
			//3、判断该工单是否存在申请单（提报）
			getNum = specialRequestDao.getReqCountSpecial(addVO.getRoDocNo());
			if(getNum>0){
				result = "已经有提报了，不可以再保存！";
			}else{
				//4、更新保存操作
				specialRequestDao.mergeSaveSpecial(addVO);
			}
		}else if("01".equals(addVO.getReqStatCd())){
			addVO.setRegDt(nowDate);//录入日期 
			addVO.setRegUsrId(LoginUtil.getUserId());//录入人id
			addVO.setReqDt(nowDate);//申请日期 
			addVO.setReqUsrId(LoginUtil.getUserId());//申请人id
			addVO.setReqUsrNm(LoginUtil.getUserNm());//申请人姓名
			addVO.setReqTskNm(LoginUtil.getTskCd());// 申请人岗位
			addVO.setReqHpNo(LoginUtil.getPrefixCustNo());//申请人手机
			//3、判断该工单是否存在申请单（提报）
			getNum = specialRequestDao.getReqCountSpecial(addVO.getRoDocNo());
			if(getNum>0){
				result = "不能重复提报";
			}else{
				//4、保存更新成提报或者新增一个提报
				specialRequestDao.mergeReqSpecial(addVO);
			}
		}
		//5、根据维修委托单号、店代码、车辆识别码查询唯一申请信息 
		SpecialRequestVo resultSpecialRequestVo = specialRequestDao.selectSpecialRequest(addVO);
		return result;
	}

	
	/**
	 * 
	 * @MethodName: initJxlsContext
	 * <p>Title: Excel的导出方法</p >
	 * @Description: TODO
	 * @author wangc
	 * @param context
	 * @param params
	 * @throws Exception void
	 * @date 2021-04-06 05:38:41 
	 */
    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

    	SpecialRequestSearchVo searchVO = new SpecialRequestSearchVo();
    	 
    	
        if(!StringUtils.isBlank(params.get("sFromRoDt").toString())&&!"null".equals(params.get("sFromRoDt").toString())){
            String sFromRoDt = params.get("sFromRoDt").toString();
            Date dFromRoDt = DateUtil.convertToDate(sFromRoDt);
            searchVO.setsFromRoDt(dFromRoDt);//开单开始日期
        }
        if(!StringUtils.isBlank(params.get("sToRoDt").toString())&&!"null".equals(params.get("sToRoDt").toString())){
            String sToRoDt = params.get("sToRoDt").toString();
            Date dToRoDt = DateUtil.convertToDate(sToRoDt);
            searchVO.setsToRoDt(dToRoDt);//结束日期
        }
        if(!StringUtils.isBlank(params.get("sFromReqDt").toString())&&!"null".equals(params.get("sFromReqDt").toString())){
            String sFromReqDt = params.get("sFromReqDt").toString();
            Date dFromReqDt = DateUtil.convertToDate(sFromReqDt);
            searchVO.setsFromReqDt(dFromReqDt);;//申请开始日期
        }
        if(!StringUtils.isBlank(params.get("sToReqDt").toString())&&!"null".equals(params.get("sToReqDt").toString())){
            String sToReqDt = params.get("sToReqDt").toString();
            Date dToReqDt = DateUtil.convertToDate(sToReqDt);
            searchVO.setsToReqDt(dToReqDt);;//申请结束日期
        }

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        List<SpecialRequestVo> list = selectSpecialRequestForSpecialBySpecial(searchVO);

        context.putVar("items", list);

    }

}
