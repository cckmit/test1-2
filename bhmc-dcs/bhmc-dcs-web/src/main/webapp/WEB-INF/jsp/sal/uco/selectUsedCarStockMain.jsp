﻿<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 중고차재고관리 -->
<section class="group">
	<div class="header_area">
        <h1 class="title_basic">二手车库存管理<!-- 중고차재고관리 --></h1>
		<div class="btn_right">
            <button id="btnSearch" type="button" class="btn_m btn_search">查询<!-- 조회 --></button>
		</div>
	</div>
	<div class="table_form form_width_100per">
		<table>
			<caption></caption>
			<colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
			</colgroup>
			<tbody>
                <tr>
                    <th scope="row">合同编号<!-- 계약번호--></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">客户名<!-- 고객명--></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">收货方姓名<!-- 인수자명 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row">签订日<!-- 계약일 --></th>
                    <td>
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
                    <th scope="row">车架号<!-- VIN --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">车牌号码<!-- 번호판号 --></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row">车辆<!-- 차량 --></th>
                    <td>
                        <input value="" class="form_comboBox">
                    </td>
                </tr>
			</tbody>
		</table>
	</div>

    <div class="table_grid mt10">
        <table class="grid">
            <caption></caption>
            <thead>
                <tr>
                    <th scope="col" data-field="data1">合同编号<!-- 계약번호 --></th>
                    <th scope="col" data-field="data2">签订人<!-- 계약인 --></th>
                    <th scope="col" data-field="data3">签订日期<!-- 계약일자 --></th>
                    <th scope="col" data-field="data4">要求移交日期<!--  인도요청일자 --></th>
                    <th scope="col" data-field="data5">预计移交日<!-- 인도예정일자 --></th>
                    <th scope="col" data-field="data6">车辆<!-- 차량  --></th>
                    <th scope="col" data-field="data7">入库日期<!-- 입고일자 --></th>
                    <th scope="col" data-field="data8">车辆识别码<!--  VIN --></th>
                    <th scope="col" data-field="data9">生产年月<!-- 생산년월 --></th>
                    <th scope="col" data-field="data10">外色<!-- 외장색 --></th>
                    <th scope="col" data-field="data11">临时车辆<!--  임시차량 --></th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>

</section>
<!-- //중고차재고관리 -->

<script>
$(document).ready(function() {

    $("#btnSearch").kendoButton({  // 조회
        click:function(e){
            // 개발진행 예정중입니다.
            dms.notification.info("<spring:message code='global.info.developIng' />");
        }
    });

    $(".form_datepicker").kendoDatePicker({
        format:"yyyy-MM-dd"
    });
    $(".grid").kendoGrid({
        pageable:{
            info:false,
            pageSize:1
        },
        height:406
    });
    $(".form_comboBox").kendoExtDropDownList();
    $(".btn_m").kendoButton();
    $(".form_numeric").kendoExtNumericTextBox();
});
</script>