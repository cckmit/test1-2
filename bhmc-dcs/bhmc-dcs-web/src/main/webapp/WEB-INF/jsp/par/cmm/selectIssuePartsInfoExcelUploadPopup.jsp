<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<link rel="stylesheet" href="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.css"/>" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.form.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/dms/jquery.ui.ext-1.0.js"/>"></script>
<style type="text/css">
    .progress_section {background-color:#ffffff;border:1px solid #ddd;padding:5px;position:absolute;width:400px;top:150px;z-index:1500;margin-left:-300px;left:50%;display:none;}
    #progressMessage {height:20px;}
    #progressbar {height:25px;}
</style>

<section id="windows" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnFileDownload" class="btn_s"><spring:message code="global.btn.templateDownload" /></button>
        	<button id="btnDel" class="btn_s"><spring:message code='global.btn.rowDel' /></button>
            <button id="btnSave" class="btn_s btn_save"><spring:message code="global.btn.save" /></button>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" action="<c:url value="/par/ism/issue/insertIssuePartsInfoExcelUploadFile.do"/>">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:70%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <td>
                        <input type="file" id="uploadFile" name="uploadFile" class="form_file" />
                    </td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        </form>
    </div>

    <div id="progressSection"></div>

    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>
</section>

<script type="text/javascript">
//그리드 목록 번호
var rowNumber = 0;
var localData = {"data":[], "total":0}

/**
 * 팝업 옵션
 */
 var options = parent.issuePartsInfoExcelUploadPopupWin.options.content.data;

$(document).ready(function() {

	//파일업로드 
	$("#uploadFile").change(function(){
		if(dms.string.isEmpty($(this).val())) {
     		dms.notification.show("<spring:message code='global.lbl.file' var='fileMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${fileMsg}' />", "popup");
     		return;
 		}
 		$("#progressSection").excelUpload("upload");
	});
    
  	//버튼 - 양식다운로드
    $("#btnFileDownload").kendoButton({
        click:function(e){
        	//TODO[양식다운로드적용]
            //location.href = "<c:url value='/cmm/sci/selectExcelTemplateDownload.do' />" + "?fileNm=MessageSource_Tpl.xlsx";
        }
    });
    
  	//버튼 - 행삭제
	$("#btnDel").kendoButton({
    	click:function(e){
    		var grid = $("#grid").data("kendoExtGrid");
			var rows = grid.select();

            rows.each(function(index, row) {
				grid.removeRow(row);
			});
   		}
	});

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e){
            /* var saveList  = [],
                grid      = $("#grid").data("kendoExtGrid"),
                rows      = grid.tbody.find("tr");

            //var saveData = grid.dataSource.data();

            if(rows.length  == 0 ){
                // 선택값이 없습니다.
                dms.notification.warning("<spring:message code='global.info.unselected' />");
                return false;
            }

            rows.each(function(index, row) {
                var gridData = grid.dataSource.at(index);
                console.log('gridData:', gridData);
                if(Number(gridData.errorCount) > 0){
                    // 납기일를 입력하십시오
                    dms.notification.warning("<spring:message code='par.lbl.periodDeliveryDt' var='periodDeliveryDt' /><spring:message code='global.info.confirmMsgParam' arguments='${periodDeliveryDt}'/>");
                    //saveList = [];
                    //return false;
                }else{
                    saveList.push(gridData);
                }

            });


            if(saveList.length == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
            }

            console.log(' saveList:',  saveList);
            options.callbackFunc(saveList); */

       }
    });

    $("#progressSection").excelUpload({
        progressId :"UPLOAD_PARTS_SALES"
        ,uploadForm :"uploadForm"
        ,messages:{
            fileUpload:"<spring:message code='global.info.fileUpload.processing' />"
            ,fileUploadComplete:"<spring:message code='global.info.fileUpload.complete' />"
            ,dataExtract:"<spring:message code='global.info.excelUpload.dataExtract.complete' />"
            ,dataExtractComplate:"<spring:message code='global.info.excelUpload.dataExtract.processing' />"
            ,uploadComplete:"<spring:message code='global.info.excelUpload.complete' />"
        }
        ,callback:function(obj){
            localData = obj;

            console.log('obj:', obj);

            if(obj.total === '-999'){
                options.callbackFunc.call(obj);
            }else{
                $('#grid').data('kendoExtGrid').dataSource.read();
            }
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
            data:localData
            ,transport:{
                read:function (options) {
                    options.success(localData);
                }
            }
            ,serverPaging:false
            ,serverSorting:false
            ,schema:{
                model:{
                    fields:{
                         itemCd         :{type:"string", validation:{required:true}}
                        ,purcExcelQty   :{type:"number", validation:{required:true}}
                        ,errorCount     :{type:"string", editable:false}
                        ,errors         :{type:"object", editable:false}
                    }
                }
            }
        }
        , height:250
        , pageable:false
        , dataBound:function onDataBound(e){
           // $("#btnSave").trigger('click');
         }
        ,columns:[
            {title:"<spring:message code='par.lbl.no' />", width:30, sortable:false
                ,attributes:{"class":"ac"}
                ,template:"#= ++rowNumber #"
            }
            ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"purcExcelQty", title:"<spring:message code='par.lbl.purcQty' />", width:40
                ,attributes:{"class":"ac"}
            }
            ,{field:"errorCount", title:"<spring:message code='par.lbl.errYn' />", width:40
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    if(dataItem.errorCount == 0){
                        return "N";
                    }
                    return "Y";
                }
            },
            {field:"errors", title:"<spring:message code='par.lbl.errMesgTxt' />", width:200
                ,template:function(dataItem) {  //에러메세지
                    var str = "";
                    $.each(dataItem.errors, function(idx, obj){
                        str += "<div>" + obj.errorMessage + "</div>";
                    });

                    return str;
                }
            }
        ]

    });

    //$("#btnSave").hide();

});
</script>









