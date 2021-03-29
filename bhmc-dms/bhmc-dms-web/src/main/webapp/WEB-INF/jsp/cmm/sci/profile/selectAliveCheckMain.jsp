<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<div id="resizableContainer">
    <div class="content">
    <!-- 보증현황 -->
        <section class="group">
            <div class="header_area">
                <div class="btn_left">
                    <dms:access viewId="VIEW-D-12959" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnInit" class="btn_m btn_reset"><spring:message code="global.btn.init" /></button>
                    </dms:access>
                </div>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-11567" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m" id="btnAlvieCheck"><spring:message code="global.btn.checkState" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11568" hasPermission="${dms:getPermissionMask('READ')}">
                        <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button>
                    </dms:access>
                </div>
            </div>
            <form id="searchForm">
            <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:9%;">
                        <col style="width:20%;">
                        <col style="width:9%;">
                        <col style="width:15%;">
                        <col style="width:9%;">
                        <col style="width:15%;">
                        <col style="width:9%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.searchDate' /><!-- 검색일자 --></th>
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sFromDt" class="form_datepicker ac">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sToDt" class="form_datepicker ac">
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </form>
            <div class="table_grid mt10">
                <div id="gridHeader" class="resizable_grid"></div>
            </div>
        </section>
    </div>
</div>
<!-- script -->
<script>

$(document).ready(function() {

    // 초기화 버튼.
    $("#btnInit").kendoButton({
        click:function(e){
            $("#searchForm").get(0).reset();
            $("#gridHeader").data("kendoExtGrid").dataSource.page(1);
        }
    });

    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){

            $("#gridHeader").data("kendoExtGrid").dataSource.page(1);
            //serviceJs.commonListInit();     // service 공통 JS
        }
    });

    // 조회 버튼.
    $("#btnAlvieCheck").kendoButton({
        click:function(e){

            $.ajax({
                url:"<c:url value='/cmm/sci/profile/aliveEaiCheck.do' />"
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error) {
                    dms.loading.hide($("#resizableContainer"));
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result , textStatus){
                    $("#gridHeader").data("kendoExtGrid").dataSource.page(1);
                    dms.notification.success("<spring:message code='global.info.success' />");
                }
                ,beforeSend:function(xhr){
                    dms.loading.show($("#resizableContainer"));
                }
                ,complete:function(xhr,status){
                    dms.loading.hide($("#resizableContainer"));
                }
            }); //ajax
        }
    });

    $("#sFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sFromDt}"
    });

    $("#sToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sToDt}"
    });

    $("#gridHeader").kendoExtGrid({
        gridId:"G-SER-1011-000073"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/cmm/sci/profile/selectAliveStatusListMains.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sFromDt"]  = $("#sFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sToDt"]    = $("#sToDt").data("kendoExtMaskedDatePicker").value();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,ipNm:{type:"string", editable:false}
                        ,contYn:{type:"string", editable:false}
                        ,regDt:{type:"date"}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.regDtFormat = kendo.parseDate(elem.regDtFormat, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
        }
        ,height:186
        ,editable:false
        ,selectable:"row"
        ,sortable:false
        ,autoBind:true
        ,columns:[
             {field:"ipNm", title:"IP", width:100}       // 차량번호
            ,{field:"contYn", title:"ALIVE Y/N", width:150}          // VIN
            ,{field:"regDt", title:"<spring:message code='global.lbl.lastAchkReqDt' />", width:120
                ,attributes:{"class":"ac tooltip-enabled"}
                , template:"#= dms.string.strNvl(kendo.toString(data.regDt, '<dms:configValue code='dateFormat' /> HH:mm:ss')) #"
            } // 견적등록일자
        ]
    });

});

</script>
<!-- //script -->

