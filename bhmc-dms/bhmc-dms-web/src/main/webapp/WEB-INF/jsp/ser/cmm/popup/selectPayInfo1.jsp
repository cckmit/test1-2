<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />
<%-- <script src="<c:url value='/resources/js/qrcode/qrcode.min.js' />"></script> --%>

<!-- 聚合支付 -->
<section id="payWindow" class="pop_wrap">
<form id="Payment" name="Payinfo" method="POST">
    <section class="group" style="display:none">
        <div class="header_area">
            <h2 class="title_basic" style="margin-top:-14px;"><spring:message code='sal.title.payinfo' /></h2>
        </div>
        
        <div>
        	 	<div class="table_form">
            		<table>
                		<caption></caption>
                		<colgroup>
                    		<col style="width:25%;">
                    		<col style="width:25%;">
                    		<col style="width:25%;">
                    		<col style="width:25%;">
                		</colgroup>
               			<tbody>
                    		<tr>
                        		<th scope="row"><spring:message code='ser.lbl.rcvDocNo' /></th>  
                        		<td>
                            		<input id="rcvDocNo" class="form_input form_readonly" style="width:150px"/>
                        		</td>
                    		</tr>
                    		<tr>
                        			<th scope="row"><spring:message code='sal.lbl.publNm' /></th> 
                        			<td>
                            			<input id="custNm" name="custNm" class="form_input form_readonly" style="width:150px" readonly data-json-obj="true" />
                        			</td>
                       
                    		</tr>
                    		<tr>
                       				<th scope="row"><spring:message code='sal.lbl.payAmt' /></th>
                        			<td>
                            			<input id="payAmt" name="payAmt" class="form_input form_readonly" style="width:150px" data-json-obj="true" readonly />
                        			</td>
                    		</tr>
                    		<tr>
                        			<th scope="row"><spring:message code='global.lbl.parOrdNo' /></th>   
                        			<td>
                            			<input id="tradeId" name="tradeId" class="form_input form_readonly"  style="width:150px" data-json-obj="true" />
                        			</td>
                    		</tr>
                  
                	</tbody>
            </table>
        </div>
    </div>
  </section>
</form>
</section>

<script type="text/javascript">
var options = parent.payInfoWindow.options.content.data;
var amount = options.payAmt;
var payInfoWindow = parent.$("#payInfoWindow").data("kendoWindow");
$(document).ready(function() {
	 $("#rcvDocNo").val(options.rcvDocNo);
	 $("#custNm").val(options.custNm);
	 $("#payAmt").val(options.payAmt);
	 $("#custNm").val(options.custNm);
	 var plateNumber = options.carRegNo;//车牌号
	//pos 下单并返回流水号+二维码
	 $.ajax({
         url:"<c:url value='/sal/fin/payInfo/posOrder.do' />",
         data:JSON.stringify({"amount":amount, "isQrcode":"1","motormasterName":options.custNm,"triggerPage":"售后-结算收款-服务收款","businessNumber":options.rcvSubDocNo,"plateNumber":plateNumber}),
         type:'POST',
         dataType:'json',
         contentType:'application/json',
         async:false,
         success:function(result) {
        	 if(result.code==000000){
        		 dms.notification.warning("聚合支付服务异常");
        	 }else if(result.code==9120003){
        		 dms.notification.warning("聚合支付异常");
        	 }else if(result.code==9120002){
        		 dms.notification.warning(result.message);
        	 }else if(result.code==9120001){
        		 var tradeId = result.data.tradeId;
        		 $("#tradeId").val(tradeId);
        	     parent.document.getElementById("tradeId").value=tradeId;
        	     parent.document.getElementById("isOpen").value="1";
        	     dms.notification.success("POS下单成功，请客户pos机上完成付款操作。");
        	     //回调popupOptions
        		 var data = JSON.stringify({"windowState":"1"})
        		 options.callbackFunc(data);
        	 }else{
        		 dms.notification.warning("聚合支付pos下单失败");
        	 }
         },
         error:function(jqXHR,status,error) {
                 dms.notification.warning("聚合支付服务异常");
         }
     });
	 sendPost();
	
})
</script>

<script type="text/javascript">
var options = parent.payInfoWindow.options.content.data;
var timer = setInterval("sendPost()",1000);
//一直发送请求查询该订单是否支付，如果支付的话关闭窗口
function sendPost(){
	var tradeId = $("#tradeId").val();
	if(tradeId == ""){return;}
	dms.loading.show();
	//if($("#paymentCompleted").prop("disabled")){
		 $.ajax({
	         url:"<c:url value='/sal/fin/payInfo/queryTradeResult.do' />",
	         data:JSON.stringify({"tradeId":tradeId,"gateReturnType":options.rcvDocNo,"gateReturnMessage":options.roDocNo,"gotoUrl":options.calcDocNo}),//2019/12/13
	         type:'POST',
	         dataType:'json',
	         contentType:'application/json',
	         async:false,
	         success:function(result) {
	        	 if(result.gateReturnType=='S'){
	        		 if(result.tradeStatus==10451004){
	        			 parent.document.getElementById("isFinish").value="1";
	        			//20191113 add判断是否有使用优惠券
	          	 		var isCouponList = result.couponList;
	          	 		if(!isCouponList && typeof(isCouponList)!="undefined"){
	          	 			//null
	          	 			parent.document.getElementById("receivedAmt").value=$("#payAmt").val();//实收金额
	          	 			parent.document.getElementById("discountAmt").value="0";//优惠金额
	          	 		}else{
	          	 			//使用了优惠券
	          	 			parent.document.getElementById("receivedAmt").value=result.payAmount;//实收金额
	          	 			parent.document.getElementById("discountAmt").value=result.orderAmount - result.payAmount;//优惠金额
	          	 		}
	        			 dms.loading.hide();
	        			 //实时查询订单停止
	        			 clearInterval(timer);
	        			 dms.notification.success("支付完成");
	        			 parent.payInfoWindow.close();
	        		 }
	        	 }else {
	        		 dms.notification.warning(result.gateReturnMessage);
	        	 }
	         },
	         error:function(jqXHR,status,error) {
	                 dms.notification.error(error);
	         }
	         
	     });
	//}
}
</script>

