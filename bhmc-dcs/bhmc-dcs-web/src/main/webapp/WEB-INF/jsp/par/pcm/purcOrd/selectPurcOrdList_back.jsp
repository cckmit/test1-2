<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 구매오더 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.purcOrdInfo" /> --%><!-- 구매오더 정보 --></h1>
            <div class="btn_right">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
            </div>
        </div>

        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch" id="searchForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.purcOrdTp" /><!-- 오더유형 --></th>
                        <td>
                            <input id="sPurcOrdTp" data-type="combo" class="form_comboBox" />
                            <input id="sTrsfTp" data-type="combo" class="form_comboBox hidden" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></th>
                        <td>
                            <input id="sPurcOrdNo" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdStatCd" /><!-- 구매오더상태 --></th>
                        <td>
                            <input id="sPurcOrdStatCd" type="text" data-type="multicombo" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.orderDt" /><!-- 구매등록일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sPurcRegDtFr" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sPurcRegDtTo" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.bpNm" /><!-- 거래처코드 --></th>
                        <td>
                             <div class="form_search">
                                <input type="text" id="sBpNm" class="form_input">
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th/>
                        <td/>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <!-- 구매오더 그리드 -->
            <div id="grid" class="grid"></div>
        </div>
    </section>
    <!-- //구매오더 -->

<!-- script -->
<script>

        var popupWindow,
            sessionBpCd         = "${bpCd}",
            sessionBpNm         = "${bpNm}",
            toDt                = "${toDt}",
            sevenDtBf           = "${sevenDtBf}",
            rowNumber           = 0, //그리드 목록 번호
            purcOrdTpList       = [],
            purcOrdTpObj        = {},
            trsfTpList          = [],
            trsfTpObj           = {},
            purcOrdStatList     = [],
            purcOrdStatObj      = {},
            popItemObj          = {},
            venderSearchPopupWin;



        trsfTpList.push({cmmCd:" ", cmmCdNm:" "});
        <c:forEach var="obj" items="${trsfTpList}" varStatus="status">
            trsfTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
            trsfTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

       purcOrdTpList.push({cmmCd:" ", cmmCdNm:" "});
        <c:forEach var="obj" items="${purcOrdTpList}" varStatus="status">
            purcOrdTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
            purcOrdTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>


        //purcOrdStatList.push({cmmCd:" ", cmmCdNm:" "});
        <c:forEach var="obj" items="${purcOrdStatList}" varStatus="status">
            purcOrdStatList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
            purcOrdStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        function fn_linkPurcOrd(pType, pPurcOrd, pBpCd, pBpNm){
            if(pType === "01"){ //등록
                parent._createOrReloadTabMenu('<spring:message code="par.menu.partOrderSave" />'
                        ,"<c:url value='/par/pcm/purcOrd/selectPurcOrdMain.do?pPurcOrdNo="+pPurcOrd+"&pBpCd="+pBpCd+"&pBpNm="+pBpNm+"'/>", "VIEW-I-10157");
            }else{
                parent._createOrReloadTabMenu('<spring:message code="par.menu.partOrderDetail" />'
                        ,"<c:url value='/par/pcm/purcOrd/selectPurcOrdStatusList.do?pPurcOrdNo="+pPurcOrd+"&pBpCd="+pBpCd+"&pBpNm="+pBpNm+"'/>", "VIEW-I-10182");
            }

        }


    $(document).ready(function() {


        //오더유형선택
        $("#sPurcOrdTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:purcOrdTpList
            ,index:0
        });

        //운송선택
        $("#sTrsfTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:trsfTpList
            ,index:0
        });

        //구매오더상태선택
        $("#sPurcOrdStatCd").kendoExtMultiSelectDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:purcOrdStatList
            ,dataBound:function(){
                var current = this.value();
                this._savedOld = current.slice(0);
            }
        });

        /*
        //구매오더상태선택
        $("#sPurcOrdStatCd").kendoMultiSelect({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:purcOrdStatList
            ,dataBound:function(){
                var current = this.value();
                this._savedOld = current.slice(0);
            }
        });
        */

        /*
        $("#sPurcRegDtFr").kendoDatePicker({
            format:"{0:<dms:configValue code='dateFormat' />}"
           ,value:""
        });

        $("#sPurcRegDtTo").kendoDatePicker({
            format:"{0:<dms:configValue code='dateFormat' />}"
           ,value:""
        });
        */
        $("#sPurcRegDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sPurcRegDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#searchCustCd").on('click', selectVenderMasterPopupWindow);



        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){

                /*
                var sPurcRegDtFr,
                    sPurcRegDtTo;

                sPurcRegDtFr = $("#sPurcRegDtFr").val();
                sPurcRegDtTo = $("#sPurcRegDtTo").val();

                if(!partsJs.string.onlyCheckDate(sPurcRegDtFr)){
                    return false;
                }

                if(!partsJs.string.onlyCheckDate(sPurcRegDtTo)){
                    return false;
                }
                */
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });


        // 구매 헤더 그리드
        $("#grid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pcm/purcOrd/selectPurcOrds.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            //var sPurcOrdStatCdLst = $("#sPurcOrdStatCd").data("kendoMultiSelect").value();
                            var sPurcOrdStatCdLst = $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value();
                            if(dms.string.isEmpty(sPurcOrdStatCdLst[0])){

                                sPurcOrdStatCdLst.splice(0,1);
                            }
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            // 구매오더 검색조건 코드.
                            params["sBpNm"]              = $("#sBpNm").val();
                            params["sPurcOrdNo"]         = $("#sPurcOrdNo").val();
                            params["sPurcOrdTp"]         = $("#sPurcOrdTp").data("kendoExtDropDownList").value();
                            params["sTrsfTp"]            = $("#sTrsfTp").data("kendoExtDropDownList").value();
                            //params["sPurcRegDtFr"]       = $("#sPurcRegDtFr").data("kendoDatePicker").value();
                            //params["sPurcRegDtTo"]       = $("#sPurcRegDtTo").data("kendoDatePicker").value();
                            params["sPurcRegDtFr"]       = $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sPurcRegDtTo"]       = $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sPurcOrdStatLst"]    = sPurcOrdStatCdLst;

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
                       id:"purcOrdNo"
                      ,fields:{
                            dlrCd         :{ type:"string", editable:false }
                          , bpCd          :{ type:"string", editable:false }
                          , bpNm          :{ type:"string", editable:false }
                          , purcOrdNo     :{ type:"string", editable:false }
                          , purcOrdTp     :{ type:"string", editable:false }
                          , trsfTp        :{ type:"string", editable:false }
                          , purcOrdStatCd :{ type:"string", editable:false }
                          , regUsrId      :{ type:"string", editable:false }
                          , purcRegDt     :{ type:"date",   editable:false }
                          , itemCnt       :{ type:"number", editable:false }
                          , totPurcQty    :{ type:"number", editable:false }
                          , totPurcAmt    :{ type:"number", editable:false }
                        }
                    }
                }
            }
            , selectable:"row"
            , scrollable :true
            , autoBind   :false
            , dataBinding :function(e){
                rowNumber = 0;
             }
            , pageable:false
            , columns:[
                  {   //딜러코드
                      title:"<spring:message code='par.lbl.dlrCd' />"
                     ,field:"dlrCd"
                     ,width:80
                     ,hidden:true
                  }
                 ,{field:"rnum"
                      ,title:"<spring:message code='par.lbl.lineNm' />"
                      ,attributes:{ "style":"text-align:center"}
                      ,template  :"#= ++rowNumber #"
                      ,width:40}                //라인번호
                  ,{field:"purcOrdNo"
                      ,title:"<spring:message code='par.lbl.purcOrdNo' />"
                      ,template  :function(dataItem){

                          var spanObj = "";

                          spanObj = "<a class='k-link' onclick=\"fn_linkPurcOrd('" + dataItem.purcOrdStatCd + "','" + dataItem.purcOrdNo + "','" + dataItem.bpCd + "','" + dataItem.bpNm + "'); \">"+dataItem.purcOrdNo+"</a>";


                          return spanObj;
                      }
                      ,width:90 }                //구매오더번호
                 ,{field:"purcOrdStatCd"
                      ,title:"<spring:message code='par.lbl.purcOrdStatCd' />"
                      //,template:'#= changePurcOrdStat(purcOrdStatCd)#'
                      ,attributes:{ "style":"text-align:center"}
                      ,width:100
                      ,template:function(dataItem){

                          var spanObj = "";

                          switch(dataItem.purcOrdStatCd)
                          {
                              case "02":// 전송

                                  spanObj = "<span class='txt_label bg_blue'>"+purcOrdStatObj[dataItem.purcOrdStatCd]+"</span>";

                                  break;

                              case "03":// 확정

                                  spanObj = "<span class='txt_label bg_orange'>"+purcOrdStatObj[dataItem.purcOrdStatCd]+"</span>";

                                  break;

                              case "04":// 완료

                                  spanObj = "<span class='txt_label bg_purple'>"+purcOrdStatObj[dataItem.purcOrdStatCd]+"</span>";

                                  break;

                              case "05":// 취소

                                  spanObj = "<span class='txt_label bg_red'>"+purcOrdStatObj[dataItem.purcOrdStatCd]+"</span>";

                                  break;

                              default: // 등록

                                  spanObj = "<span class='txt_label bg_gray'>"+purcOrdStatObj[dataItem.purcOrdStatCd]+"</span>";

                                  break;
                          }

                          return spanObj;
                      }
                  }                //구매오더상태
                 ,{field:"purcRegDt"
                      ,title:"<spring:message code='par.lbl.orderDt' />"
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,attributes:{ "style":"text-align:center"}
                      ,width:90 }                //구매등록일
                 ,{field:"purcOrdTp"
                      ,title:"<spring:message code='par.lbl.purcOrdTp' />"
                      ,template:'#= changePurcOrdTp(purcOrdTp)#'
                      ,attributes:{ "style":"text-align:center"}
                      ,width:140
                      ,hidden:true}                //오더유형
                 ,{field:"bpCd"
                     ,title:"<spring:message code='par.lbl.bpCd' />"
                     ,width:105
                     ,hidden:true}  //거래처 코드
                 ,{field:"bpNm"
                     ,title:"<spring:message code='par.lbl.supplyNo' />"
                     ,width:140 }  //공급업체
                 ,{field:"itemCnt"
                     ,title:"<spring:message code='par.lbl.itemCnt' />"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                  }      //수량
                 ,{field:"totPurcQty"
                     ,title:"<spring:message code='par.lbl.qty' />"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                  }      //수량
                 ,{field:"totPurcAmt"
                     ,title:"<spring:message code='par.lbl.amt' />"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                  }      //구매총금액
                 ,{field:"trsfTp"
                     ,title:"<spring:message code='par.lbl.trsfTp' />"
                     ,template:'#= changeTrsfTp(trsfTp)#'
                     ,attributes:{ "style":"text-align:center"}
                     ,width:140}                //운송유형
                 , {   //구매등록ID
                     title:"<spring:message code='par.lbl.purcReqUsrId' />"
                     ,field:"regUsrId"
                     ,width:120
                   }
                 , { field:"" }
            ]
        });

         // 구매상태
         changePurcOrdStat = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = purcOrdStatObj[val];
             }
             return returnVal;
         };

         //  오더유형
         changePurcOrdTp = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = purcOrdTpObj[val];
             }
             return returnVal;
         };

         // 운송유형
         changeTrsfTp = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = trsfTpObj[val];
             }
             return returnVal;
         };

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

            $("#grid").data("kendoExtGrid").dataSource.data([]);

            popItemObj = {};

            $("#sBpNm").val(sessionBpNm);  //공급업체 기본셋팅
           // $("#sPurcRegDtFr").data("kendoDatePicker").value(new Date(sevenDtBf));
           // $("#sPurcRegDtTo").data("kendoDatePicker").value(new Date(toDt));

            frYY = minDate.getFullYear();
            frMM = minDate.getMonth();
            frDD = minDate.getDate();

            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();
            $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
            $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);

            $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

        }

        function selectVenderMasterPopupWindow(){

            venderSearchPopupWin = dms.window.popup({
                windowId:"venderSearchPopupWin"
                ,title:"<spring:message code = 'par.title.venderSelect'/>"   // 거래처 조회
                ,content:{
                    url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                    ,data:{
                        "type":"custom1"
                        ,"autoBind":false
                        ,"bpCd":''
                        ,"bpNm":''
                        ,"callbackFunc":function(data){
                            $("#sBpNm").val(data[0].bpNm);
                        }
                    }
                }
            });
        }

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
               if(id === 'sPurcRegDtFr'){
                   var minDate = new Date(sevenDtBf);
                   frYY = minDate.getFullYear();
                   frMM = minDate.getMonth();
                   frDD = minDate.getDate();
                   $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                   $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
               }else if(id === 'sPurcRegDtTo'){
                   var maxDate = new Date(toDt);
                   toYY = maxDate.getFullYear();
                   toMM = maxDate.getMonth();
                   toDD = maxDate.getDate();

                   $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                   $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
               }
           }else{
               if(id === 'sPurcRegDtFr'){
                   frYY = this.value().getFullYear();
                   frMM = this.value().getMonth();
                   frDD = this.value().getDate();
                   $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
               }else if(id === 'sPurcRegDtTo'){
                   toYY = this.value().getFullYear();
                   toMM = this.value().getMonth();
                   toDD = this.value().getDate();
                   $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
               }
           }


        }
        initPage();
    });
</script>
<!-- //script -->

