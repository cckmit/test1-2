<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 중고차치환 판매법인 심사결과 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic">二手车交换销售法人审批结果资料<!-- 중고차치환 판매법인 심사결과 --></h1>
        <div class="btn_right">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            <button class="btn_m btn_search" id="btnExcelDown"><spring:message code="global.btn.excelDownload" /></button><!-- Excel 다운로드 -->
        </div>
    </div>
    <div class="table_form form_width_100per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:40%;">
                <col style="width:10%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">注册日期<!-- 등록일자 --></th>
                    <td>
                        <div class="form_right">
                            <div class="date_left">
                                <input value="" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input value="" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <table class="grid">
            <caption></caption>
            <thead>
                <tr>
                    <th scope="col" data-field="data1">登记日期<!-- 등록일자 --></th>
                    <th scope="col" data-field="data2">区分<!-- 구분 --></th>
                    <th scope="col" data-field="data3">特约代码<!-- 딜러코드 --></th>
                    <th scope="col" data-field="data4">特约名称<!-- 딜러명 --></th>
                    <th scope="col" data-field="data5">城市<!-- 도시 --></th>
                    <th scope="col" data-field="data6">省<!-- 성 --></th>
                    <th scope="col" data-field="data7">办事处<!-- 사무소 --></th>
                    <th scope="col" data-field="data8">事业部<!-- 사업부 --></th>
                    <th scope="col" data-field="data9">品牌判断<!-- 브랜드판단 --></th>
                    <th scope="col" data-field="data10">旧车车主姓名<!-- 중고차소유자명 --></th>
                    <th scope="col" data-field="data11">品牌<!-- 브랜드 --></th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>

</section>
<!-- //중고차치환 판매법인 심사결과 -->

<!-- script -->
<script>
$(document).ready(function() {
    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            //기능개발중입니다.
            dms.notification.warning("<spring:message code = 'sal.info.functionDeveloping'/>");
        }
    });

    //버튼 - 조회
    $("#btnExcelDown").kendoButton({
        click:function(e){
            //기능개발중입니다.
            dms.notification.warning("<spring:message code = 'sal.info.functionDeveloping'/>");
        }
    });


    $(".form_datepicker").kendoDatePicker({
        format:"yyyy-MM-dd"
    });
    $(".grid").kendoGrid({
        height:343
    });
    $(".grid2").kendoGrid({
        height:83
    });
    $(".form_comboBox").kendoExtDropDownList();
    $(".btn_m").kendoButton();
    $(".form_numeric").kendoExtNumericTextBox();
});
</script>
<!-- //script -->