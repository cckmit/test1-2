<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.springframework.context.i18n.LocaleContextHolder"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="springLocaleLanguageLanguage" scope="session" value="<%=LocaleContextHolder.getLocale().getLanguage()%>" />
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title>BHMC-DMS</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.common.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.default.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.4.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/kendo/kendo.all.min.js"/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/kendo/cultures/kendo.cuspringLocaleLanguagengLocaleLanguage}.min.js' />"></script>
<!--[if lt IE 9]>
    <script src="<c:url value="/resources/js/html5shiv.js"/>"></script>
<![endif]-->


<%-- 자바스크립트 전역변수:컨텍스트 경로 --%>
<script type="text/javascript">var _contextPath = "${pageContext.request.contextPath}";</script>

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.common-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value='/cmm/sci/js/selectCultureSettings.do' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/kendo.ui.ext-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/jquery.ext-1.0.js' />"></script>

<style type="text/css">
.tbl_list { width:100%;}
.tbl_list th { padding:7px 1px 4px; border:1px solid #ccc; background:#e0e6eb; color:#303030; font-weight:normal; line-height:1.2;}
.tbl_list td { padding:7px 9px 4px; border:1px solid #e5e5e5;}
.tbl_list td a { color:#303030;}
.tbl_list td a.hasLink { color:#1580db; text-decoration:underline;}
.tbl_list tr.trbg { background:#f8f8f8;}
.tbl_list tr.red td, .tbl_list tr.red td a { color:#ed1c24!important;}
.tbl_list tbody tr:nth-child(2n) { background-color:#fafafa;}
h1 { padding:10px 0 5px; font-size:16px;}
</style>
<script type="text/javascript">
    $(document).ready(function(){
       $("[href!='#']").addClass("hasLink");
    });
</script>
</head>
<body>
    <div id="go_top" style="padding:10px;">
        <h1>배치리스트</h1>
        <table class="tbl_list">
            <caption></caption>
            <colgroup>
                <col style="width:15%;">
                <col style="width:15%;">
                <col style="width:70%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">1depth</th>
                    <th scope="col">2depth</th>
                    <th scope="col">3depth - 배치링크</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td></td>
                    <td>예류배치 테스트</td>
                    <td><a href="javascript:sendCnclResv()">예류취소</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>구매상태 테스트</td>
                    <td><a href="javascript:sendBmpPurcStatus()">BMP구매상태진행</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>송장 테스트</td>
                    <td><a href="javascript:sendInvoice()">송장</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>부품 기준창고 적용 테스트</td>
                    <td><a href="javascript:setItemStdStrge()">기준창고</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>송장DMS-DCS 적용 테스트</td>
                    <td><a href="javascript:setInvcToDcs()">송장DCS전송</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>VALIDATION체크 DMS-DCS 적용 테스트</td>
                    <td><a href="javascript:setValidationLogToDcs()">LOG정보 DCS전송</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>재고전송 DMS-DCS 적용 테스트</td>
                    <td><a href="javascript:setStockInfoToDcs()">재고정보 DCS전송</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>재고분석전송 DMS-DCS 적용 테스트</td>
                    <td><a href="javascript:setStockAnalysisInfoToDcs()">재고분석정보 DCS전송</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>부품판매전송 DMS-DCS 적용 테스트</td>
                    <td><a href="javascript:setPartsSaleInfoToDcs()">부품판매정보 DCS전송</a></td>
                </tr>
            </tbody>
        </table>
        <!-- <a href="#go_top" style="position:fixed; right:30px; bottom:20px; padding:8px 9px 6px; border:3px solid #941a2e; background:#f4f4f4; color:#333; font-weight:bold;">Top</a> -->
    </div>
    <script type="text/javascript">
        function sendCnclResv(){
            $.ajax({
                    url:"<c:url value='/bat/par/issueReserve/multiBatchPartsIssueReadyActionCancel.do'/>",
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        console.log("error:"+kendo.stringify(jqXHR.responseJSON.errors));
                    },
                    success:function(jqXHR, textStatus) {

                        //정상적으로 반영 되었습니다.
                        console.log("error:"+"<spring:message code='global.info.success'/>");
                    }
                });
        }

        function sendBmpPurcStatus(){
            $.ajax({
                    url:"<c:url value='/bat/par/cmm/executeParPurchaseOrderInfcProcedure.do'/>",
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        console.log("error:"+kendo.stringify(jqXHR.responseJSON.errors));
                    },
                    success:function(jqXHR, textStatus) {

                        //정상적으로 반영 되었습니다.
                        console.log("error:"+"<spring:message code='global.info.success'/>");
                    }
                });
        }

        function sendInvoice(){
            $.ajax({
                    url:"<c:url value='/bat/par/cmm/executeParInvoiceInfcProcedure.do'/>",
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        console.log("error:"+kendo.stringify(jqXHR.responseJSON.errors));
                    },
                    success:function(jqXHR, textStatus) {

                        //정상적으로 반영 되었습니다.
                        console.log("error:"+"<spring:message code='global.info.success'/>");
                    }
                });
        }

        function setItemStdStrge(){
            $.ajax({
                    url:"<c:url value='/bat/par/cmm/executeParItemStdStrgeProcedure.do'/>",
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        console.log("error:"+kendo.stringify(jqXHR.responseJSON.errors));
                    },
                    success:function(jqXHR, textStatus) {

                        //정상적으로 반영 되었습니다.
                        console.log("error:"+"<spring:message code='global.info.success'/>");
                    }
                });
        }

        function setInvcToDcs(){
            $.ajax({
                    url:"<c:url value='/bat/par/pcm/insertInvoiceInfo.do'/>",
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        console.log("error:"+kendo.stringify(jqXHR.responseJSON.errors));
                    },
                    success:function(jqXHR, textStatus) {

                        //정상적으로 반영 되었습니다.
                        console.log("error:"+"<spring:message code='global.info.success'/>");
                    }
                });
        }

        function setValidationLogToDcs(){
            $.ajax({
                    url:"<c:url value='/bat/par/cmm/executeParValidationCheckProcedure.do'/>",
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        console.log("error:"+kendo.stringify(jqXHR.responseJSON.errors));
                    },
                    success:function(jqXHR, textStatus) {

                        //정상적으로 반영 되었습니다.
                        console.log("error:"+"<spring:message code='global.info.success'/>");
                    }
                });
        }

        function setStockInfoToDcs(){
            $.ajax({
                    url:"<c:url value='/bat/par/cmm/executeStockInfcProcedure.do'/>",
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        console.log("error:"+kendo.stringify(jqXHR.responseJSON.errors));
                    },
                    success:function(jqXHR, textStatus) {

                        //정상적으로 반영 되었습니다.
                        console.log("error:"+"<spring:message code='global.info.success'/>");
                    }
                });
        }

        function setStockAnalysisInfoToDcs(){
            console.log('setStockAnalysisInfoToDcs: 실행');
            $.ajax({
                    url:"<c:url value='/bat/par/cmm/executeStockAnalysisInfcProcedure.do'/>",
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        console.log("error:"+kendo.stringify(jqXHR.responseJSON.errors));
                    },
                    success:function(jqXHR, textStatus) {

                        //정상적으로 반영 되었습니다.
                        console.log("error:"+"<spring:message code='global.info.success'/>");
                    }
                });
        }

        function setPartsSaleInfoToDcs(){
            $.ajax({
                    url:"<c:url value='/bat/par/cmm/executePartsSaleInfcProcedure.do'/>",
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        console.log("error:"+kendo.stringify(jqXHR.responseJSON.errors));
                    },
                    success:function(jqXHR, textStatus) {

                        //정상적으로 반영 되었습니다.
                        console.log("error:"+"<spring:message code='global.info.success'/>");
                    }
                });
        }
    </script>
</body>
</html>