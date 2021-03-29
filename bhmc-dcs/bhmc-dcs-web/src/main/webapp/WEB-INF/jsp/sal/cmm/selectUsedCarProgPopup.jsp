﻿<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 계약해약 팝업 -->
<section id="window" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnAsk" class="btn_m">合同解除申请<!-- 계약해약신청 --></button>
            <button id="btnCancel" class="btn_m">取消<!-- 취소 --></button>
        </div>
    </div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:14%;">
                <col style="width:20%;">
                <col style="width:13%;">
                <col style="width:20%;">
                <col style="width:14%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">销售顾问<!-- 판매고문 --></th>
                    <td>
                        <input type="text" value="" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row">客户<!-- 고객 --></th>
                    <td>
                        <input type="text" value="" disabled class="form_input form_disabled">
                    </td>
                    <th scope="row">销售类型<!-- 판매유형 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row">合同编号<!-- 계약번호 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">合同状态<!-- 계약상태 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">合同签订日期<!-- 계약일자 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row">车种<!-- 차종 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">车型<!-- 모델 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">OCN</th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row">外色<!-- 외색 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">内色<!-- 내색 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">交车期望日期<!-- 희망인도일자 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row">车辆价格<!--  차량가격 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">折让金额<!-- 할인금액 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">车辆金额<!-- 차량금액 -->
                    </th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row">定金支付类型<!--  --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">定金<!-- 계약금 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">是否已收定金<!-- 계약금받음여부 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row">二手车置换<!-- 중고차치환 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">车牌代办<!-- 번호판대행 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">保险代办<!-- 보험대행 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row">是否贷款<!-- 대출여부 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_form mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:14%;">
                <col style="width:20%;">
                <col style="width:14%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required">取消事由<!-- 취소이유 --></span></th>
                    <td class="required_area">
                        <input value="" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row">备注  </th><!-- 비고 -->
                    <td colspan="3">
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

</section>
<!-- // 계약해약팝업 팝업 -->

<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

$(document).ready(function() {

    // 팝업 설정값
    var options = parent.popupWindow.options.content.data;

    $("#btnAsk").kendoButton({      // 신청
        click:function(e){
            // 개발진행 예정중입니다.
            dms.notification.info("<spring:message code='global.info.developIng' />");
        }
    });

    $("#btnCancel").kendoButton({  // 취소
        click:function(e){
            // 개발진행 예정중입니다.
            dms.notification.info("<spring:message code='global.info.developIng' />");
        }
    });

    /*
    $("#openButton").click(function(){
        var win = $("#window").data("kendoWindow");
        win.center();
        win.open();
    });
    $("#closeButton").click(function(){
        var win = $("#window").data("kendoWindow");
        win.close();
    });
    $("#window").kendoWindow({
        modal:true,
        resizable:false,
        //visible:false,
        title:"부품 관리",
        width:"800px"
    }).data("kendoWindow");
    */

    $(".grid").kendoGrid();
    $(".form_comboBox").kendoExtDropDownList();


});
</script>