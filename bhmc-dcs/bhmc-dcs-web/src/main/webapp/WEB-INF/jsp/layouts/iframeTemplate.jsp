<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.context.i18n.LocaleContextHolder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<c:set var="springLocale" scope="session" value="<%=LocaleContextHolder.getLocale().getLanguage()%>" />
<!DOCTYPE html>
<html lang="${springLocale}">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no"> -->
<meta name="format-detection" content="telephone=no">
<title><tiles:insertAttribute name="title" /></title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.common.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.rtl.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.default.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.dataviz.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.dataviz.default.min.css"/>">

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">
<dms:isTablet>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mob/kendo.mobile.all.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/tablet.css"/>">
</dms:isTablet>

<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.4.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/kendo/kendo.all.min.js"/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/kendo/cultures/kendo.culture.${springLocale}.min.js' />"></script>
<!--[if lt IE 9]>
    <script src="<c:url value="/resources/js/html5shiv.js"/>"></script>
<![endif]-->


<%-- 자바스크립트 전역변수:컨텍스트 경로 --%>
<script type="text/javascript">var _contextPath = "${pageContext.request.contextPath}";</script>

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.common-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value='/cmm/sci/js/selectCultureSettings.do' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/kendo.ui.ext-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/jquery.ext-1.0.js' />"></script>
<script type="text/javascript">
kendo.culture("${springLocale}");
</script>
</head>

<body>

        <!-- content -->
        <section id="content_iframe">
            <tiles:insertAttribute name="body" />
        </section>

<!--         <div id="ajaxProcessing" class="process" style="display:none;"> -->
<!--             <p>처리중입니다.</p> -->
<%--             <img src="<c:url value='/resources/img/img_process.gif'/>" alt=""> --%>
<!--         </div> -->

        <footer id="footer" style="display:none;" >
            <div id="globalFooterNotification"></div>
            <tiles:insertAttribute name="footer" />
        </footer>

<!--         <div data-iframe-height></div> -->
<%--         <script src="<c:url value='/resources/js/iframeResizer.contentWindow.min.js' />"></script> --%>


<script type="text/javascript">

    //현재페이지의 footer를 상위프레임에 출력한다.
    window.parent.$("#footer_content").html($("#footer").html());

    $("#footer").bind("DOMSubtreeModified",function(){
        window.parent.$("#footer_content").html($("#footer").html());
    });
    $("#footer").bind("DOMCharacterDataModified",function(){
        window.parent.$("#footer_content").html($("#footer").html());
    });

    /**
     * 조회 영역[AREA]에서 엔터키 입력시 이벤트 처리
     * ex)<div class="table_form" role="search" data-btnid="btnSearch"></div>
     */
     $(".table_form[role=search]").keyup(function(e) {    	 
         var btnid = $(this).attr("data-btnid");
         if (e.keyCode == 13 && btnid) {
        	 setTimeout(function(){
        		 $("#"+btnid).click();
        	 });             
         }
     });


</script>
</body>
</html>