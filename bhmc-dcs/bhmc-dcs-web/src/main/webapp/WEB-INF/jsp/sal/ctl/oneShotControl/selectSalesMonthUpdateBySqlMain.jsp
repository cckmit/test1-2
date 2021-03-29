<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
<section class="group">
    <div id="tabstrip" class="tab_area tab_iframe">
        <ul>
            <li id="1st_tab" class="k-state-active">DCS执行SQL</li>
            <li id="2nd_tab">DMS执行SQL</li>
            <!-- <li id="3nd_tab">DCS车辆差异比对</li>
            <li id="4nd_tab">DCS车辆差异处理</li> -->
        </ul>
        <div class="mt0">
            <iframe id="iframeStatus01" src="" frameborder="0" scrolling="auto" width="100%" height="526"></iframe>
        </div>
        <div class="mt0">
            <iframe id="iframeStatus02" src="" frameborder="0" scrolling="auto" width="100%" height="526"></iframe>
        </div>
        <!-- <div class="mt0">
            <iframe id="iframeStatus03" src="" frameborder="0" scrolling="auto" width="100%" height="526"></iframe>
        </div>
        <div class="mt0">
            <iframe id="iframeStatus04" src="" frameborder="0" scrolling="auto" width="100%" height="526"></iframe>
        </div> -->

    </div>
</section>
</div>

<script type="text/javascript">

var selectTabId = "1st_tab";

selectTab = function(tabId){

    var windowHeight = $(window).innerHeight();
    var iframeUrl;

    if (tabId == "1st_tab") {
        if($("#iframeStatus01").attr("src") == ""){
            iframeUrl = "<c:url value='/sal/ctl/oneShotControl/selectDcsSalesUpdateBySqlMain.do' />";
            $("#iframeStatus01").attr("height", windowHeight - 80);
            $("#iframeStatus01").attr("src", iframeUrl);
        }
    }else if(tabId == "2nd_tab"){
    	 if($("#iframeStatus02").attr("src") == ""){
             iframeUrl = "<c:url value='/sal/ctl/oneShotControl/selectDmsSalesUpdateBySqlMain.do' />";
             $("#iframeStatus02").attr("height", windowHeight - 80);
             $("#iframeStatus02").attr("src", iframeUrl);
         }
    }
}

$(document).ready(function() {

    $("#tabstrip").kendoExtTabStrip({
        animation:false
        , select:function(e) {
            selectTabId = e.item.id;
            selectTab(selectTabId);
        }
    });

    selectTab(selectTabId);
});
</script>