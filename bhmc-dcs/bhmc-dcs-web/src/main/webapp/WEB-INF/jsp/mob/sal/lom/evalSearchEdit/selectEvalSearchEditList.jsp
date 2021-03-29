﻿<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="checkitem">
    <span class="check">
        <input id="isSave_#:rowIdx #" name="isSaveName" type="checkbox" class="f_check" /><label for="isSave_#:rowIdx #"></label>
    </span>
    <span style="width:65%">#:vinNo #</span>
    <span style="width:35%">#:trsfCarNo #</span>
    <span style="width:65%"  class="clboth">#:chgDate2Str(grDt) #</span>
    <span style="width:35%">#:chgDate2Str(pltGiDt) #</span>
    <input type="hidden" name="vinNo" value="#:trimNull(vinNo) #" />
    <input type="hidden" name="dlrEvalDt" value="#:trimNull(dlrEvalDt) #" />
    <input type="hidden" name="dstbSerEvalVal" value="#:trimNull(dstbSerEvalVal) #" />
    <input type="hidden" name="driverStsfVal" value="#:trimNull(driverStsfVal) #" />
    <input type="hidden" name="carIssueHmVal" value="#:trimNull(carIssueHmVal) #" />
    <input type="hidden" name="carIssueMassVal" value="#:trimNull(carIssueMassVal) #" />
    <input type="hidden" name="otherCont" value="#:trimNull(otherCont) #" />
    <input type="hidden" name="carStatCd" value="#:trimNull(carStatCd) #" />
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

      var params = {};
      params["recordCountPerPage"] = pageSize;
      params["pageIndex"] = pageIndex;
      params["firstIndex"] = (pageIndex - 1) * pageSize;
      params["lastIndex"] = pageIndex * pageSize;
      //params["sort"] = null;

      //params["sVinNo1"] = parent.$("#sVinNo1").val();

      params["sVinNo"] = parent.$("#sVinNo1").val() + parent.$("#sVinNo2").val();        //VIN_NO1
      //date타입 에러로 임시주석 처리
      params["sPltGiDtS"] = new Date(parent.$("#sPltGiDtS").val());   //발차일자FROM
      params["sPltGiDtE"] = new Date(parent.$("#sPltGiDtE").val());   //발차일자TO

      parent.$("#content_list").css("display","block");

      $.ajax({
          url:"<c:url value='/mob/sal/lom/evalSearchEdit/selectEvalSearchEdit.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {

              //alert("KBS Loading page Error ["+pageIndex+"]");
              //mob.notification.error(jqXHR.responseJSON.errors);
              app.hideLoading();
          }
          ,success:function(result) {
              if(result.data!=null){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({pageIdx:pageIndex, rowIdx:rowIndex, dlrCd:row.dlrCd, dstbCmpNm:row.dstbCmpNm,
                          trsfCarNo:row.trsfCarNo, vinNo:row.vinNo, carStatCd:row.carStatCd, grDt:row.grDt, pltGiDt:row.pltGiDt,
                          dlrEvalDt:row.dlrEvalDt, dstbSerEvalVal:row.dstbSerEvalVal, driverStsfVal:row.driverStsfVal, carIssueHmVal:row.carIssueHmVal,
                          carIssueMassVal:row.carIssueMassVal, otherCont:row.otherCont});
                      //if(rowIndex>11) return false;
                  });
                  options.success(data);
                  //alert("KBS Loading page Success ["+pageIndex+"]");
                  app.hideLoading();
                  //mob.notification.success("<spring:message code='global.info.success'/>");
              }else{
                  app.hideLoading();
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
    var dataItem = e.dataItem;
    //parent.contentDetail(e.dataItem.itemCd);
    //parent.contentDetail(e.dataItem);
}


var app = setKendoMobApp();

</script>
