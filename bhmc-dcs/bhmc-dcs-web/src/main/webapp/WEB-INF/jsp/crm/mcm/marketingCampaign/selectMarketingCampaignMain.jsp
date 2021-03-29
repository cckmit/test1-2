<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<!-- *************************************************************************
**************************파일업로드1:상단에 스크립트 추가 ***********************
***************************************************************************-->
<%//TODO[이인문] 파일업로드 플러그인으로 변경 필요 %>
<script src="<c:url value='/resources/js/resumableFileUpload/resumable.js' />"></script>
<div id="progressWindow" class="resumable-progress">
    <p class="progress-total-txt"><!-- 현재 <span class="current_num">3</span> / 전체 <span class="whole_num">4</span> (<span class="complete_size">10</span>MB / <span class="whole_size">65</span>MB) --></p>
    <table>
        <tr>
            <td width="100%">
                <div class="progress-container">
                    <div class="progress-bar"></div>
                    <div class="progress-txt">00%</div>
                </div>
            </td>
            <td class="progress-pause" nowrap="nowrap">
                <div class="progress-btn">
                    <a href="#" onclick="r.upload(); return(false);" class="progress-resume-link"><img src="<c:url value='/resources/img/btn_resume.png' />" title="Resume upload" /></a>
                    <a href="#" onclick="r.pause(); return(false);" class="progress-pause-link"><img src="<c:url value='/resources/img/btn_pause.png' />" title="Pause upload" /></a>
                </div>
            </td>
        </tr>
    </table>
    <ul class="resumable-list"></ul>
</div>
<!-- *************************************************************************
**************************파일업로드1:상단에 스크립트 추가 ***********************
***************************************************************************-->

      <!-- 기본정보 -->
      <div id="resizableContainer">
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.menu.campaignMng" /></h1><!-- 캠페인 관리 -->
                    <div class="btn_right">
                    <dms:access viewId="VIEW-I-12534" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m" id="btnCopyVehic"><spring:message code="global.btn.copy" /></button> <!-- 복사 -->
                    </dms:access>
                    <dms:access viewId="VIEW-I-12532" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
                    </dms:access>
                    <dms:access viewId="VIEW-I-12531" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_new" id="btnAddVehic" ><spring:message code="global.btn.new" /></button> <!-- 신규  -->
                    </dms:access>
                    <dms:access viewId="VIEW-I-12533" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_modify" id="btnViewDetail" ><spring:message code='global.btn.update' /><!-- 상세 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-I-12530" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_print" id="btnPrintVehic" ><spring:message code="global.btn.print" /></button> <!-- 인쇄 -->
                    </dms:access>
                    <dms:access viewId="VIEW-I-12949" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_excel" id="btnCtlCamMgmtExcelExp" ><spring:message code='global.btn.excelExport' /><!-- 엑셀다운로드 Excel下?--></button>
                    </dms:access>
                    </div>
                </div>

                <div class="table_form" role="search" data-btnid="btnSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:8%;">
                            <col style="width:17%;">
                            <col style="width:8%;">
                            <col style="width:19%;">
                            <col style="width:8%;">
                            <col style="width:15%;">
                            <col style="width:8%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.crNm" /><!-- 캠페인명 --></th>
                                <td>
                                    <input id="sMakNm" name="sMakNm" class="form_input" style="width:100%" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.cpiCd" /><!-- 캠페인 코드 --></th>
                                <td>
                                    <input id="sCrNo" name="sCrNo" type="hidden">
                                    <input id="sMakCd" name="sMakCd" class="form_input" style="width:100%" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.hostCd" /><!-- 주최 --></th>
                                <td>
                                    <input id="sHostCd" class="form_comboBox" style="width:100%"/>
                                </td>
                                <th scope="row"><spring:message code="global.lbl.type" /><!-- 유형 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="form_left" >
                                            <input id="sMakTpCd" class="form_comboBox" />
                                        </div>
                                        <div class="form_right">
                                            <input id="sMakSubTpCd" class="form_comboBox" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.statNm" /><!-- 상태 --></th>
                                <td>
                                    <input id="sStatCd" class="form_comboBox" style="width:100%" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.campaignDt" /><!-- 캠페인일자 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sStartDt" class="form_datepicker ac" style="width:100%">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sEndDt" class="form_datepicker ac">
                                        </div>
                                    </div>
                                </td>
                                <th></th>
                                <td></td>
                                <th></th>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- 그리드 기능 버튼 시작 -->
                <div class="header_area">
                    <div class="btn_right">
                    </div>
                </div>
                <!-- 그리드 기능 버튼 종료 -->

                <div class="table_grid">
                    <div id="mcdGrid" class="resizable_grid"></div>
                </div>

                <section id="window" class="pop_wrap">
                <!-- 탭메뉴 전체 영역 -->
                <div id="tabstrip" class="tab_area">
                    <!-- 탭메뉴 -->
                    <ul>
                        <li id="defaultInfoTab" class="k-state-active"><spring:message code="global.title.defaultInfo" /><!-- 기본정보 0 --></li>
                        <li id="planTab"><spring:message code="global.title.plan" /> <!-- 방안 1 --></li>
                        <li id="goalTab"><spring:message code="global.title.goal" /> <!-- 목표 2 --></li>
                        <li id="targetTab"><spring:message code="global.title.target" /> <!-- 대상 3 --></li>
                        <li id="budgetTab"><spring:message code="crm.lbl.budget" /> <!-- 예산 4--></li>
                        <li id="bhmcLbrTab"><spring:message code="ser.lbl.labor" />          <!-- 제조사 : 공임  5 workTab --></li>
                        <li id="bhmcItemTab"><spring:message code="ser.lbl.chgItem" />        <!-- 제조사 : 교환부품  6 itemsTab--></li>
                        <li id="dlrLbrTab"><spring:message code="ser.lbl.rpipProject" />   <!-- 딜러    : 정비항목  7 laborTab--></li>
                        <li id="dlrItemTab"><spring:message code="ser.lbl.part" />         <!-- 딜러    : 부품 수령 8 itemsTab--></li>
                        <li id="vinTab"><spring:message code="ser.title.vinInfo" />        <!-- VIN정보 9 --></li>
                        <li id="dlrTab"><spring:message code="crm.title.targetDlr" /> <!-- 대상 딜러 12--></li>
                        <li id="progressTab"><spring:message code="crm.title.sign" /> <!-- 결재 10--></li>
                        <li id="resultTab"><spring:message code="global.title.result" /> <!-- 결과 11--></li>

                    </ul>
                    <div id="defaultInfoTabDiv" class="mt0">
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="global.title.defaultInfo" /></h2><!-- 기본정보 -->
                            <div class="btn_right">
							<dms:access viewId="VIEW-I-12536" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s" id="btnSaveVehic" ><spring:message code="global.btn.save" /></button> <!-- 저장 -->
							</dms:access>
							<dms:access viewId="VIEW-I-12535" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s" id="btnCancelVehic"><spring:message code="global.btn.del" /></button> <!-- 삭제 -->
							</dms:access>
                            </div>
                        </div>
                        <div class="table_form">
                            <form id="defaultInfoForm" >
                                <table>
                                    <caption></caption>
                                    <colgroup>
                                        <col style="width:14%;">
                                        <col style="width:22%;">
                                        <col style="width:10%;">
                                        <col style="width:23%;">
                                        <col style="width:10%;">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.crNo" /><!-- 캠페인번호 --></th>
                                            <td>
                                                <input id="dlrCd" name="dlrCd" type="hidden">
                                                <input id="pltCd" name="pltCd" type="hidden">
                                                <input id="delYn" name="delYn" type="hidden" value="N">
                                                <input id="crNo"  name="crNo"  type="hidden">
                                                <input id="docId" name="docId" type="hidden">
	                                                <input id="makCd" name="makCd" value="" readonly class="form_input form_readonly" style="width:100%">
                                            </td>
                                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.hostCd" /></span> <!-- 주최 --></th>
                                            <td class="required_area">
                                                <div>
                                                    <div>
                                                        <input id="hostCd" name="hostCd" value="" class="form_comboBox" />
                                                    </div>
                                                </div>
                                            </td>
                                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.type" /></span> <!-- 유형 --></th>
                                            <td class="required_area">
                                                <div class="form_float">
                                                    <div class="form_left" >
                                                        <input id="makTpCd" name="makTpCd" value="" class="form_comboBox" />
                                                        <input type="hidden" id="befMakTpCd" name="befMakTpCd" />
                                                    </div>
                                                    <div class="form_right">
                                                        <input id="makSubTpCd" name="makSubTpCd" value="" class="form_comboBox" />
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.crNm" /></span> <!-- 캠페인명 --></th>
                                            <td class="required_area" colspan="5">
                                                <input id="makNm" name="makNm" value="" class="form_input" style="width:100%" onKeyUp="txtLimit(this, '500');">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><span class="bu_required"><spring:message code='global.lbl.startDt' /></span></th>       <!-- 시작일 -->
                                            <td class="required_area">
                                                <input id="startDt" name="startDt" class="form_datepicker ac" style="width:100%" data-json-obj="true" />
                                            </td>
                                            <th scope="row"><span class="bu_required"><spring:message code='global.lbl.EndDt' /></span></th>       <!-- 종료일 -->
                                            <td class="required_area">
                                                <input id="endDt" name="endDt" class="form_datepicker ac" style="width:100%" data-json-obj="true" />
                                            </td>
                                            <th scope="row"><spring:message code="crm.lbl.period" /><!-- 일수 --></th>
                                            <td>
                                                <input id="prid" name="prid" value="" disabled="disabled" class="form_input form_readonly ar" style="width:90%"> <spring:message code="crm.lbl.day" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.aapCmpNm" /><!-- 대행업체 --></th>
                                            <td colspan="3">
                                                <input id="placeNm" name="placeNm" type="hidden">
                                                <input id="rcpeAutoYn" name="rcpeAutoYn" type="hidden">
                                                <input id="aapCmpNm" name="aapCmpNm" value="" class="form_input" style="width:100%" onKeyUp="txtLimit(this, '50');">
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.budgetAmt" /><!-- 예산 --></th>
                                            <td>
                                                <input id="budgetAmt" name="budgetAmt" disabled="disabled" class="form_numeric form_readonly ar" maxlength="10" style="width:100%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.statNm" /></span><!-- 상태 --></th>
                                            <td class="required_area">
                                                <input id="statCd" name="statCd" value="" class="form_comboBox" style="width:100%" />
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.targCustCnt" /><!-- 목표인수 --></th>
                                            <td>
                                                <input type="number" id="targCustCnt" name="targCustCnt" class="form_numeric ar" maxlength="10" style="width:100%" />
                                            </td>
                                            <th scope="row" colspan="2"></th>
                                        </tr>
                                        <tr id="serviceInfo1">
                                            <th scope="row"><spring:message code='ser.lbl.creStartDt' /></th>       <!-- 생산시작일자 -->
                                            <td>
                                                <input id="creStartDt" name="creStartDt" class="form_datepicker ac" style="width:100%" data-json-obj="true" />
                                            </td>
                                            <th scope="row"><spring:message code='ser.lbl.creEndDt' /></th>       <!-- 생산종료일자 -->
                                            <td>
                                                <input id="creEndDt" name="creEndDt" class="form_datepicker ac" style="width:100%" data-json-obj="true" />
                                            </td>
                                            <th scope="row"><spring:message code="crm.lbl.endYn" /><!-- 종료여부 --></th>
                                            <td>
                                                <input id="crEndTp" name="crEndTp" value="" class="form_comboBox" style="width:100%" />
                                            </td>
                                        </tr>
                                        <tr id="serviceInfo2">
                                            <th scope="row"><spring:message code='ser.lbl.saleStartDt' /></th>       <!-- 판매시작일자 -->
                                            <td>
                                                <input id="saleStartDt" name="saleStartDt" class="form_datepicker ac" style="width:100%" data-json-obj="true" />
                                            </td>
                                            <th scope="row"><spring:message code='ser.lbl.saleEndDt' /></th>       <!-- 판매종료일자 -->
                                            <td>
                                                <input id="saleEndDt" name="saleEndDt" class="form_datepicker ac" style="width:100%" data-json-obj="true" />
                                            </td>
                                            <th scope="row" id="crIsaNmTxt" ><spring:message code="ser.lbl.crIsaNm" /><!-- 시행처 --></th>
                                            <td>
                                                <input id="pcDstinCd" name="pcDstinCd" type="hidden" /><!-- 승상용구분코드 -->
                                                <input id="crIsaNm" name="crIsaNm" value="" type="hidden" class="form_input" style="width:100%" onKeyUp="txtLimit(this, '20');" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.detail" /></span><!-- 설명개요 --></th>
                                            <td colspan="5">
                                                <textarea id="makCont" name="makCont" rows="4" cols="" class="form_textarea" style="width:100%" onKeyUp="txtLimit(this, '4000');"></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록일 --></th>
                                            <td>
                                                <input id="regDt" name="regDt" value="" disabled="disabled" class="form_input form_readonly ac" style="width:100%">
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.updtDt" /><!-- 수정일 --></th>
                                            <td>
                                                <input id="updtDt" name="updtDt" value="" disabled="disabled" class="form_input form_readonly ac" style="width:100%">
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.regUsrId" /><!-- 등록자 --></th>
                                            <td>
                                                <input id="regUsrId" name="regUsrId" value="" disabled="disabled" class="form_input form_readonly ac" style="width:100%">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div> <!-- 기본정보 -->
                    <div id="planTabDiv" class="mt0">
                        <form id="planForm" >
                            <div class="clfix">
                                <div class="header_area">
                                    <div class="btn_right">
				                    <dms:access viewId="VIEW-I-12539" hasPermission="${dms:getPermissionMask('READ')}">
                                        <button type="button" class="btn_s" id="btnActiveSave" ><spring:message code="global.btn.save" /></button> <!-- 저장 -->
				                    </dms:access>
                                    </div>
                                </div>
                                <div class="table_form">
                                    <table>
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:8.7%;">
                                            <col style="width:89.3%;">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th scope="row"><spring:message code="global.lbl.crNm" /><!-- 캠페인명 --></th>
                                                <td class="required_area">
                                                    <input id="hDlrCd" name="hDlrCd" type="hidden">
                                                    <input id="hPltCd" name="hPltCd" type="hidden">
                                                    <input id="hMakCd" name="hMakCd" type="hidden">
                                                    <input type="hidden" id="activeFileDocNo" name="activeFileDocNo"  data-json-obj="true"/>
                                                    <input id="activeNm" name="activeNm" disabled="disabled" class="form_input form_readonly" style="width:100%" onKeyUp="txtLimit(this, '100');">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row"><spring:message code="crm.lbl.detail" /><!-- 설명개요 --></th>
                                                <td class="required_area">
                                                    <textarea id="activeCont" name="activeCont" rows="2" cols="" disabled="disabled" class="form_textarea form_readonly" style="height:120px;" onKeyUp="txtLimit(this, '2000');"></textarea>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <section class="left_areaStyle">
                                    <div class="header_area">
                                        <h2 class="title_basic"><spring:message code="global.lbl.talkPlan" /></h2><!-- 화술방안 -->
                                        <div class="btn_right">
					                    <dms:access viewId="VIEW-I-12537" hasPermission="${dms:getPermissionMask('READ')}">
                                            <button type="button" class="btn_s" id="btnTalkPlanSearch" ><spring:message code="crm.btn.talkPlanSearch" /><!-- 화술방안 조회 --></button>
					                    </dms:access>
                                        </div>
                                    </div>
                                    <div class="table_form">
                                        <table>
                                            <caption></caption>
                                            <colgroup>
                                                <col style="width:18%;">
                                                <col style="width:82%;">
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th scope="row"><spring:message code="global.lbl.talkPlan" /><!-- 화술방안 --></th>
                                                    <td>
                                                        <textarea id="talkPlan" name="talkPlan" rows="4" cols="" class="form_textarea" style="height:206px;" onKeyUp="txtLimit(this, '4000');"></textarea>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </section>
                                <section class="right_areaStyle">
                                    <div class="header_area">
                                        <h2 class="title_basic"><spring:message code="global.btn.fileUpload" /></h2><!-- 파일업로드 -->
                                        <div class="btn_right">
					                    <dms:access viewId="VIEW-I-12544" hasPermission="${dms:getPermissionMask('READ')}">
                                            <span class="btn_file" id="fileSelect"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
					                    </dms:access>
					                    <dms:access viewId="VIEW-I-12543" hasPermission="${dms:getPermissionMask('READ')}">
                                            <button type="button" class="btn_s" id="fileDelete"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
					                    </dms:access>
                                        </div>
                                    </div>
                                    <div class="table_grid">
                                        <div id="fileGrid">
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </form>
                    </div> <!-- 방안 -->
                    <div id="goalTabDiv" class="mt0">
                        <!-- 그리드 기능 버튼 시작 -->
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="global.title.goal" /></h2><!-- 목표 -->
                            <div class="btn_right">
                                <button class="btn_s" id="btnGoalAdd"><spring:message code="global.btn.rowAdd" /></button>
                                <button class="btn_s" id="btnGoalDel"><spring:message code="global.btn.rowDel" /></button>
                                <button class="btn_s" id="btnGoalSave"><spring:message code="global.btn.save" /></button>
                            </div>
                        </div>
                        <!-- 그리드 기능 버튼 종료 -->

                        <div class="table_grid">
                            <div id="goalGrid"></div>
                        </div>
                    </div> <!-- 목표 -->
                    <div id="targetTabDiv" class="mt0">
                        <section class="group">
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code='crm.title.crmTargExtract' /></h2><!-- 대상자 추출 조건 설정 -->
                            <div class="btn_right">
                                <!--<button class="btn_m" id="btnBatch">대상자추출 배치</button>-->
                                <button type="button" class="btn_s" id="btnTargetSave" ><spring:message code='crm.btn.rcpeExtrAdd' /><!-- 조건저장 --></button>
                                <button type="button" class="btn_s" id="btnTargetDelete" ><spring:message code='global.btn.del' /><!-- 삭제 추출--></button>
                                <button type="button" class="btn_s" id="btnRcpeExtr" ><spring:message code='crm.btn.rcpeExtrMapping' /><!-- 추출 실행 --></button>
<%--                                 <button type="button" class="btn_s" id="btnExcelImport"><spring:message code="crm.btn.excellCustUpload" /><!-- 고객 업로드 --></button> --%>
                                <button type="button" class="btn_s" id="btnCtlExcelExport"><spring:message code="global.btn.excelExport" /><!-- 엑셀Export --></button>
                                <button type="button" class="btn_s" id="btnTargetAdd" style="display:none;"><spring:message code='global.btn.init' /><!-- 추가 --></button>
                            </div>
                        </div>
                        <div class="table_form">
                           <input id="custExtrOverWriteChk" name="custExtrOverWriteChk" type="hidden">
                           <form id="targetForm" >
                                <table>
                                    <caption></caption>
                                    <colgroup>
                                        <col style="width:14%;">
                                        <col style="width:22%;">
                                        <col style="width:10%;">
                                        <col style="width:23%;">
                                        <col style="width:10%;">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.custExtrAutoYn' /><!-- 고객추출자동여부 --></span></th>
                                            <td class="required_area">
                                                <input id="tDlrCd" name="tDlrCd" type="hidden">
                                                <input id="tMakCd" name="tMakCd" type="hidden">
                                                <input id="extrDgreCnt" name="extrDgreCnt" type="hidden">
                                                <input id="realTargetCnt" name="realTargetCnt" type="hidden">
                                                <input id="custExtrAutoYn" name="custExtrAutoYn" value="" class="form_comboBox" required style="width:100%" />
                                            </td>
                                            <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.custExtrTermNo' /><!-- 고객추출조건  --></span></th>
                                            <td class="required_area">
                                                <input id="custExtrTitleNm" name="custExtrTitleNm" type="hidden">
                                                <input id="custExtrTermNo" name="custExtrTermNo" value="" class="form_comboBox" style="width:100%; z-index:50000;" />
                                            </td>
                                            <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.dupYn' /><!-- 중복 --></span></th>
                                            <td class="required_area">
                                                <input id="dupYn" name="dupYn" value="" class="form_comboBox" required style="width:100%" />
                                            </td>
                                        </tr>
                                        <!-- ###################################################### 추출주기설정 1/5 HTML 추가 시작 1/5 -->
                                        <tr>
                                            <th scope="row"><spring:message code='crm.lbl.custExtrCycleCont' /><!-- 고객추출주기 --></th>
                                            <td colspan="5">
                                                <button type="button" class="btn_s" id="btnCycleDay" ><spring:message code='crm.btn.allDay' /><!-- 매일 --></button>
                                                <button type="button" class="btn_s" id="btnCycleWeek" ><spring:message code='crm.btn.allWeek' /><!-- 매주 --></button>
                                                <button type="button" class="btn_s btn_select" id="btnCycleSelect" ><spring:message code='global.btn.select' /><!-- 선택 --></button>
                                                <input id="cycleDatepicker" name="cycleDatepicker" class="form_datepicker multi_datepicker" />
                                                <input type="hidden" id="custExtrCycleTp" name="custExtrCycleTp" data-json-obj="true" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" ></th>
                                            <td class="vt" colspan="5">
                                                <div id="weekSelect" style="display:none;">
                                                <c:forEach var="obj" items="${custExtrCycleWeekList}">
                                                    <label class="label_check" style="width:45px;margin:0 0 2px;"><input type="checkbox" id="custExtrCycleWeek_<c:out value='${obj.cmmCd}' />" name="custExtrCycleWeek" class="form_check" value="<c:out value='${obj.cmmCd}' />" data-json-obj="true" /> <c:out value="${obj.cmmCdNm}" /></label>
                                                </c:forEach>
                                                </div>
                                                <div id="cycleDtTxtArea" style="display:none;">
                                                    <textarea rows="2" cols="" id="cycleDt" name="cycleDt" class="form_textarea" maxlength="1000" ></textarea>
                                                </div>
                                            </td>
                                        </tr>
                                        <!-- ###################################################### 추출주기설정 1/5 HTML 추가 종료 -->
                                    </tbody>
                                </table>
                            </form>
                        </div>
                        </section>

                        <section class="group">
                            <div class="header_area">
                                <h2 class="title_basic"><spring:message code='crm.title.extractList' /></h2><!-- 추출 실행 목록 -->
                            </div>
                            <div class="table_grid">
                                <div id="targetGrid"></div>
                            </div>
                            <div class="table_grid" style="display:none;">
                                <div id="targExcelGrid"></div>
                            </div>
                        </section>
                    </div> <!-- 대상 -->
                    <div id="budgetTabDiv" class="mt0">
                        <!-- 그리드 기능 버튼 시작 -->
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="global.title.budgetInfo" /></h2><!-- 예산(위안)정보 -->
                            <div class="btn_right">
		                    <dms:access viewId="VIEW-I-12553" hasPermission="${dms:getPermissionMask('READ')}">
                                <button class="btn_s" id="btnBudgetSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
		                    </dms:access>
		                    <dms:access viewId="VIEW-I-12552" hasPermission="${dms:getPermissionMask('READ')}">
                                <button class="btn_s" id="btnBudgetAdd"><spring:message code="global.btn.rowAdd" /><!-- 행추가 --></button>
		                    </dms:access>
		                    <dms:access viewId="VIEW-I-12551" hasPermission="${dms:getPermissionMask('READ')}">
                                <button class="btn_s" id="btnBudgetDel"><spring:message code="global.btn.rowDel" /><!-- 행삭제 --></button>
		                    </dms:access>
		                    <dms:access viewId="VIEW-I-12550" hasPermission="${dms:getPermissionMask('READ')}">
                                <button class="btn_s" id="btnBudgetExcelExport"><spring:message code="global.btn.excelExport" /><!-- 엑셀Export --></button>
		                    </dms:access>
                            </div>
                        </div>
                        <!-- 그리드 기능 버튼 종료 -->

                        <div class="table_grid">
                            <div id="budgetGrid"></div>
                        </div>
                    </div> <!-- 예산 -->

                    <!-- 제조사 작업정보 -->
                    <div id="bhmcLbrTabDiv" class="mt0">
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="crm.title.lbr" /></h2><!-- 공임 -->
                        </div>

                        <div class="table_grid">
                            <div id="bhmcLbrGrid"></div>
                        </div>
                    </div>

                    <!-- 제조사 부품정보 -->
                    <div id="bhmcItemTabDiv" class="mt0">
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="crm.title.chgItem" /></h2><!-- 교환부품 -->
                        </div>

                        <div class="table_grid" >
                            <div id="bhmcItemGrid"></div>
                        </div>
                    </div> <!-- 부품정보 -->

                    <!-- 딜러 작업정보 -->
                    <div id="dlrLbrTabDiv" class="mt0">
                        <!-- 그리드 기능 버튼 시작 -->
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="ser.lbl.rpipProject" /></h2><!-- 작업정보 -->
                            <div class="btn_right">
                                <button type="button" class="btn_s" id="btnLbrAdd"><spring:message code="ser.btn.lbrSave" /></button><!--공임등록  -->
                                <button type="button" class="btn_s" id="btnWorkAdd"><spring:message code="global.btn.add" /><!-- 추가 --></button>
                                <button type="button" class="btn_s" id="btnWorkSave" ><spring:message code='global.btn.save' /><!-- 저장 --></button>
                                <button type="button" class="btn_s" id="btnWorkDel"><spring:message code="global.btn.del" /><!-- 삭제 --></button>
                            </div>
                        </div>
                        <!-- 그리드 기능 버튼 종료 -->

                        <div class="table_grid">
                            <input id="lbrCd" name="lbrCd" type="hidden">
                            <div id="dlrLbrGrid"></div>
                        </div>
                    </div> <!-- 작업정보 -->
                    <!-- 딜러 부품정보 -->
                    <div id="dlrItemTabDiv" class="mt0">
                        <!-- 그리드 기능 버튼 시작 -->
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="ser.lbl.part" /></h2><!-- 부품정보 -->
                            <div class="btn_right">
                                <button type="button" class="btn_s" id="btnItemsAdd"><spring:message code="global.btn.add" /><!-- 추가 --></button>
                                <button type="button" class="btn_s" id="btnItemsSave" ><spring:message code='global.btn.save' /><!-- 저장 --></button>
                                <button type="button" class="btn_s" id="btnItemsDel"><spring:message code="global.btn.del" /><!-- 삭제 --></button>
                            </div>
                        </div>
                        <!-- 그리드 기능 버튼 종료 -->

                        <div class="table_grid">
                            <input id="lbrCd1" name="lbrCd1" type="hidden"><!-- 공임코드 -->
                            <input id="cauItemCd" name="cauItemCd" type="hidden"><!-- 품목코드 -->
                            <input id="ltsModelCd" name="ltsModelCd" type="hidden"><!-- LTS모델코드 -->
                            <div id="dlrItemGrid"></div>
                        </div>
                    </div> <!-- 부품정보 -->

                    <div id="vinTabDiv" class="mt0">
                        <!-- 그리드 기능 버튼 시작 -->
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="ser.title.vinInfo" /></h2><!-- VIN정보 -->
                            <div class="btn_right">
                                <button type="button" class="btn_s" id="btnLtsModelExcelImport"><spring:message code="crm.btn.excelLtsModelUpload" /><!-- LTS MODEL 업로드 --></button>
                                <button type="button" class="btn_s" id="btnVinNoExcelImport"><spring:message code="crm.btn.excelVinUpload" /><!-- VIN 업로드 --></button>
                            </div>
                        </div>
                        <!-- 그리드 기능 버튼 종료 -->

                        <div class="table_grid">
                            <div id="vinGrid"></div>
                        </div>
                    </div> <!-- VIN정보 -->
                    <div id="dlrTabDiv" class="mt0">
                        <div class="clfix">
                            <div class="left_areaStyle" style="width:45%">
                                <div class="header_area">
                                    <h2 class="title_basic"><spring:message code="crm.title.allDlr" /></h2><!-- 전체 딜러 -->
                                    <div class="btn_right mt10">
                                    </div>
                                </div>
                                <div class="table_grid">
                                    <div id="dlrGrid"></div>
                                </div>
                            </div>
                            <ul class="promotion_btn pt_v1" style="padding-top:150px;">
                                <li><button class="btn_s btn_next" id="btnAddR"></button></li>
                                <li><button class="btn_s btn_prev" id="btnDelR"></button></li>
                            </ul>
                            <div class="right_areaStyle" style="width:45%">
                                <div class="header_area">
                                    <h2 class="title_basic"><spring:message code="crm.title.targetDlr" /></h2><!-- 대상 딜러 -->
                                    <div class="btn_right">
                                        <button id="btnDlrSelect" class="btn_s btn_Select"><spring:message code="global.btn.save" /><!-- 저장 --></button>
                                    </div>
                                </div>
                                <div class="table_grid">
                                    <div id="targDlrGrid"></div>
                                </div>
                            </div>
                        </div>
                    </div> <!-- 대상 딜러 -->
                    <div id="progressTabDiv" class="mt0">
                        <section class="group">
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="crm.title.sign" /></h2><!-- 결재 -->
                            <div class="btn_right">
<%--                                 <button type="button" class="btn_s" id="btnSignPrint"><spring:message code="crm.btn.btnSignPrint" /></button><!-- 신청서조회 --> --%>
                                <button type="button" class="btn_s" id="btnEvalReq"><spring:message code="crm.btn.submitReq" /></button><!-- 제출신청 -->
                                <button type="button" class="btn_s" id="btnEval"><spring:message code="crm.btn.eval" /></button><!-- 심사 -->
                                <button type="button" class="btn_s" id="btnReject"><spring:message code="global.btn.appRollback" /></button><!-- 반려 -->
                            </div>
                        </div>
                        <div class="table_grid">
                            <input id="apprDocNo" name="apprDocNo" type="hidden"><!-- 결재문서번호 -->
                            <input id="signDocId" name="signDocId" type="hidden"><!-- 결재양식ID -->
                            <input id="signCont" name="signCont" type="hidden"><!-- 결재의견 -->
                            <div id="signLineGrid"></div>
                        </div>
                        </section>
                    </div> <!-- //결재 -->
                    <div id="resultTabDiv" class="mt0">
                        <div class="clfix">
                            <!-- 목표결과정보 -->
                            <section>
                                <div class="header_area">
                                    <h2 class="title_basic"><spring:message code="global.title.campaignResult" /></h2><!-- 캠페인 결과 -->
                                </div>
                                <div class="table_grid">
                                    <div id="resultGoalGrid"></div>
                                </div>
                            </section>

                            <!-- 캠페인담당자의견정보 -->
<!--                             <section class="right_areaStyle"> -->
<!--                                 <div class="header_area"> -->
<%--                                     <h2 class="title_basic"><spring:message code="global.title.crop" /><!-- 업체평가 --></h2> --%>
<!--                                 </div> -->
<!--                                 <div class="table_grid"> -->
<!--                                     <div id="resultCorpGrid"></div> -->
<!--                                 </div> -->
<!--                             </section> -->
                        </div>
                        <div class="clfix">
                            <section class="left_areaStyle">
                                <div class="header_area">
                                   <h2 class="title_basic"><spring:message code="global.title.campaignPrsn" /><!-- 캠페인 책임자 의견 --></h2>
                                </div>
                                <div class="table_form">
                                    <table>
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:100%;">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <td class="required_area">
                                                    <textarea maxlength="4000" id="prsnOpnCont" name="prsnOpnCont" rows="" cols="" disabled="disabled" class="form_textarea form_readonly" style="height:170px;"></textarea>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </section>
                            <section class="right_areaStyle">
                              <div class="header_area">
                                  <h2 class="title_basic"><spring:message code="global.lbl.file" /></h2>
                              </div>
                              <div class="table_grid">
                                <div id="fileResultGrid"></div>
                              </div>
                            </section>
                        </div>
                    </div> <!-- 결과 -->
                </div>
                </section>

            </section>
      </div>
      <!-- //기본정보 -->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">


    var isGridReload = false      // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
      , resultKey                 // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
    ;


    // 캠페인목록에서 makCd 가지고 온경우 해당 grid dataBound 시 makCd 찾아서 선택, 상세조회 이벤트 준다
//    <c:if test="${makCd != ''}">
//        var  isGridReload = true
//           , resultKey = "<c:out value='${makCd}' />"
//        ;
//    </c:if>

    var hostList     = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var makTpList    = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var makTpDenySerList    = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var makSubTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var statList     = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var budGetList   = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var lbrList      = [{"lbrCd":"", "lbrNm":""}];
    var lbrMap       = [];


    <c:forEach var="obj" items="${hostList}">
        hostList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${makTpList}">
        makTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        <c:if test="${obj.cmmCd != '03'}">
          makTpDenySerList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:if>
    </c:forEach>

    <c:forEach var="obj" items="${makSubTpList}">
        makSubTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${statList}">
        statList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var statMap = dms.data.arrayToMap(statList, function(obj){ return obj.cmmCd; });

    //예산코드 Array
    <c:forEach var="obj" items="${budGetList}">
        budGetList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //예산코드 Map
    var budGetMap = [];
    $.each(budGetList, function(idx, obj){
        budGetMap[obj.cmmCd] = obj.cmmCdNm;
    });

    // 만족여부
    var stsfIvstYnList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${stsfIvstYnList}">
        stsfIvstYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    //만족여부 Map
    var stsfIvstYnMap = dms.data.arrayToMap(stsfIvstYnList, function(obj){ return obj.cmmCd; });

    //고객추출
    var targExtractDupMap = []; //고객추출조건번호
    targExtractDupMap['Y'] = '否';
    targExtractDupMap['N'] = '是';

    // 차종
    var carLineCdDSList = [];
    var carLineCdObj = {};
    <c:forEach var="obj" items="${carLineCdInfo}">
        carLineCdDSList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
        carLineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
    </c:forEach>

    // 그리드 모델 콤보 DataSource
    var modelCdDSList = [];
    var modelCdObj = {};


    //결재유형  Array
    var arrSignTp = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${arrSignTp}">
    arrSignTp.push({
        "cmmCd":"${obj.cmmCd}"
        ,"cmmCdNm":"${obj.cmmCdNm}"
    });
    </c:forEach>

    var arrSignTpMap = dms.data.arrayToMap(arrSignTp, function(obj){ return obj.cmmCd; });

    //결재처리코드  Array
    var arrSignProcCd = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];

    <c:forEach var="obj" items="${arrSignProcCd}">
    arrSignProcCd.push({
        "cmmCd":"${obj.cmmCd}"
        ,"cmmCdNm":"${obj.cmmCdNm}"
    });
    </c:forEach>

    var arrSignProcCdMap = dms.data.arrayToMap(arrSignProcCd, function(obj){ return obj.cmmCd; });


//##################### 정비 코드 #####################

    //공통코드:임률정보
    var rateList = [];
    <c:forEach var ="obj" items="${rateDs}">
      rateList.push({
            rpirTp:"${obj.rpirTp}"
            , rpir01:"${obj.gnlRteRate}"
            , rpir02:"${obj.wartRteRate}"
            , rpir03:"${obj.incRteRate}"
            , rpir04:"${obj.intRteRate}"
            , rpir05:"${obj.rwrkRteRate}"
        });
    </c:forEach>

    //공통코드:정비유형(수리유형)
    var lbrTpCdList  = []; //기본 수리유형
    <c:forEach var="obj" items="${lbrTpCdList}">
      lbrTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var lbrTpCdArr = dms.data.arrayToMap(lbrTpCdList, function(obj){return obj.cmmCd;});

     // 정비유형(수리유형)
     lbrTpCdGrid = function(val){
         var returnVal = "";
         if(val != null && val != ""){
             if(lbrTpCdArr[val] != undefined)
             returnVal = lbrTpCdArr[val].cmmCdNm;
         }
         return returnVal;
     };

     /** 캠페인 유형 **/
     var crTpList = [];
     <c:forEach var="obj" items="${campaignDs}">
         crTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>
     var crTpMap = dms.data.arrayToMap(crTpList, function(obj){return obj.cmmCd;});

   //캠페인유형
     crTpCdGrid = function(val){
         var returnVal = "";
         if(val != null && val != ""){
             if(crTpMap[val] != undefined)
             returnVal = crTpMap[val].cmmCdNm;
         }
         return returnVal;
     };

     setKendoDate = function( dtValue){
         return kendo.toString(kendo.parseDate(dtValue),"<dms:configValue code='dateFormat' />");
     };
     //##################### 정비 코드 #####################


    function callBackFunc(){
        //var customerForm = $("#tabFormIframe").contents().find("#customerForm").html();
        //$("#tabstrip-1", parent.document).html(customerForm);
        //$("#tabFormIframe").contents().find("#customerForm").html();
    }

    //고객 추출주기의 버튼을 잠근다.
    function cycleCheckDisTrue(){
        $("#btnCycleDay").prop("disabled",true);
        $("#btnCycleWeek").prop("disabled",true);
        $("#btnCycleSelect").prop("disabled",true);
        $("#cycleDatepicker").prop("disabled",true);
        //$("#cycleDatepicker").addClass("form_readonly");
        var cycleDatepicker = $("#cycleDatepicker").data("kendoDatePicker");
        cycleDatepicker.enable(false);
        cycleFormInit();

        //체크박스
        $("input[name=custExtrCycleWeek]:checkbox").prop("checked",false);

        // 날짜 선택 텍스트 박스
        $("#cycleDt").val("");
        $("#cycleDtTxtArea").hide();
    }

    //고객 추출주기의 버튼을 푼다.
    function cycleCheckDisFalse(){
        $("#btnCycleDay").prop("disabled",false);
        $("#btnCycleWeek").prop("disabled",false);
        $("#btnCycleSelect").prop("disabled",false);
        $("#cycleDatepicker").prop("disabled",false);
        var cycleDatepicker = $("#cycleDatepicker").data("kendoDatePicker");
        cycleDatepicker.enable(true);
        $("input[name=custExtrCycleWeek]:checkbox").prop("disabled",false);
        /* var cycleDatepicker = $("#cycleDatepicker").data("kendoDatePicker");
        cycleDatepicker.open(); */
    }

    var mode = "N";

    function resetDefualtForm(){
        $("#tDlrCd").val("");
        $("#hDlrCd").val("");
        $("#dlrCd").val("");
        $("#hPltCd").val("");
        $("#pltCd").val("");
        $("#hMakCd").val("");
        $("#tMakCd").val("");
        $("#makCd").val("");
        $("#makNm").val("");

        //$("#hostCd").data("kendoExtDropDownList").setDataSource(dms.data.cmmCdFilter(hostList));
        $("#hostCd").data("kendoExtDropDownList").select(1);

        $("#makTpCd").data("kendoExtDropDownList").select(0);
        $("#befMakTpCd").val("");
        $("#makSubTpCd").data("kendoExtDropDownList").setDataSource([]);

        $("#makCont").val("");
//        $("#rcpeAutoYn").data("kendoExtDropDownList").value("N");
        $("#rcpeAutoYn").val("N");
        $("#startDt").val("");
        $("#endDt").val("");
        $("#prid").val("");
        $("#placeNm").val("");
        $("#aapCmpNm").val("");
        $("#budgetAmt").data("kendoExtNumericTextBox").value(0);     // 예산

        $("#statCd").data("kendoExtDropDownList").value("01");
        $("#statCd").data("kendoExtDropDownList").readonly(true);
        $("#statCd").parent().addClass("readonly_area");

        $("#targCustCnt").data("kendoExtNumericTextBox").value(0);   // 목표인수
//        $("#pgssRate").val("");
        $("#regDt").val("");
        $("#updtDt").val("");
        $("#regUsrId").val("");

        $("#activeNm").val("");
        $("#activeCont").val("");
        $("#talkPlan").val("");
        $("#activeFileDocNo").val("");//파일 일련번호
        $("#apprDocNo").val("");//결재문서번호
        $("#signDocId").val("");//결재양식ID
        $("#signCont").val("");//결재의견

        $("#crNo").val(""); // 캠페인번호(정비용)
        $("#creStartDt").val(""); // 생산시작일자(정비용)
        $("#creEndDt").val(""); // 생산종료일자(정비용)
        $("#saleStartDt").val(""); // 판매시작일자(정비용)
        $("#saleEndDt").val(""); // 판매종료일자(정비용)
        $("#crEndTp").data("kendoExtDropDownList").value("N"); // 종료여부(정비용)
        $("#crIsaNm").val(""); // 캠페인리콜시행처명(정비용)
        $("#pcDstinCd").val(""); // 승상용구분코드(정비용)

        $("#fileGrid").data("kendoExtGrid").dataSource.data([]);  //파일
        $("#fileResultGrid").data("kendoExtGrid").dataSource.data([]);  //파일결과


        $("#goalGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#goalGrid").data("kendoExtGrid").dataSource.page(1);


        $("#targetGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#targetGrid").data("kendoExtGrid").dataSource.page(1);

// 신규를 위한 form reset - start
        $("#makNm").attr("readOnly", false);
        $("#makNm").removeClass("form_readonly");
        $("#aapCmpNm").attr("readOnly", false);
        $("#aapCmpNm").removeClass("form_readonly");
        $("#makCont").attr("readOnly", false);
        $("#makCont").removeClass("form_readonly");
        $("#targCustCnt").data("kendoExtNumericTextBox").enable(true);
        $("#makTpCd").data("kendoExtDropDownList").enable(true);
        $("#startDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#endDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#creStartDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#creEndDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#saleStartDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#saleEndDt").data("kendoExtMaskedDatePicker").enable(true);
// 신규를 위한 form reset - end

        initTargetForm();

        if($("#custExtrAutoYn").data("kendoExtDropDownList").value() == "Y"){
            cycleCheckDisFalse();
        }else{
            cycleCheckDisTrue();
        }

        $("#budgetGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#budgetGrid").data("kendoExtGrid").dataSource.page(1);

        $("#signLineGrid").data("kendoExtGrid").dataSource._destroyed = [];

        if( $("#apprDocNo").val() != null && $("#apprDocNo").val() != "" ) {
            $("#signLineGrid").data("kendoExtGrid").dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectSignLineExs.do' />";
        }else{
            $("#signLineGrid").data("kendoExtGrid").dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectDocLineExs.do' />";
        }

        $("#signLineGrid").data("kendoExtGrid").dataSource.page(1);
        $("#signCont").val("");

        $("#resultGoalGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#resultGoalGrid").data("kendoExtGrid").dataSource.page(1);

//        $("#resultPersonGrid").data("kendoExtGrid").dataSource._destroyed = [];
//        $("#resultPersonGrid").data("kendoExtGrid").dataSource.page(1);

//         $("#resultCorpGrid").data("kendoExtGrid").dataSource._destroyed = [];
//         $("#resultCorpGrid").data("kendoExtGrid").dataSource.page(1);

        $("#prsnOpnCont").val("");
        $("#docId").val("");


        // 정비 캠페인그리드

        $("#bhmcLbrGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#bhmcLbrGrid").data("kendoExtGrid").dataSource.page(1);

        $("#dlrLbrGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#dlrLbrGrid").data("kendoExtGrid").dataSource.page(1);

        $("#bhmcItemGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#bhmcItemGrid").data("kendoExtGrid").dataSource.page(1);

        $("#dlrItemGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#dlrItemGrid").data("kendoExtGrid").dataSource.page(1);

        $("#vinGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#vinGrid").data("kendoExtGrid").dataSource.page(1);

        $("#dlrGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#dlrGrid").data("kendoExtGrid").dataSource.page(1);

        $("#targDlrGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#targDlrGrid").data("kendoExtGrid").dataSource.page(1);

    }

    //시작일자와 종료일자를 비교하여 그 사이 기간 구하기
    function f_betweenDate(startDt, endDt){

        if(startDt != "" && endDt != ""){
            var startDay = startDt;
            var endDay   = endDt;

            var dataArry1 = startDay.split("-");
            var dataArry2 = endDay.split("-");

            var dateObj1  = new Date(dataArry1[0], Number(dataArry1[1])-1, dataArry1[2]);
            var dateObj2  = new Date(dataArry2[0], Number(dataArry2[1])-1, dataArry2[2]);

            var day = 1000*60*60*24;
            var month = day*30;
            var year = month*12;

            var betweenDay = ((dateObj2.getTime() - dateObj1.getTime()) / day) + 1;
            var betweenMonth = (dateObj2.getTime() - dateObj1.getTime()) / month;

            $("#prid").val(betweenDay);
//            return betweenDay;
        }
    }

    //예산 및 제조사지원금액 합계 계산
    function budgetGridSum() {
        var budgetGridBudgetAmtSum = 0;
        var budgetGridCorpBudnRateSum = 0;
        var budgetGridImsSuptAmtSum = 0;
        var gridDataList = $("#budgetGrid").data("kendoExtGrid").dataSource.data();
        $(gridDataList).each(function(idx, item){
            budgetGridBudgetAmtSum += item.budgetAmt;
            budgetGridCorpBudnRateSum += item.corpBudnRate;
            budgetGridImsSuptAmtSum += item.imsSuptAmt;
        });
        $("#budgetGridBudgetAmtSum").html(kendo.toString(budgetGridBudgetAmtSum, 'n2'));
        $("#budgetGridCorpBudnRateSum").html(kendo.toString(budgetGridCorpBudnRateSum, 'n2'));
        $("#budgetGridImsSuptAmtSum").html(kendo.toString(budgetGridImsSuptAmtSum, 'n2'));

        $("#budgetAmt").val(budgetGridBudgetAmtSum);
    }

    /**
    * 직원설문에 대한 설문내용 조회
    */
/*
    $(document).on("click", ".personEmpNm", function(e){

         var grid = $("#resultPersonGrid").data("kendoExtGrid"),
         row = $(e.target).closest("tr");
         var dataItem = grid.dataItem(row);

         marketingCampaignServeyPopup = dms.window.popup({
             windowId:"marketingCampaignServeyPopup"
             , title:"<spring:message code='global.title.person'/>"
             ,height:510
             , content:{
                 url:"<c:url value='/crm/mcm/marketingCampaign/selectMarketingCampaignSurveyPopup.do?dlrCd="+dataItem.dlrCd+"&makCd="+dataItem.makCd+
                         "&ivstTp="+dataItem.ivstTp+"&empId="+dataItem.empId+"&stsfIvstSeq="+dataItem.stsfIvstSeq+"&subyTmplSeq="+dataItem.subyTmplSeq+"'/>"
                 , data:{

                 }
             }
         });
     });
*/

    /**
     * 업체평가에 대한 설문내용 조회
     */
     $(document).on("click", ".corpEmpNm", function(e){

          var grid = $("#resultCorpGrid").data("kendoExtGrid"),
          row = $(e.target).closest("tr");
          var dataItem = grid.dataItem(row);

//           console.log("dataItem:::::");
//           console.log(dataItem);
//           console.log(dataItem.dlrCd);
//           console.log(dataItem.makCd);
//           console.log(dataItem.ivstTp);
//           console.log(dataItem.empId);
//           console.log(dataItem.stsfIvstSeq);
//           console.log(dataItem.subyTmplSeq);
//           console.log(dataItem.stsfIvstRsltSeq);
          marketingCampaignServeyPopup = dms.window.popup({
              windowId:"marketingCampaignServeyPopup"
              , title:"<spring:message code='global.title.crop'/>"
              ,width:800
              ,height:510
              , content:{
                  url:"<c:url value='/crm/mcm/marketingCampaign/selectMarketingCampaignSurveyPopup.do?dlrCd="+dataItem.dlrCd+"&makCd="+dataItem.makCd+
                          "&ivstTp="+dataItem.ivstTp+"&empId="+dataItem.empId+"&stsfIvstSeq="+dataItem.stsfIvstSeq+"&subyTmplSeq="+dataItem.subyTmplSeq+"'/>"
                  , data:{

                  }
              }
          });
      });

    /**
    * 캠페인 마스터 그리드 - 참여인력 조회 팝업
    */
    $(document).on("click", ".popTargExtractList", function(e){

        var grid = $("#mcdGrid").data("kendoExtGrid"),
        row = $(e.target).closest("tr");
        var dataItem = grid.dataItem(row);

        targExtractSearchPopupWin = dms.window.popup({
            windowId:"targExtractSearchPopupWin"
            ,title:"<spring:message code='crm.title.rcpeList'/>"   // 대상자 목록
            ,height:540
            ,content:{
                url:"<c:url value='/crm/cmm/crmTargExtract/selectCrmTargExtractSearchPopup.do?dlrCd="+dataItem.dlrCd+"&makCd="+dataItem.makCd+"'/>"
                , data:{
                    "autoBind":false
                    , "type"  :null
                    ,"callbackFunc":function(data){

                    }
                }
            }
         })

     });

    /**
     * 대상자 그리드 - 대상자수 조회 팝업
     */
     $(document).on("click", ".popTargExtractDetailList", function(e){

         var grid = $("#targetGrid").data("kendoExtGrid"),
         row = $(e.target).closest("tr");
         var dataItem = grid.dataItem(row);

         targExtractDetailSearchPopupWin = dms.window.popup({
             windowId:"targExtractDetailSearchPopupWin"
             ,title:"<spring:message code='crm.title.rcpeList'/>"   // 대상자 목록
             ,width:800
             ,content:{
                 url:"<c:url value='/crm/cmm/crmTargExtract/selectCrmTargExtractDetailSearchPopup.do?dlrCd="+dataItem.dlrCd+"&makCd="+dataItem.makCd+"&extrDgreCnt="+dataItem.extrDgreCnt+"&statCd="+$("#statCd").data("kendoExtDropDownList").value()+"'/>"
                 , data:{
                     "autoBind":false
                     , "type"  :null
                     ,"callbackFunc":function(data){

                     }
                 }
             }
          })

      });

     /**
     * hyperlink in grid event
     */
     $(document).on("click", ".linkCustExtrTermNo", function(e){

          var grid = $("#targetGrid").data("kendoExtGrid"),
          row = $(e.target).closest("tr");
          var dataItem = grid.dataItem(row);

          window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.crmTargExtractDetail' />", "<c:url value='/crm/cmm/crmTargExtract/selectCrmTargExtractDetailMain.do' />?sDlrCd="+dataItem.dlrCd+"&sCustExtrTermNo="+dataItem.custExtrTermNo); // RO Main
      });


    //사용자 팝업 조회
    var userSearchPopupWin;
    function userSearchPopup() {

        var grid = $("#signLineGrid").data("kendoExtGrid");
        //var rows = grid.tbody.find("tr");
        var row  = grid.select();
        var uid  = row[0].attributes["data-uid"].nodeValue;
        var dataSourceRow = grid.dataSource.getByUid(uid);



        userSearchPopupWin = dms.window.popup({
            windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"usrNm":""
                    ,"callbackFunc":function(data){
//                        dms.notification.info(JSON.stringify(data));
                        dataSourceRow.set("signUsrId", data[0].usrId);
                        dataSourceRow.set("signUsrNm", data[0].usrNm);
                    }
                }
            }

        });
    }

    var popupWindow;

    // 주기 설정 팝업
    $("#custSearch").click(function(){

        //고객자동추출여부가 "Y"일 경우만 팝업 호출
        if($("#custExtrAutoYn").val() == "Y"){
            popupWindow = dms.window.popup({
                windowId:"cronPopup"
                , title:"<spring:message code='crm.lbl.cronSetting' />"   // 주기설정
                , height:600
                , content:{
                    url:"<c:url value='/crm/cmm/cronMaker/selectCronMakerPopup.do'/>"
                    , data:{
                        "autoBind" :false
                        , "type"   :null
                        , "cronTxt":$("#custExtrCycleCont").val()
                        , "callbackFunc":function(data){

                            if ( dms.string.isNotEmpty(data) ) {
                                $("#custExtrCycleCont").val(data);
                            }
                            popupWindow.close();
                        }
                    }
                }
            });
        }
    });

    var targetUploadPopupWin;
    var vinUploadPopupWin;
    var itemSalePrcPopupWindow;
    var selectShareStockGiItemPopupWindow;

    // 대상자 입력폼 초기화
    function initTargetForm(){

        $("#extrDgreCnt").val("");
        //$("#custExtrAutoYn").data("kendoExtDropDownList").value("N");
//        $("#custExtrCycleCont").val("");
        $("#realTargetCnt").val("");
        $("#custExtrTermNo").data("kendoExtDropDownList").select(1);
        $("#dupYn").data("kendoExtDropDownList").value("Y");

        // ###################################################### 추출주기설정 4/5 초기화 시작
        // 요일 선택 체크박스 영역 초기화
        $("#weekSelect").hide();
        $("input[name=custExtrCycleWeek]:checkbox").prop("checked",false);

        // 날짜 선택 텍스트 박스
        $("#cycleDtTxtArea").hide();
        custExtrCycleDt = [];
        $("#cycleDt").val("");

        // 버튼 값 초기화
        $("#custExtrCycleTp").val("");
        // 버튼 활성화 클래스 초기화
        $("#btnCycleDay").removeClass("btn_active");
        $("#btnCycleWeek").removeClass("btn_active");
        $("#btnCycleSelect").removeClass("btn_active");
        // ###################################################### 추출주기설정 4/5 초기화 종료

    }

    // 고객추출조건(입력부). 필터를 지정하면 저장후 value 선택시 버그 있음. 따라서 함수로 만들어서 저장후 드롭다운리스트를 다시 드려줌.
    $("#custExtrTermNo").kendoExtDropDownList({
            dataSource: {
                transport: {
                    read: {
                        url : "<c:url value='/crm/mcm/marketingCampaign/selectTargExtractList.do'/>"
                        , type: "POST"
                        , dataType: "json"
                    }
                },
                schema: {
                    model: {
                        fields: {
                            custExtrTermNm: { type: "string" },
                            custExtrTermNo: { type: "string" }
                        }
                    }
                }
            }
            , dataTextField:"custExtrTermNm"
            , dataValueField:"custExtrTermNo"
            , open: function(e) {
                var custExtrTermDS = $("#custExtrTermNo").data("kendoExtDropDownList").dataSource;
                custExtrTermDS.read();
            }
            , optionLabel:" "
            , index:0
            , filter:"contains"
            , valuePrimitive: true
        });

    var custExtrTermNoDDL = function(){
/*         $("#custExtrTermNo").kendoExtDropDownList({
            dataSource: {
                transport: {
                    read: {
                        url: "<c:url value='/crm/mcm/marketingCampaign/selectTargExtractList.do'/>",
                    }
                }
            }
            , dataTextField:"custExtrTermNm"
            , dataValueField:"custExtrTermNo"
            , open: function(e) {
                //var custExtrTermDS = $("#custExtrTermNo").data("kendoExtDropDownList").dataSource;
                //custExtrTermDS.read();
            }
            //, optionLabel:" "
            //, filter:"contains"
            //, index:0
        }); */
    };

    //화술방안 조회
    var talkPlanSearchPopupWin;
    $("#btnTalkPlanSearch").click(function(){

        talkPlanSearchPopupWin = dms.window.popup({
           windowId:"talkPlanSearchPopupWin"
           ,width:800
           ,title:"<spring:message code='crm.title.talkPlan.search'/>"   // 화술방안 조회
           ,content:{
               url:"<c:url value='/crm/mcm/marketingCampaign/selectTalkPlanPopup.do'/>"
               , data:{
                   "autoBind":false
                   , "type"  :null
                   ,"callbackFunc":function(data){
                       if (data.length >= 1) {
                           $("#talkPlan").val(data[0].talkPlan);
                       }
                   }
               }
           }
        })
    });

    // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
    $("#mcdGrid").on("dblclick", "tr.k-state-selected", function (e) {
        var gridId = e.delegateTarget.id
          , grid = $("#"+gridId+"").data("kendoExtGrid")
          , selectedItem = grid.dataItem(grid.select())
        ;
        if ( dms.string.isNotEmpty(selectedItem) ){
            // 상세조회 후 팝업오픈
            viewDetail(selectedItem);
            var win = $("#window").data("kendoWindow");
            win.center();
            win.open();
            //$("#tabstrip").data("kendoExtTabStrip").select(0);
        } else {
            // 선택해주세요.
            dms.notification.success("<spring:message code='crm.info.chkSelectItemMsg' />");
            return;
        }
    });



    // 팝업 오픈 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
    function viewDetail(selectedItem, tabIndex){

        $("#dlrTab").show();
        $("#dlrTabDiv").show();

        if (selectedItem != null) {
            var tabStrip = $("#tabstrip").kendoExtTabStrip({animation:false}).data("kendoExtTabStrip");
            tabStrip.select(0);
            var hostCd = selectedItem.hostCd;

            tabStrip.enable(tabStrip.tabGroup.children().eq(0));
            tabStrip.enable(tabStrip.tabGroup.children().eq(1));
            tabStrip.enable(tabStrip.tabGroup.children().eq(2));
            tabStrip.enable(tabStrip.tabGroup.children().eq(3));
            tabStrip.enable(tabStrip.tabGroup.children().eq(4));
            if(selectedItem.makTpCd == "03"){//정비
                tabStrip.enable(tabStrip.tabGroup.children().eq(5));
                tabStrip.enable(tabStrip.tabGroup.children().eq(6));
                tabStrip.enable(tabStrip.tabGroup.children().eq(7));
                tabStrip.enable(tabStrip.tabGroup.children().eq(8));
                tabStrip.enable(tabStrip.tabGroup.children().eq(9));
            }else{
                tabStrip.disable(tabStrip.tabGroup.children().eq(5));
                tabStrip.disable(tabStrip.tabGroup.children().eq(6));
                tabStrip.disable(tabStrip.tabGroup.children().eq(7));
                tabStrip.disable(tabStrip.tabGroup.children().eq(8));
                tabStrip.disable(tabStrip.tabGroup.children().eq(9));
            }
            tabStrip.enable(tabStrip.tabGroup.children().eq(10));
            tabStrip.enable(tabStrip.tabGroup.children().eq(11));
            tabStrip.enable(tabStrip.tabGroup.children().eq(12));

            var kendoTab = $("#tabstrip").data("kendoExtTabStrip").select();
            if(tabIndex){
                kendoTab = $("#tabstrip").data("kendoExtTabStrip").select(tabIndex);
            }
            mode = "U";
            $("#hostCd").data("kendoExtDropDownList").setDataSource(hostList);

            //form field enable start
            $("#btnSaveVehic").data("kendoButton").enable(true);
            $("#makTpCd").data("kendoExtDropDownList").enable(true);
            $("#makSubTpCd").data("kendoExtDropDownList").enable(true);
            $("#makNm").attr("readOnly", false);
            $("#makNm").removeClass("form_readonly");
            $("#startDt").data("kendoExtMaskedDatePicker").enable(true);
            $("#endDt").data("kendoExtMaskedDatePicker").enable(true);
            $("#aapCmpNm").attr("readOnly", false);
            $("#aapCmpNm").removeClass("form_readonly");
            $("#targCustCnt").data("kendoExtNumericTextBox").enable(true);
            $("#makCont").attr("readOnly", false);
            $("#makCont").removeClass("form_readonly");
            $("#creStartDt").data("kendoExtMaskedDatePicker").enable(true);
            $("#creEndDt").data("kendoExtMaskedDatePicker").enable(true);
            $("#saleStartDt").data("kendoExtMaskedDatePicker").enable(true);
            $("#saleEndDt").data("kendoExtMaskedDatePicker").enable(true);
            $("#crEndTp").data("kendoExtDropDownList").enable(true);
            $("#crIsaNm").attr("readOnly", false);
            $("#crIsaNm").removeClass("form_readonly");
            //form field enable end

            $("#makTpCd").data("kendoExtDropDownList").setDataSource(makTpList);

            // hide : 심사중(02) / 활동중(03) / 활동완료(06)
            // show : 계획중(01) / 심사반려(04) / 취소(05)
            if ( selectedItem.statCd != "02" && selectedItem.statCd != "03" && selectedItem.statCd != "06" ) {
                $("#btnSaveVehic").data("kendoButton").enable(true);
                $("#btnCancelVehic").data("kendoButton").enable(true);
                $("#btnActiveSave").data("kendoButton").enable(true);
                $("#fileSelect").show();
                $("#fileDelete").show();
                $("#btnGoalSave").data("kendoButton").enable(true);
                $("#btnGoalAdd").data("kendoButton").enable(true);
                $("#btnGoalDel").data("kendoButton").enable(true);
                $("#btnRcpeExtr").data("kendoButton").enable(true);
                $("#btnTargetSave").data("kendoButton").enable(true);
                $("#btnTargetAdd").data("kendoButton").enable(true);
                $("#btnTargetDelete").data("kendoButton").enable(true);
//                 $("#btnExcelImport").data("kendoButton").enable(true);
                $("#btnBudgetSave").data("kendoButton").enable(true);
                $("#btnBudgetAdd").data("kendoButton").enable(true);
                $("#btnBudgetDel").data("kendoButton").enable(true);

                $("#btnDlrSelect").data("kendoButton").enable(true);
                $("#btnAddR").removeClass("hidden");
                $("#btnDelR").removeClass("hidden");

                if(selectedItem.makTpCd == "03"){//정비
                    $("#btnLbrAdd").data("kendoButton").enable(true);
                    $("#btnWorkAdd").data("kendoButton").enable(true);
                    $("#btnWorkSave").data("kendoButton").enable(true);
                    $("#btnWorkDel").data("kendoButton").enable(true);
                    $("#btnVinNoExcelImport").data("kendoButton").enable(true);
                    $("#btnLtsModelExcelImport").data("kendoButton").enable(true);
                    $("#btnItemsAdd").data("kendoButton").enable(true);
                    $("#btnItemsSave").data("kendoButton").enable(true);
                    $("#btnItemsDel").data("kendoButton").enable(true);
                }else{
                    $("#btnLbrAdd").data("kendoButton").enable(false);
                    $("#btnWorkAdd").data("kendoButton").enable(false);
                    $("#btnWorkSave").data("kendoButton").enable(false);
                    $("#btnWorkDel").data("kendoButton").enable(false);
                    $("#btnVinNoExcelImport").data("kendoButton").enable(false);
                    $("#btnLtsModelExcelImport").data("kendoButton").enable(false);
                    $("#btnItemsAdd").data("kendoButton").enable(false);
                    $("#btnItemsSave").data("kendoButton").enable(false);
                    $("#btnItemsDel").data("kendoButton").enable(false);
                }
            } else {

                $("#btnSaveVehic").data("kendoButton").enable(false);
                $("#btnCancelVehic").data("kendoButton").enable(false);
                $("#btnActiveSave").data("kendoButton").enable(false);
                $("#fileSelect").hide();
                $("#fileDelete").hide();
                $("#btnGoalSave").data("kendoButton").enable(false);
                $("#btnGoalAdd").data("kendoButton").enable(false);
                $("#btnGoalDel").data("kendoButton").enable(false);
                $("#btnRcpeExtr").data("kendoButton").enable(false);
                $("#btnTargetSave").data("kendoButton").enable(false);
                $("#btnTargetAdd").data("kendoButton").enable(false);
                $("#btnTargetDelete").data("kendoButton").enable(false);
//                 $("#btnExcelImport").data("kendoButton").enable(false);
                $("#btnBudgetSave").data("kendoButton").enable(false);
                $("#btnBudgetAdd").data("kendoButton").enable(false);
                $("#btnBudgetDel").data("kendoButton").enable(false);
                $("#btnWorkAdd").data("kendoButton").enable(false);
                $("#btnWorkSave").data("kendoButton").enable(false);
                $("#btnWorkDel").data("kendoButton").enable(false);
                $("#btnVinNoExcelImport").data("kendoButton").enable(false);
                $("#btnLtsModelExcelImport").data("kendoButton").enable(false);
                $("#btnItemsAdd").data("kendoButton").enable(false);
                $("#btnItemsSave").data("kendoButton").enable(false);
                $("#btnItemsDel").data("kendoButton").enable(false);

                $("#btnDlrSelect").data("kendoButton").enable(false);
                $("#btnAddR").addClass("hidden");
                $("#btnDelR").addClass("hidden");

                //form field disable start
                $("#makTpCd").data("kendoExtDropDownList").enable(false);
                $("#makSubTpCd").data("kendoExtDropDownList").enable(false);
                $("#makNm").attr("readOnly", true);
                $("#makNm").addClass("form_readonly");
                $("#startDt").data("kendoExtMaskedDatePicker").enable(false);
                $("#endDt").data("kendoExtMaskedDatePicker").enable(false);
//                 if (hostCd == "01") {
//                     $("#btnSaveVehic").data("kendoButton").enable(false);
//                     $("#endDt").data("kendoExtMaskedDatePicker").enable(false);
//                 }
                $("#aapCmpNm").attr("readOnly", true);
                $("#aapCmpNm").addClass("form_readonly");
                $("#targCustCnt").data("kendoExtNumericTextBox").enable(false);
                $("#makCont").attr("readOnly", true);
                $("#makCont").addClass("form_readonly");
                $("#creStartDt").data("kendoExtMaskedDatePicker").enable(false);
                $("#creEndDt").data("kendoExtMaskedDatePicker").enable(false);
                $("#saleStartDt").data("kendoExtMaskedDatePicker").enable(false);
                $("#saleEndDt").data("kendoExtMaskedDatePicker").enable(false);
                $("#crEndTp").data("kendoExtDropDownList").enable(false);
                $("#crIsaNm").attr("readOnly", true);
                $("#crIsaNm").addClass("form_readonly");

                //form field disable end
            }

            // 상태
            $("#statCd").data("kendoExtDropDownList").value(selectedItem.statCd);
            $("#statCd").data("kendoExtDropDownList").readonly(true);
            $("#statCd").parent().addClass("readonly_area");
            if (kendoTab[0].id == "defaultInfoTab") {
                // 딜러코드
                $("#dlrCd").val(selectedItem.dlrCd);
                // 사업장코드
                $("#pltCd").val(selectedItem.pltCd);
                // 캠페인번호
                $("#makCd").val(selectedItem.makCd);
                // 캠페인명
                $("#makNm").val(selectedItem.makNm);
                // 주최
                $("#hostCd").data("kendoExtDropDownList").value(selectedItem.hostCd);
                //onSelectHostCdSet(selectedItem.hostCd);

                // 주최부문
                // 유형
                $("#makTpCd").data("kendoExtDropDownList").value(selectedItem.makTpCd);
                $("#befMakTpCd").val(selectedItem.makTpCd);
                //$("#makSubTpCd").data("kendoExtDropDownList").enable(true);
                onSelectMakTpCdSet(selectedItem.makTpCd);

                // 서브유형
                $("#makSubTpCd").data("kendoExtDropDownList").value(selectedItem.makSubTpCd);
                // 비고
                $("#makCont").val(selectedItem.makCont);
                // 시작일
                //$("#startDt").val(kendo.toString(kendo.parseDate(selectedItem.startDt), "<dms:configValue code='dateFormat' />"));
                //var startDt = selectedItem.startDt == null || selectedItem.startDt == "" ? "":selectedItem.startDt.substring(0,4) + "-" + selectedItem.startDt.substring(4,6) + "-" + selectedItem.startDt.substring(6,8);
                $("#startDt").data("kendoExtMaskedDatePicker").value(selectedItem.startDt);
                // 종료일
                //$("#endDt").val(kendo.toString(kendo.parseDate(selectedItem.endDt), "<dms:configValue code='dateFormat' />"));
                //var endDt = selectedItem.endDt == null || selectedItem.endDt == "" ? "":selectedItem.endDt.substring(0,4) + "-" + selectedItem.endDt.substring(4,6) + "-" + selectedItem.endDt.substring(6,8);
                $("#endDt").data("kendoExtMaskedDatePicker").value(selectedItem.endDt);
                // 기간
                $("#prid").val(selectedItem.prid);
                // 장소명
                $("#placeNm").val(selectedItem.placeNm);
                // 대상자 자동추출 여부
//                $("#rcpeAutoYn").data("kendoExtDropDownList").value(selectedItem.rcpeAutoYn);
                $("#rcpeAutoYn").val(selectedItem.rcpeAutoYn);
                // 대행업체명
                $("#aapCmpNm").val(selectedItem.aapCmpNm);
                // 예산
                $("#budgetAmt").data("kendoExtNumericTextBox").value(selectedItem.budgetAmt);

                // 목표인수
                $("#targCustCnt").data("kendoExtNumericTextBox").value(selectedItem.targCustCnt);
                // 진도율
//                $("#pgssRate").val(selectedItem.pgssRate);
                // 등록일
                $("#regDt").val(selectedItem.regDt);
                // 수정일
                $("#updtDt").val(selectedItem.updtDt);
                // 등록자
                $("#regUsrId").val(selectedItem.regUsrId);

                // 캠페인번호(정비용)
                $("#crNo").val(selectedItem.makCd);
                // 생산시작일자(정비용)
                $("#creStartDt").data("kendoExtMaskedDatePicker").value(selectedItem.creStartDt);
                // 생산종료일자(정비용)
                $("#creEndDt").data("kendoExtMaskedDatePicker").value(selectedItem.creEndDt);
                // 판매시작일자(정비용)
                $("#saleStartDt").data("kendoExtMaskedDatePicker").value(selectedItem.saleStartDt);
                // 판매종료일자(정비용)
                $("#saleEndDt").data("kendoExtMaskedDatePicker").value(selectedItem.saleEndDt);
                // 종료여부(정비용)
                $("#crEndTp").data("kendoExtDropDownList").value(selectedItem.crEndTp);

                // 딜러 > 정비 인경우 시행처 삭제
                if ( selectedItem.hostCd === "01" ) {
                    $("#crIsaNmTxt").removeClass("hidden");
                    $("#crIsaNm").removeClass("hidden");
                } else if ( selectedItem.hostCd === "02"){
                    $("#crIsaNmTxt").addClass("hidden");
                    $("#crIsaNm").addClass("hidden");
                };

                // 캠페인리콜시행처명(정비용)
                $("#crIsaNm").val(selectedItem.crIsaNm);
                // 승상용구분코드(정비용)
                $("#pcDstinCd").val(selectedItem.pcDstinCd);

                // 캠페인명 포커스
                $("#makNm").focus();

            } else if (kendoTab[0].id == "planTab"){
                // 딜러코드(HIDDEN)
                $("#hDlrCd").val(selectedItem.dlrCd);
                // 딜러코드
                $("#dlrCd").val(selectedItem.dlrCd);
                // 사업장코드(HIDDEN)
                $("#hPltCd").val(selectedItem.pltCd);
                // 사업장코드
                $("#pltCd").val(selectedItem.pltCd);
                // 캠페인코드(HIDDEN)
                $("#hMakCd").val(selectedItem.makCd);
                // 캠페인번호(정비용)
                $("#crNo").val(selectedItem.makCd);
                // 캠페인코드
                $("#makCd").val(selectedItem.makCd);
                // 캠페인명
                $("#activeNm").val(selectedItem.makNm);
                // 개요설명
                $("#activeCont").val(selectedItem.makCont);
                //화술방안
                $("#talkPlan").val(selectedItem.talkPlan);
                //파일키
                $("#activeFileDocNo").val(selectedItem.activeFileDocNo);
                //파일 그리드 조회
                $("#fileGrid").data("kendoExtGrid").dataSource.read();

                // 활동명칭 포커스
                $("#activeNm").focus();

            } else if (kendoTab[0].id == "goalTab") {

                // 딜러코드
                $("#dlrCd").val(selectedItem.dlrCd);
                // 사업장코드
                $("#pltCd").val(selectedItem.pltCd);
                // 캠페인번호(정비용)
                $("#crNo").val(selectedItem.makCd);
                // 캠페인번호
                $("#makCd").val(selectedItem.makCd);

                // 목표 그리드 조회
                var grid = $("#goalGrid").data("kendoExtGrid");
                grid.dataSource.page(1);

            } else if (kendoTab[0].id == "targetTab") {

                // 딜러코드
                $("#dlrCd").val(selectedItem.dlrCd);
                $("#tDlrCd").val(selectedItem.dlrCd);
                // 사업장코드
                $("#pltCd").val(selectedItem.pltCd);
                // 캠페인번호(정비용)
                $("#crNo").val(selectedItem.makCd);
                // 캠페인번호
                $("#makCd").val(selectedItem.makCd);
                $("#tMakCd").val(selectedItem.makCd);

                $("#extrDgreCnt").val("");
                $("#realTargetCnt").val("");

                //고객추출조건(입력부).   targExtractList
                custExtrTermNoDDL();

                if($("#custExtrAutoYn").data("kendoExtDropDownList").value() == "Y"){
                    cycleCheckDisFalse();
                }else{
                    cycleCheckDisTrue();
                }

                // 대상자 그리드 조회
                var grid = $("#targetGrid").data("kendoExtGrid");
                grid.dataSource.page(1);

            } else if (kendoTab[0].id == "budgetTab") {

                // 딜러코드
                $("#dlrCd").val(selectedItem.dlrCd);
                // 사업장코드
                $("#pltCd").val(selectedItem.pltCd);
                // 캠페인번호(정비용)
                $("#crNo").val(selectedItem.makCd);
                // 캠페인번호
                $("#makCd").val(selectedItem.makCd);

                // 예산 그리드 조회
                var grid = $("#budgetGrid").data("kendoExtGrid");
                grid.dataSource.page(1);

            } else if (kendoTab[0].id == "progressTab") {

                // 딜러코드
                $("#dlrCd").val(selectedItem.dlrCd);
                // 사업장코드
                $("#pltCd").val(selectedItem.pltCd);
                // 캠페인번호(정비용)
                $("#crNo").val(selectedItem.makCd);
                // 캠페인번호
                $("#makCd").val(selectedItem.makCd);
                // 결재문서번호
                $("#apprDocNo").val(selectedItem.apprDocNo);
                // 결재양식ID
                $("#signDocId").val(selectedItem.signDocId);

                // 활동심사 그리드 조회
                var grid = $("#signLineGrid").data("kendoExtGrid");

                if( $("#apprDocNo").val() != null && $("#apprDocNo").val() != "" ) {
                    grid.dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectSignLineExs.do' />";
                }else{
                    grid.dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectDocLineExs.do' />";
                }

                grid.dataSource.page(1);

                $("#signCont").val("");

            } else if (kendoTab[0].id == "resultTab") {

                // 딜러코드
                $("#dlrCd").val(selectedItem.dlrCd);
                // 사업장코드
                $("#pltCd").val(selectedItem.pltCd);
                // 캠페인번호(정비용)
                $("#crNo").val(selectedItem.makCd);
                // 캠페인번호
                $("#makCd").val(selectedItem.makCd);


                // 결과-목표 그리드 조회
                var gridGoal = $("#resultGoalGrid").data("kendoExtGrid");
                gridGoal.dataSource.page(1);

                // 결과-직원설문 그리드 조회
    //            var gridPerson = $("#resultPersonGrid").data("kendoExtGrid");
    //            gridPerson.dataSource.page(1);

                // 결과-업체평가 그리드 조회
//                 var gridCorp = $("#resultCorpGrid").data("kendoExtGrid");
//                 gridCorp.dataSource.page(1);

                // 결과-담당자 의견 조회
                $.ajax({
                    url:"<c:url value='/crm/mcm/campaignResult/selectPrsnContByKey.do' />"
                    ,data:JSON.stringify({"sDlrCd":selectedItem.dlrCd, "sMakCd":selectedItem.makCd})
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {
    //                    dms.notification.error(jqXHR.responseJSON.errors);
                        $("#prsnOpnCont").val("");
                        $("#docId").val("");
                        $("#fileResultGrid").data("kendoExtGrid").dataSource.data([]);  // 첨부파일
                    }
                    ,success:function(jqXHR, textStatus) {
                        console.log(jqXHR);
                        $("#prsnOpnCont").val(jqXHR.prsnOpnCont);
                        $("#docId").val(jqXHR.docId);
                        if (dms.string.isNotEmpty(jqXHR.docId)) {
                            $("#fileResultGrid").data("kendoExtGrid").dataSource.page(1);
                        };
                    }
                });

            } else if (kendoTab[0].id == "bhmcLbrTab") { //제조사 공임

                // 딜러코드
                $("#dlrCd").val(selectedItem.dlrCd);
                // 사업장코드
                $("#pltCd").val(selectedItem.pltCd);
                // 캠페인번호(정비용)
                $("#crNo").val(selectedItem.makCd);
                // 캠페인번호
                $("#makCd").val(selectedItem.makCd);

                // 유형
                $("#makTpCd").data("kendoExtDropDownList").value(selectedItem.makTpCd);
                $("#befMakTpCd").val(selectedItem.makTpCd);
                //$("#makSubTpCd").data("kendoExtDropDownList").enable(true);
                onSelectMakTpCdSet(selectedItem.makTpCd);

                // 서브유형
                $("#makSubTpCd").data("kendoExtDropDownList").value(selectedItem.makSubTpCd);

                // 작업정보(정비용) 그리드 조회
               // var grid = $("#workGrid").data("kendoExtGrid");
                var grid = $("#bhmcLbrGrid").data("kendoExtGrid");
                grid.dataSource.page(1);

            } else if (kendoTab[0].id == "bhmcItemTab") { //bhmcItemTab 제조사 부품

                // 딜러코드
                $("#dlrCd").val(selectedItem.dlrCd);
                // 사업장코드
                $("#pltCd").val(selectedItem.pltCd);
                // 캠페인번호(정비용)
                $("#crNo").val(selectedItem.makCd);
                // 캠페인번호
                $("#makCd").val(selectedItem.makCd);

                // 유형
                $("#makTpCd").data("kendoExtDropDownList").value(selectedItem.makTpCd);
                $("#befMakTpCd").val(selectedItem.makTpCd);
                //$("#makSubTpCd").data("kendoExtDropDownList").enable(true);
                onSelectMakTpCdSet(selectedItem.makTpCd);

                // 서브유형
                $("#makSubTpCd").data("kendoExtDropDownList").value(selectedItem.makSubTpCd);

                // 부품정보(정비용) 그리드 조회
                var grid = $("#bhmcItemGrid").data("kendoExtGrid");

                //onSelectLbrCdSet(selectedItem.dlrCd, selectedItem.makCd);

                grid.dataSource.page(1);

            } else if (kendoTab[0].id == "dlrLbrTab") { // dlrLbrTab 딜러 공임

                // 딜러코드
                $("#dlrCd").val(selectedItem.dlrCd);
                // 사업장코드
                $("#pltCd").val(selectedItem.pltCd);
                // 캠페인번호(정비용)
                $("#crNo").val(selectedItem.makCd);
                // 캠페인번호
                $("#makCd").val(selectedItem.makCd);

                $("#hostCd").data("kendoExtDropDownList").value(selectedItem.hostCd);
                // 유형
                $("#makTpCd").data("kendoExtDropDownList").value(selectedItem.makTpCd);
                $("#befMakTpCd").val(selectedItem.makTpCd);
                //$("#makSubTpCd").data("kendoExtDropDownList").enable(true);
                onSelectMakTpCdSet(selectedItem.makTpCd);

                // 서브유형
                $("#makSubTpCd").data("kendoExtDropDownList").value(selectedItem.makSubTpCd);

                // 공임정보(정비용) 그리드 조회
                var grid = $("#dlrLbrGrid").data("kendoExtGrid");
                grid.dataSource.page(1);

            } else if (kendoTab[0].id == "dlrItemTab") { //dlrItemTab 딜러 부품

                // 딜러코드
                $("#dlrCd").val(selectedItem.dlrCd);
                // 사업장코드
                $("#pltCd").val(selectedItem.pltCd);
                // 캠페인번호(정비용)
                $("#crNo").val(selectedItem.makCd);
                // 캠페인번호
                $("#makCd").val(selectedItem.makCd);

                // 유형
                $("#makTpCd").data("kendoExtDropDownList").value(selectedItem.makTpCd);
                $("#befMakTpCd").val(selectedItem.makTpCd);
                //$("#makSubTpCd").data("kendoExtDropDownList").enable(true);
                onSelectMakTpCdSet(selectedItem.makTpCd);

                // 서브유형
                $("#makSubTpCd").data("kendoExtDropDownList").value(selectedItem.makSubTpCd);

                // 부품정보(정비용) 그리드 조회
                var grid = $("#dlrItemGrid").data("kendoExtGrid");

                onSelectLbrCdSet(selectedItem.dlrCd, selectedItem.makCd);

                grid.dataSource.page(1);

            } else if (kendoTab[0].id == "vinTab") { // 빈정보

                // 딜러코드
                $("#dlrCd").val(selectedItem.dlrCd);
                // 사업장코드
                $("#pltCd").val(selectedItem.pltCd);
                // 캠페인번호(정비용)
                $("#crNo").val(selectedItem.makCd);
                // 캠페인번호
                $("#makCd").val(selectedItem.makCd);

                // 유형
                $("#makTpCd").data("kendoExtDropDownList").value(selectedItem.makTpCd);
                $("#befMakTpCd").val(selectedItem.makTpCd);
                //$("#makSubTpCd").data("kendoExtDropDownList").enable(true);
                onSelectMakTpCdSet(selectedItem.makTpCd);

                // 서브유형
                $("#makSubTpCd").data("kendoExtDropDownList").value(selectedItem.makSubTpCd);

                //VIN정보(정비용) 그리드 조회
                var grid = $("#vinGrid").data("kendoExtGrid");
                grid.dataSource.page(1);

            } else if (kendoTab[0].id == "dlrTab") {

                // 딜러코드
                $("#dlrCd").val(selectedItem.dlrCd);
                // 사업장코드
                $("#pltCd").val(selectedItem.pltCd);
                // 캠페인번호(정비용)
                $("#crNo").val(selectedItem.makCd);
                // 캠페인번호
                $("#makCd").val(selectedItem.makCd);

                // 대상 딜러 그리드 조회
                $("#dlrGrid").data("kendoExtGrid").dataSource.page(1);
                $("#targDlrGrid").data("kendoExtGrid").dataSource.page(1);

            }

          // 제조사 , 딜러에 따라 탭 hide or show
            // 제조사 (공인,교환부품), 딜러(정비항목,부품수령)
            if ( selectedItem.hostCd === "01" ) {   // 제조사
                $("#bhmcLbrTab").show();
                $("#bhmcItemTab").show();
                $("#bhmcLbrTabDiv").show();
                $("#bhmcItemTabDiv").show();
                $("#dlrLbrTab").hide();
                $("#dlrItemTab").hide();
                $("#dlrLbrTabDiv").hide();
                $("#dlrItemTabDiv").hide();

                if ( selectedItem.makTpCd === "03" ) { // 정비
                    $("#vinTab").show();
                    $("#vinTabDiv").show();
                } else {
                    $("#bhmcLbrTab").hide();
                    $("#bhmcItemTab").hide();
                    $("#bhmcLbrTabDiv").hide();
                    $("#bhmcItemTabDiv").hide();
                    $("#vinTab").hide();
                    $("#vinTabDiv").hide();
                };

            } else if ( selectedItem.hostCd === "02"){   // 딜러

                $("#bhmcLbrTab").hide();
                $("#bhmcItemTab").hide();
                $("#bhmcLbrTabDiv").hide();
                $("#bhmcItemTabDiv").hide();

                if ( selectedItem.makTpCd === "03" ) { // 정비
                    $("#dlrLbrTab").show();
                    $("#dlrItemTab").show();
                    $("#vinTab").show();
                    $("#dlrLbrTabDiv").show();
                    $("#dlrItemTabDiv").show();
                    $("#vinTabDiv").show();
                } else {
                    $("#dlrLbrTab").hide();
                    $("#dlrItemTab").hide();
                    $("#vinTab").hide();
                    $("#dlrLbrTabDiv").hide();
                    $("#dlrItemTabDiv").hide();
                    $("#vinTabDiv").hide();
                };

            };

        } else {

            var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
            tabStrip.disable(tabStrip.tabGroup.children().eq(1));
            tabStrip.disable(tabStrip.tabGroup.children().eq(2));
            tabStrip.disable(tabStrip.tabGroup.children().eq(3));
            tabStrip.disable(tabStrip.tabGroup.children().eq(4));
            tabStrip.disable(tabStrip.tabGroup.children().eq(5));
            tabStrip.disable(tabStrip.tabGroup.children().eq(6));
            tabStrip.disable(tabStrip.tabGroup.children().eq(7));
            tabStrip.disable(tabStrip.tabGroup.children().eq(8));
            tabStrip.disable(tabStrip.tabGroup.children().eq(9));
            tabStrip.disable(tabStrip.tabGroup.children().eq(10));
            tabStrip.disable(tabStrip.tabGroup.children().eq(11));


            mode = "N";
        }
    }

    // 문자열 byte 체크
    var txtLimit = function(obj, limitByte) {

        var currLen = 0;
        var size = 0;
        var charCode, chr = null;
        for( var i = 0 ; i < obj.value.length ; i++ ) {

            chr = obj.value.charAt(i);
            charCode = chr.charCodeAt(0);

            if (charCode <= 0x00007F) size += 1; else
            if (charCode <= 0x0007FF) size += 2; else
            if (charCode <= 0x00FFFF) size += 3;
            else size += 4;

            //console.log("charCode:",charCode+" | size:",size)
            if(size > limitByte ){

                var rtnVal = "";

                for( var j = 0 ; j < currLen ; j++ ) {
                    rtnVal += obj.value.charAt(j);
                }

                obj.value = rtnVal;
                // 텍스트를 {?} byte 초과하여 작성할 수 없습니다.
                dms.notification.warning("<spring:message code='crm.info.byteLimitInfo' arguments='"+limitByte+"' />");
                return false;

            };

            currLen++;
        };
    };

    /* ###################################################### 추출주기설정 2/5 script 추가 시작  */

    var custExtrCycleDt = [];
    // 달력 박스 표시
    function isInArray(date, dates) {
        for(var idx = 0, length = dates.length; idx < length; idx++) {
            var d = dates[idx];
            if (date.getFullYear() == d.getFullYear() &&
                date.getMonth() == d.getMonth() &&
                date.getDate() == d.getDate()) {
                return true;
            }
        }
        return false;
    };

    // 추출주기 화면 초기화 - 화면만 초기화 하고 체크박스, 날짜 선택 값은 초기화 하지 않는다.
    function cycleFormInit() {

        // 요일 선택 체크박스 영역 초기화
        $("#weekSelect").hide();

        // 날짜 선택 텍스트 박스
        $("#cycleDtTxtArea").hide();

        // 버튼 값 초기화
        $("#custExtrCycleTp").val("");

        // 버튼 활성화 클래스 초기화
        $("#btnCycleDay").removeClass("btn_active");
        $("#btnCycleWeek").removeClass("btn_active");
        $("#btnCycleSelect").removeClass("btn_active");

    };

    function dtToString(custExtrCycleDt){

        var custExtrCycleDt = custExtrCycleDt;
        var firstChk = false;
        var cycleDtTxt = "";

        $("#cycleDt").val("");

        $.each(custExtrCycleDt, function(index, obj) {
            if(firstChk){
                cycleDtTxt += ", ";
            }
            cycleDtTxt += kendo.toString(obj,"<dms:configValue code='dateFormat' />");
            firstChk = true;
        });
         $("#cycleDt").val(cycleDtTxt);

    };

    // 추가 시, targDlrGrid에  데이터가 존재 유무 체크.
    function isTargetModelGrid(dlrCd){
        var flag = false;
        var targDlrGrid = $('#targDlrGrid').data('kendoExtGrid');
        var rows = targDlrGrid.tbody.find("tr");

        rows.each(function(index, row){
            var data = targDlrGrid.dataItem(row);

            if(dlrCd == data.targDlrCd){
                flag = true;
            }
        });
        return flag;
    };


    $(document).ready(function() {

        //레이어 팝업
        $("#openButton").click(function(){
            var win = $("#window").data("kendoWindow");
            win.center();
            win.open();
//             $("#tabstrip").data("kendoExtTabStrip").select(0);
        });
        $("#window").kendoWindow({
            animation:false
            ,draggable:true
            ,modal:false
            ,resizable:false
            ,visible:false
            ,title:"<spring:message code='crm.title.campaignInfo' />"
            ,width:"950px"
            ,height:"500px"
        }).data("kendoWindow");

        // 매일
        $("#btnCycleDay").kendoButton({
            click:function(e){

                //추출주기 화면 초기화
                cycleFormInit();
                $("#btnCycleDay").addClass("btn_active");
                $("#custExtrCycleTp").val("D");

            }
        });
        // 매주
        $("#btnCycleWeek").kendoButton({
            click:function(e){

                //추출주기 화면 초기화
                cycleFormInit();
                $("#btnCycleWeek").addClass("btn_active");
                $("#custExtrCycleTp").val("W");
                $("#weekSelect").show();

            }
        });
        // 선택
        $("#btnCycleSelect").kendoButton({
            click:function(e){

                //추출주기 화면 초기화
                cycleFormInit();
                $("#btnCycleSelect").addClass("btn_active");
                $("#custExtrCycleTp").val("S");
                $("#cycleDtTxtArea").show();

                var cycleDatepicker = $("#cycleDatepicker").data("kendoDatePicker");
                cycleDatepicker.open();

            }
        });

        var cycleDatepicker = $("#cycleDatepicker").kendoDatePicker({
            animation:false,
            dates:custExtrCycleDt,
            month:{
                content:'# if (isInArray(data.date, data.dates)) { #' +
                             '<em class="calendarBg">#= data.value #</em>' +
                         '# } else { #' +
                             '#= data.value #' +
                         '# } # '
            },
            open:function (e) {

                //추출주기 화면 초기화 (  $("#btnCycleSelect").click() 이벤트 주면 무한루프돔 )
                cycleFormInit();
                $("#btnCycleSelect").addClass("btn_active");
                $("#custExtrCycleTp").val("S");
                $("#cycleDtTxtArea").show();

                if ( custExtrCycleDt.length > 0 ) {

                    //$("table tbody .k-state-selected").removeClass("k-state-selected k-state-focused");
                    //$("table tbody .k-state-focused").removeClass("k-state-selected k-state-focused");

                    var cycleDatepicker = $("#cycleDatepicker").data("kendoDatePicker");
                    cycleDatepicker.setOptions({
                        dates:custExtrCycleDt
                        ,month:{
                            content:'# if (isInArray(data.date, data.dates)) { #' +
                                         '<em name="calendarBg" class="calendarBg">#= data.value #</em>' +
                                     '# } else { #' +
                                         '#= data.value #' +
                                     '# } # '
                        }
                    });

                    // 기존에 선택된 날짜 포커싱되는거 삭제
                    $("table tr .k-state-selected").removeClass("k-state-selected k-state-focused");

                };

            }
        }).getKendoDatePicker();

        cycleDatepicker.dateView.options.change = function(e){

            // 선택한 셀 표시
            this._cell.addClass("calendarChek");

            var selectDate = this.value();
            var insertDt = false;

            $.each(custExtrCycleDt, function(index, obj) {
                // 선택된 날짜와 데이터소스와 비교해서 동일한 날짜가 있으면 지워준다.
                if ( kendo.toString(selectDate,"<dms:configValue code='dateFormat' />") === kendo.toString(obj,"<dms:configValue code='dateFormat' />") ){
                    insertDt = true;
                    custExtrCycleDt.splice(index,1);
                }

            });

            // 선택된 날짜 List에 추가
            if(!insertDt){
                custExtrCycleDt.push(selectDate);
            }else{
                // 클릭시 전체 영역 표시되는 빨간 박스 삭제
                this._cell.removeClass("calendarChek k-state-selected k-state-focused");
                // 데이터소스에서 추가된 클래스가 삭제가 안되서 <div class="calSelected"></div>14 영역을 날리고 날짜를 다시 쓴다
                var cellTxt = this._cell.children().text();
                this._cell.children().html("");
                this._cell.children().html(cellTxt);
            }

            // 최종 선택된 날짜를 텍스트 박스에 뿌려준다.
            dtToString(custExtrCycleDt);

        };

/* ###################################################### 추출주기설정 2/5 script 추가 종료 */


/*************************************************************
드랍다운 리스트 셋팅
*************************************************************/

    //달력목록
    var calendarList = [{"calendarId":"", "calendarNm":""}];
    <c:forEach var="obj" items="${calendarList}">
    calendarList.push({"calendarId":"${obj.calendarId}", "calendarNm":"${obj.calendarNm}"});
    </c:forEach>

    //캘린더
    $("#calendarId").kendoExtDropDownList({
        dataTextField:"calendarNm"
        ,dataValueField:"calendarId"
        ,dataSource:calendarList
        ,optionLabel:""
        ,index:0
    });

    // 시작일
    $("#sStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 종료일
    $("#sEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 시작일(입력부)
    $("#startDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        , change:function(e){
            f_betweenDate(e.sender._oldText, $("#endDt").val());
        }
    });

    // 종료일(입력부)
    $("#endDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        , change:function(e){
            f_betweenDate($("#startDt").val(), e.sender._oldText);
        }
    });

    // 생산시작일자-정비용(입력부)
    $("#creStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 생산종료일자-정비용(입력부)
    $("#creEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 판매시작일자-정비용(입력부)
    $("#saleStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 판매종료일자-정비용(입력부)
    $("#saleEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 주최.   hostList
    $("#sHostCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:hostList
    });

    // 유형.   makTpList
    $("#sMakTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
//        , optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
        , dataSource:makTpList
        , select:onSelectMakTpCdSearch
    });

    // 유형상세.   makSubTpList
    $("#sMakSubTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "  // 선택
    });

    $("#sMakSubTpCd").data("kendoExtDropDownList").enable(false);

 // 상태.   statList
    $("#sStatCd").kendoExtDropDownList({
        dataSource:dms.data.cmmCdFilter(statList)
        ,dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , index:1
    });

    // 주최(입력부).   hostList
    $("#hostCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:hostList
//         , open: function(e) {
//             $("#hostCd").data("kendoExtDropDownList").setDataSource(dms.data.cmmCdFilter(hostList));
//         }
//         , close: function(e) {
//             $("#hostCd").data("kendoExtDropDownList").setDataSource(hostList);
//         }
        ,enable:false
    });

    // 유형(입력부).   makTpList
    $("#makTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
//        , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:makTpDenySerList
        , select:onSelectMakTpCd
        , open: function(e) {
            $("#makTpCd").data("kendoExtDropDownList").setDataSource(makTpDenySerList);
        }
    });

    // 유형상세(입력부).   makSubTpList
    $("#makSubTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "  // 선택
    });

    $("#makSubTpCd").data("kendoExtDropDownList").enable(false);
/*
    // 대상자 자동추출여부(입력부).
    $("#rcpeAutoYn").kendoExtDropDownList({
        dataSource:['Y','N']
        ,autoBind:false
        ,index:0
    });
*/
    // 상태(입력부).   statList
    $("#statCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
//        , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:statList
    });

    $("#statCd").data("kendoExtDropDownList").value("01");
    $("#statCd").data("kendoExtDropDownList").readonly(true);
    $("#statCd").parent().addClass("readonly_area");

    // 예산
    $("#budgetAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 목표인수
    $("#targCustCnt").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 종료여부-정비용(입력부).
    $("#crEndTp").kendoExtDropDownList({
        dataSource:['Y','N']
        ,autoBind:false
        ,index:0
    });

    // 고객추출자동여부(입력부).
    $("#custExtrAutoYn").kendoExtDropDownList({
        dataSource:['Y','N']
        //,autoBind:false
        , optionLabel:" "
        , index:0
        , change:function(e){
            var dataItem = this.dataItem(e.item);
            if(dataItem == "Y"){
                custExtrAutoYn(dataItem);
                cycleCheckDisFalse();
                $("#dupYn").data("kendoExtDropDownList").value(" ");
                $("#dupYn").data("kendoExtDropDownList").enable(true);
            }else{
                custExtrAutoYn(dataItem);
                cycleCheckDisTrue();
                $("#dupYn").data("kendoExtDropDownList").value("Y");
                $("#dupYn").data("kendoExtDropDownList").enable(false);
            }
        }
    });

    //고객추출조건(입력부).   targExtractList
    custExtrTermNoDDL();

    // 중복여부(입력부).
    $("#dupYn").kendoExtDropDownList({
        dataTextField: "text"
        ,dataValueField: "value"
        ,dataSource:[{value:'Y', text:'否'},{value:'N',text:'是'}]
        ,autoBind:false
        ,index:0
    });

    // 탭 선택시 이벤트
    $("#tabstrip").kendoExtTabStrip({
        animation:false
        , select:function(e) {
            var selectTabId = e.item.id;
            var grid = $('#mcdGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());

            if(selectedItem != null){

                mode = "U";

                // hide : 심사중(02) / 활동중(03) / 활동완료(06)
                // show : 계획중(01) / 심사반려(04) / 취소(05)
                if ( selectedItem.statCd != "02" && selectedItem.statCd != "03" && selectedItem.statCd != "06" ) {
                    $("#btnSaveVehic").data("kendoButton").enable(true);
                    $("#btnCancelVehic").data("kendoButton").enable(true);
                    $("#btnActiveSave").data("kendoButton").enable(true);
                    $("#fileSelect").show;
                    $("#fileDelete").show;
                    $("#btnGoalSave").data("kendoButton").enable(true);
                    $("#btnGoalAdd").data("kendoButton").enable(true);
                    $("#btnGoalDel").data("kendoButton").enable(true);
                    $("#btnRcpeExtr").data("kendoButton").enable(true);
                    $("#btnTargetSave").data("kendoButton").enable(true);
                    $("#btnTargetAdd").data("kendoButton").enable(true);
                    $("#btnTargetDelete").data("kendoButton").enable(true);
//                     $("#btnExcelImport").data("kendoButton").enable(true);
                    $("#btnBudgetSave").data("kendoButton").enable(true);
                    $("#btnBudgetAdd").data("kendoButton").enable(true);
                    $("#btnBudgetDel").data("kendoButton").enable(true);

                    if(selectedItem.makTpCd == "03"){
                        $("#btnWorkAdd").data("kendoButton").enable(true);
                        $("#btnWorkSave").data("kendoButton").enable(true);
                        $("#btnWorkDel").data("kendoButton").enable(true);
                        $("#btnVinNoExcelImport").data("kendoButton").enable(true);
                        $("#btnLtsModelExcelImport").data("kendoButton").enable(true);
                        $("#btnItemsAdd").data("kendoButton").enable(true);
                        $("#btnItemsSave").data("kendoButton").enable(true);
                        $("#btnItemsDel").data("kendoButton").enable(true);
                    }else{
                        $("#btnWorkAdd").data("kendoButton").enable(false);
                        $("#btnWorkSave").data("kendoButton").enable(false);
                        $("#btnWorkDel").data("kendoButton").enable(false);
                        $("#btnVinNoExcelImport").data("kendoButton").enable(false);
                        $("#btnLtsModelExcelImport").data("kendoButton").enable(false);
                        $("#btnItemsAdd").data("kendoButton").enable(false);
                        $("#btnItemsSave").data("kendoButton").enable(false);
                        $("#btnItemsDel").data("kendoButton").enable(false);
                    }
                } else {
                    $("#btnSaveVehic").data("kendoButton").enable(false);
                    $("#btnCancelVehic").data("kendoButton").enable(false);
                    $("#btnActiveSave").data("kendoButton").enable(false);
                    $("#fileSelect").hide();
                    $("#fileDelete").hide();
                    $("#btnGoalSave").data("kendoButton").enable(false);
                    $("#btnGoalAdd").data("kendoButton").enable(false);
                    $("#btnGoalDel").data("kendoButton").enable(false);
                    $("#btnRcpeExtr").data("kendoButton").enable(false);
                    $("#btnTargetSave").data("kendoButton").enable(false);
                    $("#btnTargetAdd").data("kendoButton").enable(false);
                    $("#btnTargetDelete").data("kendoButton").enable(false);
//                     $("#btnExcelImport").data("kendoButton").enable(false);
                    $("#btnBudgetSave").data("kendoButton").enable(false);
                    $("#btnBudgetAdd").data("kendoButton").enable(false);
                    $("#btnBudgetDel").data("kendoButton").enable(false);
                    $("#btnLbrAdd").data("kendoButton").enable(false);
                    $("#btnWorkAdd").data("kendoButton").enable(false);
                    $("#btnWorkSave").data("kendoButton").enable(false);
                    $("#btnWorkDel").data("kendoButton").enable(false);
                    $("#btnVinNoExcelImport").data("kendoButton").enable(false);
                    $("#btnLtsModelExcelImport").data("kendoButton").enable(false);
                    $("#btnItemsAdd").data("kendoButton").enable(false);
                    $("#btnItemsSave").data("kendoButton").enable(false);
                    $("#btnItemsDel").data("kendoButton").enable(false);
//                     if (selectedItem.hostCd == "01") {
//                         $("#btnSaveVehic").data("kendoButton").enable(false);
//                         $("#endDt").data("kendoExtMaskedDatePicker").enable(false);
//                     }
                }

                // 상태
                $("#statCd").data("kendoExtDropDownList").value(selectedItem.statCd);
                $("#statCd").data("kendoExtDropDownList").readonly(true);
                $("#statCd").parent().addClass("readonly_area");

                if (selectTabId == "defaultInfoTab") {

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);
                    // 캠페인명
                    $("#makNm").val(selectedItem.makNm);
                    // 주최
                    $("#hostCd").data("kendoExtDropDownList").value(selectedItem.hostCd);

                    // 유형
                    $("#makTpCd").data("kendoExtDropDownList").value(selectedItem.makTpCd);
                    $("#befMakTpCd").val(selectedItem.makTpCd);
                    //$("#makSubTpCd").data("kendoExtDropDownList").enable(true);
                    onSelectMakTpCdSet(selectedItem.makTpCd);

                    // 서브유형
                    $("#makSubTpCd").data("kendoExtDropDownList").value(selectedItem.makSubTpCd);
                    // 비고
                    $("#makCont").val(selectedItem.makCont);
                    // 시작일
                    $("#startDt").data("kendoExtMaskedDatePicker").value(selectedItem.startDt);
                    // 종료일
                    $("#endDt").data("kendoExtMaskedDatePicker").value(selectedItem.endDt);
                    // 기간
                    $("#prid").val(selectedItem.prid);
                    // 장소명
                    $("#placeNm").val(selectedItem.placeNm);
                    // 대상자 자동추출 여부
//                    $("#rcpeAutoYn").data("kendoExtDropDownList").value(selectedItem.rcpeAutoYn);
                    $("#rcpeAutoYn").val(selectedItem.rcpeAutoYn);
                    // 대행업체명
                    $("#aapCmpNm").val(selectedItem.aapCmpNm);
                    // 예산
                    $("#budgetAmt").data("kendoExtNumericTextBox").value(selectedItem.budgetAmt);

                    // 목표인수
                    $("#targCustCnt").data("kendoExtNumericTextBox").value(selectedItem.targCustCnt);
                    // 진도율
//                    $("#pgssRate").val(selectedItem.pgssRate);
                    // 등록일
                    $("#regDt").val(selectedItem.regDt);
                    // 수정일
                    $("#updtDt").val(selectedItem.updtDt);
                    // 등록자
                    $("#regUsrId").val(selectedItem.regUsrId);

                    // 캠페인번호(정비용)
                    $("#crNo").val(selectedItem.makCd);
                    // 생산시작일자(정비용)
                    $("#creStartDt").data("kendoExtMaskedDatePicker").value(selectedItem.creStartDt);
                    // 생산종료일자(정비용)
                    $("#creEndDt").data("kendoExtMaskedDatePicker").value(selectedItem.creEndDt);
                    // 판매시작일자(정비용)
                    $("#saleStartDt").data("kendoExtMaskedDatePicker").value(selectedItem.saleStartDt);
                    // 판매종료일자(정비용)
                    $("#saleEndDt").data("kendoExtMaskedDatePicker").value(selectedItem.saleEndDt);
                    // 종료여부(정비용)
                    $("#crEndTp").data("kendoExtDropDownList").value(selectedItem.crEndTp);
                    // 캠페인리콜시행처명(정비용)
                    $("#crIsaNm").val(selectedItem.crIsaNm);
                    // 승상용구분코드(정비용)
                    $("#pcDstinCd").val(selectedItem.pcDstinCd);

                    $("#makNm").focus();

                } else if (selectTabId == "planTab"){
                    // 딜러코드(HIDDEN)
                    $("#hDlrCd").val(selectedItem.dlrCd);
                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드(HIDDEN)
                    $("#hPltCd").val(selectedItem.pltCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인코드(HIDDEN)
                    $("#hMakCd").val(selectedItem.makCd);
                    // 캠페인번호(정비용)
                    $("#crNo").val(selectedItem.makCd);
                    // 캠페인코드
                    $("#makCd").val(selectedItem.makCd);
                    // 활동명칭
                    $("#activeNm").val(selectedItem.makNm);
                    // 요약설명
                    $("#activeCont").val(selectedItem.makCont);
                    //화술방안
                    $("#talkPlan").val(selectedItem.talkPlan);
                    //파일키
                    $("#activeFileDocNo").val(selectedItem.activeFileDocNo);
                    //파일 그리드 조회
                    $("#fileGrid").data("kendoExtGrid").dataSource.read();

                    // 활동명칭 포커스
                    $("#activeNm").focus();

                } else if (selectTabId == "goalTab") {

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호(정비용)
                    $("#crNo").val(selectedItem.makCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);

                    // 목표 그리드 조회
                    var grid = $("#goalGrid").data("kendoExtGrid");
                    grid.dataSource.page(1);

                } else if (selectTabId == "targetTab") {

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    $("#tDlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호(정비용)
                    $("#crNo").val(selectedItem.makCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);
                    $("#tMakCd").val(selectedItem.makCd);

                    $("#extrDgreCnt").val("");
                    $("#realTargetCnt").val("");

                    //고객추출조건(입력부).   targExtractList
                    custExtrTermNoDDL();

                    if($("#custExtrAutoYn").data("kendoExtDropDownList").value() == "Y"){
                        cycleCheckDisFalse();
                    }else{
                        cycleCheckDisTrue();
                    }

                    // 대상자 그리드 조회
                    var grid = $("#targetGrid").data("kendoExtGrid");
                    grid.dataSource.page(1);

                } else if (selectTabId == "budgetTab") {

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호(정비용)
                    $("#crNo").val(selectedItem.makCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);

                    // 예산 그리드 조회
                    var grid = $("#budgetGrid").data("kendoExtGrid");
                    grid.dataSource.page(1);

                } else if (selectTabId == "progressTab") {

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호(정비용)
                    $("#crNo").val(selectedItem.makCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);
                    // 결재문서번호
                    $("#apprDocNo").val(selectedItem.apprDocNo);
                    // 결재양식ID
                    $("#signDocId").val(selectedItem.signDocId);

                    // 활동심사 그리드 조회
                    var grid = $("#signLineGrid").data("kendoExtGrid");

                    if( $("#apprDocNo").val() != null && $("#apprDocNo").val() != "" ) {
                        grid.dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectSignLineExs.do' />";
                    }else{
                        grid.dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectDocLineExs.do' />";
                    }

                    grid.dataSource.page(1);

                    $("#signCont").val("");

                } else if (selectTabId == "resultTab") {

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호(정비용)
                    $("#crNo").val(selectedItem.makCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);

                    // 결과-목표 그리드 조회
                    var gridGoal = $("#resultGoalGrid").data("kendoExtGrid");
                    gridGoal.dataSource.page(1);

                    // 결과-직원설문 그리드 조회
//                    var gridPerson = $("#resultPersonGrid").data("kendoExtGrid");
//                    gridPerson.dataSource.page(1);

                    // 결과-업체평가 그리드 조회
//                     var gridCorp = $("#resultCorpGrid").data("kendoExtGrid");
//                     gridCorp.dataSource.page(1);

                    // 결과-담당자 의견 조회
                    $.ajax({
                        url:"<c:url value='/crm/mcm/campaignResult/selectPrsnContByKey.do' />"
                        ,data:JSON.stringify({"sDlrCd":selectedItem.dlrCd, "sMakCd":selectedItem.makCd})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error) {
//                          dms.notification.error(jqXHR.responseJSON.errors);
                            $("#prsnOpnCont").val("");
                            $("#docId").val("");
                            $("#fileResultGrid").data("kendoExtGrid").dataSource.data([]);  // 첨부파일
                        }
                        ,success:function(jqXHR, textStatus) {
                            $("#prsnOpnCont").val(jqXHR.prsnOpnCont);
                            $("#docId").val(jqXHR.docId);
                            if (dms.string.isNotEmpty(jqXHR.docId)) {
                                $("#fileResultGrid").data("kendoExtGrid").dataSource.page(1);
                            };
                        }
                    });

                } else if (selectTabId == "bhmcLbrTab") {//bhmcLbrTab 제조사 공임

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호(정비용)
                    $("#crNo").val(selectedItem.makCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);

                    // 유형
                    $("#makTpCd").data("kendoExtDropDownList").value(selectedItem.makTpCd);
                    $("#befMakTpCd").val(selectedItem.makTpCd);
                    //$("#makSubTpCd").data("kendoExtDropDownList").enable(true);
                    onSelectMakTpCdSet(selectedItem.makTpCd);

                    // 서브유형
                    $("#makSubTpCd").data("kendoExtDropDownList").value(selectedItem.makSubTpCd);

                    // 작업정보(정비용) 그리드 조회
                    var grid = $("#bhmcLbrGrid").data("kendoExtGrid");
                   // var grid = $("#workGrid").data("kendoExtGrid");
                    grid.dataSource.page(1);

                } else if (selectTabId == "bhmcItemTab") {//bhmcItemTab 제조사 부품

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호(정비용)
                    $("#crNo").val(selectedItem.makCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);

                    // 유형
                    $("#makTpCd").data("kendoExtDropDownList").value(selectedItem.makTpCd);
                    $("#befMakTpCd").val(selectedItem.makTpCd);
                    //$("#makSubTpCd").data("kendoExtDropDownList").enable(true);
                    onSelectMakTpCdSet(selectedItem.makTpCd);

                    // 서브유형
                    $("#makSubTpCd").data("kendoExtDropDownList").value(selectedItem.makSubTpCd);

                    // 부품정보(정비용) 그리드 조회
                    var grid = $("#bhmcItemGrid").data("kendoExtGrid");

                    //onSelectLbrCdSet(selectedItem.dlrCd, selectedItem.makCd);

                    grid.dataSource.page(1);

                } else if (selectTabId == "dlrLbrTab") {// dlrLbrTab 딜러 공임

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호(정비용)
                    $("#crNo").val(selectedItem.makCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);

                    // 유형
                    $("#makTpCd").data("kendoExtDropDownList").value(selectedItem.makTpCd);
                    $("#befMakTpCd").val(selectedItem.makTpCd);
                    //$("#makSubTpCd").data("kendoExtDropDownList").enable(true);
                    onSelectMakTpCdSet(selectedItem.makTpCd);

                    // 서브유형
                    $("#makSubTpCd").data("kendoExtDropDownList").value(selectedItem.makSubTpCd);

                    // 공임정보(정비용) 그리드 조회
                    var grid = $("#dlrLbrGrid").data("kendoExtGrid");
                    grid.dataSource.page(1);

                }  else if (selectTabId == "dlrItemTab") {//dlrItemTab 딜러 부품

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호(정비용)
                    $("#crNo").val(selectedItem.makCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);

                    // 유형
                    $("#makTpCd").data("kendoExtDropDownList").value(selectedItem.makTpCd);
                    $("#befMakTpCd").val(selectedItem.makTpCd);
                    //$("#makSubTpCd").data("kendoExtDropDownList").enable(true);
                    onSelectMakTpCdSet(selectedItem.makTpCd);

                    // 서브유형
                    $("#makSubTpCd").data("kendoExtDropDownList").value(selectedItem.makSubTpCd);

                    // 부품정보(정비용) 그리드 조회
                    var grid = $("#dlrItemGrid").data("kendoExtGrid");

                    onSelectLbrCdSet(selectedItem.dlrCd, selectedItem.makCd);

                    grid.dataSource.page(1);

                } else if (selectTabId == "vinTab") { // vin 정보

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호(정비용)
                    $("#crNo").val(selectedItem.makCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);

                    // 유형
                    $("#makTpCd").data("kendoExtDropDownList").value(selectedItem.makTpCd);
                    $("#befMakTpCd").val(selectedItem.makTpCd);
                    //$("#makSubTpCd").data("kendoExtDropDownList").enable(true);
                    onSelectMakTpCdSet(selectedItem.makTpCd);

                    // 서브유형
                    $("#makSubTpCd").data("kendoExtDropDownList").value(selectedItem.makSubTpCd);

                    //VIN정보(정비용) 그리드 조회
                    var grid = $("#vinGrid").data("kendoExtGrid");
                    grid.dataSource.page(1);

                } else if (selectTabId == "dlrTab") {

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호(정비용)
                    $("#crNo").val(selectedItem.makCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);

                    // 유형
                    $("#makTpCd").data("kendoExtDropDownList").value(selectedItem.makTpCd);
                    $("#befMakTpCd").val(selectedItem.makTpCd);
                    //$("#makSubTpCd").data("kendoExtDropDownList").enable(true);
                    onSelectMakTpCdSet(selectedItem.makTpCd);

                    // 서브유형
                    $("#makSubTpCd").data("kendoExtDropDownList").value(selectedItem.makSubTpCd);

                    // 대상 딜러 그리드 조회
                    $("#dlrGrid").data("kendoExtGrid").dataSource.page(1);
                    $("#targDlrGrid").data("kendoExtGrid").dataSource.page(1);

                }

            } else {
                mode = "N";
            }
        }
    });

/*************************************************************
이벤트 정의
*************************************************************/

    // 조회버튼
    $("#btnSearch").kendoButton({
        click:function(e) {

            var grid = $("#mcdGrid").data("kendoExtGrid");
            grid.dataSource.page(1);

            mode = "N";
            resetDefualtForm();

        }
    });


    // 상세정보
    $("#btnViewDetail").kendoButton({
        click:function(e){

            var grid = $("#mcdGrid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());
            if ( dms.string.isNotEmpty(selectedItem) ){

                var win = $("#window").data("kendoWindow");
                win.center();
                win.open();
//                 $("#tabstrip").data("kendoExtTabStrip").select(0);

                viewDetail(selectedItem, 0);

            } else {

                // 선택해주세요.
                dms.notification.info("<spring:message code='crm.info.chkSelectItemMsg' />");
                return;
            }

        }
        , enable:true
    });



    // 기본정보 탭
    // 추가 - mcdGrid
     $("#btnAddVehic").kendoButton({
         click:function(e) {

             var tabStrip = $("#tabstrip").kendoExtTabStrip({animation:false}).data("kendoExtTabStrip");
             tabStrip.select(0);
             //$("#tabstrip").data("kendoExtTabStrip").select(0);
             $("#mcdGrid").data("kendoExtGrid").dataSource.read();
             //시작일, 종료일을 현재 날짜 기준으로 재설정
             $("#startDt").data("kendoExtMaskedDatePicker").value(new Date());
             $("#endDt").data("kendoExtMaskedDatePicker").value(new Date());

             mode = "N";
             resetDefualtForm();

             $("#btnSaveVehic").data("kendoButton").enable(true);
             $("#btnCancelVehic").data("kendoButton").enable(false);
             $("#btnActiveSave").data("kendoButton").enable(true);
             $("#fileSelect").show;
             $("#fileDelete").show;
             $("#btnGoalSave").data("kendoButton").enable(true);
             $("#btnGoalAdd").data("kendoButton").enable(true);
             $("#btnGoalDel").data("kendoButton").enable(true);
             $("#btnRcpeExtr").data("kendoButton").enable(true);
             $("#btnTargetSave").data("kendoButton").enable(true);
             $("#btnTargetAdd").data("kendoButton").enable(true);
             $("#btnTargetDelete").data("kendoButton").enable(true);
//              $("#btnExcelImport").data("kendoButton").enable(true);
             $("#btnBudgetSave").data("kendoButton").enable(true);
             $("#btnBudgetAdd").data("kendoButton").enable(true);
             $("#btnBudgetDel").data("kendoButton").enable(true);

             $("#btnDlrSelect").data("kendoButton").enable(true);
             $("#btnAddR").removeClass("hidden");
             $("#btnDelR").removeClass("hidden");

            $("#bhmcLbrTab").hide();
            $("#bhmcItemTab").hide();
            $("#bhmcLbrTabDiv").hide();
            $("#bhmcItemTabDiv").hide();
            $("#dlrLbrTab").hide();
            $("#dlrItemTab").hide();
            $("#vinTab").hide();
            $("#dlrLbrTabDiv").hide();
            $("#dlrItemTabDiv").hide();
            $("#vinTabDiv").hide();
            $("#dlrTab").hide();

            $("#makTpCd").data("kendoExtDropDownList").setDataSource(makTpDenySerList);

             var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
             tabStrip.disable(tabStrip.tabGroup.children().eq(1));
             tabStrip.disable(tabStrip.tabGroup.children().eq(2));
             tabStrip.disable(tabStrip.tabGroup.children().eq(3));
             tabStrip.disable(tabStrip.tabGroup.children().eq(4));
             tabStrip.disable(tabStrip.tabGroup.children().eq(5));
             tabStrip.disable(tabStrip.tabGroup.children().eq(6));
             tabStrip.disable(tabStrip.tabGroup.children().eq(7));
             tabStrip.disable(tabStrip.tabGroup.children().eq(8));
             tabStrip.disable(tabStrip.tabGroup.children().eq(9));
             tabStrip.disable(tabStrip.tabGroup.children().eq(10));
             tabStrip.disable(tabStrip.tabGroup.children().eq(11));
             tabStrip.disable(tabStrip.tabGroup.children().eq(12));

             $("#serviceInfo1").hide();
             $("#serviceInfo2").hide();

             var win = $("#window").data("kendoWindow");
             win.center();
             win.open();
//              $("#tabstrip").data("kendoExtTabStrip").select(0);

         }
         , enable:true
     });

     //버튼 - 저장 - mcdGrid
     $("#btnSaveVehic").kendoButton({
        click:function(e){

            // 화면 필수 체크
            if ( dms.string.isEmpty($("#hostCd").val())){
                dms.notification.warning("<spring:message code='global.lbl.hostCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#hostCd").focus();
                return false;
            }

            //주최코드가 [01 제조사]일 경우 저장하지 못하도록 한다.
/*             if ($("#hostCd").val() == "01"){
                dms.notification.warning("<spring:message code='crm.info.noMakeCorpSave'/>");
                $("#hostCd").focus();
                return false;
            } */

            if ( dms.string.isEmpty($("#makTpCd").val())){
                dms.notification.warning("<spring:message code='global.lbl.type' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#makTpCd").focus();
                return false;
            }

            if ( dms.string.isEmpty($("#makSubTpCd").val())){
                dms.notification.warning("<spring:message code='global.lbl.type' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#makSubTpCd").focus();
                return false;
            }

            if ( dms.string.isEmpty($("#makNm").val())){
                dms.notification.warning("<spring:message code='global.lbl.crNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#makNm").focus();
                return false;
            }

            if ( dms.string.isEmpty($("#startDt").val())){
                dms.notification.warning("<spring:message code='global.lbl.startDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#startDt").focus();
                return false;
            }

            if ( dms.string.isEmpty($("#endDt").val())){
                dms.notification.warning("<spring:message code='global.lbl.EndDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#endDt").focus();
                return false;
            }

            if (Number($("#startDt").val().replace(/-/g, '')) > Number($("#endDt").val().replace(/-/g, ''))){
                dms.notification.warning("<spring:message code='cmm.info.endDateGreat'/>");
                $("#startDt").focus();
                return false;
            }

            if ( dms.string.isEmpty($("#statCd").val())){
                dms.notification.warning("<spring:message code='global.lbl.statNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#statCd").focus();
                return false;
            }

            if(!dms.string.isEmpty($("#creStartDt").data("kendoExtMaskedDatePicker").value()) || !dms.string.isEmpty($("#creEndDt").data("kendoExtMaskedDatePicker").value())){
                if ( dms.string.isEmpty($("#creStartDt").data("kendoExtMaskedDatePicker").value())){
                    dms.notification.warning("<spring:message code='ser.lbl.creStartDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#creStartDt").focus();
                    return false;
                }

                if ( dms.string.isEmpty($("#creEndDt").data("kendoExtMaskedDatePicker").value())){
                    dms.notification.warning("<spring:message code='ser.lbl.creEndDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#creEndDt").focus();
                    return false;
                }

                if (Number($("#creStartDt").val().replace(/-/g, '')) > Number($("#creEndDt").val().replace(/-/g, ''))){
                    dms.notification.warning("<spring:message code='cmm.info.endDateGreat'/>");
                    $("#creStartDt").focus();
                    return false;
                }
            }

            if(!dms.string.isEmpty($("#saleStartDt").data("kendoExtMaskedDatePicker").value()) || !dms.string.isEmpty($("#saleEndDt").data("kendoExtMaskedDatePicker").value())){
                if ( dms.string.isEmpty($("#saleStartDt").data("kendoExtMaskedDatePicker").value())){
                    dms.notification.warning("<spring:message code='ser.lbl.saleStartDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#saleStartDt").focus();
                    return false;
                }

                if ( dms.string.isEmpty($("#saleEndDt").data("kendoExtMaskedDatePicker").value())){
                    dms.notification.warning("<spring:message code='ser.lbl.saleEndDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#saleEndDt").focus();
                    return false;
                }

                if (Number($("#saleStartDt").val().replace(/-/g, '')) > Number($("#saleEndDt").val().replace(/-/g, ''))){
                    dms.notification.warning("<spring:message code='cmm.info.endDateGreat'/>");
                    $("#saleStartDt").focus();
                    return false;
                }
            }

            if ( dms.string.isEmpty($("#makCont").val())){
                dms.notification.warning("<spring:message code='crm.lbl.detail' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#makCont").focus();
                return false;
            }


            $("#makCd").prop("disabled", false);
            $("#prid").prop("disabled", false);

            var json = $("#defaultInfoForm").serializeObject();

            //기간 셋팅
//            json.prid = f_betweenDate(json.startDt, json.endDt);

            json.startDt     = $("#startDt").data("kendoExtMaskedDatePicker").value();
            json.endDt       = $("#endDt").data("kendoExtMaskedDatePicker").value();
            json.creStartDt  = $("#creStartDt").data("kendoExtMaskedDatePicker").value();
            json.creEndDt    = $("#creEndDt").data("kendoExtMaskedDatePicker").value();
            json.saleStartDt = $("#saleStartDt").data("kendoExtMaskedDatePicker").value();
            json.saleEndDt   = $("#saleEndDt").data("kendoExtMaskedDatePicker").value();
            json.makTpCd      = $("#makTpCd").data("kendoExtDropDownList").value();
            json.makSubTpCd   = $("#makSubTpCd").data("kendoExtDropDownList").value();
            json.hostCd      = $("#hostCd").val();
//            json.budgetAmt = $("#budgetAmt").data("kendoExtNumericTextBox").value();
            var url = "<c:url value='/crm/mcm/marketingCampaign/updateMarketingCampaigns.do' />";

            if(mode == "N"){
                url = "<c:url value='/crm/mcm/marketingCampaign/insertMarketingCampaigns.do' />";
            }
            console.log("#####");
            console.log(json);
            $.ajax({
                url:url
                ,dataType:"json"
                ,type:"POST"
                ,contentType:"application/json"
                ,data:JSON.stringify(json)
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(data) {

                    $("#makCd").val(data);
                    $("#crNo").val(data);
                    resultKey = data;
                    isGridReload = true;

                    dms.notification.success("<spring:message code='global.info.success'/>");
                    $("#mcdGrid").data("kendoExtGrid").dataSource.read();

                    if($("#makCd").val() == ""){
                        mode = "N";

                        var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
                        tabStrip.disable(tabStrip.tabGroup.children().eq(1));
                        tabStrip.disable(tabStrip.tabGroup.children().eq(2));
                        tabStrip.disable(tabStrip.tabGroup.children().eq(3));
                        tabStrip.disable(tabStrip.tabGroup.children().eq(4));
                        tabStrip.disable(tabStrip.tabGroup.children().eq(5));
                        tabStrip.disable(tabStrip.tabGroup.children().eq(6));
                        tabStrip.disable(tabStrip.tabGroup.children().eq(7));
                        tabStrip.disable(tabStrip.tabGroup.children().eq(8));
                        tabStrip.disable(tabStrip.tabGroup.children().eq(9));
                        tabStrip.disable(tabStrip.tabGroup.children().eq(10));
                        tabStrip.disable(tabStrip.tabGroup.children().eq(11));

                    }else{
                        mode = "U";

                        var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
                        tabStrip.enable(tabStrip.tabGroup.children().eq(1));
                        tabStrip.enable(tabStrip.tabGroup.children().eq(2));
                        tabStrip.enable(tabStrip.tabGroup.children().eq(3));
                        tabStrip.enable(tabStrip.tabGroup.children().eq(4));

                        if($("#makTpCd").val() == "03"){
                            tabStrip.enable(tabStrip.tabGroup.children().eq(5));
                            tabStrip.enable(tabStrip.tabGroup.children().eq(6));
                            tabStrip.enable(tabStrip.tabGroup.children().eq(7));
                            tabStrip.enable(tabStrip.tabGroup.children().eq(8));
                            tabStrip.enable(tabStrip.tabGroup.children().eq(9));
                        }
                        tabStrip.enable(tabStrip.tabGroup.children().eq(10));
                        tabStrip.enable(tabStrip.tabGroup.children().eq(11));

                    }
//                    resetDefualtForm();

                    var win = $("#window").data("kendoWindow");
                    win.close();

                }
                ,beforeSend:function(xhr){
                    dms.loading.show();
                }
                ,complete:function(xhr,status){
                    dms.loading.hide();
                }
            });

            $("#makCd").prop("disabled", true);
            $("#prid").prop("disabled", true);
        }
        , enable:true
     });

    //버튼 - 복사 - mcdGrid
     $("#btnCopyVehic").kendoButton({
        click:function(e){

            var grid = $('#mcdGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());

            if(selectedItem != null){

                var json = {};
                json.makCd = selectedItem.makCd;
                json.statCd = "01";
                json.makNm = selectedItem.makNm + "-<spring:message code='global.btn.copy'/>";
                json.hostCd = selectedItem.hostCd;

                var activeFileDocNo = selectedItem.activeFileDocNo
                if ( dms.string.isNotEmpty(activeFileDocNo) ) {
                    json.activeFileDocNo = activeFileDocNo;
                }

                if ( selectedItem.makTpCd === "03" ) {
                    //유형이 [정비]인 캠페인은 해당 화면에서 신규저장이 불가능 하므로 복사할 수 없습니다.
                    dms.notification.warning("<spring:message code='crm.info.noMakeTpCopy'/>");
                    return false;
                };

                console.log("defaultInfoForm"+JSON.stringify(json));

                var url = "<c:url value='/crm/mcm/marketingCampaign/copyMarketingCampaign.do' />";

                $.ajax({
                    url : url
                    ,dataType : "json"
                    ,type : "POST"
                    ,contentType : "application/json"
                    ,data : JSON.stringify(json)
                    ,error: function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success : function(data) {

                        $("#makCd").val(data);
                        $("#crNo").val(data);
                        resultKey = data;
                        isGridReload = true;

                        dms.notification.success("<spring:message code='global.info.success'/>");
                        $("#mcdGrid").data("kendoExtGrid").dataSource.read();

                        var win = $("#window").data("kendoWindow");
                        win.close();

                        mode = "N";
                    }
                });
            }else{
                //캠페인 목록을 먼저 선택해 주십시오.
                dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
            }

        }
        , enable:true
     });

     //버튼 - 캠페인취소
     $("#btnCancelVehic").kendoButton({
         click:function(e){

             var grid = $('#mcdGrid').data('kendoExtGrid');
             var selectedItem = grid.dataItem(grid.select());
             if(selectedItem!=null) {

                 if ( $("#statCd").val() != "01" ){
                     //캠페인취소는 진행상태가 '계획중'일 경우만 취소가 가능합니다.
                     dms.notification.warning("<spring:message code='crm.err.campaignCancelStat'/>");
                     return false;
                 }

                 //주최코드가 [01 제조사]일 경우 저장하지 못하도록 한다.
                 if ($("#hostCd").val() == "01"){
                     dms.notification.warning("<spring:message code='crm.info.noMakeCorpSave'/>");
                     $("#hostCd").focus();
                     return false;
                 }

                 var params = {};
                 params["dlrCd"] = $("#dlrCd").val();
                 params["makCd"] = $("#makCd").val();

                 // 캠페인 취소 confirm
                 dms.window.confirm({
                     message:"<spring:message code='crm.info.campaignCancelConfirm'/>"
                     ,callback:function(result){
                         if(result){//확인버튼 클릭 로직
                             $.ajax({
                                 url:"<c:url value='/crm/mcm/marketingCampaign/updateCampaignCancel.do' />"
                                 ,data:JSON.stringify(params)
                                 ,type:'POST'
                                 ,dataType:'json'
                                 ,contentType:'application/json'
                                 ,error:function(jqXHR, status, error) {
                                     dms.notification.error(jqXHR.responseJSON.errors);
                                 }
                                 ,success:function(jqXHR, textStatus) {

                                     resultKey = $("#makCd").val();
                                     isGridReload = true;

                                     grid.dataSource.read();

                                     //정상적으로 반영 되었습니다.
                                     dms.notification.success("<spring:message code='global.info.success'/>");

                                     var win = $("#window").data("kendoWindow");
                                     win.close();
                                 }
                                 ,beforeSend:function(xhr){
                                     dms.loading.show();
                                 }
                                 ,complete:function(xhr,status){
                                     dms.loading.hide();
                                 }
                             });
                         }else{
                             //취소버튼 클릭 로직
                         }
                     }
                 });
                 // 캠페인 취소 confirm
             } else {
                 //캠페인 목록을 먼저 선택해 주십시오.
                 dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
             }
        }
     });

     // 활동방안 탭
     // 저장 버튼
     $("#btnActiveSave").kendoButton({
         click:function(e){

             var grid = $('#mcdGrid').data('kendoExtGrid');
             var selectedItem = grid.dataItem(grid.select());
             if(selectedItem!=null) {
                 // 화면 필수 체크(활동명칭)
                 if ( dms.string.isEmpty($("#activeNm").val())){
                     dms.notification.warning("<spring:message code='global.lbl.activeNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#activeNm").focus();
                     return false;
                 }

                 // 화면 필수 체크(요약설명)
                 if ( dms.string.isEmpty($("#activeCont").val())){
                     dms.notification.warning("<spring:message code='global.lbl.activeCont' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#activeCont").focus();
                     return false;
                 }

                 var gridActive = $("#mcdGrid").data("kendoExtGrid");

                 var saveData = gridActive.getCUDData("insertList", "updateList", "deleteList");
                 var formSaveData = $("#planForm").serializeObject();

                 var params =  $.extend(
                     {"marketingCampaignVO":formSaveData}
                     ,{"marketingCampaignSaveVO":saveData}
                 );

                 $.ajax({
                      url:"<c:url value='/crm/mcm/marketingCampaign/multiActives.do' />"
                     ,data:JSON.stringify(params)
                     ,type:'POST'
                     ,dataType:'json'
                     ,async:false
                     ,contentType:'application/json'
                     ,error:function(jqXHR,status,error) {
                         dms.notification.error(jqXHR.responseJSON.errors);
                     }
                     ,success:function(jqXHR, textStatus) {
                         //정상적으로 반영 되었습니다.
                         dms.notification.success("<spring:message code='global.info.success'/>");

                         resultKey = $("#makCd").val();
                         isGridReload = true;

                         if($("#makCd").val() == ""){
                             mode = "N";
                         }else{
                             mode = "U";
                         }

                         grid.dataSource.read();
                     }
                     ,beforeSend:function(xhr){
                         dms.loading.show();
                     }
                     ,complete:function(xhr,status){
                         dms.loading.hide();
                     }
                 });

             } else {
                 //캠페인 목록을 먼저 선택해 주십시오.
                 dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
             }
         }
     });



     // 인쇄
     $("#btnPrintVehic").kendoButton({
         click:function(e){

             var grid = $('#mcdGrid').data('kendoExtGrid');

             var selectedItem = grid.dataItem(grid.select());

             if(dms.string.isNotEmpty(selectedItem) && dms.string.isNotEmpty(selectedItem.makCd)) {

                 var campaignReportParam = "?dlrCd="+selectedItem.dlrCd+"&makCd="+selectedItem.makCd;
                 var campaignReportUrl = "<c:url value='/crm/mcm/marketingCampaign/selectMarketingCampaignPrint.do' />"+campaignReportParam;
                 var newWindow=open(campaignReportUrl,"",'top=0,left=0,width=925,height=1200,toolbar=1,location=1,directories=0,status=0,menubar=0,resizable=1,scrolling=0,scrollbars=1');
             } else {

                 //캠페인 목록을 먼저 선택해 주십시오.
                 dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");

             };

         }
     });

     //버튼 - 엑셀저장
     $("#btnCtlCamMgmtExcelExp").kendoButton({
         click:function(e) {

             var grid = $("#mcdGrid").data("kendoExtGrid");
             var sysDateExcelNm = new Date();
             var sysDtVal;
             sysDtVal = sysDateExcelNm.getFullYear()+"-";
             sysDtVal += sysDateExcelNm.getMonth()+1;
             sysDtVal += "-"+sysDateExcelNm.getDate();
             sysDtVal += "-"+sysDateExcelNm.getHours()+sysDateExcelNm.getMinutes()+sysDateExcelNm.getSeconds();

             console.log("Excel Export mcdGrid : "+ sysDateExcelNm);

             dms.ajax.excelExport({
                 "beanName":"marketingCampaignService"
                 ,"templateFile":"CampaignMgmtListExp_Tpl.xlsx"
                 ,"fileName":"<spring:message code='crm.title.campaign' />_"+sysDtVal+".xlsx"
                 ,"sMakNm":$("#sMakNm").val()
                 ,"sMakCd":$("#sMakCd").val()
                 ,"sHostCd":$("#sHostCd").val()
                 ,"sMakTpCd":$("#sMakTpCd").val()
                 ,"sMakSubTpCd":$("#sMakSubTpCd").val()
                 ,"sStatCd":$("#sStatCd").val()
                 ,"sStartDt":setKendoDate($("#sStartDt").data("kendoExtMaskedDatePicker").value())
                 ,"sEndDt":setKendoDate($("#sEndDt").data("kendoExtMaskedDatePicker").value())
                 ,"sExcelTp":"CampaignMgmtList"
             });
         }
     });


        // 목표탭
        //버튼 - 추가
        $("#btnGoalAdd").kendoButton({
            click:function(e) {
                var grid = $('#mcdGrid').data('kendoExtGrid');
                var selectedItem = grid.dataItem(grid.select());
                if(selectedItem!=null) {
                    var dlrCd = selectedItem.dlrCd;
                    var pltCd = selectedItem.pltCd;
                    var makCd = selectedItem.makCd;
                    if(makCd!="") {
                        $('#goalGrid').data('kendoExtGrid').dataSource.insert(0, {
                             "dlrCd":dlrCd
                            ,"pltCd":pltCd
                            ,"makCd":makCd
                        });
                    }
                } else {
//                     캠페인 목록을 먼저 선택해 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
                }
            }
        });

        //버튼 - 삭제
        $("#btnGoalDel").kendoButton({
            click:function(e) {

                var grid = $('#mcdGrid').data('kendoExtGrid');
                var selectedItem = grid.dataItem(grid.select());
                if(selectedItem!=null) {
                    var gridGoal = $("#goalGrid").data("kendoExtGrid");
                    var rows = gridGoal.select();

                    if (rows.length < 1) {
                        //목록을 선택하여 주십시오.
                        dms.notification.info("<spring:message code='global.info.required.select'/>");
                        return;
                    }

                    rows.each(function(index, row) {
                        gridGoal.removeRow(row);
                    });
                } else {
                    //캠페인 목록을 먼저 선택해 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
                }
            }
        });

        //버튼 - 저장
        $("#btnGoalSave").kendoButton({
            click:function(e) {

                var grid = $('#mcdGrid').data('kendoExtGrid');
                var selectedItem = grid.dataItem(grid.select());
                if(selectedItem!=null) {
                    var gridGoal = $("#goalGrid").data("kendoExtGrid");

                    var saveData = gridGoal.getCUDData("insertList", "updateList", "deleteList");
                    if (gridGoal.cudDataLength == 0) {
                        //변경된 정보가 없습니다.
                        dms.notification.info("<spring:message code='global.info.required.change'/>");
                        return;
                    }

                    if (gridGoal.gridValidation()) {

        //                var venderDs = gridBudget.dataSource;
        //                var iRowCnt = venderDs.total();
        //                for(var i = 0 ;i < iRowCnt ;i++){
        //                    venderDs.at(i).imsSuptAmt = Number(venderDs.at(i).budgetAmt) * (Number(venderDs.at(i).corpBudnRate) / 100);
        //                }

                        $.ajax({
                            url:"<c:url value='/crm/mcm/marketingCampaign/multiGoals.do' />",
                            data:JSON.stringify(saveData),
                            type:'POST',
                            dataType:'json',
                            contentType:'application/json',
                            error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors);
                            },
                            success:function(jqXHR, textStatus) {

                                gridGoal.dataSource._destroyed = [];
                                gridGoal.dataSource.page(1);

                                //정상적으로 반영 되었습니다.
                                dms.notification.success("<spring:message code='global.info.success'/>");
                            }
                            ,beforeSend:function(xhr){
                                dms.loading.show();
                            }
                            ,complete:function(xhr,status){
                                dms.loading.hide();
                            }
                        });
                    }else{
                        //입력값을 확인하여 주십시오.
                        dms.notification.warning("<spring:message code='global.info.check.input'/>");
                    }
                } else {
                    //캠페인 목록을 먼저 선택해 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
                }
            }
        });

     // 대상자 리스트 탭
     // 대상자 추가
     $("#btnTargetAdd").kendoButton({
         click:function(e){
             initTargetForm();

             if($("#custExtrAutoYn").data("kendoExtDropDownList").value() == "Y"){
                 cycleCheckDisFalse();
             }else{
                 cycleCheckDisTrue();
             }
         }
     });

     var btnTargetSave = function() {
         console.log("대상자자동추출 조건저장:::");
         //추출조건제목 셋팅
         $("#custExtrTitleNm").val($("#custExtrTermNo").data("kendoExtDropDownList").text());

         var json = $("#targetForm").serializeObject();

         // ###################################################### 추출주기설정 3/5 추가 시작

         delete json.cycleDatepicker;
         delete json.cycleDt;

         if($("#custExtrAutoYn").val() == "Y"){

             json.custExtrCycleDt = custExtrCycleDt;

             // 요일 1개만 선택일경우..
             if ( typeof json.custExtrCycleWeek === 'string' ) {
                 var tmpWeek = [];
                 tmpWeek.push(json.custExtrCycleWeek);
                 json.custExtrCycleWeek = tmpWeek;
             };

             if ( $("#custExtrCycleTp").val() === "W" && !$("input[name=custExtrCycleWeek]:checkbox").is(":checked") ) {
                     // {주}을(를) 확인하여 주세요.
                     dms.notification.error("<spring:message code='crm.lbl.week' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                     return false;

             } else if ( $("#custExtrCycleTp").val() === "S" && !custExtrCycleDt.length > 0 ) {
                     // {일}을(를) 확인하여 주세요.
                     dms.notification.error("<spring:message code='crm.lbl.day' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                     return false;

             };

         }
         // ###################################################### 추출주기설정 3/5 추가 종료


         json.custExtrAutoYn = $("#custExtrAutoYn").data("kendoExtDropDownList").value();
         json.custExtrTermNo = $("#custExtrTermNo").data("kendoExtDropDownList").value();
         json.dupYn          = $("#dupYn").data("kendoExtDropDownList").value();

         var cnt = 0;
         var gridTarget = $("#targetGrid").data("kendoExtGrid");

         console.log("gridTarget :",gridTarget)
         var evalDs = gridTarget.dataSource;
         var iRowCnt = evalDs.total();
         for(var i = 0; i < iRowCnt; i++){
             if(evalDs.at(i).custExtrTermNo == $("#custExtrTermNo").data("kendoExtDropDownList").value()){
                 cnt = cnt + 1;
             }
         }
         console.log("cnt :",cnt)
         //동일한 고객추출조건으로 저장하고자 할 경우 confirm문으로 확인후 진행한다.
         if(cnt > 0){

             // 저장 confirm
             dms.window.confirm({
                 message:"<spring:message code='crm.info.custExtrAutoYnConfirm'/>"       // 동일한 고객추출조건으로 저장하고자 할 경우 confirm문으로 확인후 진행한다.
                 ,callback:function(result){
                     if(result){

                         $.ajax({
                             url:"<c:url value='/crm/mcm/marketingCampaign/multiTargets.do' />"
                             ,dataType:"json"
                             ,type:"POST"
                             ,contentType:"application/json"
                             ,data:JSON.stringify(json)
                             ,error:function(jqXHR,status,error) {
                                 dms.notification.error(jqXHR.responseJSON.errors);
                             }
                             ,success:function(data) {
                                 $("#extrDgreCnt").val("");
                                 $("#realTargetCnt").val("");

                                 dms.notification.success("<spring:message code='global.info.success'/>");
                                 gridTarget.dataSource.read();

                             }
                             ,beforeSend:function(xhr){
                                 dms.loading.show();
                             }
                             ,complete:function(xhr,status){
                                 dms.loading.hide();
                             }
                         });

                     }else{
                         //취소버튼 클릭 로직
                         return;
                     }
                 }
             });
             // 저장 confirm

         }else{
             $.ajax({
                 url:"<c:url value='/crm/mcm/marketingCampaign/multiTargets.do' />"
                 ,dataType:"json"
                 ,type:"POST"
                 ,contentType:"application/json"
                 ,data:JSON.stringify(json)
                 ,error:function(jqXHR,status,error) {
                     dms.notification.error(jqXHR.responseJSON.errors);
                 }
                 ,success:function(data) {
                     $("#extrDgreCnt").val("");
                     $("#realTargetCnt").val("");

                     dms.notification.success("<spring:message code='global.info.success'/>");
                     gridTarget.dataSource.read();

                 }
                 ,beforeSend:function(xhr){
                     dms.loading.show();
                 }
                 ,complete:function(xhr,status){
                     dms.loading.hide();
                 }
             });
         }
     };


     var custExtrAutoNProcess = function(val) {
         console.log("N으로 등록은 1건만 등록이 가능함. 체크:::");
         var targetGrid = $("#targetGrid").data("kendoExtGrid");
         var evalDs = targetGrid.dataSource;
         var iRowCnt = evalDs.total();
         var custExtrAutoYnDataItem;
         var beforeChkExtAndPlay = "false";
         var custExtrAutoYn = $("#custExtrAutoYn").data("kendoExtDropDownList").value();

         if (iRowCnt > 0) {
             $.each(targetGrid.dataSource.view(), function(idx, dataItem){
                 //console.log("custExtrAutoYnDataItem ::: " + dataItem.custExtrAutoYnDataItem);
                 console.log("dataItem.custExtrAutoYn ::: " + dataItem.custExtrAutoYn);
                 custExtrAutoYnDataItem = dataItem.custExtrAutoYn;
                 if (custExtrAutoYn == custExtrAutoYnDataItem) {
                        console.log("dataItem.custExtrAutoYn Equals....::: ");
                        beforeChkExtAndPlay = "true";
                 }
             });
         }
         if (beforeChkExtAndPlay == "true") {   // if Start - beforeChkExtAndPlay
             var msg = "<spring:message code='crm.info.alreadyCustExtrAutoNConfirm'/>";  // 이미 고객추출조건이 있습니다. 대상자수동추출은 한 건만 가능합니다. 삭제하고 등록하시겠습니까?
             if (val != "btnTargetSave") {
                 msg = "<spring:message code='crm.info.custExtrAutoYnConfirm'/>";   // 이미 해당 고객추출조건으로 생성된 데이터가 존재합니다. 다시 생성하시겠습니까?
             }
          // 저장 confirm
             dms.window.confirm({
                 message:msg
                 ,callback:function(result){
                     if(result){
                         var param = {};
                         var dlrCd = $("#dlrCd").val();
                         var makCd = $("#makCd").val();
                         var extrDgreCnt;
                         var realTargetCnt;
                         $.each(targetGrid.dataSource.view(), function(idx, dataItem){
                          // 추출차수
                             console.log("N 중복껀 삭제 시작 : " + idx);
                             extrDgreCnt = dataItem.extrDgreCnt;
                             //고객대상자 수
                             realTargetCnt = dataItem.realTargetCnt;

                             param = {
                                     "dlrCd":dlrCd
                                     ,"makCd":makCd
                                     ,"extrDgreCnt":extrDgreCnt
                                     };
                             if (realTargetCnt != 0 ) {
                                 console.log("deleteTargetEx:::");
                                 $.ajax({
                                     url:"<c:url value='/crm/mcm/marketingCampaign/deleteTargetEx.do' />"
                                     ,data:JSON.stringify(param)      //파라미터
                                     ,type:'POST'                        //조회요청
                                     ,dataType:'json'                  //json 응답
                                     ,contentType:'application/json'   //문자열 파라미터
                                     ,async:false
                                     ,error:function(jqXHR,status,error){
                                         dms.notification.error(jqXHR.responseJSON.errors);
                                     }
                                     ,success:function(data) {
                                         $("#extrDgreCnt").val("");
                                         $("#realTargetCnt").val("");
                                     }
                                     ,complete:function(xhr, status) {
                                         console.log("deleteTargetEx.do Done!!!!");
                                     }
                                 });
                            } else {
                                console.log("deleteTarget:::");
                                $.ajax({
                                     url:"<c:url value='/crm/mcm/marketingCampaign/deleteTarget.do' />"
                                     ,data:JSON.stringify(param)      //파라미터
                                     ,type:'POST'                        //조회요청
                                     ,dataType:'json'                  //json 응답
                                     ,contentType:'application/json'   //문자열 파라미터
                                     ,async:false
                                     ,error:function(jqXHR,status,error){
                                         dms.notification.error(jqXHR.responseJSON.errors);
                                     }
                                     ,success:function(data) {
                                         $("#extrDgreCnt").val("");
                                         $("#realTargetCnt").val("");
                                     }
                                     ,complete:function(xhr, status) {
                                         console.log("deleteTarget.do Done!!!!");
                                     }
                                 });
                            }
                         });

                        $("#custExtrOverWriteChk").val("Y");
                        targetGrid.dataSource.data([]);
                         if (val == "btnTargetSave") {
                             console.log("btnTargetSave - custExtrAutoNProcess");
                             btnTargetSave();
                         } else {
                             console.log("btnRcpeExtr - custExtrAutoNProcess");
                             btnRcpeExtr();
                         }

                         $("#custExtrOverWriteChk").val("");

                         $("#window").data("kendoWindow").refresh();

                     }else{
                         //취소버튼 클릭 로직
                         return;
                     }
                 }
             });
             // 저장 confirm

         } else {   // else Start - beforeChkExtAndPlay
             if (val == "btnTargetSave") {
                 btnTargetSave();
             } else {
                 btnRcpeExtr();
             }
             $("#custExtrOverWriteChk").val("");
         }      // end Start - beforeChkExtAndPlay


     };

    //버튼 - 대상자 저장 조건저장
     $("#btnTargetSave").kendoButton({
        click:function(e){

            var grid = $('#mcdGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());
            if(selectedItem!=null) {
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#custExtrAutoYn").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.custExtrAutoYn' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#custExtrAutoYn").focus();
                    return false;
                }

                if ( dms.string.isEmpty($("#custExtrTermNo").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.custExtrTermNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#custExtrTermNo").focus();
                    return false;
                }

                if ( dms.string.isEmpty($("#dupYn").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.dupYn' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#dupYn").focus();
                    return false;
                }

                // N으로 등록은 1건만 등록이 가능함. 체크
                var custExtrAutoYn = $("#custExtrAutoYn").data("kendoExtDropDownList").value();
                if (custExtrAutoYn == "N") {   // if Start - custExtrAutoYn Is N
                    custExtrAutoNProcess("btnTargetSave");
                } else {   // if else Start - custExtrAutoYn Is Y
                    btnTargetSave();
                } // if End - custExtrAutoYn

            } else {
                //캠페인 목록을 먼저 선택해 주십시오.
                dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
            }
        }
        , enable:true
     });

     // 대상자 삭제
     $("#btnTargetDelete").kendoButton({
         click:function(e){

             // TODO 추출 대상자 확인후 추출 대상자가 없으면 삭제.
             var grid = $('#mcdGrid').data('kendoExtGrid');
             var selectedItem = grid.dataItem(grid.select());
             if(selectedItem!=null) {

                 dlrCd = $("#dlrCd").val();
                 makCd = $("#makCd").val();
                 extrDgreCnt = $("#extrDgreCnt").val();
                 realTargetCnt = $("#realTargetCnt").val();

                 if (dms.string.isEmpty(extrDgreCnt)) {
                     //목록을 선택하여 주십시오.
                     dms.notification.warning("<spring:message code='global.info.required.select'/>");
                     return;

                 } else if (realTargetCnt > 0) {

                     // 대상자 삭제 confirm
                     dms.window.confirm({
                         message:"<spring:message code='crm.info.targOnNotDelConfirm'/>"        // 추출된 대상자가 존재합니다. 삭제하시겠습니까?
                         ,callback:function(result){
                             if(result){

                                 var param = {
                                         "dlrCd":dlrCd
                                         ,"makCd":makCd
                                         ,"extrDgreCnt":extrDgreCnt
                                         };

                                 $.ajax({
                                         url:"<c:url value='/crm/mcm/marketingCampaign/deleteTargetEx.do' />"
                                         ,data:JSON.stringify(param)      //파라미터
                                         ,type:'POST'                        //조회요청
                                         ,dataType:'json'                  //json 응답
                                         ,contentType:'application/json'   //문자열 파라미터
                                         ,error:function(jqXHR,status,error){
                                             dms.notification.error(jqXHR.responseJSON.errors);
                                         }
                                         ,success:function(data) {
                                             dms.notification.success("<spring:message code='global.info.success'/>");
                                             $("#extrDgreCnt").val("");
                                             $("#realTargetCnt").val("");

                                             resultKey = $("#makCd").val();
                                             isGridReload = true;

                                             grid.dataSource.read();

                                             $("#targetGrid").data("kendoExtGrid").dataSource.read();
                                         }
                                         ,beforeSend:function(xhr){
                                             dms.loading.show();
                                         }
                                         ,complete:function(xhr,status){
                                             dms.loading.hide();
                                         }
                                 });

                             }else{
                                 //취소버튼 클릭 로직
                                 return;
                             }
                         }
                     });
                     // 대상자 삭제 confirm

                 } else {

                     var param = {
                             "dlrCd":dlrCd
                             ,"makCd":makCd
                             ,"extrDgreCnt":extrDgreCnt
                             };
                     console.log("deleteTarget:::");
                     console.log(param);
                     $.ajax({
                             url:"<c:url value='/crm/mcm/marketingCampaign/deleteTarget.do' />"
                             ,data:JSON.stringify(param)      //파라미터
                             ,type:'POST'                        //조회요청
                             ,dataType:'json'                  //json 응답
                             ,contentType:'application/json'   //문자열 파라미터
                             ,error:function(jqXHR,status,error){
                                 dms.notification.error(jqXHR.responseJSON.errors);
                             }
                             ,success:function(data) {
                                 dms.notification.success("<spring:message code='global.info.success'/>");
                                 $("#extrDgreCnt").val("");
                                 $("#realTargetCnt").val("");
                                 $("#targetGrid").data("kendoExtGrid").dataSource.read();
                             }
                             ,beforeSend:function(xhr){
                                 dms.loading.show();
                             }
                             ,complete:function(xhr,status){
                                 dms.loading.hide();
                             }
                     });
                 }

             } else {
                 //캠페인 목록을 먼저 선택해 주십시오.
                 dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
             }

         }

     });

     //버튼 - 엑셀 Import
     $("#btnExcelImport").kendoButton({
         click:function(e) {

             var targetGrid = $("#targetGrid").data("kendoExtGrid");
             var evalDs = targetGrid.dataSource;
             var iRowCnt = evalDs.total();

             if ( iRowCnt > 0 ) {

                 var msg = "<spring:message code='crm.info.alreadyCustExtrAutoNConfirm'/>";  // 이미 고객추출조건이 있습니다. 대상자수동추출은 한 건만 가능합니다. 삭제하고 등록하시겠습니까?
                 // 저장 confirm
                 dms.window.confirm({
                      message:msg
                      ,callback:function(result){
                          if(result){
                              // 고객 업로드 팝업 호출
                              targetUploadPopupWin = dms.window.popup({
                                  title:"<spring:message code='crm.btn.excellCustUpload' />"
                                  ,width:800
                                  ,windowId:"targetUploadPopupWin"
                                  ,content:{
                                      url:"<c:url value='/crm/mcm/marketingCampaign/selectTargetUploadPopup.do?dlrCd="+$("#dlrCd").val()+"&makCd="+$("#makCd").val()+"'/>"
                                      ,data:{
                                          "callbackFunc":function(){
                                              $("#extrDgreCnt").val("");
                                              $("#realTargetCnt").val("");

                                              resultKey = $("#makCd").val();
                                              isGridReload = true;

                                              $('#mcdGrid').data('kendoExtGrid').dataSource.read();
                                              $('#targetGrid').data('kendoExtGrid').dataSource.read();

                                              targetUploadPopupWin.close();
                                          }
                                      }
                                  }
                              });
                          }else{
                              //취소버튼 클릭 로직
                              return;
                          }
                      }
                 });
                 // 저장 confirm
             }
         }
     });

     //버튼 - 엑셀저장
//      $("#btnCtlExcelExport").kendoButton({
//          click:function(e) {
//                 var sDlrCd = $("#dlrCd").val();
//                 var sMakCd = $("#makCd").val();
//                 var grid = $("#targExcelGrid").data("kendoExtGrid");
//                 if ( grid.dataSource.data.length == 0 ){
//                     dms.notification.warning("<spring:message code='global.info.noSearchDataMsg'/>");
//                     return false;
//                 }
//                 var sysDateExcelNm = new Date();
//                 var sysDtVal;
//                 sysDtVal = sysDateExcelNm.getFullYear()+"-";
//                 sysDtVal += sysDateExcelNm.getMonth()+1;
//                 sysDtVal += "-"+sysDateExcelNm.getDate();
//                 sysDtVal += "-"+sysDateExcelNm.getHours()+sysDateExcelNm.getMinutes()+sysDateExcelNm.getSeconds();

//                 console.log("Excel Export : " + sMakCd +" : " + sysDateExcelNm);
//                 dms.ajax.excelExport({
//                     "beanName":"marketingCampaignService"
//                     ,"templateFile":"CampaignExtractCustRlt_Tpl.xlsx"
//                     ,"fileName":"<spring:message code='crm.lbl.rcpeExtrSeq' />_"+sysDtVal+".xlsx"
//                     ,"sDlrCd":sDlrCd
//                     ,"sMakCd":sMakCd
//                     ,"sExcelTp":"CampaignExtractCustRlt"
//                 });
//          }
//      });

     //대상탭 - 엑셀Export [진]
    $("#btnCtlExcelExport").kendoButton({
        click:function(e) {

            var params = {};
            var makCd = $("#makCd").val();
            params["sMakCd"] = makCd;

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

                    dms.ajax.excelExport({
                        "beanName":"marketingCampaignService"
                        ,"templateFile":"CampaignExtractCustRlt_Tpl.xlsx"
                        ,"fileName":"<spring:message code='crm.lbl.rcpeExtrSeq'/>_"+kendo.toString(new Date(), "yyyy-MM-dd-HHmmss")+".xlsx"
                        ,"sMakCd":makCd
                        ,"sExcelTp":"CampaignExtractCustRlt"
                    });


                }
            });

        }
    });

     var btnRcpeExtr = function() {
         console.log("대상자자동추출 추출실행:::");
         var grid = $('#mcdGrid').data('kendoExtGrid');
             var params = {};
             params["dlrCd"] = $("#dlrCd").val();
             params["makCd"] = $("#makCd").val();
             params["extrDgreCnt"] = $("#extrDgreCnt").val() == "" || $("#extrDgreCnt").val() == null ? 0 : $("#extrDgreCnt").val();
             params["custExtrAutoYn"] = $("#custExtrAutoYn").data("kendoExtDropDownList").value();
             params["custExtrTermNo"] = $("#custExtrTermNo").data("kendoExtDropDownList").value();
             params["custExtrTitleNm"] = $("#custExtrTermNo").data("kendoExtDropDownList").text();
             params["dupYn"] = $("#dupYn").data("kendoExtDropDownList").value();
             params["realTargetCnt"] = $("#realTargetCnt").val();

             //신규로 대상자를 추출하는 지 알아보기 위한 변수
             var extrDgreCnt   = $("#extrDgreCnt").val() == "" || $("#extrDgreCnt").val() == null ? 0 : $("#extrDgreCnt").val();
             var realTargetCnt = $("#realTargetCnt").val() == "" || $("#realTargetCnt").val() == null ? 0 : $("#realTargetCnt").val();

             var cnt = 0;
             var gridTarget = $("#targetGrid").data("kendoExtGrid");
             var evalDs = gridTarget.dataSource;
             var iRowCnt = evalDs.total();
             for(var i = 0; i < iRowCnt; i++){
                 if(evalDs.at(i).custExtrTermNo == $("#custExtrTermNo").data("kendoExtDropDownList").value() && evalDs.at(i).realTargetCnt > 0){
                     cnt = cnt + 1;
                 }
             }

             console.log("cnt :: " + cnt);
             //동일한 고객추출조건으로 대상자를 생성하고자 할 경우 confirm문으로 확인후 진행한다.
             var custExtrOverWriteChk = $("#custExtrOverWriteChk").val();
             console.log("custExtrOverWriteChk : " + custExtrOverWriteChk);
             if(cnt > 0){

                 if (custExtrOverWriteChk != "Y") {
                     // 대상자 추출 confirm
                     dms.window.confirm({
                         message:"<spring:message code='crm.info.custExtrAutoYnConfirm'/>"      // 동일한 고객추출조건으로 대상자를 생성하고자 할 경우 confirm문으로 확인후 진행한다.
                         ,callback:function(result){
                             if(result){

                                 var gridTargetD = $("#targetGrid").data("kendoExtGrid");
                                 var selectedItemT = gridTargetD.dataItem(gridTargetD.select());
                                 if (selectedItemT != null) {

                                     var dlrCd = $("#dlrCd").val();
                                     var makCd = $("#makCd").val();
                                     var extrDgreCntD = $("#extrDgreCnt").val();
                                     var realTargetCntD = $("#realTargetCnt").val();

                                     console.log("extrDgreCntD : " + extrDgreCntD);
                                     console.log("realTargetCntD : " + realTargetCntD);
                                     if (realTargetCntD > 0) {

                                         // 대상자 삭제 confirm
                                         var param = {
                                                 "dlrCd":dlrCd
                                                 ,"makCd":makCd
                                                 ,"extrDgreCnt":extrDgreCntD
                                                 };
                                         console.log("realTargetCntD param : ");
                                         console.log(param);

                                         $.ajax({
                                                 url:"<c:url value='/crm/mcm/marketingCampaign/deleteTargetEx.do' />"
                                                 ,data:JSON.stringify(param)      //파라미터
                                                 ,type:'POST'                        //조회요청
                                                 ,dataType:'json'                  //json 응답
                                                 ,contentType:'application/json'   //문자열 파라미터
                                                 ,error:function(jqXHR,status,error){
                                                     dms.notification.error(jqXHR.responseJSON.errors);
                                                 }
                                                 ,success:function(data) {
                                                     //dms.notification.success("<spring:message code='global.info.success'/>");
                                                     $("#extrDgreCnt").val("");
                                                     $("#realTargetCnt").val("");

                                                     //resultKey = $("#makCd").val();
                                                     //isGridReload = true;

                                                     //grid.dataSource.read();

                                                     //$("#targetGrid").data("kendoExtGrid").dataSource.read();
                                                 }
//                                                                      ,beforeSend:function(xhr){
//                                                                          dms.loading.show();
//                                                                      }
//                                                                      ,complete:function(xhr,status){
//                                                                          dms.loading.hide();
//                                                                      }
                                         });
                                         // 대상자 삭제 confirm

                                     } else {

                                         var param = {
                                                 "dlrCd":dlrCd
                                                 ,"makCd":makCd
                                                 ,"extrDgreCnt":extrDgreCntD
                                                 };

                                         console.log("extrDgreCntD param : ");
                                         console.log(param);

                                         $.ajax({
                                                 url:"<c:url value='/crm/mcm/marketingCampaign/deleteTarget.do' />"
                                                 ,data:JSON.stringify(param)      //파라미터
                                                 ,type:'POST'                        //조회요청
                                                 ,dataType:'json'                  //json 응답
                                                 ,contentType:'application/json'   //문자열 파라미터
                                                 ,error:function(jqXHR,status,error){
                                                     dms.notification.error(jqXHR.responseJSON.errors);
                                                 }
                                                 ,success:function(data) {
                                                     //dms.notification.success("<spring:message code='global.info.success'/>");
                                                     $("#extrDgreCnt").val("");
                                                     $("#realTargetCnt").val("");
                                                     //$("#targetGrid").data("kendoExtGrid").dataSource.read();
                                                 }
                                         });
                                     }

                                 }

                                 $.ajax({
                                     url:"<c:url value='/crm/mcm/marketingCampaign/insertTargetExtractSave.do' />"
                                     ,data:JSON.stringify(params)
                                     ,type:'POST'
                                     ,dataType:'json'
                                     ,contentType:'application/json'
                                     ,error:function(jqXHR, status, error) {
                                         dms.notification.error(jqXHR.responseJSON.errors);
                                     }
                                     ,success:function(jqXHR, textStatus) {

                                         resultKey = $("#makCd").val();
                                         isGridReload = true;

                                         grid.dataSource.read();

                                         gridTarget.dataSource.read();

                                         //정상적으로 반영 되었습니다.
                                         dms.notification.success("<spring:message code='global.info.success'/>");
                                         $("#extrDgreCnt").val("");
                                         $("#realTargetCnt").val("");
                                     }
                                     ,beforeSend:function(xhr){
                                         dms.loading.show();
                                         dms.notification.info("<spring:message code='crm.info.proceIng'/>");
                                     }
                                     ,complete:function(xhr,status){
                                         dms.loading.hide();
                                     }
                                 });

                             }else{
                                 //취소버튼 클릭 로직
                                 return;
                             }
                         }
                     });
                     // 대상자 추출 confirm

                 } else {
                 var gridTargetD = $("#targetGrid").data("kendoExtGrid");
                  var selectedItemT = gridTargetD.dataItem(gridTargetD.select());
                  if (selectedItemT != null) {

                      var dlrCd = $("#dlrCd").val();
                      var makCd = $("#makCd").val();
                      var extrDgreCntD = $("#extrDgreCnt").val();
                      var realTargetCntD = $("#realTargetCnt").val();

                      console.log("extrDgreCntD : " + extrDgreCntD);
                      console.log("realTargetCntD : " + realTargetCntD);
                      if (realTargetCntD > 0) {

                          // 대상자 삭제 confirm
                          var param = {
                                  "dlrCd":dlrCd
                                  ,"makCd":makCd
                                  ,"extrDgreCnt":extrDgreCntD
                                  };
                          console.log("realTargetCntD param : ");
                          console.log(param);

                          $.ajax({
                                  url:"<c:url value='/crm/mcm/marketingCampaign/deleteTargetEx.do' />"
                                  ,data:JSON.stringify(param)      //파라미터
                                  ,type:'POST'                        //조회요청
                                  ,dataType:'json'                  //json 응답
                                  ,contentType:'application/json'   //문자열 파라미터
                                  ,error:function(jqXHR,status,error){
                                      dms.notification.error(jqXHR.responseJSON.errors);
                                  }
                                  ,success:function(data) {
                                      //dms.notification.success("<spring:message code='global.info.success'/>");
                                      $("#extrDgreCnt").val("");
                                      $("#realTargetCnt").val("");

                                  }
                          });
                          // 대상자 삭제 confirm

                      } else {

                          var param = {
                                  "dlrCd":dlrCd
                                  ,"makCd":makCd
                                  ,"extrDgreCnt":extrDgreCntD
                                  };

                          console.log("extrDgreCntD param : ");
                          console.log(param);

                          $.ajax({
                                  url:"<c:url value='/crm/mcm/marketingCampaign/deleteTarget.do' />"
                                  ,data:JSON.stringify(param)      //파라미터
                                  ,type:'POST'                        //조회요청
                                  ,dataType:'json'                  //json 응답
                                  ,contentType:'application/json'   //문자열 파라미터
                                  ,error:function(jqXHR,status,error){
                                      dms.notification.error(jqXHR.responseJSON.errors);
                                  }
                                  ,success:function(data) {
                                      //dms.notification.success("<spring:message code='global.info.success'/>");
                                      $("#extrDgreCnt").val("");
                                      $("#realTargetCnt").val("");
                                      //$("#targetGrid").data("kendoExtGrid").dataSource.read();
                                  }
//                                                                   ,beforeSend:function(xhr){
//                                                                       dms.loading.show();
//                                                                   }
//                                                                   ,complete:function(xhr,status){
//                                                                       dms.loading.hide();
//                                                                   }
                          });
                      }

                  }

                  $.ajax({
                      url:"<c:url value='/crm/mcm/marketingCampaign/insertTargetExtractSave.do' />"
                      ,data:JSON.stringify(params)
                      ,type:'POST'
                      ,dataType:'json'
                      ,contentType:'application/json'
                      ,error:function(jqXHR, status, error) {
                          dms.notification.error(jqXHR.responseJSON.errors);
                      }
                      ,success:function(jqXHR, textStatus) {

                          resultKey = $("#makCd").val();
                          isGridReload = true;

                          grid.dataSource.read();

                          gridTarget.dataSource.read();

                          //정상적으로 반영 되었습니다.
                          dms.notification.success("<spring:message code='global.info.success'/>");
                          $("#extrDgreCnt").val("");
                          $("#realTargetCnt").val("");
                      }
                      ,beforeSend:function(xhr){
                          dms.loading.show();
                          dms.notification.info("<spring:message code='crm.info.proceIng'/>");
                      }
                      ,complete:function(xhr,status){
                          dms.loading.hide();
                      }
                  });
                 }

             }else{
                 // 신규로 대상자추출까지 수행할 때
                 console.log("extrDgreCnt::" + extrDgreCnt);
                 console.log("realTargetCnt::" + realTargetCnt);
                 if(extrDgreCnt <= 0 || realTargetCnt > 0){

                     if (custExtrOverWriteChk != "Y") {    // if Start - custExtrOverWriteChk
                         // 대상자 추출 confirm
                         dms.window.confirm({
                             message:"<spring:message code='crm.info.custExtrNewConfirm'/>"     // 신규로 추출조건과 추출대상자를 한꺼번에 생성하고자 할 경우 confirm문으로 확인후 진행한다.
                             ,callback:function(result){
                                 if(result){

                                     $.ajax({
                                         url:"<c:url value='/crm/mcm/marketingCampaign/insertTargetExtractSave.do' />"
                                         ,data:JSON.stringify(params)
                                         ,type:'POST'
                                         ,dataType:'json'
                                         ,contentType:'application/json'
                                         ,error:function(jqXHR, status, error) {
                                             dms.notification.error(jqXHR.responseJSON.errors);
                                         }
                                         ,success:function(jqXHR, textStatus) {

                                             resultKey = $("#makCd").val();
                                             isGridReload = true;

                                             grid.dataSource.read();

                                             gridTarget.dataSource.read();

                                             //정상적으로 반영 되었습니다.
                                             dms.notification.success("<spring:message code='global.info.success'/>");
                                             $("#extrDgreCnt").val("");
                                             $("#realTargetCnt").val("");
                                         }
                                         ,beforeSend:function(xhr){
                                             dms.loading.show();
                                             dms.notification.info("<spring:message code='crm.info.proceIng'/>");
                                         }
                                         ,complete:function(xhr,status){
                                             dms.loading.hide();
                                         }
                                     });

                                 }else{
                                     //취소버튼 클릭 로직
                                     return;
                                 }
                             }
                         });
                         // 대상자 추출 confirm
                     } else {           // else Start - custExtrOverWriteChk
                         $.ajax({
                             url:"<c:url value='/crm/mcm/marketingCampaign/insertTargetExtractSave.do' />"
                             ,data:JSON.stringify(params)
                             ,type:'POST'
                             ,dataType:'json'
                             ,contentType:'application/json'
                             ,error:function(jqXHR, status, error) {
                                 dms.notification.error(jqXHR.responseJSON.errors);
                             }
                             ,success:function(jqXHR, textStatus) {

                                 resultKey = $("#makCd").val();
                                 isGridReload = true;

                                 grid.dataSource.read();

                                 gridTarget.dataSource.read();

                                 //정상적으로 반영 되었습니다.
                                 dms.notification.success("<spring:message code='global.info.success'/>");
                                 $("#extrDgreCnt").val("");
                                 $("#realTargetCnt").val("");
                             }
                             ,beforeSend:function(xhr){
                                 dms.loading.show();
                                 dms.notification.info("<spring:message code='crm.info.proceIng'/>");
                             }
                             ,complete:function(xhr,status){
                                 dms.loading.hide();
                             }
                         });
                     }          // if End - custExtrOverWriteChk
                 }else{
                     $.ajax({
                         url:"<c:url value='/crm/mcm/marketingCampaign/insertTargetExtractSave.do' />"
                         ,data:JSON.stringify(params)
                         ,type:'POST'
                         ,dataType:'json'
                         ,contentType:'application/json'
                         ,error:function(jqXHR, status, error) {
                             dms.notification.error(jqXHR.responseJSON.errors);
                         }
                         ,success:function(jqXHR, textStatus) {

                             resultKey = $("#makCd").val();
                             isGridReload = true;

                             grid.dataSource.read();

                             gridTarget.dataSource.read();

                             //정상적으로 반영 되었습니다.
                             dms.notification.success("<spring:message code='global.info.success'/>");
                             $("#extrDgreCnt").val("");
                             $("#realTargetCnt").val("");
                         }
                         ,beforeSend:function(xhr){
                             dms.loading.show();
                             dms.notification.info("<spring:message code='crm.info.proceIng'/>");
                         }
                         ,complete:function(xhr,status){
                             dms.loading.hide();
                         }
                     });
                 }
             }

     };

     //버튼 - 추출실행
     $("#btnRcpeExtr").kendoButton({
         click:function(e){

             var grid = $('#mcdGrid').data('kendoExtGrid');
             var selectedItem = grid.dataItem(grid.select());
             if(selectedItem!=null) {

                 if ( dms.string.isEmpty($("#custExtrAutoYn").val())){
                     dms.notification.warning("<spring:message code='crm.lbl.custExtrAutoYn' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#custExtrAutoYn").focus();
                     return false;
                 }

                 if($("#custExtrAutoYn").val() == "Y"){
                     //대상자를 자동으로 추출하는 경우는 해당하면에서 대상자를 추출할 수 없습니다.
                     dms.notification.warning("<spring:message code='crm.err.custExtrAutoYnExtrNot'/>");
                     return false;
                 }

                 if ( dms.string.isEmpty($("#custExtrTermNo").val())){
                     dms.notification.warning("<spring:message code='crm.lbl.custExtrTermNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#custExtrTermNo").focus();
                     return false;
                 }

                 if ( dms.string.isEmpty($("#dupYn").val())){
                     dms.notification.warning("<spring:message code='crm.lbl.dupYn' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#dupYn").focus();
                     return false;
                 }

                 // N으로 등록은 1건만 등록이 가능함. 체크
                 var custExtrAutoYn = $("#custExtrAutoYn").data("kendoExtDropDownList").value();
                 if (custExtrAutoYn == "N") {   // if Start - custExtrAutoYn Is N
                     custExtrAutoNProcess("btnRcpeExtr");
                 } else {   // if else Start - custExtrAutoYn Is Y
                     btnRcpeExtr();
                 } // if End - custExtrAutoYn



             } else {
                 //캠페인 목록을 먼저 선택해 주십시오.
                 dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
             }
        }
     });

     // 대상자추출 배치
     $("#btnBatch").kendoButton({
         click:function(e){
             var gridTarget = $("#targetGrid").data("kendoExtGrid");
             $.ajax({
                 url:"<c:url value='/bat/crm/mcm/markingCampaignBatchService.do' />"
                 //,data:JSON.stringify(param)      //파라미터
                 ,type:'POST'                        //조회요청
                 ,dataType:'json'                  //json 응답
                 ,contentType:'application/json'   //문자열 파라미터
                 ,error:function(jqXHR,status,error){
                     dms.notification.error(jqXHR.responseJSON.errors);
                 }
                 ,success:function(jqXHR, textStatus) {
                     gridTarget.dataSource.read();
                     //정상적으로 반영 되었습니다.
                     dms.notification.success("<spring:message code='global.info.success'/>");
                     $("#extrDgreCnt").val("");
                     $("#realTargetCnt").val("");
                 }
                 ,beforeSend:function(xhr){
                     dms.loading.show();
                     dms.notification.info("<spring:message code='crm.info.proceIng'/>");
                 }
                 ,complete:function(xhr,status){
                     dms.loading.hide();
                 }
             });
         }
     });

     // 예산탭
     //버튼 - 추가
     $("#btnBudgetAdd").kendoButton({
         click:function(e) {
             var grid = $('#mcdGrid').data('kendoExtGrid');
             var selectedItem = grid.dataItem(grid.select());
             if(selectedItem!=null) {
                 var dlrCd = selectedItem.dlrCd;
                 var pltCd = selectedItem.pltCd;
                 var makCd = selectedItem.makCd;
                 if(makCd!="") {
                     $('#budgetGrid').data('kendoExtGrid').dataSource.insert(0, {
                          "dlrCd":dlrCd
                         ,"pltCd":pltCd
                         ,"makCd":makCd
                         ,"budgetCd":""
                     });
                 }
             } else {
                 //캠페인 목록을 먼저 선택해 주십시오.
                 dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
             }
         }
     });

     //버튼 - 삭제
     $("#btnBudgetDel").kendoButton({
         click:function(e) {

             var grid = $('#mcdGrid').data('kendoExtGrid');
             var selectedItem = grid.dataItem(grid.select());
             if(selectedItem!=null) {
                 var gridBudget = $("#budgetGrid").data("kendoExtGrid");
                 var rows = gridBudget.select();

                 if (rows.length < 1) {
                     //목록을 선택하여 주십시오.
                     dms.notification.info("<spring:message code='global.info.required.select'/>");
                     return;
                 }

                 rows.each(function(index, row) {
                     gridBudget.removeRow(row);
                 });
             } else {
                 //캠페인 목록을 먼저 선택해 주십시오.
                 dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
             }
         }
     });

     //버튼 - 저장
     $("#btnBudgetSave").kendoButton({
         click:function(e) {

             var grid = $('#mcdGrid').data('kendoExtGrid');
             var selectedItem = grid.dataItem(grid.select());
             if(selectedItem!=null) {
                 var gridBudget = $("#budgetGrid").data("kendoExtGrid");

                 var saveData = gridBudget.getCUDData("insertList", "updateList", "deleteList");
                 if (gridBudget.cudDataLength == 0) {
                     //변경된 정보가 없습니다.
                     dms.notification.info("<spring:message code='global.info.required.change'/>");
                     return;
                 }
                 if (gridBudget.gridValidation()) {
                     var venderDs = gridBudget.dataSource;
                     var iRowCnt = venderDs.total();
                     for(var i = 0 ;i < iRowCnt ;i++){
                        if(Number(venderDs.at(i).budgetAmt)!= Number(venderDs.at(i).corpBudnRate) + Number(venderDs.at(i).imsSuptAmt)){
                            dms.notification.warning("<spring:message code='crm.info.budgetAmtLessThanImsSuptAmtAndCorpBudnRate'/>");
                            return;
                        }
                     }
                     $.ajax({
                         url:"<c:url value='/crm/mcm/marketingCampaign/multiBudgets.do' />",
                         data:JSON.stringify(saveData),
                         type:'POST',
                         dataType:'json',
                         contentType:'application/json',
                         error:function(jqXHR,status,error) {
                             dms.notification.error(jqXHR.responseJSON.errors);
                         },
                         success:function(jqXHR, textStatus) {
                             gridBudget.dataSource._destroyed = [];
                             gridBudget.dataSource.page(1);

                             selectedItem.budgetAmt = Number($("#budgetGridBudgetAmtSum").val().replace(/\,/gi,""));

                             resultKey = $("#makCd").val();
                             isGridReload = true;
                             $("#mcdGrid").data("kendoExtGrid").dataSource.read();

                             //정상적으로 반영 되었습니다.
                             dms.notification.success("<spring:message code='global.info.success'/>");
                         }
                         ,beforeSend:function(xhr){
                             dms.loading.show();
                         }
                         ,complete:function(xhr,status){
                             dms.loading.hide();
                         }
                     });
                 }else{
                     //입력값을 확인하여 주십시오.
                     dms.notification.warning("<spring:message code='global.info.check.input'/>");
                 }
             } else {
                 //캠페인 목록을 먼저 선택해 주십시오.
                 dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
             }
         }
     });

    //버튼 - 엑셀저장(예산)
     $("#btnBudgetExcelExport").kendoButton({
         click:function(e) {

             dms.ajax.excelExport({
                 "beanName":"marketingCampaignService"
                 ,"templateFile":"MarketingCampaign_Tpl.xlsx"
                 //,"fileName":"MarketingCampaign.xlsx"
                  //Q21020200018 DCS中有17个模块的下载文件名不是模块名称，而是英文或数字，需要调整为模块名称。 jiaMing 2021-2-3 start
                 ,"fileName":"<spring:message code='crm.info.campaignInfo' />_<spring:message code='crm.lbl.budget' />.xlsx"
                  //Q21020200018 DCS中有17个模块的下载文件名不是模块名称，而是英文或数字，需要调整为模块名称。 jiaMing 2021-2-3 end
                 ,"sDlrCd":$("#dlrCd").val()
                 ,"sPltCd":$("#pltCd").val()
                 ,"sMakCd":$("#makCd").val()
             });

         }
     });

     // 심사진도 탭
     // 신청서 조회
     $("#btnSignPrint").kendoButton({

         click:function(e) {

             $("#btnPrintVehic").click()

         }

     });

     //버튼 - 심사요청
     $("#btnEvalReq").kendoButton({
         click:function(e) {

             var saveData    = "";
             var cnt         = 0;


    /*         var evalDs = gridEval.dataSource;
             var iRowCnt = evalDs.total();
             for(var i = 0; i < iRowCnt; i++){
                 if(evalDs.at(i).lastSignYn == "Y"){
                     cnt = cnt + 1;
                 }
             }

             if(cnt == 0){
                 //최종결재자가 존재하지 않습니다.
                 dms.notification.info("최종결재자가 존재하지 않습니다.");
                 return;
             }else if(cnt > 1){
                 //최종결재자는 한명만 존재해야 합니다.
                 dms.notification.info("최종결재자는 한명만 존재해야 합니다.");
                 return;
             }

             if(evalDs.at(iRowCnt - 1).lastSignYn != "Y"){
                 //최종결재자는 맨 마지막 사람이어야 합니다.
                 dms.notification.info("최종결재자는 맨 마지막 사람이어야 합니다.");
                 return;
             }*/


//              var lineGrid = $("#signLineGrid").data("kendoExtGrid");
//              var selectedItem = lineGrid.dataItem(lineGrid.select());
             var gridEval = $("#signLineGrid").data("kendoExtGrid");
             var signVO = {}

             //console.log("selectedItem : ",selectedItem)
//              signVO["lastSignYn"] = selectedItem.lastSignYn;
//              signVO["signDocId"] = selectedItem.signDocId;
//              signVO["signDocLineNo"] = selectedItem.signDocLineNo;
//              signVO["signTp"] = selectedItem.signTp;
//              signVO["signUsrId"] = selectedItem.signUsrId;
//              signVO["signUsrNm"] = selectedItem.signUsrNm;

             var evalDs = gridEval.dataSource;
             var iRowCnt = evalDs.total();

             var lastSignYn = evalDs.at(0).lastSignYn;
             var signDocId = evalDs.at(0).signDocId;
             var signDocLineNo = evalDs.at(0).signDocLineNo;
             var signTp = evalDs.at(0).signTp;
             var signUsrId = evalDs.at(0).signUsrId;
             var signUsrNm = evalDs.at(0).signUsrNm;

             signVO["lastSignYn"] = lastSignYn;
             signVO["signDocId"] = signDocId;
             signVO["signDocLineNo"] = signDocLineNo;
             signVO["signTp"] = signTp;
             signVO["signUsrId"] = signUsrId;
             signVO["signUsrNm"] = signUsrNm;


             var params = {};
             params["tempSaveYn"] = "N";
             params["makCd"] = $("#makCd").val();
             params["reqTitleNm"] = $("#makNm").val();
             params["signLineVO"] = signVO;

             //console.log('insertSignEx.do');
             //console.log(params);

             $.ajax({
                 url:"<c:url value='/crm/mcm/marketingCampaign/insertSignEx.do' />"
               , data:JSON.stringify(params)
               , type:'POST'
               , dataType:'json'
               , async:false
               , contentType:'application/json'
               , error:function(jqXHR,status,error) {
                     dms.notification.error(jqXHR.responseJSON.errors);
                 }
               , success:function(jqXHR, textStatus) {
                     $("#apprDocNo").val(jqXHR);

                     gridEval.dataSource._destroyed = [];

                     if( $("#apprDocNo").val() != null && $("#apprDocNo").val() != "" ) {
                         gridEval.dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectSignLineExs.do' />";
                     }else{
                         gridEval.dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectDocLineExs.do' />";
                     }

                     gridEval.dataSource.page(1);

                     $("#signCont").val("");

                     resultKey = $("#makCd").val();
                     isGridReload = true;

                     $("#mcdGrid").data("kendoExtGrid").dataSource.read();

                     //정상적으로 반영 되었습니다.
                     dms.notification.success("<spring:message code='global.info.success'/>");
               }
               ,beforeSend:function(xhr){
                   dms.loading.show();
               }
               ,complete:function(xhr,status){
                   dms.loading.hide();
               }
             });
         }
     });

     //버튼 - 심사
     $("#btnEval").kendoButton({
         click:function(e) {

             var lineGrid = $("#signLineGrid").data("kendoExtGrid");
             var selectedItem = lineGrid.dataItem(lineGrid.select());
             var signDocNo;

             if(selectedItem == null) {
                 // 결재선을(를) 선택하여 주십시오.
                 dms.notification.warning("<spring:message code='global.title.signLine' var='returnMsg' /><spring:message code='global.info.validation.select' arguments='${returnMsg}' />");
                 return;
             }

             signDocNo = selectedItem.signDocNo;

             if(dms.string.isEmpty(selectedItem.signCont)){
                 // 화면 필수 체크(결재의견)
                 dms.notification.warning("<spring:message code='global.lbl.signCont' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 return;
             }

             if(dms.string.isEmpty(signDocNo)){
                 // 화면 필수 체크(문서번호)
                 dms.notification.warning("<spring:message code='global.lbl.signDocNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 return;
             }

             var params = {};

             params["signDocNo"] = signDocNo;
             params["signCont"] = selectedItem.signCont;
             params["signDocId"] = selectedItem.signDocId;
             params["signDocLineNo"] = selectedItem.signDocLineNo;
             params["signStatCd"] = "03";
             params["signRsltCd"] = "04";

             //console.log("params : ",JSON.stringify(params));

             $.ajax({
                 url:"<c:url value='/crm/mcm/marketingCampaign/updateSignLineEx.do' />"
               , data:JSON.stringify(params)
               , type:'POST'
               , dataType:'json'
               , async:false
               , contentType:'application/json'
               , error:function(jqXHR,status,error) {
                     dms.notification.error(jqXHR.responseJSON.errors);
                 }
               , success:function(jqXHR, textStatus) {
                     $("#signLineGrid").data("kendoExtGrid").dataSource._destroyed = [];

                     if( $("#apprDocNo").val() != null && $("#apprDocNo").val() != "" ) {
                         $("#signLineGrid").data("kendoExtGrid").dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectSignLineExs.do' />";
                     }else{
                         $("#signLineGrid").data("kendoExtGrid").dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectDocLineExs.do' />";
                     }

                     $("#signLineGrid").data("kendoExtGrid").dataSource.page(1);

                     $("#signCont").val("");

                     resultKey = $("#makCd").val();
                     isGridReload = true;

                     $("#mcdGrid").data("kendoExtGrid").dataSource.read();

                     //정상적으로 반영 되었습니다.
                     dms.notification.success("<spring:message code='global.info.success'/>");
               }
               ,beforeSend:function(xhr){
                   dms.loading.show();
               }
               ,complete:function(xhr,status){
                   dms.loading.hide();
               }
             });
         }
     });

     //버튼 - 반려
     $("#btnReject").kendoButton({
         click:function(e) {


             var lineGrid = $("#signLineGrid").data("kendoExtGrid");
             var selectedItem = lineGrid.dataItem(lineGrid.select());
             var signDocNo;

             if(selectedItem == null) {
                 // 결재선을(를) 선택하여 주십시오.
                 dms.notification.warning("<spring:message code='global.title.signLine' var='returnMsg' /><spring:message code='global.info.validation.select' arguments='${returnMsg}' />");
                 return;
             }

             signDocNo = selectedItem.signDocNo;

             if(dms.string.isEmpty(selectedItem.signCont)){
                 // 화면 필수 체크(결재의견)
                 dms.notification.warning("<spring:message code='global.lbl.signCont' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 return;
             }

             if(dms.string.isEmpty(signDocNo)){
                 // 화면 필수 체크(문서번호)
                 dms.notification.warning("<spring:message code='global.lbl.signDocNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 return;
             }

             var params = {};

             params["signDocNo"] = signDocNo;
             params["signCont"] = selectedItem.signCont;
             params["signDocId"] = selectedItem.signDocId;
             params["signDocLineNo"] = selectedItem.signDocLineNo;
             params["signStatCd"] = "03";
             params["signRsltCd"] = "02";


             //params["signStatCd"] = "03";
             //params["signRsltCd"] = "02";

             $.ajax({
                 url:"<c:url value='/crm/mcm/marketingCampaign/updateSignLineEx.do' />"
               , data:JSON.stringify(params)
               , type:'POST'
               , dataType:'json'
               , async:false
               , contentType:'application/json'
               , error:function(jqXHR,status,error) {
                     dms.notification.error(jqXHR.responseJSON.errors);
                 }
               , success:function(jqXHR, textStatus) {
                     $("#signLineGrid").data("kendoExtGrid").dataSource._destroyed = [];

                     if( $("#apprDocNo").val() != null && $("#apprDocNo").val() != "" ) {
                         $("#signLineGrid").data("kendoExtGrid").dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectSignLineExs.do' />";
                     }else{
                         $("#signLineGrid").data("kendoExtGrid").dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectDocLineExs.do' />";
                     }

                     $("#signLineGrid").data("kendoExtGrid").dataSource.page(1);

                     $("#signCont").val("");

                     resultKey = $("#makCd").val();
                     isGridReload = true;

                     $("#mcdGrid").data("kendoExtGrid").dataSource.read();

                     //정상적으로 반영 되었습니다.
                     dms.notification.success("<spring:message code='global.info.success'/>");
               }
               ,beforeSend:function(xhr){
                   dms.loading.show();
               }
               ,complete:function(xhr,status){
                   dms.loading.hide();
               }
             });
         }
     });


     //버튼 - 추가 -> 정비 팝업(정비캠페인)
     $("#btnWorkAdd").kendoButton({
         click:function(e)
         {
             // 부품 팝업 열기 함수.
             laborSearchPopup = dms.window.popup({
                 windowId:"partsMasterPopup"
                 ,width:800
                 ,height:400
                 ,title:"<spring:message code='ser.lbl.lbrNm' />"
                 ,content:{
                     url:"<c:url value='/ser/cmm/popup/selectLaborCodePopup.do'/>"
                     ,data:{
                         "autoBind":false
                         ,"selectable":"multiple"
                        // ,"sDlrCd":$("#dlrCd").val()
                         ,"sLtsModelCd":"ALL"
                         ,"callbackFunc":function(lbrData){
                             if(lbrData.length > 0) {
                                 lbrAdd(lbrData, "Y");
                             }
                         }
                     }
                 }
             });
         }
     });

     // 공임정보 등록 버튼
     $("#btnLbrAdd").kendoButton({
         click:function(e){
             parent.parent._createOrReloadTabMenu("<spring:message code='ser.menu.ltsModelMng' />", "<c:url value='/ser/svi/laborManage/selectLaborCodeManageMain.do'/>", "VIEW-D-10370");
         }
     });


     //버튼 - 작업정보 저장(정비캠페인)
     $("#btnWorkSave").kendoButton({
         click:function(e) {

             var lbrGrid = $('#dlrLbrGrid').data('kendoExtGrid');
             var selectedItem = lbrGrid.dataItem(lbrGrid.select());

             var saveData = lbrGrid.getCUDData("insertList", "updateList", "deleteList");

             if (lbrGrid.cudDataLength == 0) {
                 //변경된 정보가 없습니다.
                 dms.notification.info("<spring:message code='global.info.required.change'/>");
                 return;
             }

             if (lbrGrid.gridValidation()) {

                 $.ajax({
                     url:"<c:url value='/crm/mcm/marketingCampaign/multiWorks.do' />",
                     data:JSON.stringify(saveData),
                     type:'POST',
                     dataType:'json',
                     contentType:'application/json',
                     error:function(jqXHR,status,error) {
                         dms.notification.error(jqXHR.responseJSON.errors);
                     },
                     success:function(jqXHR, textStatus) {

                         lbrGrid.dataSource._destroyed = [];
                         lbrGrid.dataSource.page(1);

                         //정상적으로 반영 되었습니다.
                         dms.notification.success("<spring:message code='global.info.success'/>");
                     }
                     ,beforeSend:function(xhr){
                         dms.loading.show();
                     }
                     ,complete:function(xhr,status){
                         dms.loading.hide();
                     }
                 });
             }else{
                 //입력값을 확인하여 주십시오.
                 dms.notification.warning("<spring:message code='global.info.check.input'/>");
             }

         }
     });

     // 버튼 - 작업정보 삭제
     $("#btnWorkDel").kendoButton({
         click:function(e){

             // TODO 추출 대상자 확인후 추출 대상자가 없으면 삭제.
             var lbrGrid = $('#dlrLbrGrid').data('kendoExtGrid');
             var selectedItem = lbrGrid.dataItem(lbrGrid.select());

             if(selectedItem!=null) {

                 crNo = $("#makCd").val();
                 lbrCd = $("#lbrCd").val();

                 if (dms.string.isEmpty(selectedItem.lbrCd)) {
                     //목록을 선택하여 주십시오.
                     dms.notification.warning("<spring:message code='global.info.required.select'/>");
                     return false;

                 } else {

                     var rows = lbrGrid.select();
                     rows.each(function(index, row) {
                         lbrGrid.removeRow(row);
                     });
                 }
             } else {
                 //캠페인 목록을 먼저 선택해 주십시오.
                 dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
                 return false;
             }
         }
     });


     //버튼 - VIN_NO 엑셀 Import(정비캠페인)
     $("#btnVinNoExcelImport").kendoButton({
         click:function(e) {
             vinUploadPopupWin = dms.window.popup({
                 title:"<spring:message code='crm.btn.excelVinUpload' />"
                 ,width:800
                 ,height : 400
                 ,modal : true
                 ,windowId:"vinUploadPopupWin"
                 ,content:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectVinUploadPopup.do?dlrCd="+$("#dlrCd").val()+"&makCd="+$("#makCd").val()+"'/>"
                     ,data:{
                         "uploadFlag" : "VIN"
                        ,"callbackFunc":function(){
                             $('#vinGrid').data('kendoExtGrid').dataSource.read();
                             vinUploadPopupWin.close();
                         }
                     }
                 }
             });
         }
     });

     //버튼 - LTS MODEL 엑셀 Import(정비캠페인)
     $("#btnLtsModelExcelImport").kendoButton({
         click:function(e) {
             vinUploadPopupWin = dms.window.popup({
                 title:"<spring:message code='crm.btn.excelLtsModelUpload' />"
                 ,width:800
                 ,height : 400
                 ,modal : true
                 ,windowId:"vinUploadPopupWin"
                 ,content:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectVinUploadPopup.do?dlrCd="+$("#dlrCd").val()+"&makCd="+$("#makCd").val()+"'/>"
                     ,data:{
                         "uploadFlag" : "LTS"
                        ,"callbackFunc":function(){
                             $('#vinGrid').data('kendoExtGrid').dataSource.read();
                             vinUploadPopupWin.close();
                         }
                     }
                 }
             });
         }
     });

    //버튼 - 작업정보 저장(정비캠페인)
     $("#btnLaborSave").kendoButton({
         click:function(e) {

             var lbrGrid = $('#dlrLbrGrid').data('kendoExtGrid');
             var selectedItem = lbrGrid.dataItem(lbrGrid.select());

             var saveData = lbrGrid.getCUDData("insertList", "updateList", "deleteList");
             if (lbrGrid.cudDataLength == 0) {
                 //변경된 정보가 없습니다.
                 dms.notification.info("<spring:message code='global.info.required.change'/>");
                 return;
             }

             if (lbrGrid.gridValidation()) {

                 $.ajax({
                     url:"<c:url value='/crm/mcm/marketingCampaign/multiLabor.do' />",
                     data:JSON.stringify(saveData),
                     type:'POST',
                     dataType:'json',
                     contentType:'application/json',
                     error:function(jqXHR,status,error) {
                         dms.notification.error(jqXHR.responseJSON.errors);
                     },
                     success:function(jqXHR, textStatus) {

                         lbrGrid.dataSource._destroyed = [];
                         lbrGrid.dataSource.page(1);

                         //정상적으로 반영 되었습니다.
                         dms.notification.success("<spring:message code='global.info.success'/>");
                     }
                     ,beforeSend:function(xhr){
                         dms.loading.show();
                     }
                     ,complete:function(xhr,status){
                         dms.loading.hide();
                     }
                 });

             }else{
                 //입력값을 확인하여 주십시오.
                 dms.notification.warning("<spring:message code='global.info.check.input'/>");
             }
         }
     });

     // 부품추가 팝업
     $("#btnItemsAdd").kendoButton({
         click:function(e) {

             selectShareStockGiItemPopupWindow = dms.window.popup({
                 windowId:"selectShareStockGiItemPopupWindow"
                 ,width:800
                 ,height:550
                 ,title:"<spring:message code='par.title.itemInfo' />"   // 품목정보
                 ,content:{
                     url:"<c:url value='/par/cmm/selectShareStockGiItemPopup.do'/>"   /// AS-IS ser/cmm/popup/selectShareStockGiItemPopup.do
                     ,data:{
                         "autoBind":true
                         ,"selectable":"multiple"
                         ,"callbackFunc":function(parData){
                             if(parData.length > 0) {

                                 partsAdd(parData, "N");
                             }
                         }
                     }
                 }
             });
         }
     });

     //버튼 - 부품정보 저장(정비캠페인)
     $("#btnItemsSave").kendoButton({
         click:function(e) {

             var gridItem = $('#dlrItemGrid').data('kendoExtGrid');
             var selectedItem = gridItem.dataItem(gridItem.select());

             var saveData = gridItem.getCUDData("insertList", "updateList", "deleteList");
             if (gridItem.cudDataLength == 0) {
                 //변경된 정보가 없습니다.
                 dms.notification.info("<spring:message code='global.info.required.change'/>");
                 return;
             }

             if (gridItem.gridValidation()) {

                 $.ajax({
                     url:"<c:url value='/crm/mcm/marketingCampaign/multiItems.do' />",
                     data:JSON.stringify(saveData),
                     type:'POST',
                     dataType:'json',
                     contentType:'application/json',
                     error:function(jqXHR,status,error) {
                         dms.notification.error(jqXHR.responseJSON.errors);
                     },
                     success:function(jqXHR, textStatus) {

                         gridItem.dataSource._destroyed = [];
                         gridItem.dataSource.page(1);

                         //정상적으로 반영 되었습니다.
                         dms.notification.success("<spring:message code='global.info.success'/>");
                     }
                     ,beforeSend:function(xhr){
                         dms.loading.show();
                     }
                     ,complete:function(xhr,status){
                         dms.loading.hide();
                     }
                 });

             }else{
                 //입력값을 확인하여 주십시오.
                 dms.notification.warning("<spring:message code='global.info.check.input'/>");
             }
         }
     });

     // 버튼 - 부품정보 삭제
     $("#btnItemsDel").kendoButton({
         click:function(e){

             // TODO 추출 대상자 확인후 추출 대상자가 없으면 삭제.
             var gridItem = $('#dlrItemGrid').data('kendoExtGrid');
             var selectedItem = gridItem.dataItem(gridItem.select());

             if(selectedItem!=null) {

                 crNo = $("#makCd").val();
                 lbrCd = $("#lbrCd1").val();
                 cauItemCd = $("#cauItemCd").val();
                 ltsModelCd = $("#ltsModelCd").val();

                 if (dms.string.isEmpty(selectedItem.itemCd)) {
                     //목록을 선택하여 주십시오.
                     dms.notification.warning("<spring:message code='global.info.required.select'/>");
                     return;

                 } else {

                     var rows = gridItem.select();
                     rows.each(function(index, row) {
                         gridItem.removeRow(row);
                     });
                     /*
                     var param = {
                             "crNo":crNo
                             ,"lbrCd":lbrCd
                             ,"cauItemCd":cauItemCd
                             ,"ltsModelCd":ltsModelCd
                             };

                     $.ajax({
                             url:"<c:url value='/crm/mcm/marketingCampaign/deleteItems.do' />"
                             ,data:JSON.stringify(param)      //파라미터
                             ,type:'POST'                        //조회요청
                             ,dataType:'json'                  //json 응답
                             ,contentType:'application/json'   //문자열 파라미터
                             ,error:function(jqXHR,status,error){
                                 dms.notification.error(jqXHR.responseJSON.errors);
                             }
                             ,success:function(data) {
                                 dms.notification.success("<spring:message code='global.info.success'/>");
                                 $("#lbrCd1").val("");
                                 $("#cauItemCd").val("");
                                 $("#ltsModelCd").val("");
                                 $("#itemsGrid").data("kendoExtGrid").dataSource.read();
                             }
                             ,beforeSend:function(xhr){
                                 dms.loading.show();
                             }
                             ,complete:function(xhr,status){
                                 dms.loading.hide();
                             }
                     }); */
                 }

             } else {
                 //캠페인 목록을 먼저 선택해 주십시오.
                 dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
             }

         }

     });

     //대상 딜러탭
     //버튼 - 저장
     $("#btnDlrSelect").kendoButton({
         click:function(e) {
             var grid = $('#mcdGrid').data('kendoExtGrid');
             var selectedItem = grid.dataItem(grid.select());

             if(selectedItem!=null) {
                 var targDlrGrid = $("#targDlrGrid").data("kendoExtGrid");
                 var saveData = targDlrGrid.getCUDData("insertList", "updateList", "deleteList");

                 if (targDlrGrid.cudDataLength == 0) {
                     //변경된 정보가 없습니다.
                     dms.notification.info("<spring:message code='global.info.required.change'/>");
                     return;
                 };

                 var params = {};
                 params["tDlrCd"] = $("#dlrCd").val();
                 params["tMakCd"] = $("#makCd").val();
                 params["insertDlrCdVO"] = targDlrGrid.dataSource.data();

                 $.ajax({
                     url:"<c:url value='/crm/mcm/marketingCampaign/saveDlrCdData.do' />"
                     ,data:JSON.stringify(params)
                     ,type:'POST'
                     ,dataType:'json'
                     ,contentType:'application/json'
                     ,error:function(jqXHR, status, error) {
                         dms.notification.error(jqXHR.responseJSON.errors);
                     }
                     ,success:function(jqXHR, textStatus) {
                         targDlrGrid.dataSource._destroyed = [];
                         targDlrGrid.dataSource.page(1);

                         //정상적으로 반영 되었습니다.
                         dms.notification.success("<spring:message code='global.info.success'/>");
                     }
                     ,beforeSend:function(xhr){
                         dms.loading.show();
                     }
                     ,complete:function(xhr,status){
                         dms.loading.hide();
                     }
                 });
              } else {
                 //캠페인 목록을 먼저 선택해 주십시오.
                 dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
              }
        }
     });

      // 추가
     $("#btnAddR").kendoButton({
         click:function(e){

             var mcdGrid = $('#mcdGrid').data('kendoExtGrid');
             var selectedItem = mcdGrid.dataItem(mcdGrid.select());

             if ( selectedItem != null && selectedItem.statCd != "02" && selectedItem.statCd != "03" && selectedItem.statCd != "06" ) {
                 var dlrGrid = $("#dlrGrid").data("kendoExtGrid");
                 var rows = dlrGrid.select();
                 var dataItem;

                 if(rows.length > 0){

                     rows.each(function(idx, row) {
                         dataItem = dlrGrid.dataItem(row);
//                          console.log(dataItem);

                         if(!isTargetModelGrid(dataItem.dlrCd)){
                              $("#targDlrGrid").data("kendoExtGrid").dataSource.insert(idx, {
                                   targDlrCd  : dataItem.dlrCd
                                  ,targDlrNm  : dataItem.dlrNm
                                  ,targYn     : "Y"
                                  ,flagYn     : "Y"
                                  ,makCd      : $("#makCd").val()
                              });
                          }
                      });

                     rows.each(function(idx, row) {
                          dlrGrid.removeRow(row);
                      });

                 }
             }
         }
     });

    // 삭제
    $("#btnDelR").kendoButton({
        click:function(e){

            var mcdGrid = $("#mcdGrid").data("kendoExtGrid");
            var selectedItem = mcdGrid.dataItem(mcdGrid.select());

            if ( selectedItem != null && selectedItem.statCd != "02" && selectedItem.statCd != "03" && selectedItem.statCd != "06" ) {

                var targDlrGrid = $("#targDlrGrid").data("kendoExtGrid");
                var selectRows = targDlrGrid.select();

                if(selectRows.length  == 0 ){
                    //삭제할 데이터가 없습니다.
                    dms.notification.warning("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.notExistData' arguments='${del},' />");
                    return false;
                }

                if(selectRows.length > 0) {

                    $.each(selectRows, function(idx, val){
                        var data = targDlrGrid.dataItem(val);
//                         console.log(data);

                        $("#dlrGrid").data("kendoExtGrid").dataSource.insert(idx, {
                            dlrCd   : data.targDlrCd
                            ,dlrNm  : data.targDlrNm
                        });

                    });

                    selectRows.each(function(index, row){
                        targDlrGrid.removeRow(row);
                    });
                }

            }
        }
    });


/*************************************************************
 * DataSource 영역
 *************************************************************/

/*************************************************************
 *   그리드 셋팅
*************************************************************/

     //그리드 설정(캠페인 마스터)
     $("#mcdGrid").kendoExtGrid({
         gridId:"G-CRM-0722-123001"
         ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectMarketingCampaigns.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if (operation === "read") {
                         var params = {};
                         params["recordCountPerPage"]    = options.pageSize;
                         params["pageIndex"]             = options.page;
                         params["firstIndex"]            = options.skip;
                         params["lastIndex"]             = options.skip + options.take;
                         params["sort"]                  = options.sort;
                         params["sMakNm"]      = $("#sMakNm").val();
                         params["sMakCd"]      = $("#sMakCd").val();
                         params["sHostCd"]     = $("#sHostCd").val();
                         params["sMakTpCd"]    = $("#sMakTpCd").val();
                         params["sMakSubTpCd"] = $("#sMakSubTpCd").val();
                         params["sStatCd"]     = $("#sStatCd").val();
                         params["sStartDt"]    = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                         params["sEndDt"]      = $("#sEndDt").data("kendoExtMaskedDatePicker").value();

                         //console.log(kendo.stringify(params));
                         return kendo.stringify(params);
                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                 errors:"error"
                 ,data :"data"
                 ,total:"total"
                 ,model:{
                     id:"makCd"
                     ,fields:{
                         rnum:{type:"number", editable:false}
                         , makCd:{type:"string", editable:false}
                         , makNm:{type:"string", editable:false}
                         , regDtFormat:{type:"date", editable:false}
                         , hostCd:{type:"string", editable:false}
                         , hostNm:{type:"string", editable:false}
                         , statCd:{type:"string", editable:false}
                         , statNm:{type:"string", editable:false}
                         , makTpCd:{type:"string", editable:false}
                         , makTpSubTpNm:{type:"string", editable:false}
                         , targCustCnt:{type:"number", editable:false}
                         , realCustCnt:{type:"number", editable:false}
                         , startDt:{type:"date", editable:false}
                         , startDtFormat:{type:"date", editable:false}
                         , endDt:{type:"date", editable:false}
                         , endDtFormat:{type:"date", editable:false}
                         , budgetAmt:{type:"number", editable:false}
                         , regUsrId:{type:"string", editable:false}
                         , saleStartDt:{type:"date", editable:false}
                         , saleStartDtFormat:{type:"date", editable:false}
                         , saleEndDt:{type:"date", editable:false}
                         , saleEndDtFormat:{type:"date", editable:false}
                         , creStartDt:{type:"date", editable:false}
                         , creStartDtFormat:{type:"date", editable:false}
                         , creEndDt:{type:"date", editable:false}
                         , creEndDtFormat:{type:"date", editable:false}
                         , crEndTp:{type:"string", editable:false}
                         , activeNm:{type:"string", editable:false}
                         , activeCont:{type:"string", editable:false}
                         , adInvtHm:{type:"string", editable:false}
                         , adMediaCd:{type:"string", editable:false}
                         , adCostAmt:{type:"number", editable:false}
                         , adStartDt:{type:"string", editable:false}
                         , adEndDt:{type:"string", editable:false}
                         , dlrCd:{type:"string", editable:false}
                         , pltCd:{type:"string", editable:false}
                     }
                 }
                 ,parse:function(d) {
                     if(d.data){
                         $.each(d.data, function(idx, elem) {
                             elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                             elem.startDtFormat = kendo.parseDate(elem.startDt, "<dms:configValue code='dateFormat' />");
                             elem.endDtFormat = kendo.parseDate(elem.endDt, "<dms:configValue code='dateFormat' />");
                             elem.saleStartDtFormat = kendo.parseDate(elem.saleStartDt, "<dms:configValue code='dateFormat' />");
                             elem.saleEndDtFormat = kendo.parseDate(elem.saleEndDt, "<dms:configValue code='dateFormat' />");
                             elem.creStartDtFormat = kendo.parseDate(elem.creStartDt, "<dms:configValue code='dateFormat' />");
                             elem.creEndDtFormat = kendo.parseDate(elem.creEndDt, "<dms:configValue code='dateFormat' />");
                         });
                     }
                     return d;
                 }
             }
             ,requestEnd:function(e){
                 if (e.type !== "read"){
                     //this.page(1);
                 }
             }
         }
         ,dataBound:function(e) {
             // 캠페인목록에서 makCd 가지고 온경우 해당 grid dataBound 시 makCd 찾아서 선택, 상세조회 이벤트 준다
             var grid = $("#mcdGrid").data("kendoExtGrid")
             , rows = grid.tbody.find("tr")
             , gridData
             , selectRow
             if ( isGridReload && dms.string.isNotEmpty(resultKey) ) {
                 rows.each(function(index, row) {
                     gridData = grid.dataSource.at(index);
                     if ( gridData.makCd === resultKey ) {
                         selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(index);
                         grid.select(selectRow);
                     }
                 });
                 isGridReload = false;
             }
         }
/*          ,change:function(e){
             var selectedItem = this.dataItem(this.select());
             viewDetail(selectedItem, 0);
         } */
         ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
            ,{field:"makCd", title:"<spring:message code='global.lbl.crNo' />", width:130, attributes:{"class":"ac"}, sortable:true}       // 캠페인코드
            ,{field:"makNm", title:"<spring:message code='global.lbl.crNm' />", width:200, sortable:true}      // 캠페인명
            ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt' />", width:150, sortable:true
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.regDt, '<dms:configValue code='dateTimeFormat' />') #"
            }
            ,{field:"hostCd", title:"<spring:message code='global.lbl.hostCd' />", hidden:true}                       // 주최
            ,{field:"hostNm", title:"<spring:message code='global.lbl.hostCd' />", width:100, attributes:{"class":"ac"}, sortable:false}       // 주최
            ,{field:"statCd", title:"<spring:message code='global.lbl.statNm' />", hidden:true, sortable:false}   // 상태
            ,{field:"statNm", title:"<spring:message code='global.lbl.statNm' />", width:100, attributes:{"class":"ac"}, sortable:false}   // 상태
            ,{field:"makTpCd", title:"<spring:message code='global.lbl.type' />", hidden:true, sortable:false}    // 유형
            ,{field:"makTpSubTpNm", title:"<spring:message code='global.lbl.type' />", width:150, attributes:{"class":"ac"}, sortable:false}    // 유형
            ,{field:"targCustCnt", title:"<spring:message code='global.lbl.targCustCnt' />", width:100, attributes:{"class":"ar"}, sortable:true}    // 목표인수
            ,{field:"realCustCnt", title:"<spring:message code='global.lbl.useper' />", width:100, attributes:{"class":"ar"}, sortable:true
                ,template:function(dataItem){
                    var spanObj = "<a href='#' class='popTargExtractList'>"+dataItem.realCustCnt+"</a>";
                    return spanObj;
                }
            } // 참여인력
            ,{field:"startDtFormat", title:"<spring:message code='global.lbl.startDt' />", width:100, sortable:true
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#if (startDtFormat !== null ){# #= kendo.toString(data.startDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
            }
            ,{field:"endDtFormat", title:"<spring:message code='global.lbl.EndDt' />", width:100, sortable:true
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#if (endDtFormat !== null ){# #= kendo.toString(data.endDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
            }
            ,{field:"budgetAmt", title:"<spring:message code='global.lbl.budgetAmt' />", width:100, attributes:{"class":"ar"},  format:"{0:n2}", sortable:true}    // 예산
            ,{field:"regUsrId", title:"<spring:message code='global.lbl.regUsrId' />", width:100, attributes:{"class":"ac"}, sortable:true}    // 등록자
            ,{field:"creStartDtFormat", title:"<spring:message code='ser.lbl.creStartDt' />", width:100, sortable:true
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.creStartDt == null ? '':data.creStartDt, '<dms:configValue code='dateFormat' />') #"
            }
            ,{field:"creEndDtFormat", title:"<spring:message code='ser.lbl.creEndDt' />", width:100, sortable:true
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.creEndDt == null ? '':data.creEndDt, '<dms:configValue code='dateFormat' />') #"
            }
            ,{field:"saleStartDtFormat", title:"<spring:message code='ser.lbl.saleStartDt' />", width:100, sortable:true
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.saleStartDt == null ? '':data.saleStartDt, '<dms:configValue code='dateFormat' />') #"
            }
            ,{field:"saleEndDtFormat", title:"<spring:message code='ser.lbl.saleEndDt' />", width:100, sortable:true
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.saleEndDt == null ? '':data.saleEndDt, '<dms:configValue code='dateFormat' />') #"
            }
            ,{field:"crEndTp", title:"<spring:message code='ser.lbl.endYn' />", width:100, attributes:{"class":"ac"}, sortable:true}       // 종료여부
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
            ,{field:"pltCd", title:"<spring:message code='global.lbl.pltCd' />", hidden:true}                       // 사업장코드
         ]
         , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
         , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
         , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
         , appendEmptyColumn:false          //빈컬럼 적용. default:false
         , enableTooltip:true               //Tooltip 적용, default:false
         , navigatable:true
         , selectable:"row"
     });

    //그리드 설정(목표)
     $("#goalGrid").kendoExtGrid({
         gridId:"G-CRM-0722-123002"
         ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectGoals.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if (operation === "read") {
                         var params = {};
                         params["sort"]         = options.sort;
                         params["sDlrCd"]       = $("#dlrCd").val();
                         params["sPltCd"]       = $("#pltCd").val();
                         params["sMakCd"]       = $("#makCd").val();

                         return kendo.stringify(params);
                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                 model:{
                     id:"seq"
                     ,fields:{
                         rnum:{type:"number", editable:false}
                         , makCd:{type:"string", editable:false}
                         , seq:{type:"string", editable:false}
                         , targCd:{type:"string", editable:false}
                         , targNm:{type:"string", validation:{required:true}}
                         , targCntVal:{type:"number", validation:{required:true}}
                         , dlrCd:{type:"string"}
                         , pltCd:{type:"string"}
                     }
                 }
             }
         }
         ,edit:function(e) {
             if(!e.model.isNew()) {
                 if (!dms.string.isEmpty(e.model.targCd) && e.sender.columns[e.container.index()].field == "targNm") {
                     this.closeCell();
                 }
             }
             e.container.find("input[name=targNm]").keyup(function(){
                 txtLimit(this, '200');
             });
         }
         ,dataBound:function(e) {
             var that = this;
             var rows = that.tbody.find("tr");
             rows.each(function(idx, row){
                 var dataItem = that.dataItem(row);
                 if (!dms.string.isEmpty(dataItem.targCd)) {
                     $("input.grid-checkbox-item", row).prop("disabled", true);
                 }
             });
         }
         ,change:function(e) {
             var that = this;
             var rows = that.select();
             rows.each(function(idx, row) {
                 var dataItem = that.dataItem(row);
                 if (!dms.string.isEmpty(dataItem.targCd)) {
                     $(row).removeClass('k-state-selected k-state-selecting');
                 }
             });
         }
         , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
         , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
         //, multiSelectWithCheckbox:true     //멀티선택 적용. default:false
         , appendEmptyColumn:true           //빈컬럼 적용. default:false
         , enableTooltip:true               //Tooltip 적용, default:false
         , pageable:false
         , sortable:false
         , filterable:false
         , selectable:"multiple"
         , height:400
         , columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
            ,{field:"makCd", title:"<spring:message code='global.lbl.crNo' />", hidden:true}       // 캠페인코드
            ,{field:"seq", title:"<spring:message code='global.lbl.budgetCd' />", hidden:true}
            ,{field:"targCd", title:"<spring:message code='global.lbl.targ' />", hidden:true}
            ,{field:"targNm", title:"<spring:message code='global.lbl.targ' />", width:700}       // 상세내역
            ,{field:"targCntVal", title:"<spring:message code='global.lbl.targCntVal' />", width:100
                , attributes:{"class":"ar"}
                , format:"{0:n0}"
                , decimal:0
                , editor:function(container, options){
                    $('<input id="targCntVal" data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                            format: "n0"
                            ,decimals:0
                            ,restrictDecimals: true
                            ,min:0
                            ,spinners:false
                        });
                    }
            }   // 목표수치
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
            ,{field:"pltCd", title:"<spring:message code='global.lbl.pltCd' />", hidden:true}                       // 사업장코드
         ]
     });

    //대상자 그리드 설정
    $("#targetGrid").kendoExtGrid({
        gridId:"G-CRM-0722-123003"
        ,dataSource:{
              transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectTargets.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if (operation === "read") {
                         var params = {};

                         params["sort"]         = options.sort;
                         params["sDlrCd"]       = $("#dlrCd").val();
                         params["sPltCd"]       = $("#pltCd").val();
                         params["sMakCd"]       = $("#makCd").val();

                         return kendo.stringify(params);
                     } else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                 model:{
                     id:"extrDgreCnt"
                     ,fields:{
                         extrDgreCnt:{type:"string", editable:false}
                         ,custExtrTermNo:{type:"string", editable:false}
                         ,custExtrTitleNm:{type:"string", editable:false}
                         ,extrStatCd:{type:"string", editable:false}
                         ,realTargetCnt:{type:"number", editable:false}
                         ,extrDt:{type:"date", editable:false}
                         ,custExtrAutoYn:{type:"string", editable:false}
//                         ,custExtrCycleCont:{type:"string", editable:false}
                         ,custExtrCycleTp:{type:"string", editable:false} /* 고객추출주기유형 */
                         ,dupYn:{type:"string", editable:false}
                     }
                 }
             }
         }
         ,change:function(e){
             var selectedItem = this.dataItem(this.select());
             if (selectedItem != null) {
                 //고객추출조건(입력부).   targExtractList
                 custExtrTermNoDDL();

                 // 추출차수
                 $("#extrDgreCnt").val(selectedItem.extrDgreCnt);
                 // 추출조건번호
                 $("#custExtrTermNo").data("kendoExtDropDownList").value(selectedItem.custExtrTermNo);
                 $("#custExtrTermNo").data("kendoExtDropDownList").text(selectedItem.custExtrTitleNm);
                 // 추출조건제목
                 $("#custExtrTitleNm").val(selectedItem.custExtrTitleNm);
                 // 고객추출자동여부
//                  console.log("custExtrAutoYn YY : " + selectedItem.custExtrAutoYn);
                 $("#custExtrAutoYn").data("kendoExtDropDownList").value(selectedItem.custExtrAutoYn);

                 if(selectedItem.custExtrAutoYn == "Y"){
                     cycleCheckDisFalse();
                 }else{
                     cycleCheckDisTrue();
                 }
                 // 중복여부
                 $("#dupYn").data("kendoExtDropDownList").value(selectedItem.dupYn);
                 //고객대상자 수
                 $("#realTargetCnt").val(selectedItem.realTargetCnt);

                 // ###################################################### 추출주기설정 5/5 상세 조회 시작
                 cycleFormInit();
                 custExtrCycleDt = [];
                 $("#cycleDt").val("");
                 $("input[name=custExtrCycleWeek]:checkbox").prop("checked",false);

                 if( selectedItem.custExtrCycleTp === "S") {

                     $("#btnCycleSelect").click();

                     var cycleDatepicker = $("#cycleDatepicker").data("kendoDatePicker");
                     cycleDatepicker.close();

                     var tmpCustExtrCycleDt = [];
                     // 날짜선택
                     var resultArray = selectedItem.custExtrCycleCont.split(',');
                     $.each(resultArray, function(idx, row){
                         tmpCustExtrCycleDt.push(kendo.parseDate(row.trim(), "yyyyMMdd"));
                     });

                     custExtrCycleDt = tmpCustExtrCycleDt;

                     // 최종 선택된 날짜를 텍스트 박스에 뿌려준다.
                     dtToString(custExtrCycleDt);

                 } else if( selectedItem.custExtrCycleTp === "W") {

                     $("#btnCycleWeek").click();

                     // 요일 체크박스 체크
                     var resultArray = selectedItem.custExtrCycleCont.split(',');
                     $("input[name=custExtrCycleWeek]:checkbox").prop("checked", false);
                     $.each(resultArray, function(idx, row){
                         $("#custExtrCycleWeek_"+row.trim()).prop("checked", true);
                     });

                 } else if( selectedItem.custExtrCycleTp === "D") {

                     $("#btnCycleDay").click();

                 };
                 // 상세 조회 후 달력 클릭시 자꾸 이전에 선택된 달력 날짜가 찍힘. 그래서 초기화.
                 if ( custExtrCycleDt.length == 0 ) {

                     var cycleDatepicker = $("#cycleDatepicker").data("kendoDatePicker");
                     cycleDatepicker.setOptions({
                          month:{
                              empty:'-'
                          }
                     });

                 };
                 var param = {
                         "sSeq":"0"
                         };
                 $.ajax({
                         url:"<c:url value='/crm/css/satisFactionManage/selectSatisFactionBatchCnt.do' />"
                         ,data:JSON.stringify(param)      //파라미터
                         ,type:'POST'                        //조회요청
                         ,dataType:'json'                  //json 응답
                         ,contentType:'application/json'   //문자열 파라미터
                         //,async:false
                         ,error:function(jqXHR,status,error){
                             dms.notification.error(jqXHR.responseJSON.errors);
                         }
                 }).done(function(body) {


                 });
                 // ###################################################### 추출주기설정 5/5 상세 조회 종료
             }
         }
         ,dataBound:function (e) {

         }
         , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
         , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
         , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
         , appendEmptyColumn:true           //빈컬럼 적용. default:false
         , enableTooltip:true               //Tooltip 적용, default:false
         , sortable:false
         , filterable:false
         , height:290
         , columns:[
             {field:"extrDgreCnt", hidden:true}
             ,{field:"custExtrTermNo", hidden:true}
             ,{field:"custExtrTitleNm", title:"<spring:message code='crm.lbl.custExtrTermNo' />", width:200 ,attributes:{"class":"al"}
                 ,template:function(dataItem){
                     var spanObj = "<a href='#' class='linkCustExtrTermNo'>"+dataItem.custExtrTitleNm+"</a>";
                     return spanObj;
                 }
             }
             ,{field:"extrStatCd", title:"<spring:message code='crm.lbl.extrStatCd' />", width:100 ,attributes:{"class":"ac"}}
             ,{field:"realTargetCnt", title:"<spring:message code='crm.lbl.pointExtUsrCnt' />", width:100, attributes:{"class":"ar"}
                 ,template:function(dataItem){
                     var spanObj = "<a href='#' class='popTargExtractDetailList'>"+dataItem.realTargetCnt+"</a>";
                     return spanObj;
                 }
             }
             ,{field:"extrDt", title:"<spring:message code='crm.lbl.extrDt' />", width:100 ,attributes:{"class":"ac"}
                       ,format:"{0:<dms:configValue code='dateFormat' />}"
             }
             ,{field:"custExtrAutoYn", title:"<spring:message code='crm.lbl.custExtrAutoYn' />", width:100 ,attributes:{"class":"ac"}}
             ,{//고객추출주기유형
                 field:"custExtrCycleTp" , title:"<spring:message code='crm.lbl.custExtrCycleTp'/>" , width:100
                 ,attributes:{"class":"ac"}
                 ,template:function(dataItem){

                     var custExtrCycleTpNm = "";
                     var custExtrCycleTp = dataItem.custExtrCycleTp;
                     if ( custExtrCycleTp === "D" ) {
                         custExtrCycleTpNm = "<spring:message code='crm.btn.allDay' />";     //매일
                     } else if ( custExtrCycleTp === "W" ) {
                         custExtrCycleTpNm = "<spring:message code='crm.btn.allWeek' />";    //매주
                     } else if ( custExtrCycleTp === "S" ) {
                         custExtrCycleTpNm = "<spring:message code='global.btn.select' />";  //선택
                     };
                     return custExtrCycleTpNm;

                 }
             }
             ,{ field:"custExtrCycleCont", hidden:true }     // TODO 추후 삭제
             ,{field:"dupYn", title:"<spring:message code='crm.lbl.dupYn' />", width:100 ,attributes:{"class":"ac"}
                ,template:'#if(dupYn !== "") {# #= targExtractDupMap[dupYn]# #}#'
             }
         ]
    });

    //대상자 excel 내보니기 그리드 설정
    $("#targExcelGrid").kendoExtGrid({
        dataSource:{
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

                        params["sDlrCd"]          = $("#dlrCd").val();
                        params["sMakCd"]          = $("#makCd").val();
                        //params["sExtrDgreCnt"]    = $("#extrDgreCnt").val();

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
                    }
                }
            }
        }
        ,filterable:false
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}}
            ,{field:"dlrCd", hidden:true}
            ,{field:"makCd", hidden:true}
            ,{field:"custNo", hidden:true}
            ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100, attributes:{"class":"ac"}}
            ,{field:"hpNo", title:"<spring:message code='global.lbl.cellphone' />", width:100, attributes:{"class":"ac"}}
            ,{field:"addrDetlCont", title:"<spring:message code='par.lbl.addr' />", width:300, attributes:{"class":"al"}}
            ,{field:"emailNm", title:"<spring:message code='global.lbl.emailNm' />", width:200, attributes:{"class":"al"}}
            ,{field:"wechatId", title:"<spring:message code='global.lbl.wechat' />", width:150, attributes:{"class":"al"}}
        ]
        ,height:290
    });

     //그리드 설정(예산)
     $("#budgetGrid").kendoExtGrid({
         gridId:"G-CRM-0722-123004"
         ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectBudgets.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if (operation === "read") {
                         var params = {};
                         params["sort"]         = options.sort;
                         params["sDlrCd"]       = $("#dlrCd").val();
                         params["sPltCd"]       = $("#pltCd").val();
                         params["sMakCd"]       = $("#makCd").val();
                         return kendo.stringify(params);
                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                     model:{
                         id:"budgetCd"
                         ,fields:{
                             makCd:{type:"string", editable:false}
                             , budgetCd:{type:"string", validation:{required:true}}
                             , budgetDetlCont:{type:"string"}
                             , budgetAmt:{type:"number", validation:{required:true}}
                             , corpBudnRate:{type:"number", validation:{required:true}}
                             , imsSuptAmt:{type:"number", validation:{required:true}}
                             , dlrCd:{type:"string"}
                             , pltCd:{type:"string"}
                         }
                     }
             }
//              ,aggregate:[{ field:"budgetAmt", aggregate:"sum" },
//                            { field:"imsSuptAmt", aggregate:"sum" }]
         }
         ,edit:function(e) {
             e.container.find("input[name=budgetDetlCont]").keyup(function(){
                 txtLimit(this, '1000');
             });
             e.container.find("input[name=budgetAmt]").change(function(){
                 var data = e.model;
                 data.set("budgetAmt", Number($(this).val().replace(/\,/gi,"")));

                 if(data.budgetAmt < 0){
                     dms.notification.warning("<spring:message code='crm.info.budgetAmtIsNotMinus' />");
                     $(this).val(Number(0));
                     return;
                 }
                 if((Number($(this).val()) - (Number(data.imsSuptAmt))) < 0){
                     dms.notification.warning("<spring:message code='crm.info.budgetAmtcanNotLessThanImsSuptAmtAndCorpBudnRate' />");
                     return;
                 }else{
                     data.set("corpBudnRate", Number($(this).val()) - (Number(data.imsSuptAmt)));
                 }

                 budgetGridSum();
             });
             e.container.find("input[name=corpBudnRate]").change(function(){
                 var data = e.model;
                 data.set("corpBudnRate", Number($(this).val().replace(/\,/gi,"")));

                 if(data.corpBudnRate < 0){
                     dms.notification.warning("<spring:message code='crm.info.budgetAmtIsNotMinus' />");
                     $(this).val(Number(0));
                     return;
                 }
                 if(dms.string.isNotEmpty(data.corpBudnRate)){
                     if(data.corpBudnRate > data.budgetAmt ){
                         dms.notification.warning("<spring:message code='crm.info.canNotGreaterThanbudgetAmt' />");
                         return;
                     }
                 }

                 data.set("imsSuptAmt", Number(data.budgetAmt) - (Number($(this).val())));
                 budgetGridSum();
             });
             e.container.find("input[name=imsSuptAmt]").change(function(){
                 var data = e.model;
                 data.set("imsSuptAmt", Number($(this).val().replace(/\,/gi,"")));

                 if(data.imsSuptAmt < 0){
                     dms.notification.warning("<spring:message code='crm.info.budgetAmtIsNotMinus' />");
                     $(this).val(Number(0));
                     return;
                 }
                 if(dms.string.isNotEmpty(data.imsSuptAmt)){
                     if(data.imsSuptAmt > data.budgetAmt ){
                         dms.notification.warning("<spring:message code='crm.info.canNotGreaterThanbudgetAmt' />");
                         return;
                     }
                 }

                 data.set("corpBudnRate", Number(data.budgetAmt) - (Number($(this).val())));
                 budgetGridSum();
             });
         }
         , dataBound:budgetGridSum
         , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
         , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
         , multiSelectWithCheckbox:true     //멀티선택 적용. default:false
         , appendEmptyColumn:false          //빈컬럼 적용. default:false
         , enableTooltip:true               //Tooltip 적용, default:false
         , pageable:false
         , sortable:false
         , filterable:false
         , height:400
         , editableOnlyNew:true
         , editableOnlyNewExcludeColumns:["budgetCd","budgetDetlCont","budgetAmt","corpBudnRate","imsSuptAmt"]
         , columns:[
            {field:"makCd", title:"<spring:message code='global.lbl.crNo' />", hidden:true}       // 캠페인코드
            ,{field:"budgetCd", title:"<spring:message code='global.lbl.budgetCd' />", width:80} //비용항목
            ,{field:"budgetDetlCont", title:"<spring:message code='global.lbl.budgetDetlCont' />"}       // 상세내역
            ,{field:"budgetAmt", title:"<spring:message code='global.lbl.budgetAmt' />", width:150, attributes:{"class":"ar"}
              , format:"{0:n2}"
              , decimal:2
              //,footerTemplate:"#=kendo.toString(sum, 'n0')#"
              , footerTemplate:"<span id='budgetGridBudgetAmtSum'></span>"
              , footerAttributes:{style:"text-align:right;"}
            }    // 예산(위안)
            ,{field:"corpBudnRate", title:"<spring:message code='global.lbl.corpBudnRate' />", width:150, attributes:{"class":"ar"}
              , format:"{0:n2}"
              , decimal:2
//               ,footerTemplate:"#=kendo.toString(sum, 'n0')#"
              , footerTemplate:"<span id='budgetGridCorpBudnRateSum'></span>"
              , footerAttributes:{style:"text-align:right;"}
            }   // 본딜러부담(위안)
            ,{field:"imsSuptAmt", title:"<spring:message code='global.lbl.imsSuptAmt' />", width:150, attributes:{"class":"ar"}
              , format:"{0:n2}"
              , decimal:2
//               ,footerTemplate:"#=kendo.toString(sum, 'n0')#"
              , footerTemplate:"<span id='budgetGridImsSuptAmtSum'></span>"
              , footerAttributes:{style:"text-align:right;"}
            }    // 제조사부담(위안)
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
            ,{field:"pltCd", title:"<spring:message code='global.lbl.pltCd' />", hidden:true}                       // 사업장코드
         ]
     });



    //결재 라인 그리드 설정
    $("#signLineGrid").kendoExtGrid({
        gridId:"G-CRM-0722-123005"
        ,dataSource:{
              transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectDocLineExs.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};
                         params["sort"]         = options.sort;
                         params["sSignDocId"] = $("#signDocId").val();
                         if( $("#apprDocNo").val() != "" ) {
                             params["sSignDocNo"] = $("#apprDocNo").val();
                         }
                         return kendo.stringify(params);
                     } else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                 model:{
                     id:"signDocLineNo"
                     ,fields:{
                         rnum:{type:"number", editable:false}
                         ,signDocId:{type:"string", validation:{required:true}}
                         ,signDocLineNo:{type:"string",editable:false}
                         ,signTp:{type:"string", validation:{required:true}}
                         ,signUsrId:{type:"string", validation:{required:true}}
                         ,signUsrNm:{type:"string", validation:{required:true}}
                         ,signPstiCd:{type:"string", validation:{required:true}}
                         ,signPstiNm:{type:"string", validation:{required:true}}
                         ,signDeptCd:{type:"string", validation:{required:true}}
                         ,signDeptNm:{type:"string", validation:{required:true}}
                         ,signStatCd:{type:"string", editable:false}
                         ,signRsltCd:{type:"string", editable:false}
                         ,signDt    :{type:"date", editable:false}
                         ,signCont  :{type:"string"}
                     }
                 }
             }
         }
         ,edit:function(e) {
             var data = e.model;
             if (($("#apprDocNo").val() == "" || $("#apprDocNo").val() == null || data.signUsrId != "${userId}" || data.signStatCd != "02") &&
                 e.sender.columns[e.container.index()].field == "signCont") {
                 this.closeCell();
             }

             e.container.find("input[name=signCont]").keyup(function(){
                 txtLimit(this, '4000');
                 $("#signCont").val($(this).val());
             });
         }
         ,change:function(e){

             var selectedItem = this.dataItem(this.select());

             if (selectedItem != null) {
                 // 결재의견
                 $("#signCont").val(selectedItem.signCont);
             }

         }
         ,dataBound:function (e) {

             var evalDs = this.dataSource;
             var iRowCnt = evalDs.total();

             if( $("#apprDocNo").val() != "" && $("#apprDocNo").val() != null ){

                 for(var i = 0; i < iRowCnt; i++){
                     if(evalDs.at(i).signUsrId == "${userId}" && evalDs.at(i).signStatCd == "02"){
                         $("#btnEval").data("kendoButton").enable(true);
                         $("#btnReject").data("kendoButton").enable(true);
                         $("#btnEvalReq").data("kendoButton").enable(false);
                         break;
                     }else if(evalDs.at(i).signStatCd == "04"){
                         $("#btnEval").data("kendoButton").enable(false);
                         $("#btnReject").data("kendoButton").enable(false);
                         $("#btnEvalReq").data("kendoButton").enable(true);
                         break;
                     }else{
                         $("#btnEval").data("kendoButton").enable(false);
                         $("#btnReject").data("kendoButton").enable(false);
                         $("#btnEvalReq").data("kendoButton").enable(false);
                     }
                 }
//                 $("#btnEvalAdd").data("kendoButton").enable(false);
//                 $("#btnEvalDel").data("kendoButton").enable(false);
             }else{
                 if($("#statCd").val() != "03" && $("#statCd").val() != "05"){
                     $("#btnEval").data("kendoButton").enable(false);
                     $("#btnReject").data("kendoButton").enable(false);
                     $("#btnEvalReq").data("kendoButton").enable(true);
//                     $("#btnEvalAdd").data("kendoButton").enable(true);
//                     $("#btnEvalDel").data("kendoButton").enable(true);
                 }else{
                     $("#btnEval").data("kendoButton").enable(false);
                     $("#btnReject").data("kendoButton").enable(false);
                     $("#btnEvalReq").data("kendoButton").enable(false);
//                     $("#btnEvalAdd").data("kendoButton").enable(true);
//                     $("#btnEvalDel").data("kendoButton").enable(true);
                 }

             }

         }
         , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
         , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
         , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
         , appendEmptyColumn:true           //빈컬럼 적용. default:false
         , enableTooltip:true               //Tooltip 적용, default:false
         ,editableOnlyNew:true
         ,editableOnlyNewExcludeColumns:["signUsrNm", "signCont"]
         ,sortable:false
         ,filterable:false
         ,height:400
         ,columns:[
               {field:"signDocId", hidden:true}
               ,{field:"signDocLineNo", title:"<spring:message code='crm.lbl.abbreviationForNumber' />", width:100 ,attributes:{"class":"ac"}}
               ,{field:"signRsltCd", title:"<spring:message code='global.lbl.result' />", width:60, attributes:{"class":"ac"}
                   ,template:"# if(arrSignProcCdMap[signRsltCd] != null) { # #= arrSignProcCdMap[signRsltCd].cmmCdNm# # }#"
                       ,editor:function(container, options) {
                            $('<input required name="signRsltCd" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                autoBind:false
                                ,dataTextField:"cmmCdNm"
                                ,dataValueField:"cmmCd"
                                ,dataSource:arrSignProcCd
                            });
                            $('<span class="k-invalid-msg" data-for="signRsltCd"></span>').appendTo(container);
                       }
               }
               ,{field:"signUsrNm", title:"<spring:message code='crm.lbl.applyUsr' />", width:100, attributes:{"class":"ac"}
                   ,editor:function(container, options) {
                       $('<div class="form_search"><input id="signUserNm" type="text" data-bind="value:' + options.field + '" class="form_input" /><a id="btnUserSearch" href="javascript:userSearchPopup();">검색</a></div>')
                       .kendoAutoComplete({
                               minLength:2
                               ,template:"[#:data.usrId#]#:data.usrNm#"
                               ,dataTextField:"usrId"
                               ,dataSource:{
                                   serverFiltering:true
                                   ,transport:{
                                       read:{
                                            url:"<c:url value='/cmm/sci/user/selectUsersForSuggest.do' />"
                                            ,dataType:"json"
                                            ,type:"POST"
                                            ,contentType:"application/json"
                                       }
                                       ,parameterMap:function(options, operation)
                                       {
                                           if (operation === "read") {
                                               return kendo.stringify({
                                                   "sText":$("#signUsrNm").data("kendoAutoComplete").value()
                                                   ,"recordCountPerPage":10
                                               });
                                           }
                                       }
                                   }
                                   ,schema:{
                                       data:"data"
                                       ,total:"total"
                                   }
                               }
                           })
                       .appendTo(container)
                       $('<span class="k-invalid-msg" data-for="signUsrNm"></span>').appendTo(container);
                   }
               }
               ,{field:"signCont", title:"<spring:message code='crm.lbl.cont' />", width:600 ,attributes:{"class":"al"}}
               ,{field:"taskNm", title:"<spring:message code='global.lbl.task' />", width:100, attributes:{"class":"ac"}
                   ,template:'#= fn_getTaskNm(signUsrId)#'
               }
               ,{field:"signDt", title:"<spring:message code='global.lbl.dateTime' />", width:200
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
               }
               /*
               ,{field:"lastSignYn", title:"<spring:message code='global.lbl.final' />", width:50 ,attributes:{"class":"ac"}
                   ,editor:function(container, options) {
                       $('<input required name="lastSignYn" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           autoBind:true
                           ,dataSource:['Y','N']
                           ,index:0
                       });
                       $('<span class="k-invalid-msg" data-for="lastSignYn"></span>').appendTo(container);
                   }
                }
               ,{field:"signTp", title:"<spring:message code='global.lbl.gubun' />", width:60
                   ,template:"# if(arrSignTpMap[signTp] != null) { # #= arrSignTpMap[signTp].cmmCdNm# # }#"
                   ,editor:function(container, options) {
                        $('<input required name="signTp" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            autoBind:false
                            ,dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,dataSource:arrSignTp
                        });
                        $('<span class="k-invalid-msg" data-for="signTp"></span>').appendTo(container);
                   }
                } */
         ]

    });


     //그리드 설정(결과-목표)
     $("#resultGoalGrid").kendoExtGrid({
         gridId:"G-CRM-0722-123006"
         ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectResultGoals.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};

                         params["sort"]         = options.sort;

                         params["sDlrCd"]       = $("#dlrCd").val();
                         params["sPltCd"]       = $("#pltCd").val();
                         params["sMakCd"]       = $("#makCd").val();

                         return kendo.stringify(params);

                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                 model:{
                     id:"seq"
                     ,fields:{
                         rnum:{type:"number", editable:false}
                         , makCd:{type:"string", editable:false}
                         , seq:{type:"string", editable:false}
                         , targCd:{type:"string", editable:false}
                         , targNm:{type:"string", editable:false}
                         , targCntVal:{type:"number", editable:false}
                         , targRsltVal:{type:"number", editable:false}
                         , dlrCd:{type:"string"}
                         , pltCd:{type:"string"}
                     }
                 }
             }
         }
         , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
         , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
         , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
         , appendEmptyColumn:true           //빈컬럼 적용. default:false
         , enableTooltip:true               //Tooltip 적용, default:false
         ,pageable:false
         ,sortable:false
         ,filterable:false
         ,height:190
         ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
            ,{field:"makCd", title:"<spring:message code='global.lbl.crNo' />", hidden:true}       // 캠페인코드
            ,{field:"seq", title:"<spring:message code='global.lbl.budgetCd' />", hidden:true}
            ,{field:"targCd", title:"<spring:message code='global.lbl.targ' />", hidden:true}
            ,{field:"targNm", title:"<spring:message code='global.lbl.targ' />"}       // 상세내역
            ,{field:"targCntVal", title:"<spring:message code='global.lbl.targCntVal' />", width:60, attributes:{"class":"ar"}}   // 목표수치
            ,{field:"targRsltVal", title:"<spring:message code='global.lbl.result' />", width:60, attributes:{"class":"ar"}}   // 목표결과
            ,{title:"<spring:message code='crm.lbl.achievementRate' />", width:60, attributes:{"class":"ar"}
               , template:function(data){
                    var rate = 0;
                    if(data.targCntVal != null && data.targRsltVal != null){
                        if(Number(data.targCntVal) > 0){
                            rate = ((Number(data.targRsltVal)/Number(data.targCntVal))*100).toFixed(0);
                        }else{
                            rate = 0;
                        }
                    }
                    return rate+"%";
                }
            }   // 달성률
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
            ,{field:"pltCd", title:"<spring:message code='global.lbl.pltCd' />", hidden:true}                       // 사업장코드
         ]
     });


    //그리드 설정(결과-업체평가결과)
     $("#resultCorpGrid").kendoExtGrid({
         gridId:"G-CRM-0722-123008"
         ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectResultCorps.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};

                         params["sort"]         = options.sort;

                         params["sDlrCd"]       = $("#dlrCd").val();
                         params["sPltCd"]       = $("#pltCd").val();
                         params["sMakCd"]       = $("#makCd").val();

                         return kendo.stringify(params);

                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                 model:{
                     id:"seq"
                     ,fields:{
                         rnum:{type:"number", editable:false}
                         , makCd:{type:"string", editable:false}
                         , empNm:{type:"string", editable:false}
                         , stsfIvstDt:{type:"date", editable:false}
                         , stsfIvstScoreVal:{type:"number", editable:false}
                         , dlrCd:{type:"string"}
                         , pltCd:{type:"string"}
                         , stsfIvstSeq:{type:"number"}
                     }
                 }
             }
         }
         , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
         , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
         , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
         , appendEmptyColumn:true           //빈컬럼 적용. default:false
         , enableTooltip:true               //Tooltip 적용, default:false
         ,pageable:false
         ,sortable:false
         ,filterable:false
         ,height:190
         ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
            ,{field:"makCd", title:"<spring:message code='global.lbl.crNo' />", hidden:true}       // 캠페인코드
            ,{field:"empNm", title:"<spring:message code='crm.lbl.empNm' />", width:100, attributes:{"class":"al"}}     // 처리자
            ,{field:"stsfIvstDt", title:"<spring:message code='global.lbl.stsfIvstDtEx' />", width:100, attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"stsfIvstScoreVal", title:"<spring:message code='global.lbl.value' />", width:80, attributes:{"class":"ar"}
//                 ,template:function(dataItem){
//                     var spanObj = "<a href='#' class='corpEmpNm'>"+dataItem.stsfIvstScoreVal+"</a>";
//                     return spanObj;
//                 }

            }   // 점수
            ,{field:"stsfIvstYn", title:"<spring:message code='crm.lbl.stsfIvstYn' />", width:80, attributes:{"class":"ac"}          // 만족여부
                ,template:"# if(stsfIvstYnMap[stsfIvstYn] != null) { # #= stsfIvstYnMap[stsfIvstYn].cmmCdNm# # }#"
            }
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
            ,{field:"pltCd", title:"<spring:message code='global.lbl.pltCd' />", hidden:true}                       // 사업장코드
         ]
     });


     //그리드 설정(제조사 작업정보-정비용)
     $("#bhmcLbrGrid").kendoExtGrid({
         gridId:"G-CRM-1202-000001"
         ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectWorks.do' />"
                 }//read
                 ,parameterMap:function(options , operation){

                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"]  = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"]  = options.skip + options.take;
                         params["sort"]       = options.sort;

                         params["sCrNo"]      = $("#crNo").val();
                         params["sHostCd"]    = "01"

                         return kendo.stringify(params);

                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 } //parameterMap
             }//transport
             ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                       ,crTp:{type:"string", editable:false}
                       ,crNo:{type:"string", editable:false}
                       ,crNm:{type:"string", editable:false}
                       ,pcDstinCd:{type:"string", editable:false}
                       ,lbrCd:{type:"string", editable:false}
                       ,lbrNm:{type:"string", editable:false}
                       ,cauItemCd:{type:"string"}
                       ,cauItemNm:{type:"string", editable:false}
                       ,cauCd:{type:"string"}
                       ,cauNm:{type:"string", editable:false}
                       ,phenCd:{type:"string"}
                       ,phenNm:{type:"string", editable:false}
                       ,dlrCd:{type:"string", editable:false}
                    } //fields
                 }//model
             }//schema
         }//dataSource
         ,change:function(e){

             var selectedItem = this.dataItem(this.select());

             if (selectedItem != null) {
                 // 추출차수
                 $("#lbrCd").val(selectedItem.lbrCd);
             }
         }
        ,autoBind:false
        ,editable:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
        ,appendEmptyColumn:true          //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,height:400
        ,scrollable:true
        ,sortable:false
        ,filterable:false
        ,columns:[
                   {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, sortable:false, attributes:{"class":"ac"}}
                  ,{field:"crNo", title:"<spring:message code='ser.lbl.crNo' />", width:100, attributes:{"class":"ac"}, hidden:true} //캠페인번호
                  ,{field:"lbrCd", title:"<spring:message code='ser.lbl.laborCd' />", width:100, attributes:{"class":"ac"}} //공임코드
                  ,{field:"lbrNm", title:"<spring:message code='ser.lbl.laborNm' />", width:200, attributes:{"class":"al"}} //공임명
                  ,{field:"cauItemCd", title:"<spring:message code='ser.lbl.cauItem' />", width:100, attributes:{"class":"ac"}}//원인부품코드
                  ,{field:"cauItemNm", title:"<spring:message code='ser.lbl.cauItemNm' />", width:150, attributes:{"class":"al"}, hidden:true}//원인부품명
                  ,{field:"phenCd", title:"<spring:message code='ser.lbl.phenCd' />", width:80, attributes:{"class":"ac"}}//현상코드
                  ,{field:"phenNm", title:"<spring:message code='ser.lbl.phenNm' />", width:150, attributes:{"class":"ac"}, hidden:true}//현상명
                  ,{field:"cauCd", title:"<spring:message code='ser.lbl.cauCd' />", width:80, attributes:{"class":"ac"}}//원인코드
                  ,{field:"cauNm", title:"<spring:message code='ser.lbl.cauNm' />", width:150, attributes:{"class":"al"}, hidden:true}//원인코드명
                  ,{field:"lbrQty", title:"<spring:message code='ser.lbl.qty' />", width:80, attributes:{"class":"ar"},format:"{0:n0}", hidden:true }//공임수량
                  ,{field:"lbrHm", title:"<spring:message code='ser.lbl.lbrTime' />", width:80, attributes:{"class":"ar"},format:"{0:n2}"} //공임시간
                  ,{field:"lbrAmt", title:"<spring:message code='ser.lbl.confirmLbrAmt' />", width:120, attributes:{"class":"ar"},  format:"{0:n2}"} //공임금액
                  ,{field:"dlrCd", hidden:true}       // 딜러코드
                 ]

     });

     //그리드 설정(딜러 작업정보-정비용)
     $("#dlrLbrGrid").kendoExtGrid({
         gridId:"G-CRM-1202-000002"
         ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectWorks.do' />"
                 }//read
                 ,parameterMap:function(options , operation){

                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sCrNo"]      = $("#crNo").val();
                         params["sHostCd"]    = "02"

                         return kendo.stringify(params);

                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 } //parameterMap
             }//transport
             ,schema:{
                 model:{
                     id:"rnum"
                     ,fields:{
                          rnum:{type:"number", editable:false}
                         ,dlrCd:{type:"string", editable:false}
                         ,lbrCd:{type:"string", editable:false}
                         ,lbrNm:{type:"string", editable:false}
                         ,crNo:{type:"string", editable:false}
                         ,crTp:{type:"string", editable:false}
                         ,crNm:{type:"string", editable:false}
                         ,lbrTp:{type:"string"}
                         ,lbrPrc:{type:"number"}
                         ,lbrHm:{type:"number"}
                         ,lbrQty:{type:"number"}
                         ,lbrAmt:{type:"number"}
                         ,lbrTotAmt:{type:"number"}
                         ,dsRate:{type:"number"}
                     }
                 }
             }
         }
         ,height:400
         ,pageable:false
         ,autoBind:false
         ,sortable:false
         ,resizable:true
         ,selectable:"row"
         ,enableTooltip:true               //Tooltip 적용, default:false
         ,filterable:false                 // 필터링 기능 사용안함
         ,edit:function(e){

             var fieldName = $(e.container.find("input")[1]).attr("name");
             var fieldName2 = $(e.container.find("input")[0]).attr("name");


             var grid = $("#dlrLbrGrid").data("kendoExtGrid");//.dataSource._data;
             var selectedVal = grid.dataItem(grid.select());

             var editYn = false;
             var lbrTpYn = false;

             editYn = (fieldName == "lbrTotAmt" ||
                       fieldName == "lbrPrc" ||
                       fieldName == "lbrAmt"  ) ? true : false;


             if(dms.string.isEmpty(selectedVal.lbrTp) ){
                 lbrTpYn = false;
             }else{
                 lbrTpYn = true;
             }

             if(editYn){
                 this.closeCell();
             }

             if(fieldName2 == "lbrTp"){
                this.closeCell();
             }

         }
         ,columns:[
              {field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:90}// 공임코드
             ,{field:"lbrNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:180}// 공임명
             ,{field:"lbrTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:100
                 ,attributes:{"class":"ac"}
                 ,template:"#=lbrTpCdGrid(lbrTp)#"
                 ,editor:function(container, options){
                     $('<input required name="lbrTp" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                         dataTextField:"cmmCdNm"
                         ,dataValueField:"cmmCd"
                         ,dataSource:lbrTpCdList
                         ,change:function(){

                             var selectVal = this.value();
                             var lbrGrid = $("#dlrLbrGrid").data("kendoExtGrid");
                             var roTpCd = "01";
                             var lbrAmt = 0;
                             var lbrRowData = lbrGrid.dataItem(this.element.closest("tr"));
                             var lbrTp = (lbrRowData != null) ? dms.string.defaultString(lbrRowData.lbrTp, "01") :"01";

                             /** 임률 함수 serviceJs.setRpirRate(임률공통코드 , "RO유형" , "수리유형" ); **/
                             //var lbrRate = serviceJs.setRpirRate(rateList, roTpCd, lbrTp);
                             $.each(lbrGrid.dataSource._data , function(i , gridData){
                                 var lbrTp = dms.string.defaultString(gridData.lbrTp, "01");
                                 var lbrPrc = Number(serviceJs.setRpirRate(rateList, roTpCd, lbrTp));
                                 var lbrAmt = Number((gridData.lbrQty * gridData.lbrHm * lbrPrc).toFixed(2));
                                 gridData.set("lbrPrc", lbrPrc);
                                 gridData.set("lbrTotAmt", lbrAmt);
                                 gridData.set("lbrAmt", lbrAmt);
                             });

                             if(lbrRowData != null){
                                 var lbrHm = Number(lbrRowData.lbrHm);
                                 var lbrPrc = Number(lbrRowData.lbrPrc);
                                 var dsAmt = Number(lbrRowData.dsAmt);
                                 var dsRate = Number(lbrRowData.dsRate);
                                 var lbrQty = Number(lbrRowData.lbrQty);

                                 var lbrCalAmt = (lbrQty * lbrHm * lbrPrc);
                                 var lbrTotAmt = (lbrCalAmt - dsAmt).toFixed(2);
                                 var dcCalAmt  = (lbrCalAmt - lbrTotAmt).toFixed(2);
                                 var dcCalRate = Math.abs((lbrTotAmt / lbrCalAmt) -1 ).toFixed(2); // 할인율

                                 lbrRowData.set("dsRate", (dcCalRate*100).toFixed(2) );
                                 lbrRowData.set("dsAmt",  dcCalAmt );
                                 lbrRowData.set("lbrTotAmt", lbrTotAmt );
                                 lbrRowData.set("lbrAmt", (lbrQty * lbrHm * lbrPrc).toFixed(2));

                             }
                         }
                     });
                 }
             } // 공임유형(정비유형)
             ,{field:"lbrHm", title:"<spring:message code='ser.lbl.custLbr' />", width:80
                 ,attributes:{"class":"ar"}
                 ,format:"{0:n2}"
                 ,editor:function(container, options){
                     $('<input required name="lbrHm" data-name="<spring:message code="ser.lbl.lbrHm" />" data-bind="value:' + options.field + '"  />')
                     .appendTo(container)
                     .kendoExtNumericTextBox({
                          min:0
                         ,max:1000
                         ,spinners:false
                         ,change:function(){
                             var lbrAmt = 0;
                             var totLbrHm = 0;
                             var lbrRowData = lbrGrid.dataItem(this.element.closest("tr"));

                             if(lbrRowData != null){
                                 var lbrHm = Number(lbrRowData.lbrHm);
                                 var lbrPrc = Number(lbrRowData.lbrPrc);
                                 var dsAmt = Number(lbrRowData.dsAmt);
                                 var dsRate = Number(lbrRowData.dsRate);
                                 var lbrQty = Number(lbrRowData.lbrQty);

                                 var lbrCalAmt = (lbrQty * lbrHm * lbrPrc);
                                 var lbrTotAmt = (lbrCalAmt - dsAmt).toFixed(2);
                                 var dcCalAmt  = (lbrCalAmt - lbrTotAmt).toFixed(2);
                                 var dcCalRate = Math.abs((lbrTotAmt / lbrCalAmt) -1 ).toFixed(2); // 할인율

                                 lbrRowData.set("dsRate", (dcCalRate*100).toFixed(2) );
                                 lbrRowData.set("dsAmt",  dcCalAmt );
                                 lbrRowData.set("lbrTotAmt", lbrTotAmt );
                                 lbrRowData.set("lbrAmt", (lbrQty * lbrHm * lbrPrc).toFixed(2));
                             }

                         }
                     });
                 }
             } // 정비공임
             ,{field:"lbrPrc", title:"<spring:message code='ser.lbl.lbrPrc' />", width:80, attributes:{"class":"ar"}
                 ,format:"{0:n2}"
                 ,editor:function(container, options){
                     $('<input name="lbrPrc" data-bind="value:' + options.field + '"  />')
                     .appendTo(container)
                     .kendoExtNumericTextBox({
                         min:0
                         ,max:100000
                         ,decimals:0
                         ,spinners:false
                     });
                 }
             }// 공임단가
             ,{field:"lbrAmt", title:"<spring:message code='ser.lbl.confirmLbrAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}       // 공임금액
             ,{field:"dsRate", title:"<spring:message code='ser.lbl.dcRate' />", width:80 , attributes:{"class":"ar"}
                 ,format:"{0:n2}"
                 ,editor:function(container, options){
                     $('<input name="dsRate" data-bind="value:' + options.field + '"  />')
                     .appendTo(container)
                     .kendoExtNumericTextBox({
                         min:0
                         ,max:100
                         ,spinners:false
                         ,change : function(){

                             var lbrAmt = 0;
                             var lbrGrid = $("#dlrLbrGrid").data("kendoExtGrid");
                             var lbrRowData = lbrGrid.dataItem(this.element.closest("tr"));

                             if(lbrRowData != null){
                                 var lbrHm = Number(lbrRowData.lbrHm);
                                 var lbrPrc = Number(lbrRowData.lbrPrc);
                                 var dsAmt = Number(lbrRowData.dsAmt);
                                 var dsRate = Number(lbrRowData.dsRate);
                                 var lbrQty = Number(lbrRowData.lbrQty);

                                 var lbrCalAmt = (lbrQty * lbrHm * lbrPrc);
                                 var dcCalRate =  ((dsRate / 100) ).toFixed(2); // 할인율
                                 var lbrTotAmt =  (lbrCalAmt * (1-dcCalRate)).toFixed(2);
                                 var dcCalAmt  =  (lbrCalAmt - lbrTotAmt).toFixed(2);

                                 lbrRowData.set("dsRate", (dcCalRate*100).toFixed(2) );
                                 lbrRowData.set("dsAmt",  dcCalAmt );
                                 lbrRowData.set("lbrTotAmt", lbrTotAmt );
                                 lbrRowData.set("lbrAmt", (lbrQty * lbrHm * lbrPrc).toFixed(2));

                             }

                         }
                     });
                 }
             }        // 할인율
             ,{field:"lbrQty",title:"<spring:message code='ser.lbl.qty' />", width:100, attributes:{"class":"ar"} , hidden: true
                 ,format:"{0:n0}"
                 ,editor:function(container, options){
                      $('<input required name="lbrQty" data-bind="value:' + options.field + '"/>')
                      .appendTo(container)
                      .kendoExtNumericTextBox({
                          format:"n0"                // n0:###,###, n2:###,###.##
                         ,decimals:0                // 소숫점
                         ,min:1
                         ,value:0
                         ,spinners:false
                         ,change:function(){
                             var lbrAmt = 0;
                             var lbrGrid = $("#dlrLbrGrid").data("kendoExtGrid");
                             var lbrRowData = lbrGrid.dataItem(this.element.closest("tr"));


                             if(lbrRowData != null){
                                 var lbrHm = Number(lbrRowData.lbrHm);
                                 var lbrPrc = Number(lbrRowData.lbrPrc);
                                 var dsAmt = Number(lbrRowData.dsAmt);
                                 var dsRate = Number(lbrRowData.dsRate);
                                 var lbrQty = Number(lbrRowData.lbrQty);

                                 var lbrCalAmt = (lbrQty * lbrHm * lbrPrc);
                                 var lbrTotAmt = (lbrCalAmt - dsAmt).toFixed(2);
                                 var dcCalAmt  = (lbrCalAmt - lbrTotAmt).toFixed(2);
                                 var dcCalRate = Math.abs((lbrTotAmt / lbrCalAmt) -1 ).toFixed(2); // 할인율

                                 lbrRowData.set("dsRate", (dcCalRate*100).toFixed(2) );
                                 lbrRowData.set("dsAmt",  dcCalAmt );
                                 lbrRowData.set("lbrTotAmt", lbrTotAmt );
                                 lbrRowData.set("lbrAmt", (lbrQty * lbrHm * lbrPrc).toFixed(2));

                             }

                         }
                       });
                  $('<span class="k-invalid-msg" data-for="lbrQty"></span>').appendTo(container);
               }
             }// 정비수량
             ,{field:"dsAmt", title:"<spring:message code='global.lbl.dcAmt' />", width:90, attributes:{"class":"ar"}
                 ,format:"{0:n2}"
                 ,editor:function(container, options){
                     $('<input name="dsAmt" data-bind="value:' + options.field + '"  />')
                     .appendTo(container)
                     .kendoExtNumericTextBox({
                          min:0
                         ,max:100000
                         ,spinners:false
                         ,change:function(){
                             var lbrAmt = 0;
                             var lbrGrid = $("#dlrLbrGrid").data("kendoExtGrid");
                             var lbrRowData = lbrGrid.dataItem(this.element.closest("tr"));

                             if(lbrRowData != null){
                                 var lbrHm = Number(lbrRowData.lbrHm);
                                 var lbrPrc = Number(lbrRowData.lbrPrc);
                                 var dsAmt = Number(lbrRowData.dsAmt);
                                 var dsRate = Number(lbrRowData.dsRate);
                                 var lbrQty = Number(lbrRowData.lbrQty);

                                 var lbrCalAmt = (lbrQty * lbrHm * lbrPrc);
                                 var lbrTotAmt = (lbrCalAmt - dsAmt).toFixed(2);
                                 var dcCalAmt  = dsAmt;
                                 var dcCalRate = Math.abs((lbrTotAmt / lbrCalAmt) -1 ).toFixed(2); // 할인율

                                 lbrRowData.set("dsRate", (dcCalRate*100).toFixed(2) );
                                 lbrRowData.set("dsAmt",  dcCalAmt );
                                 lbrRowData.set("lbrTotAmt", lbrTotAmt );
                                 lbrRowData.set("lbrAmt", (lbrQty * lbrHm * lbrPrc).toFixed(2));

                             }

                         }
                     });
                 }
             } // 할인금액
             ,{field:"lbrTotAmt", title:"<spring:message code='ser.lbl.preLbrAmt' />", width:90, attributes:{"class":"ar"}
                 ,format:"{0:n2}"
                 ,template:function(data){
                     var lbrTotAmt = 0;
                     if(data.lbrTotAmt != null){
                         lbrTotAmt = data.lbrTotAmt;
                     }
                     return dms.string.addThousandSeparatorCommas(lbrTotAmt);
                 }
             }  // 예상공임비
             ,{field:"crNo", title:"<spring:message code='ser.lbl.crNo' />", width:100, hidden:true}    // 캠페인번호
             ,{field:"crTp", title:"<spring:message code='ser.lbl.crTp' />", width:100, hidden:true
                 ,attributes:{"class":"ac"}
                 ,template:"#=crTpCdGrid(crTp)#"
                 ,editor:function(container, options) {
                      $('<input required name="crTp" data-bind="value:' + options.field + '"/>')
                      .appendTo(container)
                      .kendoExtDropDownList({
                          valuePrimitive:true
                          ,dataTextField:"cmmCdNm"
                          ,dataValueField:"cmmCd"
                          ,dataSource:crTpList
                      });
                      $('<span class="k-invalid-msg" data-for="crTp"></span>').appendTo(container);
                  }
             }   // 캠페인유형
             ,{field:"crNm", title:"<spring:message code='ser.lbl.crNm' />", width:100, hidden:true}    // 캠페인명
             ,{field:"lbrOrgHm", title:"lbrOrgHm", width:100, hidden:true}
             ,{field:"dstinCd", title:"dstinCd", width:100, hidden:true}
         ]

     });


     //그리드 설정(제조사 부품정보-정비용)
     $("#bhmcItemGrid").kendoExtGrid({
         gridId:"G-CRM-1202-000003"
         ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectItems.do' />"
                 }//read
                 ,parameterMap:function(options , operation){

                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sCrNo"]      = $("#crNo").val();
                         params["sHostCd"]      = "01"

                         return kendo.stringify(params);

                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 } //parameterMap
             }//transport
             ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum  :{type:"number",editable:false}
                       ,lbrCd :{type:"string", validation:{required:true}}
                       ,cauItemCd :{type:"string",editable:false}
                       ,cauItemNm :{type:"string",editable:false}
                       ,ltsModelCd :{type:"string",editable:false}
                       ,ltsModelNm :{type:"string",editable:false}
                       ,itemQty:{type:"number",editable:false}
                       ,creStartDt:{type:"date",editable:false}
                       ,creEndDt:{type:"date",editable:false}
                    } //fields
                 }//model
             }//schema
         }//dataSource
        ,change:function(e){

            var selectedItem = this.dataItem(this.select());

            if (selectedItem != null) {

                // 공임코드
                $("#lbrCd1").val(selectedItem.lbrCd);
                // 부품코드
                $("#cauItemCd").val(selectedItem.cauItemCd);
                // LTS모델코드
                $("#ltsModelCd").val(selectedItem.ltsModelCd);
            }
        }
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:[]
        ,autoBind:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,scrollable:true
        ,height:400
        ,sortable:false
        ,filterable:false
        ,columns:[
                   {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, sortable:false, attributes:{"class":"ac"}}
                  ,{field:"lbrCd", title:"<spring:message code='ser.lbl.laborCd' />", width:100 , attributes:{"class":"al"}} // 공임코드
                  ,{field:"cauItemCd", title:"<spring:message code='ser.lbl.chgItemCd' />", width:100, attributes:{"class":"al"}}//부품코드
                  ,{field:"cauItemNm", title:"<spring:message code='ser.lbl.chgItemNm' />", width:200, attributes:{"class":"al"}}//부품명
                  ,{field:"itemQty", title:"<spring:message code='ser.lbl.itemQty' />", width:80, attributes:{"class":"ar"},  format:"{0:n2}"}
                  ,{field:"ltsModelCd", title:"<spring:message code='ser.lbl.ltsModel' />", width:100, attributes:{"class":"ac"}}//lts model code
                  ,{field:"creStartDt", title:"<spring:message code='ser.lbl.prdStartDt' />", width:120, attributes:{"class":"ac"}
                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                  }//생산시작일
                  ,{field:"creEndDt", title:"<spring:message code='ser.lbl.prdEndDt' />", width:120, attributes:{"class":"ac"}
                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                   }//생산종료일
                 ]

     });

     //그리드 설정(딜러 부품정보-정비용)
     $("#dlrItemGrid").kendoExtGrid({
         gridId:"G-CRM-1202-000004"
         ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectDlrItems.do' />"
                 }//read
                 ,parameterMap:function(options , operation){

                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sCrNo"]      = $("#crNo").val();
                         params["sHostCd"]    = "02"

                         return kendo.stringify(params);

                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 } //parameterMap
             }//transport
             ,schema:{
                 model:{
                     id:"rnum"
                     ,fields:{
                          dlrCd:{type:"string", editable:false}
                         ,itemCd:{type:"string", editable:false}
                         ,itemNm:{type:"string", editable:false, validation:{required:true}}
                         ,itemPrc:{type:"number", editable:false}
                         ,crNo:{type:"string", editable:false}
                         ,itemAmt:{type:"number" }
                         ,itemTotAmt:{type:"number"}
                         ,itemUnitCd:{type:"string", editable:false}
                         ,itemQty:{type:"number"}
                         ,dsRate:{type:"number"}
                         ,dsAmt:{type:"number"}
                     }
                 }
             }
         }
         ,height:400
         ,pageable:false
         ,autoBind:false
         ,resizable:false
         ,sortable:false
         ,enableTooltip:true               //Tooltip 적용, default:false
         ,appendEmptyColumn:true           //빈컬럼 적용. default:false
         ,filterable:false                 // 필터링 기능 사용안함
         ,selectable:"row"
         ,edit:function(e){
             var fieldName = $(e.container.find("input")[1]).attr("name");
             var fieldName2 = $(e.container.find("input")[0]).attr("name");

             var partGrid = $("#dlrItemGrid").data("kendoExtGrid");
             var selectedVal = partGrid.dataItem(partGrid.select());

             var roTp = "01";

             if(fieldName=="itemTotAmt" || fieldName == "itemAmt"){
                 this.closeCell();
             }

         }
         ,columns:[
              {field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:100} // 부품번호
             ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:200} // 부품명
             ,{field:"itemUnitCd", title:"<spring:message code='ser.lbl.calUnt' />", width:70}  // 계산단위
             ,{field:"itemQty", title:"<spring:message code='ser.lbl.itemQty' />", width:70, attributes:{"class":"ar"}
                 ,format:"{0:n0}"
                 ,editor:function(container, options){
                     $('<input name="itemQty" data-bind="value:' + options.field + '"  />')
                     .appendTo(container)
                     .kendoExtNumericTextBox({
                         min:0
                         ,max:100
                         ,decimals:0
                         ,spinners:false
                         ,change:function(){

                             var partGrid = $("#dlrItemGrid").data("kendoExtGrid");
                             var rowData = partGrid.dataItem(this.element.closest("tr"));

                             setPartAmt(rowData);
                         }
                     });
                 }
             }// 부품수량
             ,{field:"itemPrc", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:90, attributes:{"class":"ar"}
                 ,format:"{0:n2}"
                 ,editor:function(container, options){
                     $('<input name="itemPrc" data-bind="value:' + options.field + '"  />')
                     .appendTo(container)
                     .kendoExtNumericTextBox({
                          min:0
                         ,max:100000000
                         ,decimals:0
                         ,spinners:false
                         ,change:function(){
                             var partGrid = $("#dlrItemGrid").data("kendoExtGrid");
                             var rowData = partGrid.dataItem(this.element.closest("tr"));

                             setPartAmt(rowData);

                         }
                     });
                 }
             }// 부품단가
             ,{field:"itemAmt", title:"<spring:message code='ser.lbl.itemAmt' />", width:90, attributes:{"class":"ar"}
                  , format:"{0:n2}"
             }  // 부품금액
             ,{field:"dsRate", title:"<spring:message code='ser.lbl.dcRate' />", width:80 , attributes:{"class":"ar"}
                     ,format:"{0:n2}"
                     ,editor:function(container, options){
                         $('<input name="dsRate" data-bind="value:' + options.field + '"  />')
                         .appendTo(container)
                         .kendoExtNumericTextBox({
                             min:0
                             ,max:100
                             ,spinners:false
                             ,change : function(){
                                 var partGrid = $("#dlrItemGrid").data("kendoExtGrid");
                                 var rowData = partGrid.dataItem(this.element.closest("tr"));

                                 setPartAmt(rowData);
                             }
                         });
                     }

             }        // 할인율
             ,{field:"dsAmt", title:"<spring:message code='global.lbl.dcAmt' />", width:80, attributes:{"class":"ar"}
                 ,format:"{0:n2}"
                 ,editor:function(container, options){
                     $('<input name="dsAmt" data-bind="value:' + options.field + '"  />')
                     .appendTo(container)
                     .kendoExtNumericTextBox({
                         min:0
                         ,max:100000
                         ,spinners:false
                         ,change:function(){

                             var partGrid = $("#dlrItemGrid").data("kendoExtGrid");
                             var rowData = partGrid.dataItem(this.element.closest("tr"));

                             setPartAmt(rowData);

                         }
                     });
                 }
             } // 할인금액
             ,{field:"itemTotAmt", title:"<spring:message code='ser.lbl.preParSubAmt' />", width:90, attributes:{"class":"ar"}
                 ,format:"{0:n2}"
             }  // 예정부품대
             ,{field:"crNo", title:"<spring:message code='ser.lbl.crNo' />", width:100,hidden:true}    // 캠페인번호
             ,{field:"lbrCd" ,hidden : true}
         ]

     });


     //그리드 설정(VIN정보-정비용)
     $("#vinGrid").kendoExtGrid({
         gridId:"G-CRM-1202-000005"
         ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectVins.do' />"
                 }//read
                 ,parameterMap:function(options , operation){

                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sCrNo"]      = $("#crNo").val();

                         return kendo.stringify(params);

                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 } //parameterMap
             }//transport
             ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number"}
                       ,vinNo:{type:"string"}
                       ,ltsModelCd:{type:"string"}
                       ,ltsModelNm:{type:"string"}
                    } //fields
                 }//model
             }//schema
         }//dataSource
        ,autoBind:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
        ,appendEmptyColumn:false          //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,scrollable:true
        ,editable:false
        ,height:400
        ,autoBind:false
        ,sortable:false
        ,filterable:false
        ,columns:[
                    {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, sortable:false, attributes:{"class":"ac"}}
                   ,{field:"vinNo",title:"<spring:message code='ser.lbl.vinNo' />",width:150,attributes:{"class":"al"}}
                   ,{field:"ltsModelCd",title:"<spring:message code='ser.lbl.ltsModelCd' />",width:100,attributes:{"class":"al"}}
                   ,{field:"ltsModelNm",title:"<spring:message code='ser.lbl.ltsModelNm' />",width:250,attributes:{"class":"al"}}
                  ]

     });

     // 공임추가 공통
     lbrAdd = function(jsonObj, campaignYn){

         var lbrGrid = $('#dlrLbrGrid').data('kendoExtGrid');
         var lbrDataItem = lbrGrid.dataSource._data;

         $.each(jsonObj, function(idx, data){

             var copyData;
             var checkVal = true;

             var popTzCdCnt = 0; // 공임팝업에서 선택한 TT,ZZ CODE 수
             var gridTzCnt=0;    //그리드에 입력된 TT,ZZ 코드 수
             var pupLbrCd = data.lbrCd; //팝업 공임 코드
             var popSubLbrCd =  pupLbrCd.substring(pupLbrCd.length-2 , pupLbrCd.length); // 공임코드 뒷2 자리


             // 중복값 체크
             $.each(lbrDataItem, function(idx, obj){
                 var gridLbrCd = obj.lbrCd; //그리드 공임 코드
                 var subLbrCd =  gridLbrCd.substring(gridLbrCd.length-2 , gridLbrCd.length); //그리드에 있는 공임 뒤 코드 2자리

                 if(data.lbrCd == obj.lbrCd){
                     checkVal = false;
                 }

                 if(subLbrCd == "ZZ" || subLbrCd == "TT") gridTzCnt++; // TT , ZZ 코드 체크
             });

             //var lbrRate = data.lbrRate;
             var lbrRate = serviceJs.setRpirRate(rateList, "01", data.lbrTp);

             // ZZ CODE , TT CODE 는 1개만 입력 가능하게 체크
             if(popSubLbrCd == "ZZ" || popSubLbrCd == "TT") popTzCdCnt++;
             if( (gridTzCnt >= 1 && popTzCdCnt > 0) &&
                     (popSubLbrCd == "ZZ" || popSubLbrCd == "TT")) checkVal = false;
             if(popSubLbrCd == "ZZ") lbrRate = 0;



             if(checkVal) {
                 copyData = {
                     dlrCd:$("#dlrCd").val()
                     ,crNo:$("#crNo").val()
                     ,crNm:$("#makNm").val()
                     ,crTp:$("#makSubTpCd").val()
                     ,lbrTp:data.lbrTp             // 정비유형
                     ,lbrCd:data.lbrCd             // 정비코드
                     ,lbrNm:data.lbrNm             // 정비항목
                     ,lbrHm:(data.lbrHm == "" || data.lbrHm == null) ? 0:data.lbrHm             // 공임시간
                     ,lbrPrc:lbrRate               // 공임단가
                     ,lbrQty:data.lbrQty           // 공임수량
                     //,lbrAmt:(data.lbrHm == "" || data.lbrHm == null || data.lbrHm == 0) ? data.lbrAmt:0
                     ,lbrAmt:(data.lbrHm == 0) ? data.lbrAmt:Number((data.lbrQty * data.lbrHm * lbrRate).toFixed(2))
                     ,lbrTotAmt:(data.lbrHm == 0) ? data.lbrAmt:Number((data.lbrQty * data.lbrHm * lbrRate).toFixed(2))
                     ,dsAmt:0.00
                     ,dsRate:0.00
                 }
                 lbrGrid.dataSource.add(copyData);
             }
         });
     }


  // 부품추가 공통
     partsAdd = function(jsonObj, campaignYn){

         var partGrid = $('#dlrItemGrid').data('kendoExtGrid');
         var partDataItem = partGrid.dataSource._data;

         $.each(jsonObj, function(idx, data){

             var copyData;
             var checkVal = true;

             // 중복값 체크
             $.each(partDataItem, function(idx, obj){
                 if(data.itemCd == obj.itemCd){
                     checkVal = false;
                 }
             });

             var stockUnitCd = ( dms.string.strNvl(data.stockUnitCd) == "" ) ? "EA":data.stockUnitCd;

             if(checkVal) {
                 copyData ={

                      dlrCd:data.dlrCd
                     ,crNo:$("#crNo").val()
                     ,lbrCd:" "
                     ,ltsModelCd:" "
                     ,itemCd:data.itemCd
                     ,itemNm:data.itemNm
                     ,itemQty:data.giQty
                     ,itemPrc:data.taxDdctGrtePrc
                     ,itemUnitCd:stockUnitCd
                     ,itemTotAmt:Number(data.salePrcAmt*data.giQty)
                     ,itemAmt:Number(data.salePrcAmt)
                     ,dsAmt : 0.00
                     ,dsRate : 0.00
                 };

                 partGrid.dataSource.add(copyData);
             }
         });
     };

     setPartAmt = function(rowData){


         var itemQty = 0;

         if(rowData != null){

             itemQty = Number(rowData.itemQty);

             var itemPrc = Number(rowData.itemPrc);

             var itemAmt = Number(rowData.itemAmt);
             var dsAmt = Number(rowData.dsAmt);
             var dsRate = Number(rowData.dsRate);
             var parCalAmt = Number(itemAmt*itemQty);

             var parTotAmt = (parCalAmt - dsAmt).toFixed(2);
             var dcCalAmt = dsAmt;
             var dcCalRate = Number(Math.abs((parTotAmt / parCalAmt) -1 )).toFixed(2);

             rowData.set("itemQty", rowData.itemQty);
             rowData.set("itemTotAmt", parTotAmt);
             rowData.set("dsRate", Number((dcCalRate*100)).toFixed(2));
             rowData.set("dsAmt",  dcCalAmt);
         }
     }

		//그리드 설정(딜러)
        $("#dlrGrid").kendoExtGrid({
            gridId:"G-CRM-0518-143800"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/mcm/marketingCampaign/selectDealers.do' />"
                    }
                    ,parameterMap:function(options, operation)
                    {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sDlrCd"] = $("#sDlrCd").val();
                            params["sMakCd"] = $("#makCd").val();
//                             params["sDlrNm"] = $("#dlrNm").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                       id:"dlrCd"
                       ,fields:{
                           rnum:{type:"number"}
                           ,dlrCd:{type:"string"}
                           ,dlrNm:{type:"string"}
                           ,targDlrCd:{type:"string"}
                           ,targDlrNm:{type:"string"}
                      }
                   }
                }
            }
            ,editable:false
            ,navigatable:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
            ,pageable:false
            ,appendEmptyColumn:true
            ,height:400
            ,columns:[
//                 {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false
//                     ,attributes:{"class":"ac"}
//                 },
                {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:90
                    ,attributes:{"class":"ac"}
                }
                ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:270
                    ,attributes:{"class":"al"}}
                /*
                ,{field:"dlrGrpCd", title:"<spring:message code='global.lbl.dlrGrpCd' />", width:120
                    ,attributes:{"class":"ac"}
                }
                ,{field:"ownRgstNm", title:"<spring:message code='global.lbl.ownRgstNm' />", width:150}
                ,{field:"telNo", title:"<spring:message code='global.lbl.telNo' />", width:100}
                ,{field:"faxNo", title:"<spring:message code='global.lbl.faxNo' />", width:100}
                ,{field:"callCenTelNo", title:"<spring:message code='global.lbl.callCenTelNo' />", width:100}
                ,{field:"emgcCenTelNo", title:"<spring:message code='global.lbl.emgcCenTelNo' />", width:100}
                ,{field:"serDlrTelNo", title:"<spring:message code='global.lbl.serDlrTelNo' />", width:100}
                ,{field:"smsRemainAmount", title:"<spring:message code='global.lbl.smsRemainAmount' />", width:100
                    ,attributes:{"class":"ac"}
                }
                ,{field:"smsRemainCnt", title:"<spring:message code='global.lbl.smsRemainCnt' />", width:100
                    ,attributes:{"class":"ac"}
                }
                 */
            ]
        });

        //그리드 설정(대상 딜러)
        $("#targDlrGrid").kendoExtGrid({
            gridId:"G-CRM-0518-211300"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/mcm/marketingCampaign/selectDlrs.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sDlrCd"]       = $("#dlrCd").val();
                            params["sMakCd"]       = $("#makCd").val();

                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"dlrCd"
                        ,fields:{
                            rnum:{type:"number", editable:false}
                            , makCd:{type:"string", editable:false}
                            , flagYn:{type:"string", editable:true}
                            , targDlrCd:{type:"string", editable:false}
                            , targDlrNm:{type:"string", editable:false}
                            , targYn:{type:"string", validation:{required:true}}
                            , lbrCd:{type:"string"}
                            , dlrCd:{type:"string"}
                            , dlrNm:{type:"string"}
                            , pltCd:{type:"string"}
                        }
                    }
                }
            }
            ,dataBound:function(e){

                var mcdGrid = $("#mcdGrid").data("kendoExtGrid");
                var selectedItem = mcdGrid.dataItem(mcdGrid.select());

                if ( selectedItem !=null && selectedItem.statCd != "02" && selectedItem.statCd != "03" && selectedItem.statCd != "06" ) {
                    $("[type=checkbox]", "#targDlrGrid").prop("disabled", false);
                } else {
                    $("[type=checkbox]", "#targDlrGrid").prop("disabled", true);
                };

            }
            ,autoBind:false
            ,navigatable:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
            ,pageable:false
            ,sortable:false
            ,scrollable:true
            ,filterable:false
            ,selectable:"multiple"
            ,height:400
            ,columns:[
//                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false
//                    ,attributes:{"class":"ac"}
//                },
               {field:"makCd", title:"<spring:message code='global.lbl.crNo' />", hidden:true} // 캠페인코드
               ,{field:"targDlrCd", title:"<spring:message code='crm.lbl.dlrCd' />", width:90
                   ,attributes:{"class":"ac"}}   // 딜러코드
               ,{field:"targDlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:270
                   ,attributes:{"class":"al"}}   // 딜러명
            ]
        });


     /*****************************************************************************
      **************************파일업로드3:파일 다운로드  ****************************
      *******************************************************************************/
      $("#fileResultGrid").on("dblclick", "tr.k-state-selected", function (e) {
         var grid = $("#fileResultGrid").data("kendoExtGrid");
         var dataItem = grid.dataItem(grid.select());

         if(dms.string.isNotEmpty(dataItem)){
             dms.fileManager.download(dataItem.fileDocNo, dataItem.fileNo);
         }
      });
     /*****************************************************************************
      **************************파일업로드3:파일 다운로드  ****************************
      *******************************************************************************/

      /* *************************************************************************
       **************************파일업로드4:그리드 kendo 스크립트 추가 ***************
       ***************************************************************************/
           // 파일 그리드 시작 //
           $("#fileResultGrid").kendoExtGrid({
                dataSource:{
                   transport:{
                       read:{
                           url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                       },
                       parameterMap:function(options, operation) {
                           if (operation === "read") {

                               var params = {};

                               // 캠페인 리스트 그리드의 선택된 파일키
                               var docId = $("#docId").val();
                               if ( dms.string.isNotEmpty(docId) ) {
                                   params["sFileDocNo"] = docId;
                               } else {
                                   return;
                               }

                               return kendo.stringify(params);

                           }else if (operation !== "read" && options.models) {
                               return kendo.stringify(options.models);
                           }
                       }
                   }
                   ,schema:{
                       model:{
                           fields:{
                               fileDocNo:{type:"string"}
                               ,fileNo:{type:"number"}
                               ,fileNm:{type:"string"}
                               ,fileSize:{type:"number"}
                           }
                       }
                   }
               }
               ,autoBind:false
               ,editable:false
               ,height:180
               ,navigatable:false
               ,pageable:false
               ,sortable:false
               ,multiSelectWithCheckbox:true
               ,columns:[
                         {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />"
                             ,template:"<span style=\"text-decoration:underline;cursor:pointer;\" onclick=\"dms.fileManager.download('#=fileDocNo#','#=fileNo#')\">#=fileNm#</span>"
                         }
                         ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />", width:150    // 파일크기
                             ,attributes:{"class":"ar"}
                             ,template:"#= dms.string.formatFileSize(fileSize) #"
                         }
               ]
//               ,columns:[
//                   {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />" }           // 파일명
//                  ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />" }       // 파일크기
//               ]
          });
          // 파일 그리드 종료 //
       /* *************************************************************************
       **************************파일업로드4:그리드 kendo 스크립트 추가 ***************
       ***************************************************************************/
     /*****************************************************************************
      **************************파일업로드3:파일 다운로드  ****************************
      *******************************************************************************/
      $("#fileGrid").on("dblclick", "tr.k-state-selected", function (e) {
         var grid = $("#fileGrid").data("kendoExtGrid");
         var dataItem = grid.dataItem(grid.select());

         if(dms.string.isNotEmpty(dataItem)){
             dms.fileManager.download(dataItem.fileDocNo, dataItem.fileNo);
         }
      });
     /*****************************************************************************
      **************************파일업로드3:파일 다운로드  ****************************
      *******************************************************************************/

      /* *************************************************************************
       **************************파일업로드4:그리드 kendo 스크립트 추가 ***************
       ***************************************************************************/
           // 파일 그리드 시작 //
           $("#fileGrid").kendoExtGrid({
                dataSource:{
                   transport:{
                       read:{
                           url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                       },
                       parameterMap:function(options, operation) {
                           if (operation === "read") {

                               var params = {};

                               // 캠페인 리스트 그리드의 선택된 파일키
                               var mcdGrid = $("#mcdGrid").data("kendoExtGrid");
                               var selectedItem = mcdGrid.dataItem(mcdGrid.select());
                               if ( dms.string.isNotEmpty(selectedItem) ) {
                                   params["sFileDocNo"] = selectedItem.activeFileDocNo;
                               } else {
                                   return;
                               }

                               return kendo.stringify(params);

                           }else if (operation !== "read" && options.models) {
                               return kendo.stringify(options.models);
                           }
                       }
                   }
                   ,schema:{
                       model:{
                           fields:{
                               fileDocNo:{type:"string"}
                               ,fileNo:{type:"number"}
                               ,fileNm:{type:"string"}
                               ,fileSize:{type:"number"}
                           }
                       }
                   }
               }
               ,autoBind:false
               ,editable:false
               ,height:218
               ,navigatable:false
               ,pageable:false
               ,sortable:false
               ,multiSelectWithCheckbox:true
               ,columns:[
                         {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />"
                             ,template:"<span style=\"text-decoration:underline;cursor:pointer;\" onclick=\"dms.fileManager.download('#=fileDocNo#','#=fileNo#')\">#=fileNm#</span>"
                         }
                         ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />", width:150    // 파일크기
                             ,attributes:{"class":"ar"}
                             ,template:"#= dms.string.formatFileSize(fileSize) #"
                         }
               ]
          });
          // 파일 그리드 종료 //
       /* *************************************************************************
       **************************파일업로드4:그리드 kendo 스크립트 추가 ***************
       ***************************************************************************/

       /* *************************************************************************
        **************************파일업로드5:스크립트 추가 $(document).ready 안쪽*****
        ***************************************************************************/
        //========파일삭제
        $("#fileDelete").click(function(){
            var grid = $("#fileGrid").data("kendoExtGrid");
            var rows = grid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            var deleteList = [];
            rows.each(function(index, row) {
                var dataItem = grid.dataItem(row);
                deleteList.push({"fileDocNo":dataItem.fileDocNo, "fileNo":dataItem.fileNo});
            });

            $.ajax({
                url:"<c:url value='/cmm/sci/fileUpload/deleteFiles.do' />"
                ,data:JSON.stringify(deleteList)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(jqXHR, textStatus) {

                    grid.dataSource._destroyed = [];
                    grid.dataSource.read();

                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });
        });

        /* *************************************************************************
         **************************파일업로드5:스크립트 추가 $(document).ready 안쪽*****
         ***************************************************************************/

});





/* *************************************************************************
 **************************파일업로드6:스크립트 추가 $(document).ready 밖 *****
 ***************************************************************************/
 //================================
 var r = new Resumable({
     target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
     ,chunkSize:1 * 1024 * 1024
     ,simultaneousUploads:4
     ,testChunks:true
     ,throttleProgressCallbacks:1
     ,method:"octet"
 });
 r.assignBrowse($('#fileSelect')[0]);

 //파일추가 이벤트
 r.on('fileAdded', function(file) {

     $("#progressWindow").kendoWindow({
         width:"600px"
         ,height:"300px"
         ,title:"<spring:message code='global.lbl.fileSend'/>"     // 파일전송
         ,animation:false
         ,draggable:false
         ,visible:false
         ,resizable:false
         ,modal:true
         ,pinned:true
     }).data("kendoWindow").center().open();


     $('.resumable-progress, .resumable-list').show();
     $('.resumable-progress .progress-resume-link').hide();
     $('.resumable-progress .progress-pause-link').show();

     //파일목록 출력
     $('.resumable-list').append('<li class="resumable-file-'+file.uniqueIdentifier+'"><div class="progress-file-name"><div class="resumable-file-name"></div><div class="progress-file-size"><!--<span class="progress-complete-size">00</span>MB/<span class="progress-whole-size">00</span>MB</div>--></div><div class="file-progress-container"><div class="resumable-file-progress"></div><div class="resumable-file-txt"></div></div>');
     $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-name').html(file.fileName);

     //업로드 시작
     r.upload();

 });
 r.on('pause', function() {
     $('.resumable-progress .progress-resume-link').show();
     $('.resumable-progress .progress-pause-link').hide();
 });
 r.on('uploadStart', function() {

     var _that = this;

     if (_that.opt["query"] == null) {
          _that.opt["query"] = {};
     }

     if (dms.string.isEmpty($("#activeFileDocNo").val())) {
         $.ajax({
             url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
             dataType:"json",
             type:"get",
             async:false,
             cache:false,
             success:function(id) {
                 _that.opt["query"]["resumableSessionId"] = id;
                 $("#activeFileDocNo").val(id);                                    // 파일업로드7:업로드 완료후  마스터 테이블의 fileDocNo 를 변경해준다
//alert(id);
//console.log(id);
             }
         });
     } else {
         _that.opt["query"]["resumableSessionId"] = $("#activeFileDocNo").val();   // 파일업로드8:기존꺼에 추가할경우 fileDocNo 설정
     }

     $('.resumable-progress .progress-resume-link').hide();
     $('.resumable-progress .progress-pause-link').show();
 });
 r.on('complete', function() {

     var _that = this;

     $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();

     //console.log("resumableSessionId:" + _that.opt["query"]["resumableSessionId"]);

     $("#progressWindow").data("kendoWindow").close();
     r.files = [];
     $(".resumable-list").html("");
 });
 r.on('fileSuccess', function(file, message) {

     var result = JSON.parse(message);
     if(result.status === "finished") {
         $("#fileGrid").data("kendoExtGrid").dataSource.insert({
             fileDocNo:result.fileDocNo
             ,fileNo:result.fileNo
             ,fileNm:result.fileNm
             ,fileSize:dms.string.formatFileSize(result.fileSize)
         });
         //$('.resumable-file-'+file.uniqueIdentifier+' .resumable-file-progress').html('(completed)');
     }


 });
 r.on('fileError', function(file, message) {
     $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html('(file could not be uploaded:' + message + ')');
 });
 r.on('fileProgress', function(file) {
     var fileProgress = 0;

     if (file instanceof ResumableChunk) {
         fileProgress = file.fileObj.progress();
     } else {
         fileProgress = file.progress();
     }

     $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html(Math.min(Math.floor(fileProgress * 100), 100) + '%');
     $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').css({width:Math.min(Math.floor(fileProgress * 100), 100) + '%'});
     $('.progress-bar').css({width:Math.min(Math.floor(r.progress() * 100), 100)+ '%'});
 });
 /* *************************************************************************
 **************************파일업로드6:스크립트 추가 $(document).ready 밖 *****
 ***************************************************************************/





/**
 * 차종에 따른 모델 조회
 */
function selectGridCarlineCd(e) {
    var dataItem = this.dataItem(e.item);
    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/svo/askHelpCar/selectModel.do"
        ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
        ,async:false
    });

    modelCdDSList = responseJson.data;

    modelCdObj = [];

    if(modelCdDSList != null ){
        $.each(modelCdDSList, function(idx, obj){
            modelCdObj[obj.modelCd] = obj.modelNm;
        });
    }
};

//1 Grid- 차종의 template 정의
function bf_selectCarLine(carlineCd) {
    if(carlineCd == ""){
        return "";
    }else{
        return carLineCdObj[carlineCd];
    }
}

//2 Grid- 모델의 template 정의
function bf_selectModel(modelCd, modelNm){
    if(modelNm != ""){
        return modelNm;
    }
    if(modelCd == ""){
        return "";
    }
    return modelCdObj[modelCd];
}

/**
* 유형에 따른 유형 Sub 조회(조회조건)
*/
function onSelectMakTpCdSearch(e) {

   var dataItem = this.dataItem(e.item);

   $("#sMakSubTpCd").data("kendoExtDropDownList").setDataSource([]);
   $("#sMakSubTpCd").data("kendoExtDropDownList").enable(true);

   if(dataItem.cmmCd == ""){
       $("#sMakSubTpCd").data("kendoExtDropDownList").setDataSource([]);
       $("#sMakSubTpCd").data("kendoExtDropDownList").enable(false);
       return false;
   }

   var responseJson = dms.ajax.getJson({
       url:_contextPath + "/crm/mcm/marketingCampaign/selectMakTpCdList.do"
       ,data:JSON.stringify({"cmmCd":dataItem.cmmCd})
       ,async:false
   });

   $("#sMakSubTpCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

};

/**
* 유형에 따른 유형 Sub 조회(입력부)
*/
function onSelectMakTpCd(e) {
    var dataItem = this.dataItem(e.item);
    onSelectMakTpCdSet(dataItem.cmmCd);
};


/**
* 유형에 따른 유형 Sub 조회(값 셋팅시에만 사용함)
*/
function onSelectMakTpCdSet(value) {
    var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
    var makCd = $("#makCd").val();
    var statCd = $("#statCd").data("kendoExtDropDownList").value();
    var hostCd = $("#hostCd").data("kendoExtDropDownList").value();

    // 딜러 > 정비 인경우 시행처 삭제
    if ( hostCd === "01" ) {
        $("#crIsaNmTxt").removeClass("hidden");
        $("#crIsaNm").removeClass("hidden");
    } else if ( hostCd === "02"){
        $("#crIsaNmTxt").addClass("hidden");
        $("#crIsaNm").addClass("hidden");
    };

    if(value == "03"){
        $("#serviceInfo1").show();
        $("#serviceInfo2").show();
        if($("#makCd").val() != ""){
            tabStrip.enable(tabStrip.tabGroup.children().eq(5));
            tabStrip.enable(tabStrip.tabGroup.children().eq(6));
            tabStrip.enable(tabStrip.tabGroup.children().eq(7));
            tabStrip.enable(tabStrip.tabGroup.children().eq(8));
            tabStrip.enable(tabStrip.tabGroup.children().eq(9));
        }
    }else{
        $("#serviceInfo1").hide();
        $("#serviceInfo2").hide();
        if($("#makCd").val() != ""){
            tabStrip.disable(tabStrip.tabGroup.children().eq(5));
            tabStrip.disable(tabStrip.tabGroup.children().eq(6));
            tabStrip.disable(tabStrip.tabGroup.children().eq(7));
            tabStrip.disable(tabStrip.tabGroup.children().eq(8));
            tabStrip.disable(tabStrip.tabGroup.children().eq(9));
        }
    }
    if(value == ''){
        $("#makSubTpCd").data("kendoExtDropDownList").setDataSource([]);
        $("#makSubTpCd").data("kendoExtDropDownList").enable(false);
    }else{
        $("#makSubTpCd").data("kendoExtDropDownList").setDataSource([]);
        if (statCd === '02' || statCd === '03'  || statCd === '06' ){
            $("#makSubTpCd").data("kendoExtDropDownList").enable(false);
        } else {
            $("#makSubTpCd").data("kendoExtDropDownList").enable(true);
        }

        var responseJson = dms.ajax.getJson({
            url:_contextPath + "/crm/mcm/marketingCampaign/selectMakTpCdList.do"
            ,data:JSON.stringify({"cmmCd":value})
            ,async:false
        });

        $("#makSubTpCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
    }
};

/**
 * 캠페인번호에 따른 공임코드 조회(값 셋팅시에만 사용함)
 */
function onSelectLbrCdSet(value1, value2) {

  var responseJson = dms.ajax.getJson({
      url:_contextPath + "/crm/mcm/marketingCampaign/selectLbrCdList.do"
      ,data:JSON.stringify({"sDlrCd":value1,"sMakCd":value2})
      ,async:false
  });

  lbrList = responseJson.data;

  $.each(lbrList, function(idx, obj){
      lbrMap[obj.lbrCd] = obj.lbrNm;
  });

};

/**
* 직무명 조회
*/
function fn_getTaskNm(usrId) {

    var responseRlt;
    var param = {};
    param["sUsrId"] = usrId;

    $.ajax({
        url:"<c:url value='/crm/mcm/marketingCampaign/selectUsersForTaskName.do' />"
       ,data:kendo.stringify(param)
       ,type:'POST'
       ,dataType:'json'
       ,contentType:'application/json'
       ,async:false
       ,success:function(result) {
           responseRlt = result;
       }
       ,error:function(jqXHR,status,error) {
           dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
       }
   });

     return responseRlt;

 };

 //대상자자동추출 상태 체크
 function custExtrAutoYn(val){
     var targetGrid = $("#targetGrid").data("kendoExtGrid");
     var evalDs = targetGrid.dataSource;
     var iRowCnt = evalDs.total();
     var custExtrAutoYn;

     if (iRowCnt > 0) {
         $.each(targetGrid.dataSource.view(), function(idx, dataItem){
             custExtrAutoYn = dataItem.custExtrAutoYn;
             console.log(dataItem);
             if (val == "N"){    // N 대상자자동추출
                 if (val != custExtrAutoYn) {
                  // 대상자자동추출조건이 'Y'로 된 추출이 있습니다.
                     $("#custExtrAutoYn").data("kendoExtDropDownList").value(" ");
                     dms.notification.info("<spring:message code='crm.info.alreadyCustExtrAutoY'/>");
                     return false;
                 }
             } else if(val == "Y") {  // Y 대상자자동추출
                 if (val != custExtrAutoYn) {
                     // 대상자자동추출조건이 'N'으로 된 추출이 있습니다.
                     $("#custExtrAutoYn").data("kendoExtDropDownList").value(" ");
                     dms.notification.info("<spring:message code='crm.info.alreadyCustExtrAutoN'/>");
                     return false;
                 }
             }
         });
     }
 };
</script>