package chn.bhmc.dms.ws;

import javax.annotation.Resource;
import javax.jws.WebService;

import org.apache.velocity.VelocityContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.service.impl.NotificationMessageContext;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.util.DateUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DmsWebServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 1. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 23.     Kang Seok Han     최초 생성
 * </pre>
 */

@WebService(
    endpointInterface = "chn.bhmc.dms.ws.DmsWebService"
    ,serviceName="DmsWebService"
    ,portName="DmsWebServicePort")
public class DmsWebServiceImpl implements DmsWebService {

    private final static Logger logger = LoggerFactory.getLogger(DmsWebService.class);

    @Resource(name="notificationMessageService")
    NotificationMessageService notificationMessageService;

    @Override
    public VehicleEnterNotificationResponse vehicleEnterNotification(VehicleEnterNotificationRequest vehicleEnterNotificationRequest) throws Exception {

        VehicleEnterNotificationResponse vehicleEnterNotificationResponse = new VehicleEnterNotificationResponse();
        String vehicleNo = vehicleEnterNotificationRequest.getVehicleNo();
        String dlrCd = vehicleEnterNotificationRequest.getDlrCd();

        logger.debug("vehicleNo : {} ", vehicleNo);
        logger.debug("dlrCd : {} ", dlrCd);

        //차량진입 알림서비스 호출
        NotificationMessageContext context = new NotificationMessageContext();
        VelocityContext velocityContext = context.getVelocityContext();
        velocityContext.put("currentDate", DateUtil.getDate("MM-dd HH:mm"));
        velocityContext.put("vehicleNumber", vehicleNo);

        notificationMessageService.sendNotificationMessage(Constants.SYS_CD_DLR, "SER-0004", dlrCd, context);

        vehicleEnterNotificationResponse.setResult("S");
        vehicleEnterNotificationResponse.setMessage("");

        return vehicleEnterNotificationResponse;
    }

    /**
     * {@inheritDoc}
     */
/*    @Override
    public SerBasicDataWsDoc serBasicDataRequest(SerBasicDataWsDoc serBasicDataWsDoc) {
        SerBasicDataService serBasicDataService = null;
        SerObjectFactory objectFactory = new SerObjectFactory();

        SerBasicDataWsHeader serBasicDataWsHeader = serBasicDataWsDoc.getHeader();
        SerBasicDataWsFooter serBasicDataWsFooter = new SerBasicDataWsFooter();
        SerBasicDataWsParams serBasicDataWsParams = null;

        if(serBasicDataWsHeader.getParams() == null){
            serBasicDataWsHeader.setParams(objectFactory.createSerBasicDataWsHeaderParams(new SerBasicDataWsParams()));
        }
        serBasicDataWsParams = serBasicDataWsHeader.getParams().getValue();

        serBasicDataWsDoc.setBody(objectFactory.createSerBasicDataWsDocBody("[]"));
        serBasicDataWsDoc.setFooter(objectFactory.createSerBasicDataWsDocFooter(serBasicDataWsFooter));

        //판매 기초데이터 서비스 인터페이스를 구현한 서비스를 조회한다.
        //chn.bhmc.dms.ws.sal.bdw.service.SerBasicDataService
        Map<String, SerBasicDataService> beansMap = applicationContext.getBeansOfType(SerBasicDataService.class);

        //판매 기초데이터 서비스 인터페이스를 구현한 서비스가 없다면 요청결과에 에러정보를 포함하여 리턴한다.
        if(beansMap.size() == 0){
            serBasicDataWsFooter.setResult(SerBasicDataService.NOT_SUPPORTED);
            serBasicDataWsFooter.setMessage("NOT_SUPPORTED");
            return serBasicDataWsDoc;
        }

        for(SerBasicDataService service : beansMap.values()){
            if(service.isSupport(serBasicDataWsHeader.getId())){
                serBasicDataService = service;
                break;
            }
        }

        //id에 해당하는 구현 서비스가 없다면 요청결과에 에러정보를 포함하여 리턴한다.
        if(serBasicDataService == null){
            serBasicDataWsFooter.setResult(SerBasicDataService.NOT_SUPPORTED);
            serBasicDataWsFooter.setMessage("NOT_SUPPORTED");
            return serBasicDataWsDoc;
        }

        List<SerBasicDataWsParam> paramList = serBasicDataWsParams.getParam();
        Map<String, Object> params = new HashMap<String, Object>();
        for(SerBasicDataWsParam param : paramList){
            params.put(param.getName(), param.getValue());
        }

        try{
            List<?> list = serBasicDataService.selectList(params);
            if(list.size() != 0){
                serBasicDataWsDoc.getBody().setValue(JSONArray.toJSONString(list));
            }
        }catch(Exception e){
            e.printStackTrace();
        }

        serBasicDataWsFooter.setResult(SerBasicDataService.SUCCESS);
        serBasicDataWsFooter.setMessage("SUCCESS");

        return serBasicDataWsDoc;
    }*/

    /**
     * {@inheritDoc}
     */
/*    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
    }*/

}
