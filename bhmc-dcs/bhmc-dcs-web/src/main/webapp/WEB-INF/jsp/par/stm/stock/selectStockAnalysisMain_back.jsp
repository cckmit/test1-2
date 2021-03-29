<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <section class="group">
    <div class="header_area">
        <h1 class="title_basic"><!-- 配件库存分析 --></h1>
        <div class="btn_right">
            <button type="button" class="btn_m btn_search">查询</button><!-- 조회 -->
        </div>
    </div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:25%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required">经销商代码</span></th>
                    <td>
                        <input type="text" value="" class="form_input">
                    </td>
                    <th scope="row">配件分类</th>
                    <td>
                        <input type="text" value="" class="form_comboBox">
                    </td>
                    <th scope="row">年月</th>
                    <td>
                       <input class="form_datepicker" id="sYyMm">
                    </td>
                    <td colspan="2"></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <table class="grid">
            <caption></caption>
            <thead>
                <tr>
                    <th scope="col" data-field="data1">配件编号</th>
                    <th scope="col" data-field="data2">配件名称</th>
                    <th scope="col" data-field="data3">总件数</th>
                    <th scope="col" data-field="data4">3个月平均需金额</th>
                    <th scope="col" data-field="data5">库存数量</th>
                    <th scope="col" data-field="data6">库存金额</th>
                    <th scope="col" data-field="data7">占有率(%)</th>
                    <th scope="col" data-field="data8">MOS</th>
                    <th scope="col" data-field="data9">T/Rate</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>

    <div style="height:200px;margin-top:10px;border:1px solid #c1cbd2;"></div>
</section>
<script>
    $(document).ready(function() {


        $(".form_comboBox").kendoExtDropDownList();

        //btn
        $(".btn_m").kendoButton({
            click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");

            }
        });
        //btn
        $(".btn_s").kendoButton({
            click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });

        $(".form_datepicker").kendoDatePicker({
            format:"yyyy-MM-dd"
        });

      //년월
        $("#sYyMm").kendoDatePicker({
            //define the start view
            start:"year"
            //defines when the calendar shoule retrun date
            ,depth:"year"
            //display month and year in the input
            ,format:"yyyyMM"
        });

        $(".grid").kendoGrid({
            height:219
        });
    });
</script>