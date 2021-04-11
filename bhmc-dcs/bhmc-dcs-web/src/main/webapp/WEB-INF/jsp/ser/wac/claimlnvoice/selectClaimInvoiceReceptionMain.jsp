<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<div id="resizableContainer">
    <div class="content">
   
        <section class="group">
        	 <!--  查询区域信息开始 -->
            <div class="header_area">
                 <h1 class="title_basic">索赔发票接收</h1>
                <div class="btn_right">
<%--    				<dms:access viewId="VIEW-I-12416" hasPermission="${dms:getPermissionMask('READ')}">--%>
                        <button type="button" class="btn_m btn_search" id="btnSearch" ><spring:message code="global.btn.search" /></button>
 <%--       			</dms:access>  --%><!-- 查询 -->
<%--                     <dms:access viewId="VIEW-D-" hasPermission="${dms:getPermissionMask('READ')}"> --%>
                        <button type="button" class="btn_m " id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button>
<%--                     </dms:access> --%><!-- 下载 -->

                </div>
            </div>
            <div class="table_form form_width_70per" role="search" data-btnid="btnSearch" >
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col>
                    </colgroup>
                    <tbody>
                       <tr>
                            <th scope="row"><spring:message code="global.lbl.dlrCd" /></th><!-- 经销商代码 -->
                            <td>
                                <input id="sLbrCd" type="text" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.dlrNm' /></th><!-- 经销商名称 -->
                            <td>
                                <input id="sLbrNm" type="text" class="form_input" />
                            </td>
                            <th scope="row">开票状态</th> <!-- 开票状态 -->
                            <td>
                                <input type="text" id="sLbrTp" name="sLbrTp" class="form_comboBox"   />
                            </td>
                            
                        </tr>
                        <tr>
                        	<th scope="row">结算报表编号</th><!-- 结算报表编号 -->
                            <td>
                                <input id="sLbrCd1" type="text" class="form_input" />
                            </td>
                        	<th scope="row"><spring:message code="ser.lbl.invcDt" /></th><!-- 结算报表年月 -->
                        	<td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input value="" id="sFromDt" class="form_datepicker ac"><!-- 开始日期-->
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input value="" id="sToDt" class="form_datepicker ac" ><!-- 结束日期-->
                                </div>
                            </div>
                        	</td>
                        	<th scope="row">开票状态</th> <!-- 开票状态 -->
                            <td>
                                <input type="text" id="sLbrTp1" name="sLbrTp1" class="form_comboBox"   />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!--  查询区域信息结束 -->
            <!--  结算单列表按钮开始 -->
 			<div class="header_area">
                <h2 class="title_basic">结算单列表</h2>
                <div class="btn_right">
                     <button type="button" class="btn_m" id="btnshou" >退票</button><!-- 退票 -->
                     <button type="button" class="btn_m" id="btntui" >收票</button><!-- 收票 -->
                </div>
            </div>
            <!--  结算单列表按钮结束 -->
            <!--  结算单列表信息开始 -->
            <div class="table_grid mt10">
                 <div id="gridMaster" class="grid"></div>
            </div>
            <!--  结算单列表信息结束 -->
        </section>

        <!-- 发票信息开始 -->
        <section class="group">
            <div class="header_area">
                <h2 class="title_basic">发票信息</h2>
            </div>
            <!-- 发票信息列表 -->
            <div class="table_grid">
                <div id="gridDetail" class="grid"></div>
            </div>
        </section>
        <!-- 发票信息结束 -->
        
        <!-- 退票信息开始 -->
        <section class="group">
        	 <!--  查询区域信息开始 -->
            <div class="header_area">
                <h2 class="title_basic">退票信息</h2>
            </div>
            <div class="table_form form_width_70per" role="search" data-btnid="btnSearch" >
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col>
                    </colgroup>
                    <tbody>
                       <tr>
                            <th scope="row">退票原因</th><!-- 退票原因 -->
                            <td>
                                <input id="tp" type="text" class="form_input" />
                            </td>
                            <th scope="row">退票备注</th><!-- 退票备注 -->
                            <td>
                                <input id="bz" type="text" class="form_input" />
                            </td>
                        </tr>
                        <tr>
                        	<th scope="row">快递单号</th><!-- 快递单号 -->
                            <td>
                                <input id="kddh" type="text" class="form_input" />
                            </td>
                        	<th scope="row">快递公司</th><!-- 快递公司 -->
                        	<td>
                            	<input id="kdgs" type="text" class="form_input" />
                        	</td>
                        	<th scope="row">寄件人</th> <!-- 开票状态 -->
                            <td>
                                <input id="jjr" type="text" class="form_input" />
                            </td>
                            <th scope="row">联系电话</th> <!-- 开票状态 -->
                            <td>
                                <input id="lxdh" type="text" class="form_input" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        </div>
    </div>
</div>



<script type="text/javascript">





</script>