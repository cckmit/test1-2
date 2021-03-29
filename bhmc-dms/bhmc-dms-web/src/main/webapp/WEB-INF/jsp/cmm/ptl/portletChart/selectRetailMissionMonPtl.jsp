<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<iframe id="iframeRetailMissionMonPtl" name="iframeRetailMissionMonPtl" src="" frameborder="0" scrolling="no" width="100%" height="600" class='report'></iframe>
<script type="text/javascript">
function retailMissionMonInit(){
    var url = "<c:url value='/ReportServer?reportlet=/com/ptl/selectRetailMissionMonPtl.cpt' />";
    var param = "";

    param += "&op=view";
    param += "&sDlrCd=" + "${dlrCd}";
    param += "&sSrartYyMm=" + "${toDay}".substring(0,4) + "${toDay}".substring(5,7);
    $("#iframeRetailMissionMonPtl").attr("src", url + param);
}

function fCallRetailMissionMon(){
    var tCd = "11103";
    var params = {};
    params["tCd"] = tCd;
    $.ajax({
        url:"<c:url value='/cmm/ath/viewInfo/selectViewInfoByTcd.do' />"
        ,data:JSON.stringify(params)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR,status,error){
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
    }).done(function(viewData) {
        if(viewData != null && !dms.string.isEmpty(viewData.viewUrl)){
            parent.parent._addTabMenu(viewData.viewNm, _contextPath + viewData.viewUrl, viewData.tCd, viewData.viewId);
        }
    });
}

$(document).ready(function() {
    retailMissionMonInit();
});
</script>