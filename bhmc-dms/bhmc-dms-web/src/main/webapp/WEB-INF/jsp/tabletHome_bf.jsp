<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>
<style type="text/css">
.bigMenuBtn{float: left; text-align: center; vertical-align: middle; display: table-cell; outline: 5px #ffffff solid;}
p{ padding-top:80px; font-size: large; font-weight: bolder; color:white;}
.bigMenuBtn > img{width: 100px; margin-top: 80px;}
</style>
<div style="padding-top: 5px; padding-bottom: 5px; padding-left: 5px; background-color: #ffffff;">
<%-- <img src="<c:url value='/resources/img/wa/FlatColor.png' />" alt=""> --%>
<div class="bigMenuBtn" style="width: 30%; background-color: #2478FF;"><img src="<c:url value='/resources/img/wa/bigBtn_reserCreate.png'/>"><p><spring:message code='ser.menu.reserCreate' /></p><input type="hidden" id="viewUrl" value="<c:url value='/ser/rev/reservationReceipt/selectReservationReceiptMain.do'/>"><input id="viewId" type="hidden" value="VIEW-D-10332"></div>
<div class="bigMenuBtn" style="width: 30%; background-color: #00B4DB;"><img src="<c:url value='/resources/img/wa/bigBtn_partResvCreate.png'/>"><p><spring:message code='ser.menu.partResvCreate' /></p><input type="hidden" id="viewUrl" value="<c:url value='/ser/rev/partReservation/selectPartReservationMain.do'/>"><input id="viewId" type="hidden" value="VIEW-D-10498"></div>
<div class="bigMenuBtn" style="width: 39.5%; background-color: #7f8c8d;"><img src="<c:url value='/resources/img/wa/bigBtn_preCheck.png'/>"><p><spring:message code='ser.menu.preCheckCreate' /></p><input type="hidden" id="viewUrl" value="<c:url value='/ser/ro/preCheck/selectPreCheckMain.do'/>"><input id="viewId" type="hidden" value="VIEW-D-10333"></div>
<div class="bigMenuBtn" style="width: 20%; background-color: #00B4DB;"><img src="<c:url value='/resources/img/wa/bigBtn_roCreate.png'/>"><p><spring:message code='ser.menu.roCreate' /></p><input type="hidden" id="viewUrl" value="<c:url value='/ser/ro/repairOrder/selectRepairOrderMain.do'/>"><input id="viewId" type="hidden" value="VIEW-D-10337"></div>
<div class="bigMenuBtn" style="width: 20%; background-color: #7f8c8d;"><img src="<c:url value='/resources/img/wa/bigBtn_estCreate.png'/>"><p><spring:message code='ser.menu.estCreate' /></p><input type="hidden" id="viewUrl" value="<c:url value='/ser/est/estimate/selectEstimateManageMain.do'/>"><input id="viewId" type="hidden" value="VIEW-D-10335"></div>
<div class="bigMenuBtn" style="width: 39.5%; background-color: #2478FF;"><img src="<c:url value='/resources/img/wa/bigBtn_calc.png'/>"><p><spring:message code='ser.menu.calcMng' /></p><input type="hidden" id="viewUrl" value="<c:url value='/ser/cal/calculate/selectCalculateMain.do'/>"><input id="viewId" type="hidden" value="VIEW-D-10347"></div>
<div class="bigMenuBtn" style="width: 20%; background-color: #00B4DB;"><img src="<c:url value='/resources/img/wa/bigBtn_carCheck.png'/>"><p><spring:message code='ser.menu.carCheck' /></p><input type="hidden" id="viewUrl" value="<c:url value='/ser/ro/carCheck/selectCarCheckMain.do'/>"><input id="viewId" type="hidden" value="VIEW-D-12957"></div>
</div>
<script type="text/javascript">
$(document).ready(function() {
    $("body").css("background-color","#ffffff");
    var windowHeight = $(window).innerHeight();
    console.log("windowHeight : "+windowHeight);
    $(".bigMenuBtn").height(windowHeight/2-5);
    $(".bigMenuBtn").click(function (){
        parent._createOrReloadTabMenu($(this).find("p").text(), $(this).find("p").siblings("#viewUrl").val(), $(this).find("p").siblings("#viewId").val());
    });
});
</script>