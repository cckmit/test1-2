<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- issueReqMng -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.issueReqMng" /> --%><!-- issueReqMng --></h1>
            <div class="btn_right">
                <button id="btnInvCancel" class="btn_m"><spring:message code="par.btn.invReturn" /><!-- btnInvCancel --></button>
                <button class="btn_m" id="btnInvReq"><spring:message code="par.btn.invConfirm" /><!-- btnInvReq --></button>
                <button class="btn_m btn_print" id="btnPrint" type="button"><spring:message code="par.btn.print" /></button><!--btnSearch  -->
                <button class="btn_m btn_save" id="btnInvReqSave"><spring:message code="par.btn.save" /><!-- btnInvReqSave --></button>
                <button class="btn_m btn_init" id="btnInit" type="button"><spring:message code="par.btn.init" /></button><!--btnInit  -->
                <button class="btn_m btn_search" id="btnSearch" type="button"><spring:message code="par.btn.search" /></button><!--btnSearch  -->
            </div>
    </div>

    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col style="width:22%;">
                <col style="width:12%;">
                <col style="width:21%;">
                <col style="width:12%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.parGiTp" /><!-- parGiTp --></th>
                    <td>
                        <input id="sParGiTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.parReqDocNo" /><!-- parReqDocNo --></th>
                    <td>
                        <input id="sParReqDocNo" name="sParReqDocNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.parReqStatNm" /><!-- parReqStatNm --></th>
                    <td>
                        <input id="sParReqStatCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.issueRegDt" /><!-- issueRegDt --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sReqStartDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sReqEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.custNo" /><!-- custNo --></th>
                    <td>
                        <div class="form_search">
                            <input id="sCustCd" name="sCustCd" class="form_input" />
                                <a href="javascript:;" onclick="javascript:selectReadyPopupWindow();"><!-- CustCd Search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.custNm" /><!-- custNm --></th>
                    <td>
                        <input id="sCustNm" name="sCustNm" class="form_input" maxlength="15" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.serPrsnId" /><!-- serPrsnId --></th>
                    <td>
                        <div class="form_search">
                            <input id="sSerPrsnId" name="sSerPrsnId" class="form_input" />
                                <a href="javascript:;" onclick="javascript:selectReadyPopupWindow();"><!-- SerPrsnId Search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.carNo" /><!-- carNo --></th>
                    <td>
                        <div class="form_search">
                            <input id="sCarNo" name="sCarNo" class="form_input" />
                                <a href="javascript:;" onclick="javascript:selectReadyPopupWindow();"><!-- CarNo Search --></a>
                        </div>
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <!-- targetReqHeaderGrid -->
        <div id="targetReqHeaderGrid" ></div>
        <!-- targetReqHeaderGrid -->
    </div>

    <div class="table_form form_width_70per hidden">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col style="width:22%;">
                <col style="width:12%;">
                <col style="width:21%;">
                <col style="width:12%;">
                <col style="width:21%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.parGiTp" /><!-- parGiTp --></th>
                    <td>
                        <input id="parGiTp" name="parGiTp" readonly class="form_input form_readonly" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.parReqDocNo" /><!-- parReqDocNo --></th>
                    <td>
                        <input id="parReqDocNo" name="sParReqDocNo" readonly class="form_input form_readonly" />
                        <input id="roDocNo" name="roDocNo" type="hidden" />
                        <input id="parGiTp" name="parGiTp" type="hidden" />
                        <input id="resvDocNo" name="resvDocNo" type="hidden" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.parReqStatNm" /><!-- parReqStatNm --></th>
                    <td>
                        <input type="hidden" id="parReqStatCd" name="parReqStatCd" />
                        <input id="parReqStatNm" name="parReqStatNm" readonly class="form_input form_readonly" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.regDt" /><!-- regDt --></th>
                    <td>
                        <input id="reqStartDt" name="reqStartDt" readonly class="form_input form_readonly" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.custNm" /><!-- custNm --></th>
                    <td>
                        <input id="custNm" name="custNm" readonly class="form_input form_readonly" />
                        <input type="hidden" id="custCd" name="custCd" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.carNo" /><!-- carNo --></th>
                    <td>
                        <input id="carNo" name="carNo" readonly class="form_input form_readonly" />
                        <input type="hidden" id="vinNo" name="vinNo" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.serPrsnId" /><!-- serPrsnId --></th>
                    <td>
                        <input id="serPrsnId" name="serPrsnId" readonly class="form_input form_readonly" />
                    </td>
                    <th scope="row">&nbsp;</th>
                    <td>
                        &nbsp;
                    </td>
                    <th scope="row">&nbsp;</th>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- // tab start-->
    <div id="tabstrip" class="tab_area mt10">
    <ul>
        <li id ="tabPartOutStock" class="k-state-active"><spring:message code="par.title.partOutStock" /><!-- partOutStock --></li>
        <li id ="tabRoWorkInfo"><spring:message code="par.title.roWorkInfo" /><!-- roWorkInfo --></li>
        <li id ="tabPartsInnerInfo"><spring:message code="par.title.receiveEtcInner" /><!-- roWorkInfo --></li>
        <li id ="tabPartsReserve"><spring:message code="par.title.partsReserveInfo" /><!-- roWorkInfo --></li>
    </ul>
    <!--tabPartOutStock tab area -->
    <div class="mt0">
        <section class="group">
            <div class="header_area">
                <div class="btn_right">
                    <button id="btnPakage" class="btn_s"><spring:message code="par.btn.pakage" /><!-- btnPakage --></button>
                    <button id="btnOrderReq" class="btn_s hidden"><spring:message code="par.btn.orderReq" /><!-- btnOrderReq --></button>
                    <button id="btnCopyFromExcel" class="btn_s"><spring:message code="par.btn.copyFromItem" /><!-- btnCopyFromExcel --></button>
                    <button id="btnPartsAdd" class="btn_s"><spring:message code="par.btn.shareStockGiItem" /><!-- btnPartsAdd --></button>
                    <button id="btnResvReq" class="btn_s hidden"><spring:message code="par.btn.resvReq" /><!-- btnResvReq --></button>
                    <button id="btnAvlbReq" class="btn_s hidden"><spring:message code="par.btn.avlbReq" /><!-- btnAvlbReq --></button>

                    <button class="btn_s btn_add" id="btnAdd" type="button"><spring:message code="par.btn.rowAdd" /></button><!--rowAdd  -->
                    <button class="btn_s btn_del" id="btnDel" type="button"><spring:message code="par.btn.rowDel" /></button><!--rowDel  -->
                </div>
            </div>
            <div class="table_grid">
                <!-- targetReqDetailGrid -->
                <div id="targetReqDetailGrid" ></div>
                <!-- targetReqDetailGrid -->
            </div>
        </section>
    </div>
    <!-- tabRoWorkInfo tab area -->

    <div class="mt0">
        <section class="group">
            <div class="header_area">
                <div class="btn_right btn_right_v1">
                    &nbsp;
                </div>
            </div>
            <div class="table_grid">
                <div id="targetLbrGrid" ></div>
            </div>
        </section>
    </div>

    <div class="mt0">
        <section class="group">
            <div class="header_area">
                <div class="btn_right btn_right_v1">
                    &nbsp;
                </div>
            </div>
            <div class="table_grid">
                <div id="targetPartsInnerGrid" ></div>
            </div>
        </section>
    </div>

    <div class="mt0">
        <section class="group">
            <div class="header_area">
                <div class="btn_right btn_right_v1">
                    &nbsp;
                </div>
            </div>
            <div class="table_grid">
                <div id="targetPartsReserveGrid" ></div>
            </div>
        </section>
    </div>

</div>
<!-- // tab end -->

<div>
    <button id="btnSubPartsSelect" class="btn_s"><spring:message code="par.btn.subPartsSelect" /><!-- btnSubPartsSelect --></button>
    <button id="btnInPartsHistory" class="btn_s"><spring:message code="par.btn.inPartsHistory" /><!-- btnInPartsHistory --></button>
</div>

</section>
<!-- //issueReqMng -->

<!-- script -->
<script>
//parGiTp
var parGiTpList = [];
<c:forEach var="obj" items="${parGiTpList}">
parGiTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var parGiTpMap = [];
$.each(parGiTpList, function(idx, obj){
    parGiTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//parGiTpSr
var parGiTpSrList = [];
<c:forEach var="obj" items="${parGiTpSrList}">
parGiTpSrList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var parGiTpSrMap = [];
$.each(parGiTpSrList, function(idx, obj){
    parGiTpSrMap[obj.cmmCd] = obj.cmmCdNm;
});
//etcGiTp
var etcGiTpList = [];
<c:forEach var="obj" items="${etcGiTpList}">
etcGiTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var etcGiTpMap = [];
$.each(etcGiTpList, function(idx, obj){
    etcGiTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//partsParReqStatCd
var partsParReqStatCdList = [];
<c:forEach var="obj" items="${partsParReqStatCdList}">
partsParReqStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var partsParReqStatCdMap = [];
$.each(partsParReqStatCdList, function(idx, obj){
    partsParReqStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//roTpCdList
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd});
//roTpCdGrid Func
roTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = roTpCdArr[val].cmmCdNm;
    }
    return returnVal;
}
//giStrgeCdList
var giStrgeCdList = [];
<c:forEach var="obj" items="${giStrgeCdList}">
giStrgeCdList.push({
    "strgeCd":"${obj.strgeCd}"
    ,"strgeNm":"${obj.strgeNm}"
});
</c:forEach>
var giStrgeCdMap = [];
$.each(giStrgeCdList, function(idx, obj){
    giStrgeCdMap[obj.strgeCd] = obj.strgeNm;
});
//location Array
var locCdList = [];
<c:forEach var="obj" items="${locCdList}">
locCdList.push({
    "locCd":"${obj.locCd}"
    ,"locNm":"${obj.locNm}"
});
</c:forEach>
var locCdMap = [];
$.each(locCdList, function(idx, obj){
    locCdMap[obj.locCd] = obj.locNm;
});
//popup ready Func
function selectReadyPopupWindow(){
    // ready message
    dms.notification.success("<spring:message code='global.info.ready'/>");
}
//share item popup Func
var shareItemPopupButtonWindow;
function selectShareItemPopupButtonWindow(){
    shareItemPopupButtonWindow = dms.window.popup({
        windowId:"shareItemPopupButtonWindow"
        ,title:"<spring:message code = 'par.title.shareItemInfo'/>"   // shareItemInfo select
        ,width:600
        ,height:350
        ,content:{
            url:"<c:url value='/par/cmm/selectShareItemPopup.do'/>"
            ,data:{
                "callbackFunc":function(data){
                    shareItemPopupButtonWindow.close();
                }
            }
        }
    });
}
//stock gr item popup Func
var stockGrItemPopupButtonWindow;
function selectStockGrItemPopupButtonWindow(){
    stockGrItemPopupButtonWindow = dms.window.popup({
        windowId:"stockGrItemPopupButtonWindow"
        ,title:"<spring:message code = 'par.title.stockGrItemInfo'/>"   // stockGrItemInfo select
        ,width:700
        ,height:350
        ,content:{
            url:"<c:url value='/par/cmm/selectStockGrItemPopup.do'/>"
            ,data:{
                "callbackFunc":function(data){
                    stockGrItemPopupButtonWindow.close();
                }
            }
        }
    });
}
//order request popup Func
var issueReqPopupButtonWindow;
function selectIssueReqPopupButtonWindow(){
    issueReqPopupButtonWindow = dms.window.popup({
        windowId:"issueReqPopupButtonWindow"
        ,title:false
        ,width:400
        ,height:90
        ,content:{
            url:"<c:url value='/par/ism/issueReq/selectIssueReqCheckPopup.do'/>"
            ,data:{
                "callbackFunc":function(data){
                    // order reqeust y or n
                    if(data.flag == "Y"){
                        $("#btnOrderReq").click();
                    }
                }
            }
        }
    });
}
//order retrun popup Func
var issueReturnPopupButtonWindow;
function selectIssueReturnPopupButtonWindow(grid){
    issueReturnPopupButtonWindow = dms.window.popup({
        windowId:"issueReturnPopupButtonWindow"
        ,title:false
        ,width:300
        ,height:90
        ,content:{
            url:"<c:url value='/par/ism/issueReq/selectIssueReturnCheckPopup.do'/>"
            ,data:{
                "callbackFunc":function(data){
                    //receive y or n
                    if(data.flag == "Y"){

                        var dateItems = [ ];
                        var itemReturnCnt = 0;
                        var rows = grid.select();
                        $.each(rows, function(idx, row){
                            //출고상태 02 완료 인것만 반품 가능
                            var item = grid.dataItem(row);
                            if(parReqStatCd ==="02"){
                                item.returnId = data.receiveNm;
                                item.giDocStatCd = "03";
                                item.giStatCd = "03";
                                dateItems.push(item);
                                itemReturnCnt++;
                            }
                        });

                        if(itemReturnCnt ===0){
                            var issuePartsOutVO = {
                                    dlrCd:""
                                    ,giDocNo:dateItems[0].giDocNo
                                    ,giDocTp:"03"
                                    ,giDocStatCd:"03"
                                    ,cancYn:"Y"
                                    ,parReqDocNo:dateItems[0].parReqDocNo
                                    ,roDocNo:dateItems[0].roDocNo
                                    ,pltCd:""
                                    ,serPrsnId:$("#serPrsnId").val()
                                    ,custCd:$("#custCd").val()
                                    ,custNm:$("#custNm").val()
                                    ,vinNo:$("#vinNo").val()
                                    ,carNo:$("#carNo").val()
                                    ,mvtDocYyMm:""
                                    ,mvtDocNo:""
                                    ,regUsrId:null
                                    ,regDt:null
                                    ,updtUsrId:null
                                    ,updtDt:null
                                }

                            var issueReqSaveVO = { "issuePartsOutVO":issuePartsOutVO, "issueReqDetailVO":dateItems };
                            $.ajax({
                                url:"<c:url value='/par/ism/issueReq/insertIssuePartsOutReturnInves.do' />"
                                ,data:JSON.stringify(issueReqSaveVO)
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,error:function(jqXHR,status,error){
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                }
                                ,success:function(jqXHR, textStatus){
                                    grid.dataSource.read();
                                    $("#targetReqHeaderGrid").data("kendoExtGrid").dataSource.read();
                                    //parts Out Return complete message.
                                    dms.notification.success("<spring:message code='par.lbl.releaseComf' var='releaseComf' /><spring:message code='global.info.successMsg' arguments='${releaseComf}' />");
                                }
                            });
                        }
                    }
                }
            }
        }
    });
}
//order receive popup Func
var issueReceivePopupButtonWindow;
function selectIssueReceivePopupButtonWindow(grid, tabIndex){
    issueReceivePopupButtonWindow = dms.window.popup({
        windowId:"issueReceivePopupButtonWindow"
        ,title:false
        ,width:300
        ,height:90
        ,content:{
            url:"<c:url value='/par/ism/issueReq/selectIssueReceiveCheckPopup.do'/>"
            ,data:{
                "callbackFunc":function(data){
                    //receive y or n
                    if(data.flag == "Y"){

                        var dateItems = [ ];
                        var rows = grid.select();
                        $.each(rows, function(idx, row){
                            var item = grid.dataItem(row);
                            item.receiveId = data.receiveNm;
                            item.giDocStatCd = "02";
                            item.giStatCd = "02";
                            dateItems.push(item);
                        });

                        var vSerPrsnId  = "";
                        var vCustCd  = "";
                        var vCustNm  = "";
                        var vVinNo  = "";
                        var vCarNo  = "";
                        if(tabIndex === 0){
                            vSerPrsnId  = $("#serPrsnId").val();
                            vCustCd  = $("#custCd").val();
                            vCustNm  = $("#custNm").val();
                            vVinNo  = $("#vinNo").val();
                            vCarNo  = $("#carNo").val();
                        }else{
                            vCustCd  = dateItems[0].custCd;
                            vCustNm  = dateItems[0].custNm;
                        }

                        var issuePartsOutVO = {
                                dlrCd:""
                                ,giDocNo:dateItems[0].giDocNo
                                ,giDocTp:"02"
                                ,giDocStatCd:"02"
                                ,cancYn:"N"
                                ,parReqDocNo:dateItems[0].parReqDocNo
                                ,roDocNo:dateItems[0].roDocNo
                                ,pltCd:""
                                ,serPrsnId:vSerPrsnId
                                ,custCd:vCustCd
                                ,custNm:vCustNm
                                ,vinNo:vVinNo
                                ,carNo:vCarNo
                                ,mvtDocYyMm:""
                                ,mvtDocNo:""
                                ,regUsrId:null
                                ,regDt:null
                                ,updtUsrId:null
                                ,updtDt:null
                            }

                        var issueReqSaveVO = { "issuePartsOutVO":issuePartsOutVO, "issueReqDetailVO":dateItems };
                        $.ajax({
                            url:"<c:url value='/par/ism/issueReq/insertIssuePartsOutInves.do' />"
                            ,data:JSON.stringify(issueReqSaveVO)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,error:function(jqXHR,status,error){
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }
                            ,success:function(jqXHR, textStatus){

                                if(tabIndex === 0){
                                    grid.dataSource.read();
                                    $("#targetReqHeaderGrid").data("kendoExtGrid").dataSource.read();
                                }else{
                                    $("#targetPartsInnerGrid").data("kendoExtGrid").dataSource.read();
                                }

                                //parts Out complete message.
                                dms.notification.success("<spring:message code='par.lbl.releaseComf' var='releaseComf' /><spring:message code='global.info.successMsg' arguments='${releaseComf}' />");
                            }
                        });

                    }
                }
            }
        }
    });
}
//order receive print popup Func
var issueReceivePrintPopupButtonWindow;
function selectIssueReceivePrintPopupButtonWindow(){
    issueReceivePrintPopupButtonWindow = dms.window.popup({
        windowId:"issueReceivePrintPopupButtonWindow"
        ,title:false
        ,width:800
        ,height:600
        ,content:{
            url:"<c:url value='/par/ism/issueReq/selectIssueReceivePrintPopup.do'/>"
            ,data:{
                "parReqDocNo":$("#parReqDocNo").val()
                ,"carNo":$("#carNo").val()
                ,"custCd":$("#custCd").val()
                ,"custNm":$("#custNm").val()
                ,"callbackFunc":function(data){
                }
            }
        }
    });
}

//page init Func
function pageInit(){
    $("#sParGiTp").data("kendoExtDropDownList").select(0);
    $("#sParReqDocNo").val("");
    $("#sParReqStatCd").data("kendoExtDropDownList").select(0);
    $("#sReqStartDt").data("kendoExtMaskedDatePicker").value(new Date("${sysStartDate}"));
    $("#sReqEndDt").data("kendoExtMaskedDatePicker").value(new Date("${sysEndDate}"));
    $("#sCustCd").val("");
    $("#sCustNm").val("");
    $("#sSerPrsnId").val("");
    $("#sCarNo").val("");

    $("#parGiTp").val("");
    $("#parReqDocNo").val("");
    $("#roDocNo").val("");
    $("#parGiTp").val("");
    $("#resvDocNo").val("");
    $("#parReqStatCd").val("");
    $("#parReqStatNm").val("");
    $("#reqStartDt").val("");
    $("#custNm").val("");
    $("#custCd").val("");
    $("#carNo").val("");
    $("#vinNo").val("");
    $("#serPrsnId").val("");
    //button disable
    buttonEnableDisable(false, "00", "00");
}
//buttonEnableDisable Func
function buttonEnableDisable(bFlag, parReqStatCd, parGiTp){
    //page button list
    $("#btnInvReq").data("kendoButton").enable(false);
    $("#btnPrint").data("kendoButton").enable(false);
    $("#btnInvReqSave").data("kendoButton").enable(false);

    //parts button list
    $("#btnPakage").data("kendoButton").enable(false);
    $("#btnSubPartsSelect").data("kendoButton").enable(false);
    $("#btnInPartsHistory").data("kendoButton").enable(false);
    $("#btnOrderReq").data("kendoButton").enable(false);
    $("#btnCopyFromExcel").data("kendoButton").enable(false);
    $("#btnPartsAdd").data("kendoButton").enable(false);
    $("#btnResvReq").data("kendoButton").enable(false);
    $("#btnAvlbReq").data("kendoButton").enable(false);
    $("#btnInvCancel").data("kendoButton").enable(false);
    $("#btnAdd").data("kendoButton").enable(false);
    $("#btnDel").data("kendoButton").enable(false);

    if(parReqStatCd === "01"){

        $("#btnInvReq").data("kendoButton").enable(true);
        $("#btnPrint").data("kendoButton").enable(true);
        $("#btnInvReqSave").data("kendoButton").enable(true);

        $("#btnPakage").data("kendoButton").enable(true);
        $("#btnSubPartsSelect").data("kendoButton").enable(true);
        $("#btnInPartsHistory").data("kendoButton").enable(true);
        $("#btnCopyFromExcel").data("kendoButton").enable(true);
        $("#btnPartsAdd").data("kendoButton").enable(true);

        if(parGiTp == "SR" || parGiTp == "RO"){
            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnDel").data("kendoButton").enable(true);
        }
        if(bFlag){
            $("#btnResvReq").data("kendoButton").enable(true);
        }
        else{
            $("#btnPakage").data("kendoButton").enable(true);
            $("#btnSubPartsSelect").data("kendoButton").enable(true);
            $("#btnInPartsHistory").data("kendoButton").enable(true);
            $("#btnOrderReq").data("kendoButton").enable(true);
            $("#btnCopyFromExcel").data("kendoButton").enable(true);
            $("#btnPartsAdd").data("kendoButton").enable(true);
            $("#btnResvReq").data("kendoButton").enable(true);
            $("#btnAvlbReq").data("kendoButton").enable(true);
            $("#btnInvCancel").data("kendoButton").enable(true);
        }
    }else if(parReqStatCd === "02"){
        $("#btnPrint").data("kendoButton").enable(true);
        $("#btnInvCancel").data("kendoButton").enable(true);
    }
}
//updateIssuePartsResves Func
function updateIssuePartsResves(){
    var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
    rows = grid.select();
    rowCnt = rows.length;
    var dateItems = [ ];

    if(rowCnt == 0){
        // line check
        dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
        return;
    }

    if(grid.gridValidation()){
        // checked list
        $.each(rows, function(idx, row){
            dateItems.push(grid.dataItem(row));
        });

        var multiIssueReqDetailPartsResves = { insertList:[], updateList:dateItems, deleteList:[] };
        $.ajax({
            url:"<c:url value='/par/ism/issuePartsResv/multiIssueReqDetailPartsResves.do' />"
            ,data:JSON.stringify(multiIssueReqDetailPartsResves)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(jqXHR, textStatus){
                $("#targetReqHeaderGrid").data("kendoExtGrid").dataSource.read();
                // resv complete message
                dms.notification.success("<spring:message code='par.lbl.resv' var='resv' /><spring:message code='global.info.successMsg' arguments='${resv}' />");
            }
        });
    }else{
        // input value check message.
        dms.notification.warning("<spring:message code='global.info.check.input'/>");
    }
}
//updateIssuePartsAvlbes Func
function updateIssuePartsAvlbes(){
    var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
    rows = grid.select();
    rowCnt = rows.length;
    var dateItems = [ ];

    if(rowCnt == 0){
        // line selected message
        dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
        return;
    }

    if(grid.gridValidation()){
        var issueReqItemCheckCnt = 0;
        var issueReqDbYnCnt = 0;
        // checkbox selecte row list
        $.each(rows, function(idx, row){

            var item = grid.dataItem(row);

            if(item.itemCd == ""){
                issueReqItemCheckCnt++;
            }
            if(item.dbYn == "N"){
                issueReqDbYnCnt++;
            }

            dateItems.push(item);
        });

        if(issueReqItemCheckCnt > 0){
            // itemCd check message.
            dms.notification.info("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.issueCheckMsg' arguments='${itemCd}' />");
            return false;
        }

        if(issueReqDbYnCnt > 0){
             // data save continue.
            dms.notification.info("<spring:message code='global.info.isSaveRun' />");
            return false;
        }

        var multiIssueReqDetailPartsAvlbes = { insertList:[], updateList:dateItems, deleteList:[] };
        $.ajax({
            url:"<c:url value='/par/ism/issuePartsAvlb/multiIssueReqDetailPartsAvlbes.do' />"
            ,data:JSON.stringify(multiIssueReqDetailPartsAvlbes)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(jqXHR, textStatus){
                $("#targetReqHeaderGrid").data("kendoExtGrid").dataSource.read();
                // parts avlbes complete message
                dms.notification.success("<spring:message code='par.lbl.orderReq' var='orderReq' /><spring:message code='global.info.successMsg' arguments='${orderReq}' />");
            }
        });
    }else{
        // input value check message.
        dms.notification.warning("<spring:message code='global.info.check.input'/>");
    }
}
//updateIssuePartsRoes Func
function updateIssuePartsRoes(){
    var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
    rows = grid.select();
    rowCnt = rows.length;
    var dateItems = [ ];

    if(rowCnt == 0){
        //line select message
        dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
        return;
    }

    if(grid.gridValidation()){
        var issueReqItemCheckCnt = 0;
        var issueReqDbYnCnt = 0;
        //checked list
        $.each(rows, function(idx, row){
            var item = grid.dataItem(row);
            if(item.itemCd == ""){
                issueReqItemCheckCnt++;
            }
            if(item.dbYn == "N"){
                issueReqDbYnCnt++;
            }
            dateItems.push(item);
        });

        if(issueReqItemCheckCnt > 0){
            //itemCd message
            dms.notification.info("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.issueCheckMsg' arguments='${itemCd}' />");
            return false;
        }

        if(issueReqDbYnCnt > 0){
             //save continue message
            dms.notification.info("<spring:message code='global.info.isSaveRun' />");
            return false;
        }

        var multiIssueReqDetailPartsRoes = { insertList:[], updateList:dateItems, deleteList:[] };
        $.ajax({
            url:"<c:url value='/par/pcm/purcRqst/multiIssueReqDetailPartsRoes.do' />"
            ,data:JSON.stringify(multiIssueReqDetailPartsRoes)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(jqXHR, textStatus){
                $("#targetReqHeaderGrid").data("kendoExtGrid").dataSource.read();
                // orderReq complete message.
                dms.notification.success("<spring:message code='par.lbl.orderReq' var='orderReq' /><spring:message code='global.info.successMsg' arguments='${orderReq}' />");
            }
        });
    }else{
        // input value check message.
        dms.notification.warning("<spring:message code='global.info.check.input'/>");
    }
}
//RO InvsReq Func.
function updateIssuePartsInves(){

    var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
    var tabIndex = tabStrip.select().index()
    console.log("tab index:"+tabIndex);
    var grid = null;
    if(tabIndex === 0){//부품출고
        grid = $("#targetReqDetailGrid").data("kendoExtGrid");
    }else if(tabIndex === 2){//내부수령
        grid = $("#targetPartsInnerGrid").data("kendoExtGrid");
    }else{
        return false;
    }

    rows = grid.select();
    rowCnt = rows.length;
    var dateItems = [ ];
    console.log("rowCnt:"+rowCnt);
    if(rowCnt == 0){
        // line selected message.
        dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
        return false;
    }

    if(grid.gridValidation()){
        var issueReqItemCheckCnt = 0;
        var issueReqGiStrgeCdCheckCnt = 0;
        var issueReqGiLocCdCheckCnt = 0;
        var issueReqCheckCnt = 0;
        var issueReqDbYnCnt = 0;

        //checked list.
        $.each(rows, function(idx, row){
            var item = grid.dataItem(row);
            if(item.reqQty > item.avlbStockQty){
                issueReqCheckCnt++;
            }
            if(item.itemCd == ""){
                issueReqItemCheckCnt++;
            }
            if(item.giStrgeCd == ""){
                issueReqGiStrgeCdCheckCnt++;
            }
            if(item.giLocCd == ""){
                issueReqGiLocCdCheckCnt++;
            }
            if(item.dbYn == "N"){
                issueReqDbYnCnt++;
            }
            dateItems.push(item);
        });

        if(issueReqItemCheckCnt > 0){
            //itemCd check message.
            dms.notification.info("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.issueCheckMsg' arguments='${itemCd}' />");
            return false;
        }

        if(issueReqGiStrgeCdCheckCnt > 0){
            //giStrgeCd check message
            dms.notification.info("<spring:message code='par.lbl.giStrgeCd' var='giStrgeCd' /><spring:message code='par.info.issueCheckMsg' arguments='${giStrgeCd}' />");
            return false;
        }

        if(issueReqGiLocCdCheckCnt > 0){
            //giLocCd check message
            dms.notification.info("<spring:message code='par.lbl.giLocCd' var='giLocCd' /><spring:message code='par.info.issueCheckMsg' arguments='${giLocCd}' />");
            return false;
        }

        if(issueReqDbYnCnt > 0){
            //is Save Run message
            dms.notification.info("<spring:message code='global.info.isSaveRun' />");
            return false;
        }
        if(issueReqCheckCnt > 0){
            //order Req popup show.
            selectIssueReqPopupButtonWindow();
        }else{
            //receive Popup show.
            selectIssueReceivePopupButtonWindow(grid, tabIndex);
        }

    }else{
        // input value check message.
        dms.notification.warning("<spring:message code='global.info.check.input'/>");
    }
}
//updateIssuePartsSaves Func.
function updateIssuePartsSaves(){
    var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
    rows = grid.dataSource.data();

    var dateItems = [ ];
    var issueReqItemCheckCnt = 0;
    //checked list
    $.each(rows, function(idx, row){
        var item = row;
        if(item.itemCd == ""){
            issueReqItemCheckCnt++;
        }
        dateItems.push(item);
    });

    if(issueReqItemCheckCnt > 0){
        // itemCd check message.
        dms.notification.info("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.issueCheckMsg' arguments='${itemCd}' />");
        return false;
    }

    var multiIssueReqDetails = grid.getCUDData("insertList", "updateList", "deleteList");
    if(grid.cudDataLength == 0){
        dms.notification.info("<spring:message code='global.info.required.change'/>");
        return;
    }

    var issueReqDetailSaveVO = {
        "issueReqVO":{
            "dlrCd":null
            ,"parReqDocNo":$("#parReqDocNo").val()
            ,"parGiTp":$("#parGiTp").val()
            ,"parReqStatCd":"01"
            ,"cancYn":"N"
            ,"roDocNo":$("#roDocNo").val()
            ,"resvDocNo":$("#resvDocNo").val()
            ,"pltCd":null
            ,"serPrsnId":$("#serPrsnId").val()
            ,"custCd":$("#custCd").val()
            ,"custNm":$("#custNm").val()
            ,"vinNo":$("#vinNo").val()
            ,"carNo":$("#carNo").val()
            ,"carlineCd":null
            ,"giDocNo":null
            ,"giDocTp":null
            ,"giDocStatCd":null
        }
        ,"issueReqDetailVO":multiIssueReqDetails
        ,"repairOrderLaborVO":$("#targetLbrGrid").data("kendoExtGrid").dataSource.data()
    }

    $.ajax({
        url:"<c:url value='/par/ism/issueReq/multiIssueReqDetails.do' />"
        ,data:JSON.stringify(issueReqDetailSaveVO)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR,status,error){
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
        ,success:function(jqXHR, textStatus){
            // destroy data clear and data reload
            grid.dataSource._destroyed = [];
            grid.dataSource.read();
            // success message
            dms.notification.success("<spring:message code='global.info.success'/>");
        }
    });
}
//updateIssueInvReturn(InvCancel) Func
function updateIssueInvReturn(statCd){

    var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
    rows = grid.select();
    rowCnt = rows.length;
    var dateItems = [ ];

    if(rowCnt == 0){
        // line selected message.
        dms.notification.info("<spring:message code='par.lbl.lineNm' var='lineNm' /><spring:message code='global.info.check.field' arguments='${lineNm}' />");
        return;
    }

    if(grid.gridValidation()){
        var issueReqItemCheckCnt = 0;
        var issueReturnCheckCnt = 0;
        var issueReqDbYnCnt = 0;

        //checked list.
        $.each(rows, function(idx, row){
            var item = grid.dataItem(row);

            //TODO:[InBoShim] return  item operate ready.
            if(item.parReqStatCd == "02"){
                if(item.returnQty > item.avlbStockQty){
                    issueReqCheckCnt++;
                }
                if(item.itemCd == ""){
                    issueReqItemCheckCnt++;
                }
                if(item.dbYn == "N"){
                    issueReqDbYnCnt++;
                }
                if(item.parReqStatCd == "02"){
                    issueReturnCheckCnt++;
                }
                dateItems.push(item);
            }
        });

        if(issueReqItemCheckCnt > 0){
            //itemCd check message.
            dms.notification.info("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.issueCheckMsg' arguments='${itemCd}' />");
            return false;
        }

        if(issueReqDbYnCnt > 0){
            //is Save Run message
            dms.notification.info("<spring:message code='global.info.isSaveRun' />");
            return false;
        }
        if(issueReturnCheckCnt > 0){
            //returnQty check message.
            dms.notification.info("<spring:message code='par.lbl.returnQty' var='returnQty' /><spring:message code='par.info.issueCheckMsg' arguments='${returnQty}' />");
            return false;
        }else{
            //return Popup show.
            selectIssueReturnPopupButtonWindow(grid);
        }

    }else{
        // input value check message.
        dms.notification.warning("<spring:message code='global.info.check.input'/>");
    }
}
// reqHeaderChanged
function selectTargetReqHeaderChanged(selectedItem){
    $("#parGiTp").val(parGiTpMap[selectedItem.parGiTp]);//parGiTp
    if(selectedItem.parGiTp == "SR") //giTp Resv(SR)
        buttonEnableDisable(true, selectedItem.parReqStatCd, selectedItem.parGiTp);
    else
        buttonEnableDisable(false, selectedItem.parReqStatCd, selectedItem.parGiTp);
    $("#parReqDocNo").val(selectedItem.parReqDocNo);    //parReqDocNo
    $("#roDocNo").val(selectedItem.roDocNo);            //roDocNo
    $("#parGiTp").val(selectedItem.parGiTp);            //parGiTp
    $("#resvDocNo").val(selectedItem.resvDocNo);        //resvDocNo
    $("#parReqStatCd").val(selectedItem.parReqStatCd);  //parReqStatCd
    $("#parReqStatNm").val(partsParReqStatCdMap[selectedItem.parReqStatCd]);  //parReqStatNm
    $("#reqStartDt").val(kendo.toString(kendo.parseDate(selectedItem.regDt), "<dms:configValue code='dateFormat' />"));     // regDt
    $("#custCd").val(selectedItem.custCd);              //custCd
    $("#custNm").val(selectedItem.custNm);              //custNm
    $("#carNo").val(selectedItem.carNo);                //carNo
    $("#vinNo").val(selectedItem.vinNo);                //vinNo
    $("#serPrsnId").val(selectedItem.serPrsnId);        //serPrsnId
    //targetLbrGrid
    $("#targetLbrGrid").data("kendoExtGrid").dataSource.read();
    //tergetReqDetailGrid
    $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.read();
}
// targetReqDetailGrid Change Func
function targetReqDetailGridChanged(){
    var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
    // k-state-selected add all
    grid.tbody.find('>tr').each(function(){
        var dataItem = grid.dataItem(this);
        if(dataItem.dirty)
            $(this).addClass("k-state-selected");
    });
}
//package popup Func
var selectIssueWorkPackagePopup;
function selectWorkPackagePopupWindow(){
    selectIssueWorkPackagePopup = dms.window.popup({
        windowId:"selectIssueWorkPackagePopup"
        ,width:700
        ,height:350
        ,title:"<spring:message code='par.lbl.pakage' />"   //pakage
        ,content:{
            url:"<c:url value='/par/cmm/selectIssuePackageWorkPopup.do'/>"
            ,data:{
                "autoBind":true
                ,"selectable":"multiple"
                ,"callbackFunc":function(parData, lbrData){
                    //partItems, lbrItems Add Func call
                    setPartsItemsAndLbrItems(parData, lbrData);

                    selectIssueWorkPackagePopup.close();


                }
            }
        }
    });
}
//PartItemLbrItem Add Func
function setPartsItemsAndLbrItems(parData, lbrData){
    //parts Item add
    for(var i=0; i<parData.length; i++){
        var data = parData[i];
        var sRnum = 1;
        var itemCheckCnt = 0;
        var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
        grid.tbody.find('>tr').each(function(){
            var dataItem = grid.dataItem(this);
            var vRoLineNoFr = dataItem.roLineNo;
            if(sRnum < vRoLineNoFr){
                sRnum = vRoLineNoFr;
            }
            sRnum = sRnum + 1;
            if(dataItem.itemCd === data.itemCd){
                itemCheckCnt++;
            }

        });

        if(itemCheckCnt === 0){
            var IssueReqDetailVO = {
                "rnum":sRnum
                ,"dlrCd":null
                ,"pltCd":null
                ,"parReqDocNo":$("#parReqDocNo").val()
                ,"parReqDocLineNo":sRnum
                ,"parReqStatCd":"01"
                ,"purcReqNo":"01"
                ,"reqStrgeCd":""
                ,"cancYn":"N"
                ,"parGiTp":$("#parGiTp").val()
                ,"roDocNo":$("#roDocNo").val()
                ,"roLineNo":sRnum
                ,"resvDocNo":$("#resvDocNo").val()
                ,"resvDocLineNo":sRnum
                ,"grStrgeCd":""
                ,"giStrgeCd":""
                ,"giLocCd":""
                ,"dbItemCd":data.itemCd
                ,"pkgItemCd":data.pkgItemCd
                ,"itemCd":data.itemCd
                ,"itemNm":data.itemNm
                ,"unitCd":data.stockUnitCd
                ,"reqQty":1
                ,"endQty":1
                ,"avlbStockQty":null
                ,"resvStockQty":null
                ,"clamStockQty":null
                ,"grScheQty":null
                ,"giScheQty":null
                ,"resvQty":1
                ,"purcReqDt":null
                ,"giDocNo":null
                ,"giDocTp":null
                ,"giDocStatCd":null
                ,"dbYn":"N"
                ,"itemPrc":data.itemPrc
                ,"taxAmt":data.itemAmt
                ,"taxDdctAmt":data.itemAmt
                ,"taxAmt":null
                ,"receiveDt":null
                ,"receiveId":null
                ,"returnPartsQty":null
                ,"returnDt":null
                ,"returnId":null
            }
            $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.add(IssueReqDetailVO).set("dirty", true);
        }
    }
    //lbr Item add
    for(var j=0; j<lbrData.length; j++){
        var data = lbrData[j];
        if(data.lbrCd !== ""){
            var itemCheckCnt = 0;
            var lbrGrid = $("#targetLbrGrid").data("kendoExtGrid");
            var sRnum = lbrGrid.dataSource.total();
            lbrGrid.tbody.find('>tr').each(function(){
                var dataItem = lbrGrid.dataItem(this);
                if(dataItem.lbrCd === data.lbrCd){
                    itemCheckCnt++;
                }
            });

            if(itemCheckCnt === 0){
                var lbrVO = {
                    rnum:sRnum + 1
                    ,dlrCd:null
                    ,roTp:"01"
                    ,roDocNo:$("#roDocNo").val()
                    ,lbrCd:data.lbrCd
                    ,lbrNm:data.lbrNm
                    ,lbrTp:data.lbrTp
                    ,lbrPrc:data.lbrPrc
                    ,lbrHm:data.lbrHm
                    ,dstbHm:null
                    ,dcAmt:null
                    ,expcLbrAmt:null
                    ,payCmpNm:null
                    ,remark:null
                    ,lineNo:null
                }
                $("#targetLbrGrid").data("kendoExtGrid").dataSource.add(lbrVO);
            }
        }
    }
}
//item search popup Func
var selectShareStockGiItemPopupWindow;
function selectPartsMasterPopupWindow(){

    selectShareStockGiItemPopupWindow = dms.window.popup({
        windowId:"selectShareStockGiItemPopupWindow"
        ,width:900
        ,height:550
        ,title:""
        ,content:{
            url:"<c:url value='/par/cmm/selectShareStockGiItemPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"itemCd":$("#sItemCd").val()
                ,"selectable":"multiple"
                ,"callbackFunc":function(data){
                    if(data.length > 0){
                        setPartsItemsAndLbrItems(data,[{}]);
                    }
                }
            }
        }
    });
}
function selectCellPartsMasterPopupWindow(){
    searchItemPopupWindow = dms.window.popup({
        windowId:"searchItemPopupWindow"
        ,title:"<spring:message code='par.title.itemInfo' />"   // itemInfo
        ,content:{
            url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"autoClose":true
                ,"itemCd":$("#sItemCd").val()
                ,"callbackFunc":function(data){
                    if(data.length > 0){
                        var bCheck = false;
                        var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
                        var dataItemList = grid.dataSource._data;

                        for(var i = 0;i < dataItemList.length ;i++){
                            if(dataItemList[i].itemCd !== "" && dataItemList[i].itemCd == data[0].itemCd){
                                bCheck = true;
                                break;
                            }
                        }

                        if(!bCheck){
                            var rows = grid.tbody.find("tr");

                            rows.each(function(index, row) {
                                //var dataItem = $("#targetReqDetailGrid").data("kendoExtGrid").dataSource._data;

                                console.log("index:"+index);

                                if(index == 0){

                                    var dataItem = grid.dataItem(row);
                                    dataItem.itemCd = data[0].itemCd;
                                    if(dataItem.dbItemCd == ""){
                                        dataItem.dbItemCd = data[0].itemCd;
                                    }

                                    dataItem.itemNm = data[0].itemNm;
                                    dataItem.unitCd = data[0].stockUnitCd;
                                    dataItem.giStrgeCd = data[0].giStrgeCd;
                                    dataItem.grStrgeCd = data[0].grStrgeCd;
                                    //console.log("reqStrgeCd:"+data[0].reqStrgeCd);
                                    if(data[0].reqStrgeCd === null){
                                        dataItem.reqStrgeCd = "-";
                                    }else{
                                        dataItem.reqStrgeCd = data[0].reqStrgeCd;
                                    }
                                    dataItem.avlbStockQty = 0;
                                    dataItem.resvStockQty = 0;
                                    dataItem.clamStockQty = 0;
                                    dataItem.grScheQty = 0;
                                    dataItem.giScheQty = 0;

                                    //selectStockInOutByKey get data
                                    /* $.ajax({
                                        url:"<c:url value='/par/stm/stockInOut/selectStockInOutByKey.do' />"
                                        ,data:JSON.stringify({sStrgeCd:data[0].giStrgeCd, sItemCd:data[0].itemCd})
                                        ,type:'POST'
                                        ,dataType:'json'
                                        ,contentType:'application/json'
                                        ,async:false
                                        ,error:function(jqXHR,status,error){

                                        }
                                        ,success:function(jqXHR, textStatus){
                                            dataItem[index].avlbStockQty = jqXHR.avlbStockQty;
                                            dataItem[index].resvStockQty = jqXHR.resvStockQty;
                                            dataItem[index].clamStockQty = jqXHR.clamStockQty;
                                            dataItem[index].grScheQty = jqXHR.grScheQty;
                                            dataItem[index].giScheQty = jqXHR.giScheQty;
                                        }
                                    }); */

                                    dataItem.dirty = true;
                                }
                            });

                            grid.refresh();

                        }else{
                            // message
                            dms.notification.info("<spring:message code='global.info.already' />");
                        }
                    }
                }
            }
        }
    });
}
/**
* hyperlink in grid event
*/
$(document).on("click", ".linkRoNo", function(e){
     var thisName = $(this).data("name");
     var grid = $("#targetReqHeaderGrid").data("kendoExtGrid"),
     row = $(e.target).closest("tr");
     // k-state-selected remove all
     grid.tbody.find('>tr').each(function(){
        $(this).removeClass("k-state-selected");
     });
     // k-state-selected add
     row.addClass("k-state-selected");
     var dataItem = grid.dataItem(row);
     selectTargetReqHeaderChanged(dataItem);
     // Ro detail tab window open
     window.parent._createOrReloadTabMenu("<spring:message code='ser.menu.roMng' />", "<c:url value='/ser/ro/repairOrder/selectRepairOrderMain.do' />?roDocNo="+dataItem.roDocNo+"&parReqStatCd="+dataItem.parReqStatCd, "VIEW-I-10319"); // RO Main
 });

    $(document).ready(function() {
        //btnInvReq
        $("#btnInvReq").kendoButton({
            enable:false
            ,click:function(e){
                //updateIssuePartsInves Func call
                updateIssuePartsInves();
            }
        });
        // btnInvCancel
        $("#btnInvCancel").kendoButton({
            enable:false
            ,click:function(e){
                //updateIssueInvReturn(InvCancel) Func call
                //updateIssueInvReturn("03");
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });
        //btnPrint
        $("#btnPrint").kendoButton({
            enable:false
            ,click:function(e){
                //selectIssueReceivePrintPopupButtonWindow Func call
                selectIssueReceivePrintPopupButtonWindow();
            }
        });
        //btnInit
        $("#btnInit").kendoButton({
            enable:true
            ,click:function(e){
                //pageInit Func call
                pageInit();
            }
        });
        // btnInvReqSave
        $("#btnInvReqSave").kendoButton({
            enable:false
            ,click:function(e){
                //updateIssuePartsSaves Func call
                updateIssuePartsSaves();
            }
        });
        // btnSearch.
        $("#btnSearch").kendoButton({
            enable:true
            ,click:function(e){
                // reqEndDt value not empty
                if($("#sReqEndDt").val() != ""){
                    // reqEndDt value empty
                    if($("#sReqStartDt").val() == ""){
                        // sReqStartDt value check message
                        dms.notification.info("<spring:message code='par.lbl.regStartDt' var='regStartDt' /><spring:message code='global.info.emptyCheckParam' arguments='${regStartDt}' />");
                        return false;
                    }
                }
                // reqHeaderGrid datasource read.
                $("#targetReqHeaderGrid").data("kendoExtGrid").dataSource.read();
            }
        });
        //btnPakage
        $("#btnPakage").kendoButton({
            enable:false
            ,click:function(e){
                //selectWorkPackagePopupWindow Func call
                selectWorkPackagePopupWindow();
            }
        });
        //btnSubPartsSelect
        $("#btnSubPartsSelect").kendoButton({
            enable:false
            ,click:function(e){
                //selectShareItemPopupButtonWindow Func call.
                selectShareItemPopupButtonWindow();
            }
        });
        //btnInPartsHistory
        $("#btnInPartsHistory").kendoButton({
            enable:false
            ,click:function(e){
                //selectStockGrItemPopupButtonWindow Func call.
                selectStockGrItemPopupButtonWindow();
            }
        });
        // btnOrderReq
        $("#btnOrderReq").kendoButton({
            enable:false
            ,click:function(e){
                // RO OrderReq
                updateIssuePartsRoes();
            }
        });
        //btnCopyFromExcel
        $("#btnCopyFromExcel").kendoButton({
            enable:false
            ,click:function(e){
              //excel file copy
                var data = dms.string.parseClipboardDataToExcelFormat();
                if(data === undefined || data.length === 0) {
                    //excel copy data empty message.
                    dms.notification.info("<spring:message code='par.lbl.excelCopyData' var='excelCopyData' /><spring:message code='par.info.itemInsertNotMsg' arguments='${excelCopyData}' />");
                    return false;
                }

                for(var i=0; i<data.length; i++){
                    var cells = data[i];

                    var itemCheckCnt = 0;
                    var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
                    grid.tbody.find('>tr').each(function(){
                        var dataItem = grid.dataItem(this);
                        if(dataItem.itemCd === cells[0]){
                            itemCheckCnt++;
                        }
                    });

                    if(itemCheckCnt === 0){
                        var total = $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.total()+1;

                        //selectIssuePartsOutDetailInfoByKey get data
                        $.ajax({
                            url:"<c:url value='/par/ism/issueReq/selectIssuePartsOutDetailInfoByKey.do' />"
                            ,data:JSON.stringify({sItemCd:cells[0]})
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,async:false
                            ,error:function(jqXHR,status,error){

                            }
                            ,success:function(jqXHR, textStatus){

                                var IssueReqDetailVO = {
                                    "rnum":total
                                    ,"dlrCd":null
                                    ,"pltCd":null
                                    ,"parReqDocNo":$("#sParReqDocNo").val()
                                    ,"parReqDocLineNo":total
                                    ,"parReqStatCd":"01"
                                    ,"purcReqNo":"01"
                                    ,"reqStrgeCd":""
                                    ,"cancYn":"N"
                                    ,"parGiTp":$("#sParGiTp").val()
                                    ,"roDocNo":""
                                    ,"roLineNo":total
                                    ,"resvDocNo":""
                                    ,"resvDocLineNo":total
                                    ,"grStrgeCd":jqXHR.giStrgeCd
                                    ,"giStrgeCd":jqXHR.giStrgeCd
                                    ,"giLocCd":jqXHR.giLocCd
                                    ,"dbItemCd":cells[0]
                                    ,"pkgItemCd":data.pkgItemCd
                                    ,"itemCd":cells[0]
                                    ,"itemNm":jqXHR.itemNm
                                    ,"unitCd":data.stockUnitCd === "" ? "EA":data.stockUnitCd
                                    ,"reqQty":cells[1]
                                    ,"endQty":0
                                    ,"avlbStockQty":jqXHR.avlbStockQty
                                    ,"resvStockQty":jqXHR.resvStockQty
                                    ,"clamStockQty":jqXHR.clamStockQty
                                    ,"grScheQty":jqXHR.grScheQty
                                    ,"giScheQty":jqXHR.giScheQty
                                    ,"resvQty":cells[1]
                                    ,"purcReqDt":null
                                    ,"giDocNo":null
                                    ,"giDocTp":null
                                    ,"giDocStatCd":null
                                    ,"giStatCd":$("#sEtcGiTp").val()
                                    ,"dbYn":"N"
                                    ,"itemPrc":jqXHR.itemPrc
                                    ,"itemAmt":jqXHR.itemAmt
                                    ,"taxDdctAmt":jqXHR.itemPrc + (jqXHR.itemPrc * 0.16)
                                    ,"taxAmt":jqXHR.itemPrc * 0.16
                                    ,"receiveDt":null
                                    ,"receiveId":null
                                    ,"returnPartsQty":null
                                    ,"returnDt":null
                                    ,"returnId":null
                                }
                                $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.add(IssueReqDetailVO).set("dirty", true);
                            }
                        });
                    }
                }
            }
        });
        //btnPartsAdd
        $("#btnPartsAdd").kendoButton({
            enable:false
            ,click:function(e){
                // TODO:[InBoShim] sub parts popup not linked
                // ready message
                //dms.notification.info("<spring:message code='global.info.ready' />");
                selectPartsMasterPopupWindow();
            }
        });
        // btnResvReq
        $("#btnResvReq").kendoButton({
            enable:false
            ,click:function(e){
                // Resv Req.
                updateIssuePartsResves();
            }
        });
        // btnAvlbReq.
        $("#btnAvlbReq").kendoButton({
            enable:false
            ,click:function(e){
                // TODO:[InBoShim] is not Func
                // Avlb Req
                //updateIssuePartsAvlbes();
                // ready message
                dms.notification.info("<spring:message code='global.info.ready' />");
            }
        });
        // btnAdd
        $("#btnAdd").kendoButton({
            enable:false
            ,click:function(e){
                var sRnum = 1;
                var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
                grid.tbody.find('>tr').each(function(){
                    var dataItem = grid.dataItem(this);
                    var vRoLineNoFr = dataItem.roLineNo;

                    if(sRnum < vRoLineNoFr){
                        sRnum = vRoLineNoFr;
                    }
                    sRnum = sRnum + 1;
                });

                var IssueReqDetailVO = {
                    "rnum":sRnum
                    ,"dlrCd":null
                    ,"pltCd":null
                    ,"parReqDocNo":$("#parReqDocNo").val()
                    ,"parReqDocLineNo":sRnum
                    ,"parReqStatCd":"01"
                    ,"purcReqNo":"01"
                    ,"reqStrgeCd":""
                    ,"cancYn":"N"
                    ,"parGiTp":$("#parGiTp").val()
                    ,"roDocNo":$("#roDocNo").val()
                    ,"roLineNo":sRnum
                    ,"resvDocNo":$("#resvDocNo").val()
                    ,"resvDocLineNo":sRnum
                    ,"grStrgeCd":""
                    ,"giStrgeCd":""
                    ,"giLocCd":""
                    ,"dbItemCd":""
                    ,"pkgItemCd":""
                    ,"itemCd":""
                    ,"itemNm":""
                    ,"unitCd":""
                    ,"reqQty":1
                    ,"endQty":1
                    ,"avlbStockQty":null
                    ,"resvStockQty":null
                    ,"clamStockQty":null
                    ,"grScheQty":null
                    ,"giScheQty":null
                    ,"resvQty":1
                    ,"purcReqDt":null
                    ,"giDocNo":null
                    ,"giDocTp":null
                    ,"giDocStatCd":null
                    ,"dbYn":"N"
                    ,"itemPrc":null
                    ,"itemAmt":null
                    ,"taxDdctAmt":null
                    ,"taxAmt":null
                    ,"receiveDt":null
                    ,"receiveId":null
                    ,"returnPartsQty":null
                    ,"returnDt":null
                    ,"returnId":null
                }
                $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.insert(0, IssueReqDetailVO);
            }
        });
        // btnDel
        $("#btnDel").kendoButton({
            enable:false
            ,click:function(e){
                var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
                var rows = grid.select();
                var rowCnt = rows.length;

                if(rowCnt > 0){
                    rows.each(function(index, row) {
                        grid.removeRow(row);
                    });

                    // rnum, parDocLineNo, roLineNo update
                    var dataItemList = grid.dataSource._data;
                    var j= 0;
                    for(var i = 0; i < dataItemList.length; i++){
                        dataItemList[i].rnum = j+1;
                        dataItemList[i].parReqDocLineNo = j+1;
                        dataItemList[i].roLineNo = j+1;
                        dataItemList[i].dirty = true;
                    }
                    grid.refresh();
                }
                else{
                    // delete item check message
                    dms.notification.info("<spring:message code='par.lbl.delItem' var='delItemMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${delItemMsg}' />");
                }
            }
        });
        // sParGiTp dropdownlist
        $("#sParGiTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:parGiTpList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        // parReqSattCd dropdownlist
        $("#sParReqStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:partsParReqStatCdList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        // reqStartDt datepicker
        $("#sReqStartDt").kendoExtMaskedDatePicker({
            value:new Date("${sysStartDate}")
            ,format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        // reqEndDt datepicker
        $("#sReqEndDt").kendoExtMaskedDatePicker({
            value:new Date("${sysEndDate}")
            ,format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        // tabStrip
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select:function(e) {
                var selectTabId = e.item.id;
            }
        });
        //targetReqHederGrid.
        $("#targetReqHeaderGrid").kendoExtGrid({
            gridId:"G-PAR-0808-153201"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;

                            var sParGiTp = $("#sParGiTp").val() == "" ? "RO":$("#sParGiTp").val();
                            params["sParGiTp"] = sParGiTp;                              //sParGiTp
                            params["sRoDocNo"] = $("#sParReqDocNo").val();              //sParReqDocNo.
                            params["sParReqStatCd"] = $("#sParReqStatCd").val();        //sParReqStatCd.
                            params["sReqStartDt"] = $("#sReqStartDt").data("kendoExtMaskedDatePicker").value();     //sReqStartDt
                            params["sReqEndDt"] = $("#sReqEndDt").data("kendoExtMaskedDatePicker").value();         //sReqEndDt
                            params["sCustCd"] = $("#sCustCd").val();                    //sCustCd.
                            params["sCustNm"] = $("#sCustNm").val();                    //sCustNm.
                            params["sSerPrsnId"] = $("#sSerPrsnId").val();              //sSerPrsnId.
                            params["sCarNo"] = $("#sCarNo").val();                      //sCarNo.

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"itemCd"
                        ,fields:{
                            rnum:{ type:"number" , validation:{required:true} }
                            ,dlrCd:{ type:"string" , validation:{required:true} }
                            ,pltCd:{ type:"string" }
                            ,itemCd:{ type:"string" , validation:{required:true} }
                            ,itemNm:{ type:"string" , validation:{required:true} }
                            ,regUsrId:{ type:"string" }
                            ,regDt:{ type:"date" }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"date" }
                        }
                    }
                }
            }
            ,editable:false
            ,pageable:false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    selectTargetReqHeaderChanged(selectedItem);
                }
            }
            ,dataBound:function(e) {
                $("#targetLbrGrid").data("kendoExtGrid").dataSource.read();
                $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.read();
            }
            ,height:173
            ,columns :
                [{ field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 }//rnum
                ,{ field:"parReqStatCd", title:"<spring:message code='par.lbl.parReqStatNm'/>"
                    ,width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.parReqStatCd){
                            case "02":// ok
                                spanObj = "<span class='txt_label bg_blue'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            case "03":// cancel
                                spanObj = "<span class='txt_label bg_red'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            default: // ready:request
                                spanObj = "<span class='txt_label bg_gray'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }//parReqStatCd
                ,{ field:"regDt", title:"<spring:message code='par.lbl.issueReqDt'/>", format:"{0:<dms:configValue code='dateFormat' />}", width:100 }//regDt
                ,{ field:"parGiTp", title:"<spring:message code='par.lbl.parGiTp'/>"
                    ,width:120
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.parGiTp){
                            case "SR"://SR
                                spanObj = "<span class='txt_label bg_yellow'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                            case "RO"://RO
                                spanObj = "<span class='txt_label bg_green'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                            case "SA"://SA(Parts Sale)
                                spanObj = "<span class='txt_label bg_blue'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                            default: // ready:request
                                spanObj = "<span class='txt_label bg_gray'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }//parGiTp
                ,{ field:"roDocNo", title:"<spring:message code='par.lbl.parReqDocNo'/>", width:130
                    ,template:function(dataItem){
                        var spanObj = "<a href='#' class='linkRoNo'>"+dataItem.roDocNo+"</a>";
                        return spanObj;
                    }
                } //roDocNo
                ,{ field:"custNm", title:"<spring:message code='par.lbl.custNm'/>", width:100 }//custNm
                ,{ field:"carNo", title:"<spring:message code='par.lbl.carNo'/>", width:100 }//carNo
                ,{ field:"carlineCd", title:"<spring:message code='par.lbl.carLine'/>", width:100 }//carlineCd
                ,{ field:"serPrsnId", title:"<spring:message code='par.lbl.serPrsnId'/>", width:100 }//serPrsnId
                ,{ field:"bigo", title:"<spring:message code='par.lbl.remark'/>", width:100 }//bigo
            ]
        });
        //targetLbrGrid.
        $("#targetLbrGrid").kendoExtGrid({
            gridId:"G-PAR-0808-153401"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/ser/ro/repairOrder/selectRepairOrderLabors.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;
                            var sRoDocNo = $("#roDocNo").val() == "" ? "X":$("#roDocNo").val();
                            params["sRoDocNo"] = sRoDocNo;

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                            rnum:{type:"number", editable:false}
                            ,roTp:{type:"string", validation:{required:true}}
                            ,roDocNo:{type:"string", validation:{required:true}}
                            ,dlrCd:{type:"string", editable:false}
                            ,lbrCd:{type:"string", editable:false}
                            ,lbrNm:{type:"string", editable:false}
                            ,lbrTp:{type:"string", editable:false}
                            ,lbrTime:{type:"string", editable:false}
                            ,lbrPrc:{type:"number"}
                        }
                    }
                }
            }
            ,height:150
            ,pageable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,editable:false
            ,columns:[
                {field:"lbrCd", title:"<spring:message code='par.lbl.lbrCd' />", width:100}
                ,{field:"lbrNm", title:"<spring:message code='par.lbl.lbrNm' />", width:200}
                ,{field:"lbrTp", title:"<spring:message code='par.lbl.lbrTp' />", width:100}
                ,{field:"lbrTime", title:"<spring:message code='par.lbl.lbrTime' />", width:100}
                ,{field:"lbrPrc", title:"<spring:message code='par.lbl.lbrPrc' />", width:100, attributes:{"class":"ar"}, format:"{0:n0}"}
                ,{field:"lbrHm", title:"<spring:message code='par.lbl.lbrHm' />", width:70, attributes:{"class":"ar"} }
            ]
        });
        //targetReqDetailGrid.
        $("#targetReqDetailGrid").kendoExtGrid({
            gridId:"G-PAR-0808-153301"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqDetailes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;

                            var parReqDocNo = $("#parReqDocNo").val() == "" ? "X":$("#parReqDocNo").val();
                            params["sParReqDocNo"] = parReqDocNo;
                            params["sCancYn"] = "N";

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"parReqDocLineNo"
                        ,fields:{
                            rnum:{ type:"number", validation:{required:true}, editable:false }
                            ,dlrCd:{ type:"string", validation:{required:true}, editable:false }
                            ,pltCd:{ type:"string", validation:{required:true}, editable:false }
                            ,parReqDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,parReqDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,parReqStatCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,purcReqNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqStrgeCd:{ type:"string" , validation:{required:true} }
                            ,cancYn:{ type:"string" , validation:{required:true}, editable:false }
                            ,parGiTp:{ type:"string" , validation:{required:true}, editable:false }
                            ,roDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,roLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,giCauNm:{ type:"string" , validation:{required:true}, editable:true }
                            ,resvDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,giLocCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,dbItemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,pkgItemCd:{ type:"string", editable:false }
                            ,itemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:true }
                            ,unitCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,reqQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,endQty:{ type:"number" , validation:{required:true}, editable:true }
                            ,avlbStockQty:{ type:"number", editable:false }
                            ,resvStockQty:{ type:"number", editable:false }
                            ,clamStockQty:{ type:"number", editable:false }
                            ,grScheQty:{ type:"number", editable:false }
                            ,giScheQty:{ type:"number", editable:false }
                            ,resvQty:{ type:"number", editable:true }
                            ,purcReqDt:{ type:"date" , editable:false }
                            ,giDocNo:{ type:"string" , editable:false }
                            ,giDocTp:{ type:"string" , editable:false }
                            ,giDocStatCd:{ type:"string" , editable:false }
                            ,dbYn:{ type:"string" , editable:false }
                            ,itemPrc:{ type:"number" , editable:false }
                            ,itemAmt:{ type:"number" , editable:false }
                            ,taxDdctAmt:{ type:"number" , editable:false }
                            ,taxAmt:{ type:"number" , editable:false }
                            ,receiveDt:{ type:"date" , editable:false }
                            ,receiveId:{ type:"string" , editable:false }
                            ,returnPartsQty:{ type:"number" , editable:false }
                            ,returnDt:{ type:"date" , editable:false }
                            ,returnId:{ type:"string" , editable:false }
                            ,etcGiTp:{ type:"string" , editable:true }
                        }
                    }
                }
            }
            ,edit:function(e){
                var grid = this,
                fieldName = grid.columns[e.container.index()].field;
                // complete close cell
                if (e.model.parReqStatCd == "02") {
                    if(fieldName=="itemCd" || fieldName=="itemNm" || fieldName=="unitCd" || fieldName=="resvQty" || fieldName=="giStrgeCd" || fieldName=="giLocCd"){
                        this.closeCell();
                    }
                }else{
                    if(fieldName=="itemNm" || fieldName=="unitCd"){
                        this.closeCell();
                    }
                }
            }
            ,height:150
            ,pageable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,multiSelectWithCheckbox:true
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();
                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if( dataItem != null && dataItem != 'undefined'){
                        // parReqStatCd 02 checkbox remove
                        if(dataItem.parReqStatCd !== "01"){
                            var multiCheckBox = e.sender.tbody.find(".grid-checkbox-item[data-uid='" + dataItem.uid + "']");
                            multiCheckBox.remove();
                        }
                        // TODO:[InBoShim] cell calss add or remove
                        /* var reqQty = row.children().eq(6);
                        reqQty.addClass("bg_blue");

                        var endQty = row.children().eq(7);
                        // endQty <> reqQty or endQty  <> resvQty
                        if(dataItem.endQty != dataItem.reqQty || dataItem.endQty != dataItem.resvQty){
                            endQty.addClass("bg_red");
                        }

                        var avlbStockQty = row.children().eq(8);
                        // avlbStockQty < 0 or avlbStockQty < reqQty
                        if(dataItem.avlbStockQty < 0 || dataItem.avlbStockQty < dataItem.reqQty){
                            avlbStockQty.addClass("bg_red");
                        }

                        var grScheQty = row.children().eq(9);
                        if(dataItem.grScheQty <= 0) // grScheQty  <= 0
                        {
                            grScheQty.addClass("bg_red");
                        }

                        var resvQty = row.children().eq(10);
                        resvQty.addClass("bg_blue"); */
                    }
                });
            }
            ,change:function(e) {
                /* var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
                var dataItem = grid.dataItem(grid.select());
                if( dataItem != null && dataItem != 'undefined'){
                    // complete k-state-selected remove
                    if(dataItem.parReqStatCd !== "01"){
                        $(grid.select()).removeClass("k-state-selected");
                    }
                    // dirty targetReqDetailGridChanged Func Call
                    if(dataItem.dirty){
                      targetReqDetailGridChanged();
                    }
                } */
            }
            /*
            , copyFromExcel:function(data) {

                if($("#parReqDocNo").val() === ""){
                    // parReqDocNo select message
                    dms.notification.info("<spring:message code='par.lbl.parReqDocNo' var='parReqDocNo' /><spring:message code='global.info.check.field' arguments='${parReqDocNo}' />");
                    return false;
                }
                if($("#parReqStatCd").val() === "03"){
                    // parReqDocNo select message
                    dms.notification.info("<spring:message code='global.lbl.registration' var='registration' /><spring:message code='par.lbl.copyExcel' var='copyExcel' /><spring:message code='global.info.possible' arguments='${registration},${copyExcel}' />");
                    return false;
                }

                for(var i=0; i<data.length; i++){
                    var cells = data[i];

                    var sRnum = 1;
                    var itemCheckCnt = 0;
                    var grid = $("#targetReqDetailGrid").data("kendoExtGrid");
                    grid.tbody.find('>tr').each(function(){
                        var dataItem = grid.dataItem(this);
                        var vRoLineNoFr = dataItem.roLineNo;
                        if(sRnum < vRoLineNoFr){
                            sRnum = vRoLineNoFr;
                        }
                        sRnum = sRnum + 1;
                        if(dataItem.itemCd === cells[0]){
                            itemCheckCnt++;
                        }

                    });

                    if(itemCheckCnt === 0){
                        var IssueReqDetailVO = {
                            "rnum":sRnum
                            ,"dlrCd":null
                            ,"pltCd":null
                            ,"parReqDocNo":$("#parReqDocNo").val()
                            ,"parReqDocLineNo":sRnum
                            ,"parReqStatCd":"01"
                            ,"purcReqNo":"01"
                            ,"reqStrgeCd":""
                            ,"cancYn":"N"
                            ,"parGiTp":$("#parGiTp").val()
                            ,"roDocNo":$("#roDocNo").val()
                            ,"roLineNo":sRnum
                            ,"resvDocNo":$("#resvDocNo").val()
                            ,"resvDocLineNo":sRnum
                            ,"grStrgeCd":""
                            ,"giStrgeCd":""
                            ,"giLocCd":""
                            ,"dbItemCd":cells[0]
                            ,"pkgItemCd":""
                            ,"itemCd":cells[0]
                            ,"itemNm":""
                            ,"unitCd":""
                            ,"reqQty":cells[1]
                            ,"endQty":0
                            ,"avlbStockQty":null
                            ,"resvStockQty":null
                            ,"clamStockQty":null
                            ,"grScheQty":null
                            ,"giScheQty":null
                            ,"resvQty":cells[1]
                            ,"purcReqDt":null
                            ,"giDocNo":null
                            ,"giDocTp":null
                            ,"giDocStatCd":null
                            ,"dbYn":"N"
                            ,"itemPrc":null
                            ,"itemAmt":null
                            ,"taxDdctAmt":null
                            ,"taxAmt":null
                            ,"receiveDt":null
                            ,"receiveId":null
                            ,"returnPartsQty":null
                            ,"returnDt":null
                            ,"returnId":null
                        }
                        this.dataSource.add(IssueReqDetailVO).set("dirty", true);
                    }
                }
            }
            */
            ,columns :
                [{field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 }
                ,{field:"parReqStatCd", title:"<spring:message code='par.lbl.parReqStatNm'/>"
                    ,width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.parReqStatCd){
                            case "02":// complete
                                spanObj = "<span class='txt_label bg_blue'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            case "03":// cancel
                                spanObj = "<span class='txt_label bg_red'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            default: // ready:request
                                spanObj = "<span class='txt_label bg_gray'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>"
                    ,width:150
                    ,editor:function(container, options){
                        //$('<div class="form_search" style="width:100%"><input required data-bind="value:' + options.field + '" class="form_input" style="width:100%"  /><a href="#" onclick="javascript:selectCellPartsMasterPopupWindow(this);"></a></div>').appendTo(container);
                        $('<input required data-bind="value:' + options.field + '" class="form_input" style="width:100%"  />')
                        .appendTo(container)
                        .kendoMaskedTextBox({
                            change:function(){

                                if(this.value() === "")
                                    return false;

                                var grid = $("#targetReqDetailGrid").data("kendoExtGrid"),
                                model = grid.dataItem(this.element.closest("tr"));

                                //selectIssuePartsOutDetailInfoByKey get data
                                $.ajax({
                                    url:"<c:url value='/par/ism/issueReq/selectIssuePartsOutDetailInfoByKey.do' />"
                                    ,data:JSON.stringify({sItemCd:this.value()})
                                    ,type:'POST'
                                    ,dataType:'json'
                                    ,contentType:'application/json'
                                    ,async:false
                                    ,error:function(jqXHR,status,error){
                                        // itemCd not use check message
                                        dms.notification.info("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.itemInsertNotMsg' arguments='${itemCd}' />");
                                    }
                                    ,success:function(jqXHR, textStatus){
                                       model.set("itemCd", jqXHR.itemCd);
                                       model.set("itemNm", jqXHR.itemNm);
                                       model.set("dbItemCd", jqXHR.itemCd);
                                       model.set("unitCd", jqXHR.unitCd);
                                    }
                                });
                            }
                        });
                    }
                }
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150 }
                ,{field:"pkgItemCd", title:"<spring:message code='par.lbl.package'/>", width:80 }
                ,{field:"reqQty", title:"<spring:message code='par.lbl.reqQty'/>", attributes:{"class":"ar"}, width:80 }
                ,{field:"resvQty", title:"<spring:message code='par.lbl.outQty'/>", attributes:{"class":"ar"}, width:90
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            format:"n0"
                            ,spinners:false
                            ,change:function(){
                                var grid = $("#targetReqDetailGrid").data("kendoExtGrid"),
                                model = grid.dataItem(this.element.closest("tr"));
                                model.set("endQty", this.value());
                            }
                        });
                    }
                }
                ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.avlbStockQty'/>", attributes:{"class":"ar"}, width:80 }
                ,{field:"grScheQty", title:"<spring:message code='par.lbl.strgeStockQty'/>", attributes:{"class":"ar"}, width:90 }
                ,{field:"giStrgeCd", title:"<spring:message code='par.lbl.strge' />", attributes:{"class":"ar"}, width:120
                    ,editor:function(container, options){
                        var input = $('<input id="strgeCd" name="strgeCd" data-bind="value:' + options.field + '"  />')
                        .appendTo(container);

                        input.kendoExtDropDownList({
                            dataTextField:"strgeNm"
                            ,dataValueField:"strgeCd"
                            ,optionLabel:" "
                            ,valuePrimitive:true
                            ,dataSource:giStrgeCdList
                        }).appendTo(container);
                    }
                    ,template:'#if(giStrgeCd !== "" && giStrgeCd !== null){# #= giStrgeCdMap[giStrgeCd]# #}#'
                }
                ,{field:"giLocCd", title:"<spring:message code='par.lbl.locId' />", attributes:{"class":"ar"}, width:120
                    ,editor:function(container, options){
                        //location Array
                        var locCdList = [{"locCd":"", "locNm":""}];
                        <c:forEach var="obj" items="${locCdList}">
                        if(options.model.giStrgeCd === "${obj.strgeCd}" && options.model.itemCd === "${obj.itemCd}"){
                            locCdList.push({
                                "locCd":"${obj.locCd}"
                                ,"locNm":"${obj.locNm}"
                            });
                        }
                        </c:forEach>

                        var input = $('<input id="locCd" name="locCd" data-bind="value:' + options.field + '"  />')
                        .appendTo(container);

                        input.kendoExtDropDownList({
                            dataTextField:"locNm"
                            ,dataValueField:"locCd"
                            ,valuePrimitive:true
                            ,dataSource:locCdList
                        }).appendTo(container);
                    }
                    ,template:'#if(giLocCd !== "" && giLocCd !== null){# #= locCdMap[giLocCd]# #}#'
                }
                ,{field:"itemPrc", title:"<spring:message code='par.lbl.prc' />", attributes:{"class":"ar"}, format:"{0:n2}", width:100 }
                ,{field:"taxDdctAmt", title:"<spring:message code='par.lbl.amt' />", attributes:{"class":"ar"}, format:"{0:n2}", width:100 }
                ,{field:"taxAmt", title:"<spring:message code='par.lbl.taxAmt' />", attributes:{"class":"ar"}, width:80 }
                ,{field:"receiveDt", title:"<spring:message code='par.lbl.receiveDt' />", format:"{0:<dms:configValue code='dateFormat' />}", width:80 }
                ,{field:"receiveDt", title:"<spring:message code='par.lbl.receiveTime' />", format:"{0:HH:mm }", width:80 }
                ,{field:"receiveId", title:"<spring:message code='par.lbl.receiveId' />", width:80 }
                ,{field:"returnPartsQty", title:"<spring:message code='par.lbl.returnPartsQty' />", attributes:{"class":"ar"}, width:80 }
                ,{field:"returnDt", title:"<spring:message code='par.lbl.returnDt' />", format:"{0:<dms:configValue code='dateFormat' />}", width:80 }
                ,{field:"returnDt", title:"<spring:message code='par.lbl.returnTime' />", format:"{0:HH:mm }", width:80 }
                ,{field:"returnId", title:"<spring:message code='par.lbl.returnId' />", width:80 }
            ]
        });
        //targetPartsInnerGrid
        $("#targetPartsInnerGrid").kendoExtGrid({
            gridId:"G-PAR-0808-153402"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqDetailes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;

                            params["sParGiTp"] = "IN";  //sParGiTp
                            params["sEtcGiTp"] = "02";  //sEtcGiTp.
                            params["sReqStartDt"] = $("#sReqStartDt").data("kendoExtMaskedDatePicker").value();     //sReqStartDt
                            params["sReqEndDt"] = $("#sReqEndDt").data("kendoExtMaskedDatePicker").value();         //sReqEndDt
                            params["sCancYn"] = "N";

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"parReqDocLineNo"
                        ,fields:{
                            rnum:{ type:"number", validation:{required:true}, editable:false }
                            ,dlrCd:{ type:"string", validation:{required:true}, editable:false }
                            ,pltCd:{ type:"string", validation:{required:true}, editable:false }
                            ,parReqDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,parReqDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,parReqStatCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,purcReqNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqStrgeCd:{ type:"string" , validation:{required:true} }
                            ,cancYn:{ type:"string" , validation:{required:true}, editable:false }
                            ,parGiTp:{ type:"string" , validation:{required:true}, editable:false }
                            ,roDocNo:{ type:"string" , validation:{required:true}, editable:true }
                            ,roLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,giCauNm:{ type:"string" , validation:{required:true}, editable:true }
                            ,resvDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,giLocCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,dbItemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,pkgItemCd:{ type:"string", editable:false }
                            ,itemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,unitCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqQty:{ type:"number" , validation:{required:true}, editable:true }
                            ,endQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,avlbStockQty:{ type:"number", editable:false }
                            ,resvStockQty:{ type:"number", editable:false }
                            ,clamStockQty:{ type:"number", editable:false }
                            ,grScheQty:{ type:"number", editable:false }
                            ,giScheQty:{ type:"number", editable:false }
                            ,resvQty:{ type:"number", editable:true }
                            ,purcReqDt:{ type:"date" , editable:false }
                            ,giDocNo:{ type:"string" , editable:false }
                            ,giDocTp:{ type:"string" , editable:false }
                            ,giDocStatCd:{ type:"string" , editable:false }
                            ,dbYn:{ type:"string" , editable:false }
                            ,itemPrc:{ type:"number" , editable:false }
                            ,itemAmt:{ type:"number" , editable:true }
                            ,taxDdctAmt:{ type:"number" , editable:true }
                            ,taxAmt:{ type:"number" , editable:true }
                            ,receiveDt:{ type:"date" , editable:false }
                            ,receiveId:{ type:"string" , editable:false }
                            ,returnPartsQty:{ type:"number" , editable:true }
                            ,returnDt:{ type:"date" , editable:false }
                            ,returnId:{ type:"string" , editable:false }
                            ,etcGiTp:{ type:"string" , editable:true }
                        }
                    }
                }
            }
            ,height:150
            ,editable:false
            ,pageable:false
            ,autoBind:true
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,multiSelectWithCheckbox:true
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();
                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if( dataItem != null && dataItem != 'undefined'){
                        // parReqStatCd 02 checkbox remove
                        if(dataItem.parReqStatCd !== "01"){
                            var multiCheckBox = e.sender.tbody.find(".grid-checkbox-item[data-uid='" + dataItem.uid + "']");
                            multiCheckBox.remove();
                        }
                    }
                });
            }
            ,change:function(e) {
            }
            ,columns :
                [{field:"parReqDocNo", title:"<spring:message code='par.lbl.giDocNo'/>", width:100}
                ,{field:"parReqStatCd", title:"<spring:message code='par.lbl.parReqStatCd'/>"
                    ,width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.parReqStatCd){
                            case "02":// complete
                                spanObj = "<span class='txt_label bg_blue'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            case "03":// cancel
                                spanObj = "<span class='txt_label bg_red'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            default: // ready:request
                                spanObj = "<span class='txt_label bg_gray'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>", width:150 }
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150 }
                ,{field:"unitCd", title:"<spring:message code='par.lbl.unitNm'/>", width:50 }
                ,{field:"reqQty", title:"<spring:message code='par.lbl.reqQty'/>", attributes:{"class":"ar"}, width:80 }
                ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.avlbStockQty'/>", attributes:{"class":"ar"}, width:80 }
                ,{field:"itemPrc", title:"<spring:message code='par.lbl.prc' />", attributes:{"class":"ar"}, format:"{0:n2}", width:100 }
                ,{field:"taxDdctAmt", title:"<spring:message code='par.lbl.amt' />", attributes:{"class":"ar"}, format:"{0:n2}", width:100 }
                ,{field:"taxAmt", title:"<spring:message code='par.lbl.taxAmt' />", attributes:{"class":"ar"}, width:80 }
                ,{field:"etcGiTp", title:"<spring:message code='par.lbl.borrowStatus' />", attributes:{"class":"ar"}, width:80
                    ,template:'#if(etcGiTp !== "" && etcGiTp !== null){# #= etcGiTpMap[etcGiTp]# #}#'
                }
                ,{field:"receiveId", title:"<spring:message code='par.lbl.receiveId' />", width:80 }
            ]
        });
        //targetPartsReserveGrid
        $("#targetPartsReserveGrid").kendoExtGrid({
            gridId:"G-PAR-0808-153501"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqDetailes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;

                            params["sParGiTp"] = "SR";  //sParGiTp
                            params["sReqStartDt"] = $("#sReqStartDt").data("kendoExtMaskedDatePicker").value(); //sReqStartDt
                            params["sReqEndDt"] = $("#sReqEndDt").data("kendoExtMaskedDatePicker").value();     //sReqEndDt
                            params["sCancYn"] = "N";

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"parReqDocLineNo"
                        ,fields:{
                            rnum:{ type:"number", validation:{required:true}, editable:false }
                            ,dlrCd:{ type:"string", validation:{required:true}, editable:false }
                            ,pltCd:{ type:"string", validation:{required:true}, editable:false }
                            ,parReqDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,parReqDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,parReqStatCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,purcReqNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqStrgeCd:{ type:"string" , validation:{required:true} }
                            ,cancYn:{ type:"string" , validation:{required:true}, editable:false }
                            ,parGiTp:{ type:"string" , validation:{required:true}, editable:false }
                            ,roDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,roLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,resvDt:{ type:"date" , validation:{required:true}, editable:false }
                            ,resvStatus:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvTp:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,custNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,carNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,techNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,giLocCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,dbItemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,pkgItemCd:{ type:"string", editable:false }
                            ,itemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,unitCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,endQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,avlbStockQty:{ type:"number", editable:false }
                            ,resvStockQty:{ type:"number", editable:false }
                            ,clamStockQty:{ type:"number", editable:false }
                            ,grScheQty:{ type:"number", editable:false }
                            ,giScheQty:{ type:"number", editable:false }
                            ,resvQty:{ type:"number", editable:true }
                            ,readyQty:{ type:"number", editable:true }
                            ,purcReqDt:{ type:"date" , editable:false }
                            ,giDocNo:{ type:"string" , editable:false }
                            ,giDocTp:{ type:"string" , editable:false }
                            ,giDocStatCd:{ type:"string" , editable:false }
                            ,dbYn:{ type:"string" , editable:false }
                            ,itemPrc:{ type:"number" , editable:false }
                            ,itemAmt:{ type:"number" , editable:false }
                            ,taxDdctAmt:{ type:"number" , editable:false }
                            ,taxAmt:{ type:"number" , editable:false }
                            ,borrowStatus:{ type:"string" , editable:false }
                            ,receiveDt:{ type:"date" , editable:false }
                            ,receiveId:{ type:"string" , editable:false }
                            ,returnPartsQty:{ type:"number" , editable:false }
                            ,returnDt:{ type:"date" , editable:false }
                            ,returnId:{ type:"string" , editable:false }
                            ,regDt:{ type:"date" , editable:false }
                        }
                    }
                }
            }
            ,height:150
            ,editable:false
            ,pageable:false
            ,autoBind:true
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,multiSelectWithCheckbox:true
            ,dataBound:function(e){
            }
            ,change:function(e) {
            }
            ,columns :
                [{field:"regDt", title:"<spring:message code='par.lbl.resvDt'/>", format:"{0:<dms:configValue code='dateFormat' />}", width:60 }
                ,{field:"resvStatus", title:"<spring:message code='par.lbl.resvStatus'/>"
                    ,width:60
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.parReqStatCd){
                            case "02":// complete
                                spanObj = "<span class='txt_label bg_blue'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            case "03":// cancel
                                spanObj = "<span class='txt_label bg_red'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            default: // ready:request
                                spanObj = "<span class='txt_label bg_gray'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }
                ,{field:"resvTp", title:"<spring:message code='par.lbl.resvTp'/>"
                    ,width:70
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "<span class='txt_label bg_yellow'>"+"["+dataItem.parGiTp+"]"+parGiTpSrMap[dataItem.parGiTp]+"</span>";
                        return spanObj;
                    }
                }
                ,{field:"resvDocNo", title:"<spring:message code='par.lbl.resvDocNo'/>", width:100 }
                ,{field:"custNm", title:"<spring:message code='par.lbl.custNm'/>", width:50 }
                ,{field:"carNo", title:"<spring:message code='par.lbl.carNo'/>", width:50 }
                ,{field:"techNm", title:"<spring:message code='par.lbl.techNm'/>", width:50 }
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>", width:110 }
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:120 }
                ,{field:"reqQty", title:"<spring:message code='par.lbl.reqQty'/>", width:50, attributes:{"class":"ar"}}
                ,{field:"resvQty", title:"<spring:message code='par.lbl.resvQty'/>", width:50, attributes:{"class":"ar"}}
                ,{field:"readyQty", title:"<spring:message code='par.lbl.readyQty'/>", width:50, attributes:{"class":"ar"}}
                ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.avlbStockQty' />", width:50 , attributes:{"class":"ar"}}

            ]
        });
    });
</script>
<!-- //script -->
