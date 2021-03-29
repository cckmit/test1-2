<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 保险历史查询 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.findLnsuranceHistory" /></h1> <!-- 保险历史查询 -->
            <div class="btn_right">
                <dms:access viewId="VIEW-D-13318" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 查询 -->
                </dms:access>
                 <dms:access viewId="VIEW-D-13319" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m" id="btnExcelExport7"><spring:message code="ser.btn.excelDownload" /></button><!-- 下载 -->
                 </dms:access>
            </div>
        </div>
        <!-- 조회 조건 시작 -->
        <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                    	<th scope="row"><spring:message code='global.lbl.vinNo' /></th>   <!-- 车辆识别码 -->
                    		<td>
                       			 <input id="vinNo" class="form_input" />
                    		</td>
                    	<th scope="row"><spring:message code='ser.lbl.incStartDt' /></th>       <!-- 保险开始日期 -->
                    		<td>
                        		<div class="form_float">
                            		<div class="date_left">
                                		<input id="startDateStartStr" class="form_datepicker ac" />
                                		<span class="txt_from">~</span>
                            		</div>
                            		<div class="date_right">
                                			<input id="startDateEndStr" class="form_datepicker ac" />
                            		</div>
                        		</div>
                    		</td>
                    		
                    	<th scope="row"><spring:message code='sal.lbl.synchronizationDate' /></th>     <!-- 同步日期 -->
                    		<td>
                        		<div class="form_float">
                            		<div class="date_left">
                                		<input id="synchronizationDtStartStr" class="form_datepicker ac" />
                                		<span class="txt_from">~</span>
                            		</div>
                            		<div class="date_right">
                                			<input id="synchronizationDtEndStr" class="form_datepicker ac" />
                            		</div>
                        		</div>
                    		</td>
                	</tr>
                	<tr>
                		<th scope="row"><spring:message code='global.lbl.carNo' /></th>   <!-- 车牌号 -->
                    			<td>
                        			<input id="carRegNo" class="form_input" />
                    			</td>
                    	<th scope="row"><spring:message code='ser.lbl.incEndDt' /></th>       <!-- 保险结束日期 -->
                    		<td>
                        		<div class="form_float">
                            		<div class="date_left">
                                		<input id="endDateStartStr" class="form_datepicker ac" />
                                		<span class="txt_from">~</span>
                            		</div>
                            		<div class="date_right">
                                			<input id="endDateEndStr" class="form_datepicker ac" />
                            		</div>
                        		</div>
                    		</td>
                	</tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- 금융정보 -->
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
</div>




<script  type="text/javascript">
	$(document).ready(function() {
		 //保险开始日期- START
	    $("#startDateStartStr").kendoExtMaskedDatePicker({
	    	format:"<dms:configValue code='dateFormat' />"
	        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
	    });

	    //保险开始日期- END
	    $("#startDateEndStr").kendoExtMaskedDatePicker({
	         format:"<dms:configValue code='dateFormat' />"
	        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
	    });
	    
	    
	    //同步日期- START
	    $("#synchronizationDtStartStr").kendoExtMaskedDatePicker({
	         format:"<dms:configValue code='dateFormat' />"
	        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
	    });

	    //同步日期- END
	    $("#synchronizationDtEndStr").kendoExtMaskedDatePicker({
	         format:"<dms:configValue code='dateFormat' />"
	        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
	    });
	    
	    
	    //保险结束日期- START
	    $("#endDateStartStr").kendoExtMaskedDatePicker({
	         format:"<dms:configValue code='dateFormat' />"
	        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
	    });

	    //保险结束日期- END
	    $("#endDateEndStr").kendoExtMaskedDatePicker({
	         format:"<dms:configValue code='dateFormat' />"
	        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
	    });
		
		
	});
	
	
	//下载excel
	$("#btnExcelExport7").kendoButton({
		
        click:function(e){
            var param = $.extend(
                 {"vinNo"            :$("#vinNo").val()}
                ,{"startDateStartStr"              :$("#startDateStartStr").data('kendoExtMaskedDatePicker').value()}
                ,{"startDateEndStr"               :$("#startDateEndStr").data('kendoExtMaskedDatePicker').value()}
                ,{"synchronizationDtStartStr"           :$("#synchronizationDtStartStr").data('kendoExtMaskedDatePicker').value()}
                ,{"synchronizationDtEndStr"          :$("#synchronizationDtEndStr").data('kendoExtMaskedDatePicker').value()}
                ,{"carRegNo"          :$("#carRegNo").val()}
                ,{"endDateStartStr"            :$("#endDateStartStr").data('kendoExtMaskedDatePicker').value()}
                ,{"endDateEndStr"  :$("#endDateEndStr").data('kendoExtMaskedDatePicker').value()}
            );

            $.ajax({
                url:"<c:url value='/sal/com/selectCommercialInsurance.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result){
                    if(result.total <= 10000){
                        dms.ajax.excelExport({
                            "beanName"              :"commercialInsuranceService"
                            ,"templateFile"         :"CommercialInsurance_Tpl.xlsx"
                            ,"fileName"             :"<spring:message code='sal.title.findLnsuranceHistory' />.xlsx"
                            ,"vinNo"            	:$("#vinNo").val()
                            ,"startDateStartStr"              :$("#startDateStartStr").val()
                            ,"startDateEndStr"               :$("#startDateEndStr").val()
                            ,"synchronizationDtStartStr"           :$("#synchronizationDtStartStr").val()
                            ,"synchronizationDtEndStr"          :$("#synchronizationDtEndStr").val()
                            ,"carRegNo"          :$("#carRegNo").val()
                            ,"endDateStartStr"            :$("#endDateStartStr").val()
                            ,"endDateEndStr"  :$("#endDateEndStr").val()
                        });
                    }else{
                        dms.notification.warning("<spring:message code='global.btn.excelDownload' var='excelDownload'/><spring:message code='global.err.chkGreateParam' arguments='${excelDownload},10000' />");
                    }
                }
            });
        }
    });
	
		

    $("#btnSearch").kendoButton({
        click:function(e) {
        	 var carRegNo = $("#carRegNo").val();
        	 /* if( carRegNo == null || carRegNo == '' ){
                 dms.notification.info("<spring:message code='global.lbl.carNo' var='carNo' /><spring:message code='global.info.emptyCheckParam' arguments='${carNo},' />"); // 주문주차
                 return;
             } */
        	$("#grid").kendoExtGrid({
        	    gridId:"G-SAL-0123-1139059"
               	,dataSource:{
               	 transport:{
                     read:{
                         url:"<c:url value='/sal/com/selectCommercialInsurance.do' />"
                     }
                    ,parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};
                             params["recordCountPerPage"] = options.pageSize;
                             params["pageIndex"] = options.page;
                             params["firstIndex"] = options.skip;
                             params["lastIndex"] = options.skip + options.take;
                             params["sort"] = options.sort;
                             
                             
                             params["vinNo"] = $("#vinNo").val();//车辆识别码
                             params["startDateStartStr"] = $("#startDateStartStr").data('kendoExtMaskedDatePicker').value(); //保险开始日期起
                             params["startDateEndStr"] = $("#startDateEndStr").data('kendoExtMaskedDatePicker').value();//保险开始日期止
                             params["synchronizationDtStartStr"] = $("#synchronizationDtStartStr").data('kendoExtMaskedDatePicker').value();//同步日期起
                             params["synchronizationDtEndStr"] = $("#synchronizationDtEndStr").data('kendoExtMaskedDatePicker').value();//同步日期止
                             params["carRegNo"] = $("#carRegNo").val();//车牌号
                             params["endDateStartStr"] = $("#endDateStartStr").data('kendoExtMaskedDatePicker').value();//保险结束日期起
                             params["endDateEndStr"] = $("#endDateEndStr").data('kendoExtMaskedDatePicker').value();//保险结束日期止
                             return kendo.stringify(params);
                         }else if (operation !== "read" && options.models) {
                             return kendo.stringify(options.models);
                         }
                     }
                 }
        	     ,batch :false
                 ,schema:{
                      model:{
                          id:"fincItemCd"
                         ,fields:{
                        	 vinNo:{type:"string"} 
                             ,carRegNo:{type:"string"} 
                             ,policyNo:{type:"string"} 
                             ,icCode:{type:"string"}
                             ,icName:{type:"string"}
                             ,code:{type:"string"}
                             ,note1:{type:"string" }//保险金额
                             ,note2:{type:"string" }//保额（万元）
                             ,insuranceStartDate:{type:"string"}
                             ,insuranceEndDate:{type:"string"}
                             ,note4:{type:"string"}//车主
                             ,note5:{type:"string"}//手机号
                             ,synchronizationDate:{type:"string"}
                             

                         }
                     }
                 }
               }
        	   ,dataBound:function(e) {
                   var savedCmp = $("#savedFincCmp").val();
                   var savedItem = $("#savedFincItem").val();

                   if(dms.string.isNotEmpty(savedCmp)){
                       var selectRow
                         , grid = $("#grid").data("kendoExtGrid")
                         , rows = grid.tbody.find("tr");

                       rows.each(function(index, row) {
                           var dataItem = grid.dataSource.at(index);

                           if(dataItem.fincCmpCd == savedCmp
                                   && dataItem.fincItemCd == savedItem){
                                selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(index);
                                grid.select(selectRow);
                           }
                       });
                   }
                   $("#savedFincCmp").val("");
                   $("#savedFincItem").val("");
        	   }
               ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
               ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
               ,multiSelectWithCheckbox :false    //멀티선택 적용. default :false
               ,appendEmptyColumn:false          //빈컬럼 적용. default:false
               ,enableTooltip:false               //Tooltip 적용, default:false
        	   ,height:434
        	   ,selectable :"row"
        	   ,editable:false
        	   ,autoBind:true
               ,navigatable :true
        	   ,columns:[
                       {
                           title:"<spring:message code='global.lbl.vinNo' />"
                          ,field:"vinNo"
                          ,width:100
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }  //VIN
                       ,{
                           title:"<spring:message code='global.lbl.carNo' />"
                          ,field:"carRegNo", width:50
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }  // 车牌号 
                       ,{
                           title:"<spring:message code='global.lbl.policyNo' />"
                          ,field:" policyNo", width:100
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }  // 保单号
                       ,{
                           title:"<spring:message code='ser.lbl.incCmpCd' />"
                          ,field:" icCode", width:60
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }  // 保险公司代码
                       ,{
                           title:"<spring:message code='ser.lbl.incCmpNm' />"
                          ,field:" icName", width:60
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }  // 保险公司名称 
                       ,{
                           title:"<spring:message code='sal.lbl.incTp' />"
                          ,field:" code", width:150
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }  // 险种
                       ,{
                           title:"<spring:message code='global.lbl.incAmt' />(<spring:message code="global.lbl.yuan"/>)"
                          ,field:" note1", width:50
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }  //保险金额
                       ,{
                           title:"<spring:message code='sal.lbl.incAmountAmt' />(<spring:message code="global.lbl.yuan"/>)"
                          ,field:" note2", width:50
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }  //保额
                       ,{
                           title:"<spring:message code='ser.lbl.incStartDt' />"
                          ,field:" insuranceStartDate", width:75
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }  // 保险开始日期
                       ,{
                           title:"<spring:message code='ser.lbl.incEndDt' />"
                          ,field:"insuranceEndDate", width:75
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }  // 保险结束日期
                       ,{
                           title:"<spring:message code='ser.lbl.vehicleOwner' />"
                          ,field:"note4", width:50
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }  //车主
                       ,{
                           title:"<spring:message code='ser.lbl.mobilePhone' />"
                          ,field:"note5", width:50
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }  //手机
                       ,{
                           title:"<spring:message code='sal.lbl.synchronizationDate' />"
                          ,field:"synchronizationDate", width:50
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }   //同步日期
                  ]
        	});
        	refreshAll();
        }
    });

refreshAll = function() {
   // $("#carRegNo").val("");
}

</script>