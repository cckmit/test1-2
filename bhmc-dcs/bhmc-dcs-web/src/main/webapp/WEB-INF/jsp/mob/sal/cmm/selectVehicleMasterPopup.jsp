﻿<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />
    <section id="content">
        <!-- content_pop_list -->
        <section id="content_pop_list">
            <div class="content_title conttitlePrev">
                <h2 id="content_pop_list_title"><spring:message code="global.lbl.carList" /><!-- 차량리스트 --></h2>
            </div>

            <div class="skeyarea">
                <div>
                    <table class="slist01">
                        <colgroup>
                            <col style="width:35%;">
                            <col style="">
                        </colgroup>
                        <tbody>
                            <tr id="search1Area">
                                <th scope="row"><span><spring:message code="global.lbl.vinNum" /><!-- VIN NO --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                            </tr>
                            <tr id="search2Area">
                                <th scope="row"><span><spring:message code="global.lbl.vinSts" /><!-- 차량상태 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                            </tr>
                            <tr id="search3Area">
                                <th scope="row"><span><spring:message code="global.lbl.ownStatCd" /><!-- 보유상태 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                            </tr>
                            <tr id="search4Area">
                                <th scope="row"><span><spring:message code="global.lbl.carLine" /><!-- 차종 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                            </tr>
                            <tr id="search5Area">
                                <th scope="row"><span><spring:message code="global.lbl.model" /><!-- 모델 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                            </tr>
                            <tr id="search6Area">
                                <th scope="row"><span><spring:message code="global.lbl.ocn" /><!-- OCN --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                            </tr>
                            <tr id="search7Area">
                                <th scope="row"><span><spring:message code="global.lbl.extColor" /><!-- 외장색 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                            </tr>
                            <tr id="search8Area">
                                <th scope="row"><span><spring:message code="global.lbl.intColor" /><!-- 내장색 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="listarea">
                <div class="dlistitem listhead">
                    <span style="width:50%"><spring:message code="global.lbl.vinNum" /><!-- VIN --></span>
                    <span style="width:50%"><spring:message code="global.lbl.vinSts" /><!-- 차량상태 --></span>
                    <span class="clboth"><spring:message code="global.lbl.ocn" /><!-- OCN명 --></span>
                    <span style="width:50%" class="clboth"><spring:message code='global.lbl.extColor' />/<spring:message code='global.lbl.intColor' /><!-- 외장색/내장색 --></span>
                    <span style="width:50%"><spring:message code="global.lbl.stockCd" /><!-- 재고유형 --></span>
                </div>
                <iframe id="comonPoppuList" border="0" frameborder="0" width="100%" height="300"></iframe>
            </div>
            <div class="con_btnarea">
                <span class="btnd1" id="btnSelect"><spring:message code="global.btn.select" /><!-- 선택 --></span>
            </div>
        </section>


        <!-- content_pop_search -->
        <section id="content_pop_search" class="content_pop_search" style="display:none;">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="global.lbl.carSearch" /><!-- 차량검색조건  --></h2>
            </div>
           <div class="formarea">
                <table class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                     <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.vinNo' /><!-- VIN --></th>
                                <td>
                                    <div class="f_text"><input type="text" id="sVinNo"  class="form_input" ></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.vinSts' /><!-- 차량상태 --></th>
                                <td>
                                    <div class="f_text"><input type="text" id="sCarStatCd"  class="form_comboBox" ></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.ownStatCd' /><!-- 보유상태 --></th>
                                <td>
                                    <div class="f_text"><input type="text" id="sOwnStatCd" class="form_comboBox" ></div>

                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.carLine' /><!-- 차종 --></th>
                                <td>
                                    <div class="f_text"><input type="text" id="sCarlineCd"   class="form_comboBox" ></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.model' /><!-- 모델 --></th>
                                <td>
                                    <div class="f_text"><input type="text" id="sModelCd"  class="form_comboBox" ></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.ocn' /><!-- OCN --></th>
                                <td>
                                    <div class="f_text"><input type="text" id="sOcnCd"  class="form_comboBox" ></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.extColor' /><!-- 외장색 --></th>
                                <td>
                                    <div class="f_text"><input type="text" id="sExtColorCd"  class="form_comboBox" ></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.intColor' /><!-- 내장색 --></th>
                                <td>
                                    <div class="f_text"><input type="text" id="sIntColorCd"  class="form_comboBox" ></div>
                                </td>
                            </tr>
                        </tbody>
                </table>
            </div>
            <div class="con_btnarea">
                <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
            </div>
        </section>
    </section>

        <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
        <div id="docu_top" style="display:none">TOP</div>



<!-- script -->
<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';
var toDate,
    gCrud;

toDate = new Date();

//차량
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//차량상태 SAL001
var carStatDs = [];
var carStatObj = {};
<c:forEach var="obj" items="${carStatList}">
    carStatDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
    carStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//차량보유상태 SAL149
var ownStatDs = [];
var ownStatObj = {};
<c:forEach var="obj" items="${ownStatList}">
    ownStatDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
    ownStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//재고유형 SAL074
var stockDSList = [];
var stockTpObj = {};
<c:forEach var="obj" items="${stockTpDS}">
    stockDSList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
    stockTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//창고
var storageDSList = [];
var strgeCdObj = {};
<c:forEach var="obj" items="${storageList}">
    storageDSList.push({cmmCdNm:"${obj.strgeNm}", cmmCd:"${obj.strgeCd}"});
    strgeCdObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>

// 위치
var locDSList = [];
var locCdObj = {};
<c:forEach var="obj" items="${locDSList}">
    locDSList.push({cmmCdNm:"${obj.locNm}", cmmCd:"${obj.locCd}"});
    locCdObj["${obj.locCd}"] = "${obj.locNm}";
</c:forEach>


//회사차구분 Array
var cmpCarDstinCd = [];
<c:forEach var="obj" items="${cmpCarDstinCdDS}">
    cmpCarDstinCd.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
//회사차구분 Map
var cmpCarDstinCdMap = dms.data.arrayToMap(cmpCarDstinCd, function(obj){ return obj.cmmCd; });


$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sVinNo").val("");
            break;
        case "search2Area" :
            $("#sCarStatCd").data("kendoExtDropDownList").value("");
            break;
        case "search3Area" :
            $("#sOwnStatCd").data("kendoExtDropDownList").value("");
            break;
        case "search4Area" :
            $("#sCarlineCd").data("kendoExtDropDownList").value("");
            break;
        case "search5Area" :
            $("#sModelCd").data("kendoExtDropDownList").value("");
            break;
        case "search6Area" :
            $("#sOcnCd").data("kendoExtDropDownList").value("");
            break;
        case "search7Area" :
            $("#sExtColorCd").data("kendoExtDropDownList").value("");
            break;
        case "search8Area" :
            $("#sIntColorCd").data("kendoExtDropDownList").value("");
            break;
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});

function setSearchBox(){
    var sVinNo = $("#sVinNo").val();
    var sCarStatCd = $("#sCarStatCd").data("kendoExtDropDownList").value();
    var sOwnStatCd = $("#sOwnStatCd").data("kendoExtDropDownList").value();
    var sCarlineCd = $("#sCarlineCd").data("kendoExtDropDownList").value();
    var sModelCd = $("#sModelCd").data("kendoExtDropDownList").value();
    var sOcnCd = $("#sOcnCd").data("kendoExtDropDownList").value();
    var sExtColorCd = $("#sExtColorCd").data("kendoExtDropDownList").value();
    var sIntColorCd = $("#sIntColorCd").data("kendoExtDropDownList").value();

    if(sVinNo == "" && sCarStatCd == "" && sOwnStatCd == "" && sCarlineCd == "" &&
            sModelCd == "" && sOcnCd == "" && sExtColorCd == "" && sIntColorCd == ""){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();
        if(sVinNo == "") $("#search1Area").hide();
        else $("#search1Area").show();
        if(sCarStatCd == "") $("#search2Area").hide();
        else $("#search2Area").show();
        if(sOwnStatCd == "") $("#search3Area").hide();
        else $("#search3Area").show();
        if(sCarlineCd == "") $("#search4Area").hide();
        else $("#search4Area").show();
        if(sModelCd == "") $("#search5Area").hide();
        else $("#search5Area").show();
        if(sOcnCd == "") $("#search6Area").hide();
        else $("#search6Area").show();
        if(sExtColorCd == "") $("#search7Area").hide();
        else $("#search7Area").show();
        if(sIntColorCd == "") $("#search8Area").hide();
        else $("#search8Area").show();

    }
    setMainListHeight();
}

// 그리드에서 목록 선택시 선택값 세팅
var setDataItem;
var searchClickFl = false;
$(document).ready(function() {
    setDataItem = null ;// 화면 로딩시 초기화

  //현재일자
    var toDay = "${toDay}";

    function initPage(){
        /* if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        } */
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
        $(".skeyarea").hide();
    }

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='global.title.carMasterSearch' />");<!-- 차량마스터검색   -->
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    $("#comonPoppuList").attr("src", "<c:url value='/mob/sal/cmm/selectVehicleMasterListPopup.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sVinNo      = $("#sVinNo").val();
            var sCarStatCd  = $("#sCarStatCd").data("kendoExtDropDownList").text();
            var sOwnStatCd  = $("#sOwnStatCd").data("kendoExtDropDownList").text();
            var sCarlineCd  = $("#sCarlineCd").data("kendoExtDropDownList").text();
            var sModelCd    = $("#sModelCd").data("kendoExtDropDownList").text();
            var sOcnCd      = $("#sOcnCd").data("kendoExtDropDownList").text();
            var sExtColorCd = $("#sExtColorCd").data("kendoExtDropDownList").text();
            var sIntColorCd = $("#sIntColorCd").data("kendoExtDropDownList").text();

            if(sVinNo != "") $("#search1Area span[name='searchStr']").text(sVinNo);
            if(sCarStatCd != "") $("#search2Area span[name='searchStr']").text(sCarStatCd);
            if(sOwnStatCd != "") $("#search3Area span[name='searchStr']").text(sOwnStatCd);
            if(sCarlineCd != "") $("#search4Area span[name='searchStr']").text(sCarlineCd);
            if(sModelCd != "") $("#search5Area span[name='searchStr']").text(sModelCd);
            if(sOcnCd != "") $("#search6Area span[name='searchStr']").text(sOcnCd);
            if(sExtColorCd != "") $("#search7Area span[name='searchStr']").text(sExtColorCd);
            if(sExtColorCd != "") $("#search8Area span[name='searchStr']").text(sExtColorCd);
            searchClickFl = true;
            setSearchBox();
            contentList();
        }
    });



    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_pop_list").css("display") == "block") { goMain(); }
        else if ($("#content_pop_search").css("display") == "block") { contentList(); }
        //else if ($("#content_detail").css("display") == "block") { contentList(); }
    });

    //버튼 - TOP
    $("#docu_top").bind("click", function()
    {
        $("body,html").animate({scrollTop:0}, 200);
    });

    //상단으로 이동
    $(window).scroll(function () {
        if ($(this).scrollTop() != 0)
        {
            //$("#docu_top").fadeIn();
        }
        else
        {
            $("#docu_top").fadeOut();
        }
    });


  //조회조건 - 회사차구분
    $("#sCmpCarDstinCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:cmpCarDstinCd
        ,optionLabel:"<spring:message code='global.lbl.all' />"   // 전체
    });




    //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:"<spring:message code='global.lbl.all' />"   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sModelCd").data("kendoExtDropDownList").enable(true);

           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
           $("#sOcnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           if(dataItem.carlineCd == ""){
               $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sModelCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectModel.do' />"
               ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
               ,async:false
           });
           $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    // 모델
    $("#sModelCd").kendoExtDropDownList({
        dataTextField:"modelNm"
       ,dataValueField:"modelCd"
       ,optionLabel:"<spring:message code='global.lbl.all' />"   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcnCd").data("kendoExtDropDownList").enable(true);

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           if(dataItem.modelCd == ""){
               $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sOcnCd").data("kendoExtDropDownList").enable(false);
               return false;
           }
           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectOcn.do' />"
               ,data:JSON.stringify({"carlineCd":$("#sCarlineCd").val(), "modelCd":dataItem.modelCd})
               ,async:false
           });
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });
    $("#sModelCd").data("kendoExtDropDownList").enable(false);

    // ocn
    $("#sOcnCd").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,optionLabel:"<spring:message code='global.lbl.all' />"   // 전체
        ,select:function(e){
            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sExtColorCd").data("kendoExtDropDownList").enable(true);

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

            if(this.dataItem(e.item).ocnCd == ""){
                $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleMaster/selectExtColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sOcnCd").data("kendoExtDropDownList").enable(false);

    //외장색
    $("#sExtColorCd").kendoExtDropDownList({
         dataTextField: "extColorNm"
        ,dataValueField:"extColorCd"
        ,optionLabel:"<spring:message code='global.lbl.all' />"   // 전체
        ,select:function(e){
            if(this.dataItem(e.item).extColorCd == ""){
                $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(true);

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleMaster/selectIntColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

    //내장색
    $("#sIntColorCd").kendoExtDropDownList({
         dataTextField: "intColorNm"
        ,dataValueField:"intColorCd"
        ,optionLabel:"<spring:message code='global.lbl.all' />"   // 전체
    });
    $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

    //차량보유상태
    $("#sOwnStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:ownStatDs
        ,optionLabel:"<spring:message code='global.lbl.all' />"   // 전체
    });

    //차량상태
    $("#sCarStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carStatDs
        ,optionLabel:"<spring:message code='global.lbl.all' />"   // 전체
    });

    //헤더 접기 실행
    //$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");
    $("#header_title").bind("click", function(){
        if($("#content_pop_search").css("display") == "block"){
            $("#content_pop_search").css("display","none");
            $("#content_pop_list").css("display","block");$("#header_title span").attr("class","search_open");
            $("#header_title span").attr("class","search_close");
        }else{
            $("#header_title span").attr("class","search_open");
            contentSearch();
        }
    });
});
</script>

<script>

//팝업 레이어닫기

function goMain() {
  //window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
    parent.popupWindow.close();
}


//목록페이지 보기
function contentList() {
  $("#content_pop_search").css("display","none");
  $("#content_pop_list").css("display","block");$("#header_title span").attr("class","search_open");
  document.getElementById("comonPoppuList").contentWindow.document.location.reload(); // 목록 iframe 새로고침
}

//검색페이지 보기
function contentSearch() {
  $("#content_pop_list").css("display","none");
  //$("#content_detail").css("display","none");
  $("#content_pop_search").css("display","block");
}

// 팝업 설정값
var options = parent.popupWindow.options.content.data;


function contentCommonDetail(dataItem) {
     setDataItem = dataItem;
  }

//선택 버튼.
$("#btnSelect").kendoButton({
    click:function(e){
        if(setDataItem != null) {
            options.callbackFunc(setDataItem);
            parent.popupWindow.close();
        } else {
            dms.notification.info("<spring:message code='global.lbl.car' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
        }
    }
});




</script>