<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- content -->
<section id="content">

    <!-- B/O 관리   영역 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.backOrderMng" /> --%><!--  B/O 관리  --></h1>
            <div class="btn_right">
                <button class="btn_m btn_reset" id="btnInit" type="button"><spring:message code="par.btn.init" /></button><!--btnInit  -->
                <button id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /><!-- btnSearch --></button>
            </div>
        </div>
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.dlrCd" /><!-- 딜러코드 --></span></th>
                        <td class="required_area">
                            <input type="text" value="" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdTp" /><!-- 오더유형 --></th>
                        <td>
                            <input value="" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 오더번호 --></th>
                        <td>
                            <input type="text" value="" class="form_input">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.dt" /><!-- 일자 --></span></th>
                        <td class="required_area">
                            <div class="form_float">
                                <div class="date_left">
                                    <input value="" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input value="" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.statNm" /><!-- 상태 --></th>
                        <td>
                            <input value="" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부번 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sItemCd" class="form_input" value="${itemCd}">
                                <a id="searchItemCd"><!-- 검색 --></a>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_form mt5">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:22%;">
                    <col style="width:10%;">
                    <col style="width:22%;">
                    <col style="width:10%;">
                    <col style="width:22%;">
                    <col style="width:4%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.backOrderCnt" /><!-- 결품건수 --></th>
                        <td>
                            <input type="text" value="" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.backOrderQty" /><!-- 결품수량 --></th>
                        <td>
                            <input type="text" value="" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.backOrderAmt" /><!-- 결품금액 --></th>
                        <td>
                            <input type="text" value="" class="form_input">
                        </td>
                        <td>
                            <button id="btnTransfer" class="btn_s btn_search"><spring:message code="par.btn.transfer" /><!-- 이관 --></button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //  B/O 관리 영역 -->

    <!-- B/O 세부 현황 -->
    <section class="group mt5">
        <div class="table_grid">
            <table class="grid">
                <caption></caption>
                <thead>
                    <tr>
                        <th scope="col" data-field="data1" rowspan="2">订单号<!-- 오더번호 --></th>
                        <th scope="col" data-field="data2" rowspan="2">行号<!-- 라인 --></th>
                        <th scope="col" data-field="data3" colspan="2">配件编号<!-- 오더 부번 --></th>
                        <th scope="col" data-field="data4" rowspan="2">配件名称<!-- 품명 --></th>
                        <th scope="col" data-field="data5" colspan="6">数量<!-- 수량 --></th>
                    </tr>
                    <tr>
                        <th scope="col" data-field="data3">订单<!-- 오더 --></th>
                        <th scope="col" data-field="data4">当前信息<!-- 확정  --></th>
                        <th scope="col" data-field="data5">订单<!-- 오더 --></th>
                        <th scope="col" data-field="data6">当前信息<!-- 확정  --></th>
                        <th scope="col" data-field="data7">网店价(含税)</th>
                        <th scope="col" data-field="data8">B/O数量<!-- B/O수량 --></th>
                        <th scope="col" data-field="data9">工程中 数量<!-- 진행중수량 --></th>
                        <th scope="col" data-field="data10">预计发货时间<!-- ETD --></th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>

    </section>
    <!-- // B/O 세부 현황 -->

</section>
<!-- //content -->

<!-- script -->
<script>
    $(document).ready(function() {
        var searchItemPopupWindow;

        $("#searchItemCd").on('click', selectPartsMasterPopupWindow);
        //btnInit
        $("#btnInit").kendoButton({
            click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");

            }
        });
        //btnSearch
        $("#btnSearch").kendoButton({
            click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });

        //btnTransfer
        $("#btnTransfer").kendoButton({
            click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });

        $(".tab_area").kendoExtTabStrip({
            animation:false
        });
        $(".form_datepicker").kendoDatePicker({
            format:"yyyy-MM-dd"
        });
        $(".grid").kendoGrid({
            height:219
        });
        $(".form_comboBox").kendoExtDropDownList();

        // 부품 팝업 열기 함수.
        function selectPartsMasterPopupWindow(){

            searchItemPopupWindow = dms.window.popup({
                windowId:"partsMasterPopup"
                ,title:"<spring:message code='par.title.itemInfo' />"   // 품목정보
                ,content:{
                    url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
                    ,data:{
                        "type":"custom1"
                        ,"autoBind":false
                        ,"itemCd":$("#sItemCd").val()
                        ,"callbackFunc":function(data){
                            if(data.length > 0)
                            {
                                $("#sItemCd").val(data[0].itemCd);
                                //$("#sItemNm").val(data[0].itemNm);

                            }
                            searchItemPopupWindow.close();
                        }
                    }
                }
            });
        }
    });
</script>
<!-- //script -->