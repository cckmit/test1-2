<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 대상자 추출 팝업 -->
    <section id="window" class="pop_wrap">

        <div class="header_area">
            <div class="btn_right">
                <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
                <button class="btn_m btn_delete" id="btnDel"><spring:message code="global.btn.rowDel" /></button>
                <button type="button" class="btn_m" id="btnCtlExcelExport"><spring:message code="global.btn.excelExport" /><!-- 엑셀Export --></button>
            </div>
        </div>

        <!-- 조회결과 -->
        <div class="table_grid">
            <input id="makCd" name="makCd" type="hidden">
            <input id="extrDgreCnt" name="extrDgreCnt" type="hidden">
            <input id="statCd" name="statCd" type="hidden">
            <div id="targGrid"></div>
        </div>
        <!-- // 조회결과 -->
    </section>
    <!-- //대상자 추출 팝업 -->

<!-- script -->
<script>

function gridCommonParams() {
    // 그리드 상세 조회 및 엑셀export 수량 확인을 위한 공통 param
    var params = {};

    params["sMakCd"]          = $("#makCd").val();
    params["sExtrDgreCnt"]    = $("#extrDgreCnt").val();

    return params;

};

$(document).ready(function() {

    /************************************************************
        팝업옵션 설정
    *************************************************************/
    /**
    * 팝업 옵션
    */
    var options = parent.targExtractDetailSearchPopupWin.options.content.data;

    // 딜러코드
    // 캠페인번호
    $("#makCd").val("${makCd}");
    // 추출차수
    $("#extrDgreCnt").val("${extrDgreCnt}");
    // 진행상태
    $("#statCd").val("${statCd}");

    if($("#statCd").val() != "03" && $("#statCd").val() != "05"){
        $("#btnSave").show();
        $("#btnDel").show();
    }else{
        $("#btnSave").hide();
        $("#btnDel").hide();
    }

    //버튼 - 삭제
    $("#btnDel").kendoButton({
        click:function(e) {
            var grid = $("#targGrid").data("kendoExtGrid");
            var rows = grid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {

            var grid = $("#targGrid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/crm/cmm/crmTargExtract/multiCrmTargExtractDetails.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(jqXHR, textStatus) {

                        grid.dataSource._destroyed = [];
                        grid.dataSource.read();

                        // 부모 화면 오브젝트 컨트롤
                        parent.resultKey = $("#makCd").val();
                        parent.isGridReload = true;

                        parent.$("#mcdGrid").data("kendoExtGrid").dataSource.read();

                        parent.$("#targetGrid").data("kendoExtGrid").dataSource.read();

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                    ,beforeSend:function(xhr){
                        dms.loading.show($("#window"));
                    }
                    ,complete:function(xhr,status){
                        dms.loading.hide($("#window"));
                    }
                });
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });

    //대상자 그리드 설정
    $("#targGrid").kendoExtGrid({
        gridId:"G-CRM-0725-190601"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/crm/cmm/crmTargExtract/selectCrmTargExtractPopups.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params = $.extend(params, gridCommonParams());

                        //console.log("11params : ",kendo.stringify(params))
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
                        rnum:{type:"string", editable:false}
                        ,dlrCd:{type:"string", editable:false}
                        ,makCd:{type:"string", editable:false}
                        ,custNo:{type:"string", editable:false}
                        ,custNm:{type:"string", editable:false}
                        ,hpNo:{type:"string", editable:false}
                        ,addrDetlCont:{type:"string", editable:false}
                        ,emailNm:{type:"string", editable:false}
                        ,wechatId:{type:"string", editable:false}
                        ,blueMembershipYn:{type:"string", editable:false}
                        ,membershipYn:{type:"string", editable:false}
                        ,haveCarCnt:{type:"number", editable:false}
                        ,carRegNo:{type:"string", editable:false}
                        ,carlineNm:{type:"string", editable:false}
                        ,modelNm:{type:"string", editable:false}

                    }
                }
            }
        }
        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        , multiSelectWithCheckbox:true     //멀티선택 적용. default:false
        , appendEmptyColumn:false          //빈컬럼 적용. default:false
        , enableTooltip:true               //Tooltip 적용, default:false
        ,filterable:false
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
            ,{field:"dlrCd", hidden:true}
            ,{field:"makCd", hidden:true}
            ,{field:"custNo", hidden:true}
            ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100, attributes:{"class":"ac"}}
            ,{field:"hpNo", title:"<spring:message code='global.lbl.cellphone' />", width:100, attributes:{"class":"ac"}}
            ,{field:"addrDetlCont", title:"<spring:message code='par.lbl.addr' />", width:300, attributes:{"class":"al"}}
            ,{field:"emailNm", title:"<spring:message code='global.lbl.emailNm' />", width:200, attributes:{"class":"al"}}
            ,{field:"wechatId", title:"<spring:message code='global.lbl.wechat' />", width:150, attributes:{"class":"al"}}
            ,{field:"blueMembershipYn"  , title:"<spring:message code='crm.lbl.blueMembershipYn' />", width:90, sortable:false
                , attributes:{"class":"ac"}
                , template:"#if (blueMembershipYn == 'Y'){# <span class='icon_ok'></span> #} else {# #}#"
            }  // 블루멤버십 BLUE_MEMBERSHIP_NO
            ,{field:"membershipYn"  , title:"<spring:message code='crm.lbl.mbrShipTpYn' />", width:90, sortable:false
                , attributes:{"class":"ac"}
                , template:"#if (membershipYn == 'Y'){# <span class='icon_ok'></span> #} else {# #}#"
            }
            ,{field:"sexCd"   , title:"<spring:message code='global.lbl.sex' />", width:40, sortable:false //성별
                ,attributes:{"class":"ac"}
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    var spanObj = "";
                    if (dataItem.sexCd == 'M') {
                        spanObj = "<span class='icon_male'></span>";
                    } else if (dataItem.sexCd == 'F') {
                        spanObj = "<span class='icon_female'></span>";
                    }
                    return spanObj;
                }
            }
            ,{field:"birthDt"  , title:"<spring:message code='global.lbl.birthday' />", width:100, attributes:{"class":"ac"}}     //생일
            ,{field:"haveCarCnt"   ,title:"<spring:message code='crm.lbl.haveCarCnt' />", width:60, attributes:{"class":"ar"}}   //보유 대수
            ,{field:"carRegNo" ,title:"<spring:message code='global.lbl.carRegNo' />"   ,width:100  ,attributes:{"class":"al"}}   //차량등록번호
            ,{field:"carlineNm" ,title:"<spring:message code='global.lbl.carLine' />"   ,width:100, sortable:false  ,attributes:{"class":"al"}}   //차종
            ,{field:"modelNm"   ,title:"<spring:message code='global.lbl.model' />"     ,width:150, sortable:false  ,attributes:{"class":"al"}}   //차형
        ]
        ,height:435
    });

    //버튼 - 엑셀저장
    $("#btnCtlExcelExport").kendoButton({
        click:function(e) {

            var params = {};
            params = gridCommonParams();

            // 캠페인에 따른 추출대상자 엑셀Export 수량 데이터를 조회한다.
            $.ajax({
                url:"<c:url value='/crm/cmm/crmTargExtract/selectCrmTargExtractPopupsExcelExportCnt.do' />",
                data:JSON.stringify(params),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                },
                success:function(resultCnt) {

                    //console.log("resultCnt : ",resultCnt)
                    <c:set value="10000" var="maxCnt" />;
                    var excelMaxExportCnt = <c:out value="${maxCnt}"/>;

                    if ( resultCnt > excelMaxExportCnt ) {
                        // {엑셀Export}는 { *** 个数} 를 초과할 수 없습니다.
                        dms.notification.warning("<spring:message code='crm.info.excelExport' var='returnMsg1' /><spring:message code='crm.info.maxExcelExportCnt' arguments='${maxCnt}' var='returnMsg2' /><spring:message code='crm.info.maxInfoChk' arguments='${returnMsg1}, ${returnMsg2}' />");
                        return;
                    };

                    var sMakCd = $("#makCd").val();
                    var sExtrDgreCnt = $("#extrDgreCnt").val();

                    dms.ajax.excelExport({
                        "beanName":"marketingCampaignService"
                        ,"templateFile":"CampaignExtractCustRlt_Tpl.xlsx"
                        ,"fileName":"<spring:message code='crm.lbl.rcpeExtrSeq'/>_"+kendo.toString(new Date(), "yyyy-MM-dd-HHmmss")+".xlsx"
                        ,"sMakCd":sMakCd
                        ,"sExtrDgreCnt":sExtrDgreCnt
                        ,"sExcelTp":"CampaignExtractCustRlt"
                    });

                }

            });

        }
    });


});
</script>
<!-- //script -->