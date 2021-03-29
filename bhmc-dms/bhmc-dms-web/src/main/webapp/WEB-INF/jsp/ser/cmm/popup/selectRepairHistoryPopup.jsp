<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.repairHistory" /></h1>
    </div>
    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>
<input type="hidden" id="sRoDocNo" name="sRoDocNo"/>
</section>
<script type="text/javascript">

$(document).ready( function(){

	var parentData = parent.repairHistroyInfoSearchPopup.options.content.data;
	$("#sRoDocNo").val(parentData.sRoDocNo);

    $("#grid").kendoExtGrid({
        gridId:"G-SER-1107-165301"
        ,dataSource:{
         transport:{
            read:{
                url:"<c:url value='/ser/cmm/popup/selectRpirHisReturns.do' />"
            }
            ,parameterMap:function(options, operation) {
                if (operation === "read") {

                    var params = {};

                    params["recordCountPerPage"] = options.pageSize;
                    params["pageIndex"] = options.page;
                    params["firstIndex"] = options.skip;
                    params["lastIndex"] = options.skip + options.take;
                    params["sort"] = options.sort;

                    params["sRoDocNo"] = $("#sRoDocNo").val();

                    return kendo.stringify(params);

                } else if (operation !== "read" && options.models) {
                    return kendo.stringify(options.models);
                }
            }
        }
        ,schema:{
            model:{
                id:"rnum"
                ,fields:{
                     rnum:{type:"number"}
                    ,rpirDt:{type:"date"}
                    ,rpirDtFormat:{type:"date"}
                    ,saNm:{type:"string"}
                    ,rpirCd:{type:"string"}
                    ,rpirNm:{type:"string"}
                    ,wrkStatNm:{type:"string"}
                }
            }
            ,parse:function(d) {
                if(d.data){
                    $.each(d.data, function(idx, elem) {
                        elem.rpirDtFormat = kendo.parseDate(elem.rpirDt, "<dms:configValue code='dateFormat' />");
                    });
                }
                return d;
            }
         }
        }
        ,pageable:false
        ,editable:false
        ,appendEmptyColumn:false
        ,height:330
        ,columns:[
              {field:"rpirDtFormat", title:"<spring:message code='ser.lbl.rpirHisDt' />", width:140
                  ,attributes:{"class":"ac tooltip-enabled"}
                  ,template:"#= dms.string.strNvl(kendo.toString(data.rpirDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
              }//조작일자
             ,{field:"saNm", title:"<spring:message code='ser.lbl.assigner' />", width:80, attributes:{"class":"al"}}//정비배정자
             ,{field:"rpirCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100, attributes:{"class":"al"}}//공임코드
             ,{field:"rpirNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:250, attributes:{"class":"al"}}//정비명칭
             ,{field:"wrkStatNm", title:"<spring:message code='ser.lbl.processWorkStat' />", width:80, attributes:{"class":"ac"}}//정비진도상태
        ]
    });

    if(parentData.autoBind){
      $("#grid").data("kendoExtGrid").dataSource.read();
    }

});
</script>