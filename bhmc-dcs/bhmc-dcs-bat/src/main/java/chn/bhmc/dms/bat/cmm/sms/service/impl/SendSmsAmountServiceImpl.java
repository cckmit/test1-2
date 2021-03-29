package chn.bhmc.dms.bat.cmm.sms.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.cmm.sms.service.SendSmsAmountService;
import chn.bhmc.dms.bat.cmm.sms.service.dao.SendSmsAmountDAO;
import chn.bhmc.dms.bat.cmm.sms.vo.SendSmsAmountVO;
import chn.bhmc.dms.bat.cmm.sms.vo.SmsAmountResultVO;
import chn.bhmc.dms.core.context.WebContext;
/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SendSmsMessageServiceImpl
 * @Description : DCS - SMS Relay 서버간 I/F 전송을 위한  ServiceImpl
 * @author Choi KyungYong
 * @since 2016. 9. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since            author              description
 *  ===========    ===============    ===========================
 *  2016. 9. 1.     Choi KyungYong            ���� ��
 * </pre>
 */
@Service("sendSmsAmountService")
public class SendSmsAmountServiceImpl extends HService implements SendSmsAmountService {

    /**
     * DCS - SMS Relay 서버간 I/F 전송을 위한 DAO
     */
    @Resource(name="sendSmsAmountDAO")
    SendSmsAmountDAO sendSmsAmountDAO;

    /*
     * @see chn.bhmc.dms.bat.cmm.sms.service.SendSmsAmountServiceImpl#setDlrSmsAmount
     */
    @SuppressWarnings("unchecked")
    public List<JSONObject> getDlrSmsAmount() throws Exception {

        List<JSONObject> rtnlist = new ArrayList<JSONObject>();
        List<SendSmsAmountVO> list = new ArrayList<SendSmsAmountVO>();
        try{
            //sms 전송 데이터 selsect
            list = sendSmsAmountDAO.selectDlrAllList();

            JSONObject jsonData = new JSONObject();
            for(int i = 0; i < list.size(); i++){
                jsonData = new JSONObject();
                jsonData.put("dealerid", list.get(i).getDlrCd());
                rtnlist.add(jsonData);
            }

        }catch (Exception e) {
            log.error(e.getMessage(), e);
            throw e;
        }

        return rtnlist;
    }

    /*
     * @see chn.bhmc.dms.bat.cmm.sms.service.SendSmsAmountServiceImpl#requestSMSAmount
     */
    public void requestSMSAmount(List<JSONObject> pList) throws Exception{
        String sendData = "";

        String url = WebContext.getServletContext().getInitParameter("SMS_RELAY_SERVER_AMOUNT_URL");
        HttpPost request =  new HttpPost(url);
        CloseableHttpClient httpClient = HttpClientBuilder.create().build();
        SmsAmountResultVO smsAmountResultVO = new SmsAmountResultVO();
        try{

            for(int i = 0; i < pList.size(); i++){
                sendData = pList.get(i).toJSONString();
                StringEntity requestEntity = new StringEntity(sendData, "UTF-8");
                request.addHeader("content-type", "application/x-www-form-urlencoded");
                request.setEntity(requestEntity);

                HttpResponse response = httpClient.execute(request);
                HttpEntity responseEntity = response.getEntity();
                String responseText = EntityUtils.toString(responseEntity, "UTF-8");

                Object obj = JSONValue.parseWithException(responseText);
                JSONObject jsonRecvData = (JSONObject)obj;
                JSONObject jsonBalanceData = (JSONObject) jsonRecvData.get("smsBalance");
                smsAmountResultVO.setSmsRemainAmount(Double.parseDouble(jsonBalanceData.get("amount").toString()));
                smsAmountResultVO.setSmsRemainCnt(Integer.parseInt(jsonBalanceData.get("number").toString()));
                smsAmountResultVO.setDlrCd(jsonBalanceData.get("dealerid").toString());

                //딜러별 예치금 잔액 저장
                sendSmsAmountDAO.updateSmsDlrAmount(smsAmountResultVO);
                sendSmsAmountDAO.updateSmsDlrAmountIF(smsAmountResultVO);
            }

        }catch (Exception e) {
            log.error(e.getMessage(), e);
            throw e;
        }finally{
            httpClient.close();
        }
    }

}
