<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%--
    JSP Name : selectSalesSummaryAnalyzeRpt.jsp
    Description : 판매집계분석표 보고서
    author chibeom.song
    since 2017. 1. 23.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2017. 1. 23.   chibeom.song     최초 생성
--%>

<!-- [DMS] 판매집계분석표 보고서 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.rpt.salessummaryanalyzerpt" /></h1>
        <div class="btn_right">
            <dms:access viewId="VIEW-D-11223" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m" id="btnSearch" name="btnSearch"><spring:message code="global.btn.search" /></button>
            </dms:access>
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.title.searchCondition" /></th>
                    <td>
                        <input type="text" id="sSrartYyMm" name="sSrartYyMm" value="" class="form_comboBox" style="width:150px;">
                    </td>
                    <th scope="row"></th>
                    <td></td>
                    <th scope="row"></th>
                    <td></td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <br>
    <div class="table_info table_info_v1">
        <iframe id="iframeSalesSummaryAnalyzeRpt" name="iframeSalesSummaryAnalyzeRpt" src="" frameborder="0" scrolling="auto" width="100%" height="650" class='report'></iframe>
    </div>
</section>


<!-- script -->
<script type="text/javascript">

function mainCall(){

    var dlrCd  = "${dlrCd}";
    var sSrartYyMm = $("#sSrartYyMm").val();
    var salessummaryanalyzerptUrl = "<c:url value='/ReportServer?reportlet=/sale/selectSalesSummaryAnalyzeRpt.cpt' />";
    var param = "";

    param += "&sDlrCd="+dlrCd;
    param += "&sStartDt="+$("#sStartDt").val();

    $("#iframeSalesSummaryAnalyzeRpt").attr("src", salessummaryanalyzerptUrl + param);
}

$(document).ready(function() {

    $("#sSrartYyMm").kendoDatePicker({
         value:"${sysdate}"
        ,start:"year"
        ,depth:"year"
        ,format:"yyyyMM"
    });

    $("#sSrartYyMm").kendoMaskedTextBox({
        mask:"######"
    });

    var now = new Date();

    function leadingZeros(n, digits) {
        var zero = '';
        n = n.toString();
        if (n.length < digits) {
            for (i = 0; i < digits - n.length; i++)
                zero += '0';
        }
        return zero + n;
    }

    $("#sSrartYyMm").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2));


    $("#btnSearch").kendoButton({
        click:function(e) {
            mainCall();
           }
    });

    mainCall();

});
</script>
<!-- //[DMS] 판매집계분석표 보고서 -->