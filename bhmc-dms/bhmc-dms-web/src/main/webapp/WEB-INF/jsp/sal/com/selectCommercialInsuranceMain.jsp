<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 商业保险查询 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.findCommercialLnsurance" /></h1> <!-- 商业保险查询 -->
            <div class="btn_right">
                <dms:access viewId="VIEW-D-13321" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 查询 -->
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
                    <th scope="row"><span class="bu_required"><spring:message code='global.lbl.carNo' /></span></th>   <!-- 车牌号 -->
                    <td>
                        <input id="licenseNo" class="form_input" />
                    </td>
                     <th scope="row"></th>
                        <td></td>
                        <td></td>
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

    $("#btnSearch").kendoButton({
        click:function(e) {
        	 var licenseNo = $("#licenseNo").val();
        	 if( licenseNo == null || licenseNo == '' ){
                 dms.notification.info("<spring:message code='global.lbl.carNo' var='carNo' /><spring:message code='global.info.emptyCheckParam' arguments='${carNo},' />"); // 주문주차
                 return;
             }
        	$("#grid").kendoExtGrid({
        	    gridId:"G-SAL-0123-1139059"
               	,dataSource:{
               	 transport:{
                     read:{
                         url:"<c:url value='/sal/com/selectInfoByCarRegNo.do' />"
                     }
                    ,parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};
                             params["recordCountPerPage"] = options.pageSize;
                             params["pageIndex"] = options.page;
                             params["firstIndex"] = options.skip;
                             params["lastIndex"] = options.skip + options.take;
                             params["sort"] = options.sort;
                             params["licenseNo"] = $("#licenseNo").val();
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
                             ,note2:{type:"string" }//保额
                             ,insuranceStartDate:{type:"string"}
                             ,insuranceEndDate:{type:"string"}
                             ,note4:{type:"string"}
                             ,note5:{type:"string"} 

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
                   }  //车辆识别码
                   ,{
                       title:"<spring:message code='global.lbl.carNo' />"
                      ,field:"carRegNo", width:50
                      ,headerAttributes:{style:"text-align:center;"}
                      ,attributes:{"class":"al"}
                   }  //车牌号 
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
                   }  //保险公司代码
                   ,{
                       title:"<spring:message code='ser.lbl.incCmpNm' />"
                      ,field:" icName", width:60
                      ,headerAttributes:{style:"text-align:center;"}
                      ,attributes:{"class":"al"}
                   }  //保险公司名称 
                   ,{
                       title:"<spring:message code='sal.lbl.incTp' />"
                      ,field:" code", width:150
                      ,headerAttributes:{style:"text-align:center;"}
                      ,attributes:{"class":"al"}
                   }  //险种
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
                   }  //保险开始日期
                   ,{
                       title:"<spring:message code='ser.lbl.incEndDt' />"
                      ,field:"insuranceEndDate", width:75
                      ,headerAttributes:{style:"text-align:center;"}
                      ,attributes:{"class":"al"}
                   }  //保险结束日期
                   ,{
                       title:"<spring:message code='ser.lbl.vehicleOwner' />"
                      ,field:"note4", width:50
                      ,headerAttributes:{style:"text-align:center;"}
                      ,attributes:{"class":"al"}
                   }  //车主
                   ,{
                       title:"<spring:message code='ser.lbl.mobilePhone' />"
                      ,field:"note5", width:75
                      ,headerAttributes:{style:"text-align:center;"}
                      ,attributes:{"class":"al"}
                   }  //手机
                  ]
        	});
        }
    });
</script>