<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

      <!-- 기본정보 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="global.lbl.custInfo" /></h1> <!-- 고객정보 -->
                    <div class="btn_right">
                        <button type="button" class="btn_m btn_add" id="btnCustReset"><spring:message code="global.btn.add" /></button> <!-- 추가 -->
                        <button type="button" class="btn_m btn_search" id="btnCustSearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
                        <button type="button" class="btn_m btn_save" id="btnCustSave"><spring:message code="global.btn.save" /></button> <!-- 저장 -->
                    </div>
                </div>
<div id="customerForm" name="customerForm" onsubmit="return false;">
                <div class="table_form form_width_100per">
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
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.custNo" /></th> <!-- 고객번호 -->
                                <td>
                                    <input id="custNo" name="custNo" type="text" value="" class="form_input form_readonly"   data-json-obj="true" />
                                    <input id="pageMode" name="pageMode" type="hidden" value="insertMode" readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.cmpNm' /></span></th> <!-- 고객명 회사명-->
                                <td class="required_area">
                                    <input id="custNm" name="custNm" type="text" value="" class="form_input reqCustCheck"  data-json-obj="true" />
                                    <input id="oldCustNm" name="oldCustNm" type="hidden" value="" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custTp" /></th> <!-- 고객유형 개인/법인-->
                                <td>
                                    <input id="custTp" name="custTp" class="form_comboBox form_readonly"  readOnly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custCd" /></th> <!-- 잠재/보유고객 -->
                                <td>
                                    <input id="custCd" name="custCd" class="form_comboBox"  data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.crnNo" /></th> <!-- 사업자등록번호 -->
                                <td>
                                    <input id="ssnCrnNo" name="ssnCrnNo" type="text" value="" class="form_input"  pattern="[0-9A-Z]" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.bhmcyn" /></th> <!-- BHMC여부 -->
                                <td>
                                    <div class="form_float">
                                        <div class="form_left" style="width:16%" >
                                            <label class="label_check ml5"><input id="bhmcYn" type="checkbox" class="form_check" onclick="return false;" unchecked readOnly data-json-obj="true" /></label>
                                        </div>
                                        <div class="form_right" style="width:84%" >
                                            <input id="siebelRowId" name="siebelRowId" type="text" value="" class="form_input form_readonly" readonly data-json-obj="true" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.prsnSC" /></th> <!-- 담당SC -->
                                <td class="readonly_area">
                                    <input id="mngScId" name="mngScId" type="text" value="" class="form_input"  readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.prsnSA" /></th> <!-- 담당SA -->
                                <td class="readonly_area">
                                    <input id="mngTecId" name="mngTecId" type="text" value="" class="form_input form_readonly"  readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custHoldTp" /></th> <!-- 정보출처 -->
                                <td colspan="3">
                                    <div class="form_float">
                                        <div class="form_left" style="width:37.5%" >
                                            <input id="custHoldTp" name="custHoldTp" class="form_comboBox" data-json-obj="true" />
                                        </div>
                                        <div class="form_right" style="width:62.5%" >
                                            <input id="custHoldTpDtl" name="custHoldTpDtl" class="form_comboBox" data-json-obj="true" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_form form_width_100per mt5">
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
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.ownRgstNm" /></th> <!-- 대표자명 -->
                                <td>
                                    <input id="ownRgstNm" name="ownRgstNm" type="text" value="" class="form_input"  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.bizCondition" /></th> <!-- 업종 -->
                                <td>
                                    <input id="bizcondCd" name="bizcondCd" class="form_comboBox"  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.cmpScale" /></th> <!-- 회사규모 -->
                                <td>
                                    <input id="cmpScaleCont" name="cmpScaleCont" class="form_comboBox"  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.cmpTp" /></th> <!-- 회사유형 -->
                                <td>
                                    <input id="cmpTp" name="cmpTp" class="form_comboBox"  data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>

                            <th scope="row"><spring:message code="global.lbl.job" /></th> <!-- 직업 -->
                                <td>
                                    <input id="jobCd" name="jobCd" class="form_comboBox"  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.officeTelNo" /></th> <!-- 회사전화 -->
                                <td>
                                    <input id="officeTelNo" name="officeTelNo" type="text" value="" class="form_input numberic"  data-type="tel" pattern="\d" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.fax" /></th> <!-- FAX -->
                                <td>
                                    <input id="officeFaxNo" name="officeFaxNo" type="text" value="" class="form_input numberic"  data-type="tel" pattern="\d" data-json-obj="true" />
                                </td>
                                <th><spring:message code="global.lbl.emailNm" /></th> <!-- 이메일 -->
                                <td>
                                    <input id="emailNm" name="emailNm" type="email" value="" class="form_input" data-json-obj="true" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- 주소정보 시작 -->
                <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='global.title.addr' /></h2>
                    <div class="btn_right">
                        <button class="btn_s btn_save" id="btnSaveAddress" ><spring:message code="global.btn.save" /></button> <!-- 주소저장 -->
                        <button class="btn_s btn_add" id="btnAddAddress" ><spring:message code="global.btn.rowAdd" /></button> <!-- 주소행추가 -->
                        <button class="btn_s btn_del" id="btnDelAddress" ><spring:message code="global.btn.rowDel" /></button> <!-- 주소행삭제 -->
                    </div>
                </div>
                <div class="table_grid">
                    <div id="addrGrid"></div>
                </div>
                </section>
                <!-- //주소정보 끝 -->
                <div class="table_form form_width_100per mt5">
                    <table>
                        <colgroup>
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.rejectRecv' /></th> <!-- 수신거부  -->
                                <td>
                                    <label class="label_check ml5"><input id="dmReceiveYn" name="dmReceiveYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code="global.lbl.dm" /></label>&nbsp;&nbsp;&nbsp;
                                    <label class="label_check ml5"><input id="emailReceiveYn" name="emailReceiveYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code='global.lbl.email' /></label>&nbsp;&nbsp;&nbsp;
                                    <label class="label_check ml5"><input id="faxReceiveYn" name="faxReceiveYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code='global.lbl.fax' /></label>&nbsp;&nbsp;&nbsp;
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_form form_width_100per mt5">
                    <table>
                        <colgroup>
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"></th> <!-- 정보활용동의서 -->
                                <td>
                                    <label class="label_check ml5"><input id="perInfoAgreeYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code="global.lbl.infoAgreedocId" /></label>
                                    <label class="label_check ml5"><input id="perInfoUseYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code="global.lbl.infoUsrYn" /></label>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_form form_width_100per mt5">
                    <table>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:40%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.buyAddCnt' /></th> <!-- 추가구매  -->
                                <td>
                                    <input id="buyCnt" name="buyCnt" class="form_input"  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.chgBuy' /></th> <!-- 교환구매  -->
                                <td>
                                    <div class="form_float">
                                        <div class="form_left" style="width:33%;" >
                                            <input id="chgBuyYn" name="chgBuyYn" class="form_comboBox" data-json-obj="true" />
                                        </div>
                                        <div class="form_left" style="width:33%;">
                                            <input id="purcCarBrandCd" name="purcCarBrandCd" class="form_comboBox" data-json-obj="true" />
                                        </div>
                                        <div class="form_right" style="width:34%;">
                                            <input id="purcCarModelNm" name="purcCarModelNm" class="form_input" data-json-obj="true" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_form form_width_100per mt5">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:40%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                              <th scope="row"><spring:message code="global.lbl.group" /></th> <!-- 그룹 -->
                              <td>
                                  <select id="custGroups" name="custGroups" multiple="multiple" ></select>
                              </td>
                              <th scope="row"><spring:message code="global.lbl.tag" /></th> <!-- 태그  -->
                              <td>
                                  <select id="custTags" name="custTags" multiple="multiple" ></select>
                              </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

</div>
            </section>
      <!-- //기본정보 -->

      <!-- 고객 연계인 정보 -->
      <section class="group">
          <div class="header_area">
              <h2 class="title_basic"><spring:message code="global.title.relCustInfo" /></h2> <!-- 고객 연계인 정보 -->
              <div class="btn_right">
                  <button class="btn_s btn_save" id="btnSaveRelCustGrid" ><spring:message code="global.btn.save" /></button> <!-- 연계인저장 -->
                  <button class="btn_s btn_add" id="btnAddRelCust" ><spring:message code="global.btn.rowAdd" /></button> <!-- 연계인행추가 -->
                  <button class="btn_s btn_del" id="btnDelRelCust" ><spring:message code="global.btn.rowDel" /></button> <!-- 연계인행삭제 -->
              </div>
          </div>
          <div class="table_grid">
            <div id="gridRel"></div>
          </div>
      </section>
      <!-- //고객 연계인 정보 -->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">

/*************************************************************
 데이터 셋업
*************************************************************/
    var popupWindow;
    var groupTxt;
    var tagTxt;
    var groupDS = [];
    var hobbyDS = [];
    var tagDS   = [];
    var custGroups = [];
    var custTags = [];

    var loginDlrCd              = "${dlrCd}"
    var custTpList              = [];
    var custCdList              = [];
    var custHoldTpList          = [{"cmmCd":"", "cmmCdNm":""}];
    var custHoldTpDtlList       = [];
    var prefContactMthCd        = [{"cmmCd":"", "cmmCdNm":""}];
    var prefContactTimeCd       = [{"cmmCd":"", "cmmCdNm":""}];
    var mathDocTpList           = [{"cmmCd":"", "cmmCdNm":""}];
    var pconTpList              = [{"cmmCd":"", "cmmCdNm":""}];
    var addrTpList              = [{"cmmCd":"", "cmmCdNm":""}];
    var ageCdList               = [{"cmmCd":"", "cmmCdNm":""}];
    var driverTpList            = [{"cmmCd":"", "cmmCdNm":""}];
    var jobCdList               = [{"cmmCd":"", "cmmCdNm":""}];
    var bizcondCdList           = [{"cmmCd":"", "cmmCdNm":""}];
    var cmpScaleContList        = [{"cmmCd":"", "cmmCdNm":""}];
    var cmpTpList               = [{"cmmCd":"", "cmmCdNm":""}];
    var marryYnList             = [{"cmmCd":"", "cmmCdNm":""}];
    var prefContactMthCdList    = [{"cmmCd":"", "cmmCdNm":""}];
    var prefContactTimeCdList   = [{"cmmCd":"", "cmmCdNm":""}];
    var avgCarChgCdList         = [{"cmmCd":"", "cmmCdNm":""}];
    var prefCommMthCdList       = [{"cmmCd":"", "cmmCdNm":""}];
    var chgBuyYnDS              = [{"cmmCd":"", "cmmCdNm":""}];
    var purcCarBrandCdDS        = [{"cmmCd":"", "cmmCdNm":""}];

    var prefCommMthCdMap        = [];
    var mathDocTpMap            = [];
    var pconTpMap               = [];
    var addrTpMap               = [];
    var prefContactMthCdMap     = [];
    var prefContactTimeCdMap    = [];

    chgBuyYnDS.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
    chgBuyYnDS.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});

    <c:forEach var="obj" items="${purcCarBrandCdDS}">
    purcCarBrandCdDS.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${custTpList}">
    custTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${custCdList}">
    custCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${prefCommMthCdList}">
    prefCommMthCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    prefCommMthCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${custHoldTpList}">
    custHoldTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${custHoldTpDtlList}">
    custHoldTpDtlList.push({"cmmCd":"${obj.makCd}" , "cmmCdNm":"${obj.makNm}"});
    </c:forEach>


    <c:forEach var="obj" items="${prefContactMthCd}">
    prefContactMthCd.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${prefContactTimeCd}">
    prefContactTimeCd.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${mathDocTpList}">
    mathDocTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    mathDocTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${pconTpList}">
    pconTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    pconTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${addrTpList}">
    addrTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    addrTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${ageCdList}">
    ageCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${driverTpList}">
    driverTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${jobCdList}">
    jobCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${bizcondCdList}">
    bizcondCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${cmpScaleContList}">
    cmpScaleContList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${cmpTpList}">
    cmpTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${marryYnList}">
    marryYnList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${prefContactMthCdList}">
    prefContactMthCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    prefContactMthCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${prefContactTimeCdList}">
    prefContactTimeCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    prefContactTimeCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${avgCarChgCdList}">
    avgCarChgCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${custGroups}">
    custGroups.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${custTags}">
    custTags.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
    </c:forEach>

    var defaultGroupDatasourceSetting = function(e){
        groupDS = [];
        var selectedGroups = $("#custGroups").data("kendoMultiSelect").value();

        if(selectedGroups.length == 0){
            return;
        }

        $.each(custGroups, function(index, data){
            if(selectedGroups.indexOf(data.grpSeq) > -1){
                //defaultGroups.push(data);
                groupDS.push({"grpSeq":data.grpSeq,"grpTp":"001"});
            }
        });
        console.log(groupDS);
    };

    var defaultTagDatasourceSetting = function(e){
        tagDS = [];
        var selectedTags = $("#custTags").data("kendoMultiSelect").value();

        if(selectedTags.length == 0){
            return;
        }

        $.each(custTags, function(index, data){
            if(selectedTags.indexOf(data.grpSeq) > -1){
                tagDS.push({"grpSeq":data.grpSeq,"grpTp":"002"});
            }
        });
    };

    function getCustCnt(idVal){

        return false;
        var custNm     = $("#custNm").val();
        var hpNo       = $("#hpNo").val();

        if (custNm.length >= 1 && hpNo.length > 1 ){

            var param = {};
            param["sCustNm"]       = custNm;
            param["sHpNo"]         = hpNo;
            param["sSearchRange"]  = "DLR";

            console.log(param);

            $.ajax({
                url:"<c:url value='/crm/cif/customerInfo/customerSearch.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    console.log(jqXHR);
                    console.log(jqXHR.responseJSON);
                    //alert(jqXHR.responseJSON.errors[0].errorMessage);
                    //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                },
                success:function(result){
                    console.log(result);

                    if (result.custInfoDS.length == 0 ){
                        dms.notification.success("<spring:message code='global.info.ableToDo' />");
                    } else {
                        dms.notification.success("<spring:message code='global.info.already' />");
                    }
                }
            }).done(function(result) {
                console.log("done!!!!");
            });
        }
    }

$(document).ready(function() {

/*************************************************************
드랍다운 리스트 셋팅
*************************************************************/

// 고객유형 드랍다운 리스트.   custTpList    (CRM001)
    $("#custTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:custTpList
        , index:1
    });
    $("#custTp").data("kendoExtDropDownList").value("02");

 // 잠재/보유고객      custCd              (CRM023)
    $("#custCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:custCdList
        , index:0
        //,  value:"01"
    });
    $("#custCd").data("kendoExtDropDownList").value("01");


 // 고객확보유형1      custHoldTp      (CRM008)
     $("#custHoldTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:custHoldTpList
        , index:0
        , change:function(){
            var selcmmCd = this.dataItem(this.select()).cmmCd;
            var custHoldTpDtl = $("#custHoldTpDtl").data("kendoExtDropDownList");
            if (selcmmCd == "01"){
                custHoldTpDtl.enable(true);
            } else {
                custHoldTpDtl.enable(false);
            }
        }
    });

 // 고객확보유형2      custHoldTpDtl   (CRM***)
     $("#custHoldTpDtl").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:custHoldTpDtlList
        , index:0
        , enable:false
    });

 // 직업군                  jocCd                   (CRM002)
     $("#jobCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:jobCdList
        , index:0
    });

 // 업종                  bizcondCd
     $("#bizcondCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:bizcondCdList
        , index:0
    });

 // 회사규모                  cmpScaleContList       (CRM026)
     $("#cmpScaleCont").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:cmpScaleContList
        , index:0
    });

 // 회사유형                  cmpTp
     $("#cmpTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:cmpTpList
        , index:0
    });

 // 주 운전자                driverTp            (CRM015)
     $("#driverTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:driverTpList
        , index:0
    });

 // 연령                       ageCd                 (CRM014)
     $("#ageCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:ageCdList
        , index:0
    });


 // 평균차량 교체 시기                       avgCarChgCdList    (CRM029)
     $("#avgCarChgCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:avgCarChgCdList
        , index:0
    });

     $("#chgBuyYn").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         , dataValueField:"cmmCd"
         //, optionLabel:" "
         , dataSource:chgBuyYnDS
         , index:0
     });

     $("#purcCarBrandCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         , dataValueField:"cmmCd"
         //, optionLabel:" "
         , dataSource:purcCarBrandCdDS
         , index:0
     });

 // 숫자
     $(".numberic").kendoMaskedTextBox({
         mask:"000000000000000000"
         , promptChar:" "
     });

 // 숫자와 알파벳
     $(".numberandalpha").kendoMaskedTextBox({
         mask:"AAAAAAAAAAAAAAAAAAAA"
         , promptChar:" "
     });

 // 고객명, 휴대전화 입력 후 고객 체크 (자동)
     $(".reqCustCheck").focusout(function(){
         var idValue = $(this).context.id;
         if (idValue == "custNm" || idValue == "hpNo" ){
         //    getCustCnt(idValue);
         }
     });

     $(".numberic").focusout(function(){
         $(this).val($.trim($(this).val()));
     });


     $(".numberandalpha").focusout(function(){
         $(this).val($.trim($(this).val()));
     });

 // 그룹
     $("#custGroups").kendoMultiSelect({
         dataSource:custGroups,
         valuePrimitive:true,
         placeholder:"",
         dataTextField:"grpNm",
         dataValueField:"grpSeq",
         dataBound:defaultGroupDatasourceSetting,
         change:defaultGroupDatasourceSetting
     });

 // 태그
     $("#custTags").kendoMultiSelect({
         dataSource:custTags,
         valuePrimitive:true,
         placeholder:"",
         dataTextField:"grpNm",
         dataValueField:"grpSeq",
         dataBound:defaultTagDatasourceSetting,
         change:defaultTagDatasourceSetting
     });


/*************************************************************
이벤트 정의
*************************************************************/

    $("#addrGrid").on("click", "input.flagYn", function(){

        var addrGrid = $("#addrGrid").data("kendoExtGrid");
        var uid = $(this).data("uid");

        $("input.flagYn", "#addrGrid").prop("checked", false);
        $(this).prop("checked", true);
        console.log(uid);

        $.each(addrGrid.dataSource.view(), function(idx, dataItem){
            dataItem.set("flagYn", "N");
        });

        addrGrid.dataSource.getByUid(uid).set("flagYn", "Y");
        console.log(addrGrid.dataSource.data());

    });

    // 주소저장 - addrGrid
    $("#btnSaveAddress").kendoButton({
        click:function(e){
            var grid = $("#addrGrid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

            console.log("btnSaveAddress!!!");
            console.log(saveData);

            if (grid.cudDataLength == 0){
                dms.notification.info("<spring:message code='global.info.required.change' />");
                return;
            }

            // 그리드 무결성 점검
            var dataValidate = false;
            $.each(saveData.insertList, function(idx, row){
                if(row.addrTp == ""){
                   // 선택하지 않은 주소유형이 있습니다.
                   dms.notification.info("<spring:message code='global.lbl.type' var='globalLblAddress' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblAddress}' />");
                   dataValidate = true;
                   return false;
                }
             });

            if(dataValidate){ return false;}

            if($("input.flagYn:checked", "#addrGrid").length != 1 ){
                dms.notification.warning("<spring:message code='global.lbl.selectAddr' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                dataValidate = true;
                return false;
            }

            if (grid.gridValidation()){
                $.ajax({
                    url:"<c:url value='/crm/cmm/addressInfo/multiAddressInfo.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error){
                        //globalNotification.show(JSON.parse(jqXHR.responseText).error, "error");
                        console.log("failed!!");
                    },
                    success:function(jqXHR, textStatus){
                        dms.notification.info("<spring:message code='global.info.success' />");
                        grid.dataSource.page(1);
                    }
                });
            }else{
                globalNotification.show("<spring:message code='global.info.check.input' />", "error");
            }
        }
    });

    //버튼 - 연계인  추가
     $("#btnAddRelCust").kendoButton({
         click:function(e) {
             popupWindow = dms.window.popup({
                 windowId:"customerSearchPopup"
                 , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
                 , content:{
                     url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                     , data:{
                         "autoBind":false
                         , "type"  :null
                         , "callbackFunc":function(data){
                             if (data.length >= 1) {
                                 console.log(data);
                                 insertRelCustomerItemAdd(data);
                             }
                         }
                     }
                 }
             })
         }
         , enable:false
     });

     // 연계인추가 - gridRel
     function insertRelCustomerItemAdd(data){
         $.each(data, function(idx, row){
             $("#gridRel").data("kendoExtGrid").dataSource.insert(0,{
                 "pconCustNo"            :row.custNo
                 , "pconTp"              :"01"
                 , "mathDocTp"           :row.mathDocTp
                 , "prefCommMthCd"       :row.prefCommMthCd
                 , "prefContactMthCd"    :row.prefContactMthCd
                 , "prefContactTimeCd"   :row.prefContactTimeCd
                 , "upperCustNo"         :$("#custNo").val()            // 상위 고객번호
                 , "custNm"              :row.custNm
                 , "certiNum"            :row.certiNum                  // 신분증 번호
                 , "telNo"               :row.telNo                     // 전화
                 , "hpNo"                :row.hpNo                      // 휴대전화
                 , "emailNm"             :row.emailNm                   // E-MAIL
                 //, "regDt"               :row.regDt                     // 등록일
                 , "prefCommNo"          :row.prefCommNo                // 선호 연락처
             });
         });
     }

     // 연계인 삭제 - gridRel
     $("#btnDelRelCust").kendoButton({
        click:function(e) {
            var grid = $("#gridRel").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
        , enable:false
     });

     //버튼 - 주소  추가
     $("#btnAddAddress").kendoButton({
         click:function(e) {

             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#custNo").focus();
                 return false;
             }

             zipCodeSearchPopupWin = dms.window.popup({
                 windowId:"zipCodeSearchPopupWin"
                 , title:"<spring:message code='global.title.zipSearch' />"   // 사용자 조회
                 , content:{
                     url:"<c:url value='/cmm/sci/commonPopup/selectZipCodePopup.do'/>"
                     , data:{
                         "autoBind":false
                         ,"usrNm":""
                         , "callbackFunc":function(data){
                             if (data.length >= 1) {
                                 console.log(data);
                                 insertAddressItemAdd(data);
                             }
                         }
                     }
                 }
             })
         }
     });

     // 주소추가 - addressGrid
     function insertAddressItemAdd(data){
         var custNo = $("#custNo").val();
         $.each(data, function(idx, row){
             $("#addrGrid").data("kendoExtGrid").dataSource.insert(0,{
                 "addrTp"            :"01"
                 , "zipCd"           :row.zipCd
                 , "sungNm"          :row.sungNm
                 , "cityNm"          :row.cityNm
                 , "distNm"          :row.distNm
                 , "addrNm"          :""
                 , "addrDetlCont"    :""
                 , "flagYn"          :"N"
                 , "sungCd"          :row.sungCd
                 , "cityCd"          :row.cityCd
                 , "distCd"          :row.distCd
                 , "refTableNm"      :"CR_0101T"                  //참조테이블
                 , "refKeyNm"        :custNo                     // 참조 키
             });
         });
     }

     // 주소 삭제 - addressGrid
     $("#btnDelAddress").kendoButton({
        click:function(e) {
            var grid = $("#addrGrid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
     });


     $("#btnSaveRelCustGrid").kendoButton({
         click:function(e){
             var grid = $("#gridRel").data("kendoExtGrid");

             var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

             if (grid.cudDataLength == 0){
                 dms.notification.info("<spring:message code='global.info.required.change' />");
                 return;
             }

             console.log(saveData);

             if (grid.gridValidation()){
                 $.ajax({
                     url:"<c:url value='/crm/cif/customerInfo/multiCustomerRelChg.do' />",
                     data:JSON.stringify(saveData),
                     type:'POST',
                     dataType:'json',
                     contentType:'application/json',
                     error:function(jqXHR,status,error){
                         //globalNotification.show(JSON.parse(jqXHR.responseText).error, "error");
                         consoloe.log("failed!!");
                     },
                     success:function(jqXHR, textStatus){

                         //grid.dataSource._destroyed = [];
                         dms.notification.info("<spring:message code='global.info.success' />");
                         grid.dataSource.page(1);
                     }
                 });
             }else{
                 globalNotification.show("<spring:message code='global.info.check.input' />", "error");
             }
         }
          , enable:false
     });

     $("#btnCustSearch").kendoButton({
         click:function(e) {

             if ( dms.string.isEmpty($("#custNo").val())){
                 dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#custNo").focus();
                 return false;
             }

             var custNo = $("#custNo").val();

             $("#btnCustReset").click();

             // form 데이터
             var param = {};
             param["sCustNo"] = custNo; // $("#custNo").val();
             param["sSearchRange"] = "MY";
             //param["sBhmcYnSearch"] = "N";

             console.log(param);
             $.ajax({
                 url:"<c:url value='/crm/cif/customerInfo/customerSearch.do' />"
                 ,data:JSON.stringify(param)
                 ,type:'POST'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,error:function(jqXHR,status,error){
                     //console.log(jqXHR);
                     //console.log(jqXHR.responseJSON);
                     //alert(jqXHR.responseJSON.errors[0].errorMessage);
                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                 }
             }).done(function(result) {

                 console.log(result);

                 if (result.custInfoDS.length != 0 ){
                     $("#custNm").val(result.custInfoDS[0].custNm);
                     //$("#custNm").val(result.custInfoDS[0].custNm);
                     $("#oldCustNm").val(result.custInfoDS[0].custNm);
                     $("#custNo").val(result.custInfoDS[0].custNo);
                     $("#custTp").data("kendoExtDropDownList").value(result.custInfoDS[0].custTp);
                     $("#custCd").data("kendoExtDropDownList").value(result.custInfoDS[0].custCd);
                     $("#emailNo").val(result.custInfoDS[0].emailNo);
                     $("#mngScId").val(result.custInfoDS[0].mngScId);
                     $("#mngTecId").val(result.custInfoDS[0].mngTecId);
                     $("#sungCd").val(result.custInfoDS[0].sungCd);
                     $("#cityCd").val(result.custInfoDS[0].cityCd);
                     $("#regionCd").val(result.custInfoDS[0].regionCd);
                     $("#regionCdRead").val(result.custInfoDS[0].regionCdRead);
                     $("#zipCd").val(result.custInfoDS[0].zipCd);
                     $("#addr1").val(result.custInfoDS[0].addr1);
                     $("#addr2").val(result.custInfoDS[0].addr2);
                     $("#officeSungCd").val(result.custInfoDS[0].officeSungCd);
                     $("#officeCityCd").val(result.custInfoDS[0].officeCityCd);
                     $("#officeRegionCd").val(result.custInfoDS[0].officeRegionCd);
                     $("#officeRegionCdRead").val(result.custInfoDS[0].officeRegionCdRead);
                     $("#officeZipCd").val(result.custInfoDS[0].officeZipCd);
                     $("#officeAddr1").val(result.custInfoDS[0].officeAddr1);
                     $("#officeAddr2").val(result.custInfoDS[0].officeAddr2);
                     $("#idSungCd").val(result.custInfoDS[0].idSungCd);
                     $("#idCityCd").val(result.custInfoDS[0].idCityCd);
                     $("#idRegionCd").val(result.custInfoDS[0].idRegionCd);
                     $("#idRegionCdRead").val(result.custInfoDS[0].idRegionCdRead);
                     $("#idZipCd").val(result.custInfoDS[0].idZipCd);
                     $("#idAddr1").val(result.custInfoDS[0].idAddr1);
                     $("#idAddr2").val(result.custInfoDS[0].idAddr2);
                     $("#custHoldTp").data("kendoExtDropDownList").value(result.custInfoDS[0].custHoldTp);
                     $("#custHoldTpDtl").data("kendoExtDropDownList").value(result.custInfoDS[0].custHoldTpDtl);
                     $("#jobCd").data("kendoExtDropDownList").value(result.custInfoDS[0].jobCd);
                     $("#bizcondCd").data("kendoExtDropDownList").value(result.custInfoDS[0].bizcondCd);
                     $("#cmpScaleCont").data("kendoExtDropDownList").value(result.custInfoDS[0].cmpScaleCont);
                     $("#cmpTp").data("kendoExtDropDownList").value(result.custInfoDS[0].cmpTp);
                     $("#psitNm").val(result.custInfoDS[0].psitNm);
                     $("#officeTelNo").data("kendoMaskedTextBox").value(result.custInfoDS[0].officeTelNo);
                     $("#officeFaxNo").data("kendoMaskedTextBox").value(result.custInfoDS[0].officeFaxNo);
                     $("#siebelRowId").val(result.custInfoDS[0].siebelRowId);

                     $("#chgBuyYn").data("kendoExtDropDownList").value(result.custInfoDS[0].chgBuyYn);
                     $("#purcCarBrandCd").data("kendoExtDropDownList").value(result.custInfoDS[0].purcCarBrandCd);

                     $("#buyCnt").val(result.custInfoDS[0].buyCnt);
                     $("#purcCarModelNm").val(result.custInfoDS[0].purcCarModelNm);
                     $("#ownRgstNm").val(result.custInfoDS[0].ownRgstNm);

                     // CheckBox
                     var bhmcYn = result.custInfoDS[0].bhmcYn;
                     var dmReceiveYn = result.custInfoDS[0].dmReceiveYn;
                     var emailReceiveYn = result.custInfoDS[0].emailReceiveYn;
                     var faxReceiveYn = result.custInfoDS[0].faxReceiveYn;
                     var perInfoAgreeYn = result.custInfoDS[0].perInfoAgreeYn;
                     var perInfoUseYn = result.custInfoDS[0].perInfoUseYn;

                     if (bhmcYn == 'Y'){ $("#bhmcYn").prop("checked", true) };
                     if (dmReceiveYn == 'Y'){ $("#dmReceiveYn").prop("checked", true) };
                     if (emailReceiveYn == 'Y'){ $("#emailReceiveYn").prop("checked", true) };
                     if (faxReceiveYn == 'Y'){ $("#faxReceiveYn").prop("checked", true) };
                     if (perInfoAgreeYn == 'Y'){ $("#perInfoAgreeYn").prop("checked", true) };
                     if (perInfoUseYn == 'Y'){ $("#perInfoUseYn").prop("checked", true) };

                 }

                 if (result.groupDS.length != 0 ){
                     groupSeq = "";
                     var groupDsItem;
                     for(i=0 ;  i < result.groupDS.length ; i++){
                         groupDsItem = result.groupDS[i];
                         if (i==0){
                             groupSeq = groupDsItem.grpSeq;
                         }else{
                             groupSeq = groupSeq+","+groupDsItem.grpSeq;
                         }
                     }
                     $("#custGroups").data("kendoMultiSelect").value(groupSeq.split(","));
                     defaultGroupDatasourceSetting();
                 }

                 if (result.tagDS.length != 0 ){
                     tagSeq = "";
                     var tagDsItem;
                     for(i=0 ;  i < result.tagDS.length ; i++){
                         tagDsItem = result.tagDS[i];
                         if (i==0){
                             tagSeq = tagDsItem.grpSeq;
                         }else{
                             tagSeq = tagSeq+","+tagDsItem.grpSeq;
                         }
                         //tagDS.push({"grpSeq":tagDsItem.grpSeq,"grpTp":"002"});
                     }
                     $("#custTags").data("kendoMultiSelect").value(tagSeq.split(","));
                     defaultTagDatasourceSetting();
                 }

                 // Mode 변경
                 $("#pageMode").val("updateMode");

                 var btnAddRelCust = $("#btnAddRelCust").data("kendoButton");
                 var btnSaveRelCustGrid = $("#btnSaveRelCustGrid").data("kendoButton");
                 var btnDelRelCust = $("#btnDelRelCust").data("kendoButton");
                 btnAddRelCust.enable(true);
                 btnSaveRelCustGrid.enable(true);
                 btnDelRelCust.enable(true);

                 // 주소 조회
                 var addrGrid = $("#addrGrid").data("kendoExtGrid");
                 addrGrid.dataSource.read();

                 // 연계인 조회
                 var grid = $("#gridRel").data("kendoExtGrid");
                 //grid.setDataSource(new kendo.data.DataSource());
                 grid.dataSource.read();

             });
         }

     });

     // 초기화
     $("#btnCustReset").kendoButton({
        click:function(e){
            var btnAddRelCust = $("#btnAddRelCust").data("kendoButton");
            var btnSaveRelCustGrid = $("#btnSaveRelCustGrid").data("kendoButton");
            var btnDelRelCust = $("#btnDelRelCust").data("kendoButton");
            btnAddRelCust.enable(false);
            btnSaveRelCustGrid.enable(false);
            btnDelRelCust.enable(false);

            $("#pageMode").val("insertMode");

            // Reset
            $("#custNm").val("");
            $("#oldCustNm").val("");
            $("#custNo").val("");
            $("#custTp").data("kendoExtDropDownList").value("");
            $("#custCd").data("kendoExtDropDownList").value("");
            $("#emailNo").val("");
            $("#mngScId").val("");
            $("#mngTecId").val("");
            $("#sungCd").val("");
            $("#cityCd").val("");
            $("#regionCd").val("");
            $("#regionCdRead").val("");
            $("#zipCd").val("");
            $("#addr1").val("");
            $("#addr2").val("");
            $("#officeSungCd").val("");
            $("#officeCityCd").val("");
            $("#officeRegionCd").val("");
            $("#officeRegionCdRead").val("");
            $("#officeZipCd").val("");
            $("#officeAddr1").val("");
            $("#officeAddr2").val("");
            $("#idSungCd").val("");
            $("#idCityCd").val("");
            $("#idRegionCd").val("");
            $("#idRegionCdRead").val("");
            $("#idZipCd").val("");
            $("#idAddr1").val("");
            $("#idAddr2").val("");
            $("#custHoldTp").data("kendoExtDropDownList").value("");
            $("#custHoldTpDtl").data("kendoExtDropDownList").value("");
            $("#jobCd").data("kendoExtDropDownList").value("");
            $("#bizcondCd").data("kendoExtDropDownList").value("");
            $("#cmpScaleCont").data("kendoExtDropDownList").value("");
            $("#cmpTp").data("kendoExtDropDownList").value("");
            $("#psitNm").val("");
            $("#officeTelNo").data("kendoMaskedTextBox").value("");
            $("#officeFaxNo").data("kendoMaskedTextBox").value("");
            $("#siebelRowId").val("");
            $("#chgBuyYn").data("kendoExtDropDownList").value("");
            $("#purcCarBrandCd").data("kendoExtDropDownList").value("");
            $("#buyCnt").val("");
            $("#purcCarModelNm").val("");
            $("#ownRgstNm").val("");

            $("#bhmcYn").prop("checked", false);
            $("#dmReceiveYn").prop("checked", false);
            $("#emailReceiveYn").prop("checked", false);
            $("#faxReceiveYn").prop("checked", false);
            $("#perInfoAgreeYn").prop("checked", false);
            $("#perInfoUseYn").prop("checked", false);

            $("#custTp").data("kendoExtDropDownList").value("02");
            $("#custCd").data("kendoExtDropDownList").value("01");

            var grid = $("#gridRel").data("kendoExtGrid");
            //grid.setDataSource(new kendo.data.DataSource());
            grid.dataSource.read();
        }
     });

     // 저장/수정
     $("#btnCustSave").kendoButton({
         click:function(e) {

             // TODO [이교진] 메세지 등록
             // 화면 필수 체크
             if ( dms.string.isEmpty($("#custNm").val())) {
                 dms.notification.warning("<spring:message code='global.lbl.custNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#custNm").focus();
                 return false;
             }

             // form 데이터
             var param =
                 $("#customerForm").serializeObject(
                     $("#customerForm").serializeArrayInSelector("[data-json-obj='true']")
                 );

             console.log("------------------");
             console.log(param);

             if ($("#bhmcYn").prop("checked")){ param["bhmcYn"] = "Y" };
             if ($("#dmReceiveYn").prop("checked")){ param["dmReceiveYn"] = "Y" };
             if ($("#emailReceiveYn").prop("checked")){ param["emailReceiveYn"] = "Y" };
             if ($("#faxReceiveYn").prop("checked")){ param["faxReceiveYn"] = "Y" };
             if ($("#perInfoAgreeYn").prop("checked")){ param["perInfoAgreeYn"] = "Y" };
             if ($("#perInfoUseYn").prop("checked")){ param["perInfoUseYn"] = "Y" };

             if ( dms.string.isEmpty($("#chgBuyYn").data("kendoExtDropDownList").value(""))) {
                 param["chgBuyYn"] = "N";
             }

             var pageMode = $("#pageMode").val();
             var url = "<c:url value='/crm/cif/customerInfo/insertCustomer.do' />";
             if (pageMode == "insertMode"){
                 // 신규등록 URL
                 url = "<c:url value='/crm/cif/customerInfo/insertCustomer.do' />";
             } else {
                 // 업데이트 URL
                 url = "<c:url value='/crm/cif/customerInfo/updateCustomer.do' />";
             }

             param["groupDS"] = groupDS;
             param["tagDS"] = tagDS;
             param["hobbyDS"] = hobbyDS;

             console.log(param);

             $.ajax({
                 url:url
                 ,data:JSON.stringify(param)
                 ,type:'POST'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,error:function(jqXHR,status,error){
                     console.log(jqXHR);
                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                 },
                 success:function(result){
                     //console.log(result);
                     if (result["custNo"] != ""){
                         console.log("success!!!!");
                         dms.notification.success("<spring:message code='global.info.success'/>");
                         $("#custNo").val(result["custNo"]);

                         $("#btnCustSearch").click();
                     }

                 }
             }).done(function(result) {
                 console.log("btnCustSave Done!!!!");
             });
         }
     });

     // 버튼 - 그룹선택 팝업
     $("#btnSelectGroupPopup").kendoButton({
         click:function(e) {
             popupWindow = dms.window.popup({
                 windowId:"groupSearchPopup"
                 , title:"<spring:message code = 'global.title.custGrpSearch'/>"   // 고객그룹 조회
                 , content:{
                     url:"<c:url value='/crm/cif/customerGroup/selectGroupPopup.do'/>"
                     , data:{
                         "autoBind":false
                         , "type"  :null
                         , "grpTp" :"001"
                         , "callbackFunc":function(data){
                             if (data.length > 0) {
                                 //groupDS = data;

                                 groupDS = [];
                                 groupTxt = "";
                                 for(i=0 ;  i < data.length ; i++){
                                     if (i==0){
                                         groupTxt = data[i].grpNm;
                                     }else{
                                         groupTxt = groupTxt+", "+data[i].grpNm;
                                     }
                                     groupDS.push({"grpSeq":data[i].grpSeq,"grpTp":"001"});
                                 }

                                 $("#groupTxt").val(groupTxt);
                             }
                         }
                     }
                 }
             })
         }
     });

     // 버튼 - 태그선택 팝업
     $("#btnSelectTagPopup").kendoButton({
         click:function(e) {
             popupWindow = dms.window.popup({
                 windowId:"groupSearchPopup"
                 , title:"<spring:message code = 'global.lbl.tag'/>"   // 태그 조회
                 , content:{
                     url:"<c:url value='/crm/cif/customerGroup/selectTagPopup.do'/>"
                     , data:{
                         "autoBind":false
                         , "type"  :null
                         , "grpTp" :"002"
                         , "callbackFunc":function(data){
                             if (data.length > 0) {
                                 tagDS = [];
                                 tagTxt = "";
                                 for(i=0 ;  i < data.length ; i++){
                                     if (i==0){
                                         tagTxt = data[i].grpNm;
                                     }else{
                                         tagTxt = tagTxt+", "+data[i].grpNm;
                                     }
                                     tagDS.push({"grpSeq":data[i].grpSeq,"grpTp":"002"});
                                 }

                                 $("#tagTxt").val(tagTxt);
                             }
                         }
                     }
                 }
             })
         }
     });


/*************************************************************
 * DataSource 영역
 *************************************************************/

/*************************************************************
 *   그리드 셋팅
*************************************************************/
     //연계인 그리드 설정
         $("#gridRel").kendoExtGrid({
             dataSource:{
                 transport:{
                     read:{
                         url:"<c:url value='/crm/cif/customerInfo/customerRelSearch.do' />"
                     }
                     ,parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};

                             params["recordCountPerPage"]   = options.pageSize;
                             params["pageIndex"]            = options.page;
                             params["firstIndex"]           = options.skip;
                             params["lastIndex"]            = options.skip + options.take;
                             params["sort"]                 = options.sort;

                             params["upperCustNo"] = $("#custNo").val();
                             return kendo.stringify(params);

                         }else if (operation !== "read" && options.models) {
                             return kendo.stringify(options.models);
                         }
                     }
                 }
                 ,schema:{
                     errors:"error"
                         ,data:"data"
                         ,total:"total"
                         ,model:{
                             id:"seq"
                                ,fields:{
                                 seq                   :{type:"number", editable:false}
                                 , pconCustNo          :{type:"string", editable:false}
                                 //, rnum              :{type:"number", editable:false}
                                 , upperCustNo         :{type:"string", editable:false}
                                 , custNo              :{type:"string", editable:false}
                                 , pconTp              :{type:"string", validation:{required:true} , editable:true}
                                 , custNm              :{type:"string", editable:false}
                                 , mathDocTp           :{type:"string", editable:false}       // 신분증유형
                                 , certiNum            :{type:"string", editable:false}       // 신분증 번호
                                 , telNo               :{type:"string", editable:false}       // 전화
                                 , hpNo                :{type:"string", editable:false}       // 휴대전화
                                 , emailNm             :{type:"string", editable:false}       // E-MAIL
                                 , prefCommMthCd       :{type:"string", editable:false}       // 선호연락방식
                                 , prefCommNo          :{type:"string", editable:false}       // 선호 연락처
                                 , prefContactMthCd    :{type:"string", editable:false}       // 우선 연락방식
                                 , prefContactTimeCd   :{type:"string", editable:false}       // 우선 연락시간
                                 , regDt               :{type:"date", editable:false}         // 등록일
                             }
                         }
                 }
                 ,batch:true
                 ,pageSize:10
                 ,serverPaging:true
                 ,serverSorting:false
                 ,requestEnd:function(e) {

                     if (e.type !== "read") {
                         //this.page(1);
                     }
                 }
             }
             ,multiSelectWithCheckbox:true
             ,columns:[
                         // {field:"rnum",              title:"<spring:message code='global.lbl.no' />", width:30, sortable:false, attributes:{"class":"ac"}}
                         {field:"pconTp",            title:"<spring:message code='global.lbl.type' />",  width:100, attributes:{"class":"ac"}
                            , editor:function(container, options){
                                $('<input data-bind="value:' + options.field + '"  />')
                                .appendTo(container)
                                .kendoExtDropDownList({
                                    dataTextField:"cmmCdNm"
                                    , dataValueField:"cmmCd"
                                    //, optionLabel:" "
                                    , dataSource:pconTpList
                                });
                            }
                            , template:'#if (pconTp !== ""){# #= pconTpMap[pconTp]# #}#'
                         }
                         ,{field:"custNm",            title:"<spring:message code='global.lbl.custNm' />",  width:100, attributes:{"class":"ac"}}
                         ,{field:"mathDocTp",         title:"<spring:message code='global.lbl.mathDocTp' />",  width:100, attributes:{"class":"ac"}
                             , editor:function(container, options){
                                 $('<input data-bind="value:' + options.field + '"  />')
                                 .appendTo(container)
                                 .kendoExtDropDownList({
                                     dataTextField:"cmmCdNm"
                                     , dataValueField:"cmmCd"
                                     //, optionLabel:" "
                                     , dataSource:mathDocTpList
                                 });
                             }
                             , template:'#if (mathDocTp !== ""){# #= mathDocTpMap[mathDocTp]# #}#'
                         }
                         ,{field:"certiNum",          title:"<spring:message code='global.lbl.ssnCrnNo' />",  width:100, attributes:{"class":"ac"}}
                         ,{field:"telNo",             title:"<spring:message code='global.lbl.homeTelNo' />",  width:100, attributes:{"class":"ac"}}
                         ,{field:"hpNo",              title:"<spring:message code='global.lbl.hpNo' />",  width:100, attributes:{"class":"ac"}}
                         ,{field:"emailNm",           title:"<spring:message code='global.lbl.emailNm' />",  width:100, attributes:{"class":"al"}}
                         ,{field:"prefCommMthCd",     title:"<spring:message code='global.lbl.prefCommMthCd' />",  width:100, attributes:{"class":"ac"}
                             , editor:function(container, options){
                                 $('<input data-bind="value:' + options.field + '"  />')
                                 .appendTo(container)
                                 .kendoExtDropDownList({
                                     dataTextField:"cmmCdNm"
                                     , dataValueField:"cmmCd"
                                     //, optionLabel:" "
                                     , dataSource:prefCommMthCdList
                                 });
                             }
                             , template:'#if (prefCommMthCd !== ""){# #= prefCommMthCdMap[prefCommMthCd]# #}#'
                         }
                         ,{field:"prefCommNo",        title:"<spring:message code='global.lbl.prefCommNo' />",  width:100, attributes:{"class":"ac"}}
                         ,{field:"prefContactMthCd",  title:"<spring:message code='global.lbl.prefContactMthCd' />",  width:100, attributes:{"class":"ac"}
                             , editor:function(container, options){
                                 $('<input data-bind="value:' + options.field + '"  />')
                                 .appendTo(container)
                                 .kendoExtDropDownList({
                                     dataTextField:"cmmCdNm"
                                     , dataValueField:"cmmCd"
                                     //, optionLabel:" "
                                     , dataSource:prefContactMthCdList
                                 });
                             }
                             , template:'#if (prefContactMthCd !== ""){# #= prefContactMthCdMap[prefContactMthCd]# #}#'
                         }
                         ,{field:"prefContactTimeCd", title:"<spring:message code='global.lbl.prefContactTime' />",  width:100, attributes:{"class":"ac"}
                             , editor:function(container, options){
                                 $('<input data-bind="value:' + options.field + '"  />')
                                 .appendTo(container)
                                 .kendoExtDropDownList({
                                     dataTextField:"cmmCdNm"
                                     , dataValueField:"cmmCd"
                                     //, optionLabel:" "
                                     , dataSource:prefContactTimeCdList
                                 });
                             }
                             , template:'#if (prefContactTimeCd !== ""){# #= prefContactTimeCdMap[prefContactTimeCd]# #}#'
                         }
                         ,{field:"regDt",             title:"<spring:message code='global.lbl.regDt' />",  width:100, attributes:{"class":"ac"}
                            , format:"{0:<dms:configValue code='dateFormat' />}"
                         }
                     ]
             ,navigatable:false
             ,height:150
             ,editable:{
                 mode:"incell"
                 ,confirmation :false
             }
             ,pageable:{
                 refresh:true
             }
             ,resizable:false

         });


      // 주소 그리드
         $("#addrGrid").kendoExtGrid({
             dataSource:{
                 transport:{
                     read:{
                         url:"<c:url value='/crm/cmm/addressInfo/selectAddressInfo.do' />"
                     }
                     ,parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};

                             params["recordCountPerPage"]    = options.pageSize;
                             params["pageIndex"]             = options.page;
                             params["firstIndex"]            = options.skip;
                             params["lastIndex"]             = options.skip + options.take;
                             params["sort"]                  = options.sort;
                             params["sRefTableNm"]           = "CR_0101T";
                             params["sRefKeyNm"]             = $("#custNo").val();

                             console.log(params);
                             return kendo.stringify(params);

                         }else if (operation !== "read" && options.models) {
                             return kendo.stringify(options.models);
                         }
                     }
                 }
                 ,schema:{
                     errors:"error"
                         ,data:"data"
                         ,total:"total"
                         ,model:{
                             id:"seq"
                             ,fields:{
                                 seq:{type:"string", editable:false}
                                 ,rnum  :{type:"number" , editable:false}
                                 ,addrTp:{type:"string", editable:true}
                                 ,zipCd:{type:"string", editable:false}
                                 ,sungCd:{type:"string", editable:false}
                                 ,cityCd:{type:"string", editable:false}
                                 ,distCd:{type:"string", editable:false}
                                 ,sungNm:{type:"string", editable:false}
                                 ,cityNm:{type:"string", editable:false}
                                 ,distNm:{type:"string", editable:false}
                                 ,addrNm:{type:"string", editable:true}
                                 ,addrDetlCont:{type:"string", editable:true}
                                 ,flagYn:{type:"string", editable:true}
                                 ,refTableNm:{type:"string", editable:false}
                                 ,refKeyNm:{type:"string", editable:false}
                                 ,useYn:{type:"string", editable:false}
                             }
                         }
                 }
                 ,requestEnd:function(e){
                     if (e.type !== "read"){
                         //this.page(1);
                     }
                 }
             }
             ,multiSelectWithCheckbox:true
             ,autoBind:false
             ,navigatable:false
             ,height:150
             ,resizable:false
             ,columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false ,attributes:{"class":"ac"}}
                ,{field:"addrTp", title:"<spring:message code='global.lbl.type' />", width:100, attributes:{"class":"ac"}
                    , editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            , dataValueField:"cmmCd"
                            , dataSource:addrTpList
                        });
                    }
                    , template:'#if (addrTp !== ""){# #= addrTpMap[addrTp]# #}#'
                }       // 주소유형
                ,{field:"zipCd", title:"<spring:message code='global.lbl.zipCd' />", width:100, attributes:{"class":"ac"}}       // 우편번호
                ,{field:"sungNm", title:"<spring:message code='global.lbl.sungNm' />", width:100, attributes:{"class":"al"}}       // 성
                ,{field:"cityNm", title:"<spring:message code='global.lbl.cityNm' />", width:100, attributes:{"class":"al"}}       // 도시
                ,{field:"distNm", title:"<spring:message code='global.lbl.distNm' />", width:100, attributes:{"class":"al"}}       // 지역
                ,{field:"addrNm", hidden:true}       // 주소
                ,{field:"addrDetlCont", title:"<spring:message code='global.lbl.detlAddr' />", width:200, attributes:{"class":"al"}}       // 상세주소
                ,{field:"flagYn", title:"<spring:message code='global.lbl.typicalCar' />", width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem) {
                        if (dataItem.flagYn == "Y") {
                            return "<input type='checkbox' name='flagYn' data-uid='" + dataItem.uid + "' class='flagYn' checked />"
                        } else {
                            return "<input type='checkbox' name='flagYn' data-uid='" + dataItem.uid + "' class='flagYn' />"
                        }
                    }
                }
                ,{field:"sungCd", hidden:true}
                ,{field:"cityCd", hidden:true}
                ,{field:"distCd", hidden:true}
                ,{field:"refTableNm", hidden:true}
                ,{field:"refKeyNm", hidden:true}
                ,{title:""}
             ]

         });
});

</script>






