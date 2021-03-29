<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 优惠券明细查询 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="ser.title.findCouponDetails" /></h1> <!-- 优惠券明细查询 -->
            <div class="btn_right">
                <dms:access viewId="VIEW-D-13325" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 查询 -->
                </dms:access>
                 <dms:access viewId="VIEW-D-13326" hasPermission="${dms:getPermissionMask('READ')}">
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
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col style="width:10%;">
                </colgroup>
                <tbody>
                    <tr>
                    	<th scope="row"><spring:message code='sal.lbl.finDocNo' /></th>   <!-- 收款编号-->
                    		<td>
                       			 <input id="paymentNo" class="form_input" />
                    		</td>
                    	<th scope="row"><spring:message code='global.lbl.roDocNo' /></th>   <!-- 维修委托号码 -->
                    			<td>
                        			<input id="roDocNo" class="form_input" />
                    			</td>	
                    	<th scope="row"><spring:message code='ser.lbl.couponUsageDate' /></th>       <!-- 优惠券使用日期 -->
                    		<td>
                        		<div class="form_float">
                            		<div class="date_left">
                                		<input id="couponUsageTimeStartStr" class="form_datepicker ac" />
                                		<span class="txt_from">~</span>
                            		</div>
                            		<div class="date_right">
                                		<input id="couponUsageTimeEndStr" class="form_datepicker ac" />
                            		</div>
                        		</div>
                    		</td>
                    	<th scope="row"><spring:message code='ser.lbl.couponState' /></th>   <!-- 卡券状态 -->
                    			<td>
                        			<input id="couponState" type="text" class="form_comboBox" />
                    			</td>	
                	</tr>
                </tbody>
            </table>
        </div>
    </section>
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
</div>




<script  type="text/javascript">
	$(document).ready(function() {
		 //优惠券使用日期- START
	    $("#couponUsageTimeStartStr").kendoExtMaskedDatePicker({
	    	format:"<dms:configValue code='dateFormat' />"
	        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
	    });

	    //优惠券使用日期- END
	    $("#couponUsageTimeEndStr").kendoExtMaskedDatePicker({
	         format:"<dms:configValue code='dateFormat' />"
	        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
	    });
	    
	    //卡券状态
	    $("#couponState").kendoExtDropDownList({
	        dataSource:["", "已使用", "已退款"]
	    }).data("kendoExtDropDownList").select(0);
	});
	
	
	//下载excel
	$("#btnExcelExport7").kendoButton({
		
        click:function(e){
            var param = $.extend(
                 {"paymentNo"            		:$("#paymentNo").val()}
                ,{"roDocNo"          			:$("#roDocNo").val()}
                ,{"couponUsageTimeStartStr"     :$("#couponUsageTimeStartStr").data('kendoExtMaskedDatePicker').value()}
                ,{"couponUsageTimeEndStr"       :$("#couponUsageTimeEndStr").data('kendoExtMaskedDatePicker').value()}
                ,{"couponState"         		:$("#couponState").data("kendoExtDropDownList").value()}
            );

            $.ajax({
                url:"<c:url value='/cmm/coupon/selectCouponDetails.do' />"
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
                            "beanName"              	:"couponDetailsService"
                            ,"templateFile"         	:"CouponDetails_Tpl.xlsx"
                            ,"fileName"             	:"<spring:message code='ser.title.findCouponDetails' />.xlsx"
                            ,"paymentNo"            		:$("#paymentNo").val()
                            ,"roDocNo"              :$("#roDocNo").val()
                            ,"couponUsageTimeStartStr"               :$("#couponUsageTimeStartStr").val()
                            ,"couponUsageTimeEndStr"           :$("#couponUsageTimeEndStr").val()
                            ,"couponState"          :$("#couponState").val()
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
        	$("#grid").kendoExtGrid({
        	    gridId:"G-SER-0123-1139059"
               	,dataSource:{
               	 transport:{
                     read:{
                         url:"<c:url value='/cmm/coupon/selectCouponDetails.do' />"
                     }
                    ,parameterMap:function(options, operation) {
                         if (operation === "read") {
                             var params = {};
                             params["recordCountPerPage"] = options.pageSize;
                             params["pageIndex"] = options.page;
                             params["firstIndex"] = options.skip;
                             params["lastIndex"] = options.skip + options.take;
                             params["sort"] = options.sort;
                             params["paymentNo"] = $("#paymentNo").val();//付款编号
                             params["roDocNo"] = $("#roDocNo").val();//维修委托号码
                             params["couponUsageTimeStartStr"] = $("#couponUsageTimeStartStr").data('kendoExtMaskedDatePicker').value(); //保险开始日期起
                             params["couponUsageTimeEndStr"] = $("#couponUsageTimeEndStr").data('kendoExtMaskedDatePicker').value();//保险开始日期止
                             params["couponState"] =  $("#couponState").data("kendoExtDropDownList").value();//卡券状态
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
                        	 couponCode:{type:"string"}//优惠卷卡号
                        	 ,paymentNo:{type:"string"}//付款编号
                             ,couponName:{type:"string"}//卡卷名称
                             ,couponState:{type:"string"}//卡券状态
                             ,tradeId:{type:"string"}//平台交易号
                             ,roDocNo:{type:"string"}//维修委托号码
                             ,calcDocNo:{type:"string"}//服务结算号码
                             ,effectiveDate:{type:"string" }//有效期开始日期
                             ,expiryDate:{type:"string" }//有效期结束日期
                             ,couponType:{type:"string"}//卡券类型
                             ,couponChannelCode:{type:"string"}//优惠券渠道
                             ,couponAmount:{type:"string"}//优惠券面额
                             ,payAmount:{type:"string"}//实际抵扣金额
                             ,cardVolumeCollectionTime:{type:"string"}//卡券领取时间
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
                           title:"<spring:message code='ser.lbl.couponCardNo' />"
                          ,field:"couponCode"
                          ,width:80
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }  //优惠卷卡号
                       ,{
                           title:"<spring:message code='ser.lbl.paymentNumber' />"
                          ,field:"paymentNo", width:80
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }  //付款编号
                       ,{
                           title:"<spring:message code='ser.lbl.couponName' />"
                          ,field:" couponName", width:80
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }  //卡卷名称
                       ,{
                           title:"<spring:message code='ser.lbl.couponState' />"
                          ,field:"couponState", width:50
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }  //卡券状态
                       ,{
                           title:"<spring:message code='ser.lbl.platformTransactionNo' />"
                          ,field:"tradeId", width:80
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }  //平台交易号
                       ,{
                           title:"<spring:message code='ser.lbl.roDocNo' />"
                          ,field:"roDocNo", width:80
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }  //维修委托号码
                       ,{
                           title:"<spring:message code='ser.lbl.calcNo' />"
                          ,field:"calcDocNo", width:80
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }  //服务结算号码
                       ,{
                           title:"<spring:message code='ser.lbl.effectiveDate' />"
                          ,field:"effectiveDate", width:80
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }  //有效期开始日期
                       ,{
                           title:"<spring:message code='ser.lbl.expiryDate' />"
                          ,field:"expiryDate", width:80
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }  //有效期结束日期
                       ,{
                           title:"<spring:message code='ser.lbl.couponType' />"
                          ,field:"couponType", width:50
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }  //卡券类型
                       ,{
                           title:"<spring:message code='ser.lbl.couponChannel' />"
                          ,field:"couponChannelCode", width:60
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }  //优惠券渠道
                       ,{
                           title:"<spring:message code='ser.lbl.couponAmount' />"
                          ,field:"couponAmount", width:50
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }  //优惠券面额
                       ,{
                           title:"<spring:message code='ser.lbl.actualDeductionAmount' />"
                          ,field:"payAmount", width:80
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }   //实际抵扣金额
                       ,{
                           title:"<spring:message code='ser.lbl.collectionTimeOfCardAndVoucher' />"
                          ,field:"cardVolumeCollectionTime", width:80
                          ,headerAttributes:{style:"text-align:center;"}
                          ,attributes:{"class":"al"}
                       }   //卡券领取时间
                  ]
        	});
        }
    });
</script>