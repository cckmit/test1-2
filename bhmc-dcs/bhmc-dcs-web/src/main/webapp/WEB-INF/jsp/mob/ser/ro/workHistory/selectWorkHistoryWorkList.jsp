﻿<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />


<div data-role="view">
  <ul data-role="listview" data-source="listData" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">

        <div class="dlistitem">
            <span style="width:100%">#:trimNull(lbrNm) #</span>
            <span class="clboth" style="width:35%">#:trimNull(lbrCd) #</span>
            <span style="width:35%">#:trimNull(lbrTp) #</span>
            <span style="width:30%">#:trimNull(expcLbrAmt) #</span>
            <span class="clboth" style="width:35%">#:trimNull(lbrHm) #</span>
            <span style="width:35%">#:trimNull(lbrPrc) #</span>
            <span style="width:30%">#:trimNull(dcAmt) #</span>
        </div>
</script>

<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자
var toDay = "${toDay}";     // 현재일자
var oneDay = "${oneDay}";   // 해당월 1일

var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;

// datasource below is customized for demo purposes.
var listData = new kendo.data.DataSource({
  transport:{
    read:function(options) {

      if (rowIndex >= rowTotal)
      {
          return;
      }
      app.showLoading();
      pageIndex++;
      //alert("KBS Loading page ["+pageIndex+"]");

      var params = {};
      params["recordCountPerPage"] = pageSize;
      params["pageIndex"] = pageIndex;
      params["firstIndex"] = (pageIndex - 1) * pageSize;
      params["lastIndex"] = pageIndex * pageSize;
      params["sort"] = null;

      //params["sRoDocNo"] = parent.$("#roDocNo").val();

      params["sRoDocNo"] = "RO2016060155-097";




      $.ajax({
          url:"<c:url value='/mob/ser/ro/workHistory/selectRepairOrderLabors.do' />"

          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              //alert("KBS Loading page Error ["+pageIndex+"]");
              mob.notification.error(jqXHR.responseJSON.errors);
              app.hideLoading();
          }
          ,success:function(result) {
              if(result.data!=null && result.data != ""){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;

                      data.push({
                          pageIdx:pageIndex,
                          rowIdx:rowIndex,
                          dlrCd:row.dlrCd,

                          roDocNo:row.roDocNo,
                          roTp:row.roTp,
                          lbrTp:row.lbrTp,
                          lbrCd:row.lbrCd,
                          lbrNm:row.lbrNm,
                          lbrHm:row.lbrHm,
                          lbrPrc:row.lbrPrc,
                          dcAmt:row.dcAmt,
                          expcLbrAmt:row.expcLbrAmt
                      });
                  });
                  options.success(data);

                  //alert("KBS Loading page Success ["+pageIndex+"]");
                  app.hideLoading();
                  //mob.notification.success("<spring:message code='global.info.success'/>");
                  parent.setSubListHeight("workList",rowTotal);
              }else{
                  app.hideLoading();
                  parent.setSubListHeight("workList",0);
              }
          }
      });
    }
  },

  pageSize:pageSize,
  serverPaging:true,
  schema:{
      total:function(){ return rowTotal; }
  }
});

function listViewClick(e)
{
    //parent.contentDetail(e.dataItem.itemCd);
}


progressStatChange = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        //returnVal = parent.progressStatMap[val].cmmCdNm;
    }
    return returnVal;
}

//var app = setKendoMobApp();
//var app = new kendo.mobile.Application($(document.body),{platform:"android-light", useNativeScrolling:true});
var app = setKendoMobAppForNativeScroll();
</script>