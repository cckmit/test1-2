package chn.bhmc.dms.par.cpm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.jxls.util.JxlsHelper;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoDetailService;
import chn.bhmc.dms.par.cpm.service.dao.AdvanceReceivedInfoDetailDAO;
import chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoDetailVO;
import chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoSearchVO;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.jxls.common.Context;
import org.jxls.expression.JexlExpressionEvaluator;
import org.jxls.transform.Transformer;
import org.jxls.util.JxlsHelper;

/**
 * 선수금 상세 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 5. 23.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 23.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("advanceReceivedInfoDetailService")
public class AdvanceReceivedInfoDetailServiceImpl extends HService implements AdvanceReceivedInfoDetailService {

    @Resource(name="advanceReceivedInfoDetailDAO")
    private AdvanceReceivedInfoDetailDAO advanceReceivedInfoDetailDAO;

    /*
     * @see chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoDetailService#selectAdvanceReceivedInfoDetailByKey(java.lang.String)
     */
    @Override
    public AdvanceReceivedInfoDetailVO selectAdvanceReceivedInfoDetailByKey(String dlrCd) throws Exception {
        return advanceReceivedInfoDetailDAO.selectAdvanceReceivedInfoDetailByKey(dlrCd);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoDetailService#selectAdvanceReceivedInfoDetailsByCondition(chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoSearchVO)
     */
    @Override
    public List<AdvanceReceivedInfoDetailVO> selectAdvanceReceivedInfoDetailsByCondition(
            AdvanceReceivedInfoSearchVO searchVO) throws Exception {
        return advanceReceivedInfoDetailDAO.selectAdvanceReceivedInfoDetailsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoDetailService#selectAdvanceReceivedInfoDetailsByConditionCnt(chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoSearchVO)
     */
    @Override
    public int selectAdvanceReceivedInfoDetailsByConditionCnt(AdvanceReceivedInfoSearchVO searchVO) throws Exception {
        return advanceReceivedInfoDetailDAO.selectAdvanceReceivedInfoDetailsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoDetailService#insertAdvanceReceivedInfoDetail(chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoDetailVO)
     */
    @Override
    public int insertAdvanceReceivedInfoDetail(AdvanceReceivedInfoDetailVO advanceReceivedInfoDetailVO)
            throws Exception {
        return advanceReceivedInfoDetailDAO.insertAdvanceReceivedInfoDetail(advanceReceivedInfoDetailVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoDetailService#updateAdvanceReceivedInfoDetail(chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoDetailVO)
     */
    @Override
    public int updateAdvanceReceivedInfoDetail(AdvanceReceivedInfoDetailVO advanceReceivedInfoDetailVO)
            throws Exception {
        return advanceReceivedInfoDetailDAO.updateAdvanceReceivedInfoDetail(advanceReceivedInfoDetailVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoDetailService#deleteAdvanceReceivedInfoDetail(chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoDetailVO)
     */
    @Override
    public int deleteAdvanceReceivedInfoDetail(AdvanceReceivedInfoDetailVO advanceReceivedInfoDetailVO)
            throws Exception {
        return advanceReceivedInfoDetailDAO.deleteAdvanceReceivedInfoDetail(advanceReceivedInfoDetailVO);
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
    /*@Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

    	AdvanceReceivedInfoSearchVO searchVO = new AdvanceReceivedInfoSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        
        List<AdvanceReceivedInfoDetailVO> list = selectAdvanceReceivedInfoDetailsByCondition(searchVO);
        
        Map<String , Object> model=new HashMap<String , Object>();
        
        
        model.put("dpstAmt", 10.10);//保证金
        model.put("calcAmt", 10.11);//工程中
        model.put("balAmt" , 10.12);//实际金额
        model.put("lmtAmt" , 10.13);//提示金额
        
        model.put("data", list);//信息数据
        //context.putVar("items", list);
        
        context.putVar("items", model);

    }*/
    
    
    

    
    

}
