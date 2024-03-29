<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 클레임 조회 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.claimList" /> --%><!-- 클레임 조회 --></h1>
            <div class="btn_right">
                <button class="btn_m" id="btnSend"><spring:message    code="par.btn.transmission" /><!--전송  --></button>
                <button class="btn_m btn_reset" id="btnInit"><spring:message    code="par.btn.init" /><!-- 초기화 --></button>
                <button class="btn_m btn_search" id="btnSearch"><spring:message  code="par.btn.search" /><!-- 조회 --></button>
                <button class="btn_m btn_save" id="btnSave"><spring:message    code="par.btn.save" /><!-- 저장 --></button>
                <button class="btn_m btn_cancel" id="btnDelItem"><spring:message code="par.btn.cancel" /><!-- 취소 --></button>
            </div>
        </div>

        <div class="table_form form_width_70per"  role="search" data-btnid="btnSearch" id="searchForm">
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
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.bpCd" /><!-- 공급업체 --></span></th>
                        <td>
                            <input id="sBpCd" class="form_input hidden form_readonly" readonly >
                            <input id="sBpNm" class="form_input form_readonly"  readonly>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.invcDocNo" /><!-- 송장번호 --></th>
                        <td>
                            <input id="sMobisInvcNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></th>
                        <td>
                            <input id="sPurcOrdNo" class="form_input" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.regDt" /><!-- 등록일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sRegDtFr" class="form_datepicker" data-type="maskDate">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sRegDtTo" class="form_datepicker" data-type="maskDate">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.claimDocNo" /><!-- 클레임번호 --></th>
                        <td>
                            <input id="sClaimDocNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 품목번호 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sItemCd" class="form_input" value="${itemCd}">
                                <a id="searchItemCd"><!-- 검색 --></a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                        <td>
                            <input id="sCarlineCd" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.claimStatCd" /><!-- 클레임 상태 --></th>
                        <td>
                            <input type="text" id="sClaimStatCd" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></th>
                        <td>
                            <input type="text" id="sItemNm" class="form_input" value="${itemNm}">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABC CLASS --></th>
                        <td>
                            <input id="sAbcInd" data-type="combo" class="form_comboBox">
                        </td>
                        <th scope="row"></th>
                        <td></td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <!-- 클레임대상 그리드 -->
            <div id="grid" class="resizable_grid"></div>
        </div>

        <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="par.title.pictureInfo" /><!-- 사진 --></h2>
            </div>
            <div class="photo_area"></div>
        </section>
    </section>
</div>
    <!-- //구매오더 -->

<!-- script -->
<script>

        var sessionBpCd         = "${bpCd}",
            sessionBpNm         = "${bpNm}",
            toDt                = "${toDt}",
            sevenDtBf           = "${sevenDtBf}",
            invcUnitObj         = {},
            prcTpList           = [],
            prcTpObj            = {},
            abcIndList          = [],
            carlineCdList       = [],
            claimTpList         = [],
            claimTpObj          = {},
            claimStatCdList     = [],
            claimStatCdObj      = {},
            claimTargetTpList   = [],
            claimTargetTpObj    = {},
            purcItemTpList      = [],
            purcItemTpObj       = {},
            popItemObj          = {},
            checkdIds           = {},
            changeClaimTp,
            changeClaimStatCd,
            changePrcTp,
            changeInvcUnit,
            searchItemPopupWindow,
            searchTrsfTp,
            transObj;


        <c:forEach var="obj" items="${prcTpList}" varStatus="status">
            prcTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        <c:forEach var="obj" items="${invcUnitList}" varStatus="status">
            invcUnitObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
        </c:forEach>

        claimTpObj[' '] = "";
        <c:forEach var="obj" items="${clTpList}" varStatus="status">
            claimTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            claimTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        claimStatCdObj[' '] = "";
        <c:forEach var="obj" items="${claimStatCdList}" varStatus="status">
            claimStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            claimStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        claimTargetTpObj[' '] = "";
        <c:forEach var="obj" items="${clTargetTpList}" varStatus="status">
            claimTargetTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            claimTargetTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        abcIndList.push({cmmCd:"", cmmCdNm:"ALL"});
        <c:forEach var="obj" items="${abcIndList}" varStatus="status">
            abcIndList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

        carlineCdList.push({cmmCd:"", cmmCdNm:"ALL"});
        <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
            carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
        </c:forEach>

    $(document).ready(function() {


        $("#sClaimStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:claimStatCdList
           ,index:0
       });

        $("#sAbcInd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:abcIndList
           ,index:0
       });

        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:carlineCdList
           ,index:0
       });

        $("#sRegDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sRegDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });


        $("#searchItemCd").on('click', selectPartsMasterPopupWindow);


        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });

        // 저장 버튼
        $("#btnSave").kendoButton({
            click:function(e){

                var saveList      = [],
                    grid          = $("#grid").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    lCrud         = '',
                    paramUrl      = '',
                    chkRow,
                    header;

                header = {
                      bpCd            :$("#sBpCd").val()
                };

                if(dms.string.isEmpty($("#sBpCd").val())){
                    //거래처정보는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.required.field' arguments='${bpCd}'/>");
                    return false;
                }

                if(rows.length  == 0 ){
                    // 선택값이 없습니다.
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index);
                    chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                    if(chkRow === true){

                        if(dms.string.isEmpty(gridData.invcQty) || gridData.invcQty == 0){
                            // 수량을 입력하십시오
                            dms.notification.warning("<spring:message code='par.lbl.qty' var='qty' /><spring:message code='global.info.confirmMsgParam' arguments='${qty}'/>");
                            saveList = [];
                            return false;
                        }

                        if(dms.string.isEmpty(gridData.invcPrc) || gridData.invcPrc == 0){
                            // 단가를 입력하십시오.
                            dms.notification.warning("<spring:message code='par.lbl.prc' var='prc' /><spring:message code='global.info.confirmMsgParam' arguments='${prc}'/>");
                            saveList = [];
                            return false;
                        }

                        if(dms.string.isEmpty(gridData.claimQty) || gridData.claimQty == 0){
                            // 클레임 수량을 입력하십시오
                            dms.notification.warning("<spring:message code='par.lbl.claimQty' var='claimQty' /><spring:message code='global.info.confirmMsgParam' arguments='${claimQty}'/>");
                            saveList = [];
                            return false;
                        }

                        if(gridData.claimQty > 0){

                            if(Number(gridData.claimQty) > Number(gridData.invcQty)){
                                // 클레임 수량이 입고확정수량보다 클 수 없습니다.
                                dms.notification.warning("<spring:message code='par.err.compareClaimInvcQty' />");
                                saveList = [];
                                return false;
                            }

                            if(dms.string.isEmpty(gridData.claimTp)){
                                // 클레임 사유를 선택하십시오
                                dms.notification.warning("<spring:message code='par.lbl.claimTp' var='claimTp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${claimTp}'/>");
                                saveList = [];
                                return false;
                            }

                            if(dms.string.isEmpty(gridData.claimTargCd)){
                                // 클레임 대상을 선택하십시오
                                dms.notification.warning("<spring:message code='par.lbl.claimTargetCd' var='claimTargetCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${claimTargetCd}'/>");
                                saveList = [];
                                return false;
                            }else{
                                //클레임 대상이 배송처인 경우
                                if(gridData.claimTargCd === '02'){
                                    if(dms.string.isEmpty(gridData.dlBpCd)){
                                        // 배송업체를 선택하십시오
                                        dms.notification.warning("<spring:message code='par.lbl.dlBpCd' var='dlBpCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${dlBpCd}'/>");
                                        saveList = [];
                                        return false;
                                    }

                                    if(dms.string.isEmpty(gridData.dlBpNm)){
                                        // 배송업체를 선택하십시오
                                        dms.notification.warning("<spring:message code='par.lbl.dlBpCd' var='dlBpCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${dlBpCd}'/>");
                                        saveList = [];
                                        return false;
                                    }
                                }
                            }


                        }

                        saveList.push(gridData);
                    }
                });

                if(saveList.length > 0){
                    var data ={
                           "ClaimVO":saveList
                        };

                    $.ajax({
                         url:"<c:url value='/par/pcm/claim/updateClaim.do' />"
                        ,data:kendo.stringify(data)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,async:false
                        ,success:function(result) {
                            if (result === 1) {
                                dms.notification.success("<spring:message code='par.lbl.claim' var='claim' /><spring:message code='global.info.regSuccessParam' arguments='${claim}'/>");
                                $("#grid").data("kendoExtGrid").dataSource.read();

                            } else {
                                if(result === 0){
                                    dms.notification.error("<spring:message code='par.lbl.claim' var='claim' /><spring:message code='global.err.regFailedParam' arguments='${claim}'/>");
                                }
                            }

                        }
                        ,error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }

                    });
                }

              }
        });

        /**
         * grid 클레임사유 DropDownList
         */
         grClaimTpDropDownEditor = function(container, options) {

             $('<input data-bind="value:' + options.field + '"  />')
             .appendTo(container)
             .kendoExtDropDownList({
                 dataTextField: "cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:  claimTpList
                ,change:function(e){
                    $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                 }
             });


         };

        /**
         * grid 클레임사유 change
         */
         changeGrClaimTp = function() {

         };

        /**
         * grid 클레임대상 DropDownList
         */
         claimTargCdDropDownEditor = function(container, options) {

             $('<input data-bind="value:' + options.field + '"  />')
             .appendTo(container)
             .kendoExtDropDownList({
                 dataTextField: "cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:  claimTargetTpList
                ,change:function(e){
                    $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                 }
             });

             $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
         };

         copyToClipboard = function(grid, row, idx){
             var colName = grid.options.columns[idx].field;
             var value = grid.dataItem(row)[colName];
             window.prompt("Copy to clipboard:Ctrl + C, Enter", value);
         };

         // 클레임 관리 그리드
         $("#grid").kendoExtGrid({
             gridId:"G-PAR-0808-154401"
            ,dataSource:{
                 transport:{
                     read:{
                          url:"<c:url value='/par/pcm/claim/selectClaimManageItemByCondition.do' />"
                     }
                     , parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};

                             params["sort"]               = options.sort;

                             // 입고확정대상 검색조건 코드.
                             params["sCarlineCd"]         = $("#sCarlineCd").data("kendoExtDropDownList").value();
                             params["sAbcInd"]            = $("#sAbcInd").data("kendoExtDropDownList").value();
                             params["sClaimStatCd"]       = $("#sClaimStatCd").data("kendoExtDropDownList").value();
                             params["sBpCd"]              = $("#sBpCd").val();
                             params["sPurcOrdNo"]         = $("#sPurcOrdNo").val();
                             params["sMobisInvcNo"]       = $("#sMobisInvcNo").val();
                             params["sClaimDocNo"]        = $("#sClaimDocNo").val();
                             params["sItemCd"]            = $("#sItemCd").val();
                             params["sItemNm"]            = $("#sItemNm").val();
                             params["sRegDtFr"]           = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                             params["sRegDtTo"]           = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();


                             return kendo.stringify(params);
                         }
                     }
                 }
                 ,schema:{
                      data:function (result){
                          if(result.total === 0){
                              dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                          }
                          return result.data;
                      }
                     ,total:"total"
                     ,model:{
                        id:"claimDocNo"
                       ,fields:{
                               dlrCd          :{ type:"string" , validation:{required:true} }
                             , claimDocNo     :{ type:"string", editable:false }
                             , claimStatCd    :{ type:"string", editable:false }
                             , invcDocNo      :{ type:"string", editable:false }
                             , invcDocLineNo  :{ type:"number", editable:false }
                             , invcDt         :{ type:"date"  , editable:false }
                             , purcOrdNo      :{ type:"string", editable:false }
                             , purcOrdLineNo  :{ type:"number", editable:false }
                             , mobisInvcNo    :{ type:"string", editable:false }
                             , mobisInvcLineNo:{ type:"number", editable:false }
                             , itemCd         :{ type:"string", editable:false }
                             , itemNm         :{ type:"string", editable:false }
                             , invcQty        :{ type:"number", editable:false }
                             , invcUnitCd     :{ type:"string", editable:false }
                             , prcTp          :{ type:"string", editable:false }
                             , prc            :{ type:"number", editable:false }
                             , amt            :{ type:"number", editable:false }
                             , claimUnitCd    :{ type:"string", editable:false}
                             , claimQty       :{ type:"number" }
                             , claimTp        :{ type:"string" }
                             , claimTargCd    :{ type:"string" }
                             , dlBpCd         :{ type:"string" }
                             , dlBpNm         :{ type:"string" }
                             , reqCont        :{ type:"string" }
                             , docFileNo      :{ type:"string" }
                         }
                     }
                 }
             }
             , height:250
             , selectable :"multiple"
             , scrollable :true
             , sortable   :true
             , filterable:false
             , appendEmptyColumn:true           //빈컬럼 적용. default:false
             , autoBind   :false
            // , multiSelectWithCheckbox:true
             , change:function(e){
                 var grid = this,
                     rows = e.sender.select(),
                     selecLeng = e.sender.select().length;

                 if(selecLeng > 1){
                     rows.each(function(index, row) {
                         $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                     });
                 }else if(selecLeng === 1){
                     rows.each(function(index, row) {
                          if (!$(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked")) {
                              $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                          }else {
                              $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
                          }
                      });
                 }

              }
             , pageable:false
             , edit:function(e){
                 var eles = e.container.find("input"),
                     rows = e.sender.select(),
                     selectedItem = e.sender.dataItem(rows[0]),
                     grid = this,
                     fieldName = grid.columns[e.container.index()].field;

                 if(fieldName === "dlBpNm"){
                      this.closeCell();
                 }else if(fieldName === "claimQty" || fieldName === "claimTp" || fieldName === "claimTargCd" || fieldName === "grStrgeCd" || fieldName === "grLocCd" || fieldName === "reqCont"){
                     $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);
                 }else if(fieldName === "chk"){
                     this.closeCell();
                 }

              }
             , columns:[
                   {
                       title:"&nbsp;"
                      ,field:"chk"
                      ,width:30
                      ,attributes:{style:"text-align:center;"}
                      ,template:"<input type='checkbox' data-uid='#= uid #' class='grid-checkbox-item' data-chk=false/>"
                      ,headerTemplate:"<input type='checkbox' class='grid-checkAll'/>"
                   }
                 , {   //딜러코드
                       title:"<spring:message code='par.lbl.dlrCd' />"
                      ,field:"dlrCd"
                      ,width:80
                      ,hidden:true
                   }
                 , {   //클레임번호
                       title:"<spring:message code='par.lbl.claimDocNo' />"
                      ,field:"claimDocNo"
                      ,width:90
                   }
                 , {   //클레임상태
                       title:"<spring:message code='par.lbl.claimStatCd' />"
                      ,field:"claimStatCd"
                      ,attributes:{ "style":"text-align:center"}
                      ,template:'#= changeClaimStatCd(claimStatCd)#'
                      ,width:90
                   }
                 , {   //INVOICE일자
                       title:"<spring:message code='par.lbl.invcDt' />"
                      ,field:"invcDt"
                      ,width:90
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,attributes:{ "style":"text-align:center"}
                   }
                 , {   //송장번호
                       title:"<spring:message code='par.lbl.invcDocNo' />"
                      ,field:"mobisInvcNo"
                      ,width:140
                   }
                 , {   //송장라인번호
                       title:"<spring:message code='par.lbl.lineNm' />"
                      ,field:"mobisInvcLineNo"
                      ,attributes:{ "style":"text-align:right"}
                      ,width:40
                   }
                 , {  //거래처 코드
                       title:"<spring:message code='par.lbl.bpCd' />"
                      ,field:"bpCd"
                      ,width:105
                      ,hidden:true
                   }
                 , {  //공급업체
                       title:"<spring:message code='par.lbl.bpCd' />"
                      ,field:"bpNm"
                      ,width:140
                      ,hidden:true
                   }
                 , {   //구매오더번호
                       title:"<spring:message code='par.lbl.purcOrdNo' />"
                      ,field:"purcOrdNo"
                      ,width:100
                   }
                 , {   //Line
                       title:"<spring:message code='par.lbl.lineNm' />"
                      ,field:"purcOrdLineNo"
                      ,attributes:{ "style":"text-align:right"}
                      ,width:40
                   }
                 , {   //송장번호
                       title:"<spring:message code='par.lbl.invcDocNo' />"
                      ,field:"invcDocNo"
                      ,width:100
                      ,hidden:true
                   }
                 , {   //송장번호
                       title:"<spring:message code='par.lbl.lineNm' />"
                      ,field:"invcDocLineNo"
                      ,width:100
                      ,hidden:true
                   }
                 , {   //부품번호
                       title:"<spring:message code='par.lbl.itemCd' />"
                      ,field:"itemCd"
                      ,width:140
                   }
                 , {   //부품명
                       title:"<spring:message code='par.lbl.itemNm' />"
                      ,field:"itemNm"
                      ,width:200
                   }
                 , {   //입고수량
                       title:"<spring:message code='par.lbl.grQty' />"
                      ,field:"invcQty"
                      ,width:60
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n0}"
                      ,decimal:0
                   }
                 , {   //단위
                       title:"<spring:message code='par.lbl.unitNm' />"
                      ,field:"invcUnitCd"
                      ,width:80
                      ,attributes:{ "style":"text-align:center"}
                      ,template:'#= changeInvcUnit(invcUnitCd)#'
                      ,hidden:true
                   }
                 , {   //단가유형
                       title:"<spring:message code='par.lbl.prcTp' />"
                      ,field:"prcTp"
                      ,width:80
                      ,attributes:{ "style":"text-align:center"}
                      ,template:'#= changePrcTp(prcTp)#'
                      ,hidden:true
                   }
                 , {   //단가
                       title:"<spring:message code='par.lbl.prc' />"
                      ,field:"prc"
                      ,width:90
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n2}"
                      ,decimals:2
                   }
                 , {   //금액
                       title:"<spring:message code='par.lbl.amt' />"
                      ,field:"amt"
                      ,width:90
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n2}"
                      ,decimals:2
                   }
                 , {   //클레임수량
                       title:"<spring:message code='par.lbl.claimQty' />"
                      ,field:"claimQty"
                      ,width:70
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n0}"
                      ,editor:function(container, options){
                          var input = $("<input/>");

                          input.attr("name", options.field);
                          input.appendTo(container);
                          input.kendoExtNumericTextBox({
                              min:0,
                              spinners:false
                          });
                      }
                      ,decimal:0
                   }
                 , {   //클레임사유
                       title:"<spring:message code='par.lbl.claimTp' />"
                      ,field:"claimTp"
                      ,width:100
                      ,editor:grClaimTpDropDownEditor
                      ,change:changeGrClaimTp
                      ,template:'#= changeClaimTp(claimTp)#'
                   }
                 , {   //클레임대상
                       title:"<spring:message code='par.lbl.claimTargetCd' />"
                      ,field:"claimTargCd"
                      ,width:100
                      ,editor:claimTargCdDropDownEditor
                      ,template:'#= changeClaimTargCd(claimTargCd)#'
                   }
                 , {   //배송업체 코드
                       title:"<spring:message code='par.lbl.dlBpCd' />"
                      ,field:"dlBpCd"
                      ,width:105
                      ,hidden:true
                   }
                 , {   //배송업체 코드
                       title:"<spring:message code='par.lbl.dlBpCd' />"
                      ,field:"dlBpNm"
                      ,attributes:{ "style":"text-align:right"}
                      ,template:"<span>#:dlBpNm #<img src='<c:url value='/resources/img/btn_search.png'/>' style='float:right;cursor:pointer;' onclick='fnDlBpCdPop(this)'/></span>"
                      ,width:140
                   }
                 , {   //요청사항
                       title:"<spring:message code='par.lbl.reqCont' />"
                      ,field:"reqCont"
                      ,width:140
                   }
                 , {   //사진파일
                       title:"<spring:message code='par.lbl.pictureFile' />"
                      ,field:"docFileNo"
                      ,width:80
                   }
             ]
         });

         // 클레임사유
         changeClaimTp = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = claimTpObj[val];
             }
             return returnVal;
         };


         // 클레임상태
         changeClaimStatCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = claimStatCdObj[val];
             }
             return returnVal;
         };



         // 가격유형
         changePrcTp = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = prcTpObj[val];
             }
             return returnVal;
         };

         //단위
         changeInvcUnit = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 //returnVal = invcUnitObj[val];
             }
             return returnVal;
         };

        // 부품 팝업 열기 함수.
        function selectPartsMasterPopupWindow(){

            searchItemPopupWindow = dms.window.popup({
                windowId:"partsMasterPopup"
                ,title:"<spring:message code='par.title.itemInfo' />"   // 품목정보
                ,content:{
                    url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
                    ,data:{
                        "type":"custom1"
                        ,"autoBind":false
                        ,"itemCd":$("#sItemCd").val()
                        ,"callbackFunc":function(data){
                            if(data.length > 0)
                            {
                                $("#sItemCd").val(data[0].itemCd);
                                $("#sItemNm").val(data[0].itemNm);
                            }
                        }
                    }
                }
            });
        }

        function initPage(){
            var minDate = new Date(sevenDtBf),
                maxDate = new Date(toDt),
                toYY,
                toMM,
                toDD,
                frYY,
                frMM,
                frDD;


            //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
            //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
                return false;
            }

            // 품목 정보 Reset
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            partsJs.validate.groupObjAllDataInit();

            //$("#grid").data("kendoExtGrid").dataSource.data([]);

            popItemObj = {};

            $("#sBpCd").val(sessionBpCd);  //공급업체 기본셋팅
            $("#sBpNm").val(sessionBpNm);  //공급업체 기본셋팅

            frYY = minDate.getFullYear();
            frMM = minDate.getMonth();
            frDD = minDate.getDate();

            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();

            $("#sRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
            $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);

            $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));


        }

        /*
        function fnChkDateValue(e){

            var chkDateValue = dms.string.checkDate($(this),$(this).val(),'date');

            if(!chkDateValue.result){
                var chkArgs = chkDateValue.resultArgs;

                if(dms.string.isEmpty(chkArgs)){
                    dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
                }else{
                    dms.notification.warning("<spring:message code='global.err.checkDateExceedParam' arguments='" + chkArgs + "'/>");
                }
                $(this).data("kendoExtMaskedDatePicker").value(new Date(toDt));
            }else{
                $(this).data("kendoExtMaskedDatePicker").value(new Date(chkDateValue.resultMsg));
            }

        }
        */
        function fnChkDateValue(e){

            var  elmt  = e.sender.element[0],
                 id    = elmt.id,
                 toYY,
                 toMM,
                 toDD,
                 frYY,
                 frMM,
                 frDD;

            if(this.value() == null){
                if(id === 'sRegDtFr'){
                    var minDate = new Date(sevenDtBf);
                    frYY = minDate.getFullYear();
                    frMM = minDate.getMonth();
                    frDD = minDate.getDate();
                    $("#sRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                    $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                }else if(id === 'sRegDtTo'){
                    var maxDate = new Date(toDt);
                    toYY = maxDate.getFullYear();
                    toMM = maxDate.getMonth();
                    toDD = maxDate.getDate();

                    $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                    $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                }
            }else{
                if(id === 'sRegDtFr'){
                    frYY = this.value().getFullYear();
                    frMM = this.value().getMonth();
                    frDD = this.value().getDate();
                    $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                }else if(id === 'sRegDtTo'){
                    toYY = this.value().getFullYear();
                    toMM = this.value().getMonth();
                    toDD = this.value().getDate();
                    $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                }
            }
        }

        initPage();
    });

    function fnDlBpCdPop(e){
        var grid     = $("#grid").data("kendoExtGrid"),
            //rowIndex = grid.items().index(grid.select()),
            tr       = grid.select().closest("tr"),
            dataItem = grid.dataItem(tr);


        if(dataItem.claimTargCd === '02'){
            selectVenderMasterPopupWindow();

        }else{
            dms.notification.warning("<spring:message code='par.err.claimTargetChk' />");
        }

        //var selected = grid.select();
    }

     // 클레임대상
    changeClaimTargCd = function(val){
        var returnVal = "",
            grid     = $("#grid").data("kendoExtGrid"),
            rowIndex = grid.items().index(grid.select()),
            dataItem = grid.dataSource.at(rowIndex);


        if(val != null && val != ""){
            returnVal = claimTargetTpObj[val];

            if(!dms.string.isEmpty(dataItem)){
                if(dataItem.claimTargCd !== '02'){
                   dataItem.set("dlBpCd", '');
                   dataItem.set("dlBpNm", '');
                }
            }
        }
        return returnVal;
    };

    $(document).on("click", ".grid-checkAll", function(e){
        var grid = $("#grid").data("kendoExtGrid");
        var checked = $(this).is(":checked");
        var rows = grid.tbody.find("tr");

        if(checked){
            rows.each(function(index, row) {
                grid.select($(this));
                $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
            });



        }else{
            grid.clearSelection();

            rows.each(function(index, row) {
                $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
            });
        }
    });

    var venderSearchPopupWin;
    function selectVenderMasterPopupWindow(){

        venderSearchPopupWin = dms.window.popup({
            windowId:"venderSearchPopupWin"
            ,title:"<spring:message code = 'par.title.venderSelect'/>"   // 거래처 조회
            ,deactivate :false
            ,content:{
                url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":true
                    ,"bpTp":'04'
                    ,"callbackFunc":function(data){
                        var grid = $("#grid").data("kendoExtGrid"),
                        tr = grid.select().closest("tr"),
                        dataItem = grid.dataItem(tr);

                        dataItem.set("dlBpCd", data[0].bpCd);
                        dataItem.set("dlBpNm", data[0].bpNm);

                        venderSearchPopupWin.close();
                    }
                }
            }
        });
    }
</script>
<!-- //script -->

