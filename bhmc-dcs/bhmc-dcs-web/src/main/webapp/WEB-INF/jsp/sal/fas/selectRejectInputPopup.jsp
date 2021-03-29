<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="window" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnConfirm" class="btn_m"><spring:message code='global.btn.confirm' /></button>       <!-- 确认 -->
             <button id="btnClose" class="btn_m"><spring:message code='global.btn.close' /></button>          <!-- 取消 -->
        </div>
    </div>

    <div class="table_form form_width_20per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:13%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.evalRemark' /></th>
                    <td>
                        <textarea id="approvalNoteDesc" rows="7" cols="" class="form_textarea"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

</section>


<!-- script -->
<script type="text/javascript">

$(document).ready(function() {
    // 获取父页参数值
    var vo = [];
     var options = parent.popupWindow.options.content.data;
     vo = options.params.list;
    $("#btnConfirm").kendoButton({
        click:function(e){
            var param = {};
            for(var i=0;i < vo.length;i++){
            	console.log(typeof vo[i]);
            	vo[i]["approvalNoteDesc"] = $("#approvalNoteDesc").val();
            	//vo[i].push({approvalNoteDesc:$("#approvalNoteDesc").val()});
            }
            param = {list:vo};
           
            $.ajax({
                url:"<c:url value='/sal/fas/coercionApproval/nonConfirms.do' />",
                data:JSON.stringify(param),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                },
                success:function(jqXHR, textStatus) {
                     //dms.notification.success("<spring:message code='global.info.success'/>");
                     var data = [];
                     data.msg = 'save';
                     options.callbackFunc(data);
                     parent.popupWindow.close();
                }
            });
           
        }
    });

    // 关闭
    $("#btnClose").kendoButton({
        click:function(e){
            var data = [];
            data.msg = 'close';
            options.callbackFunc(data);
            parent.popupWindow.close();
        }
    });

   

});

</script>