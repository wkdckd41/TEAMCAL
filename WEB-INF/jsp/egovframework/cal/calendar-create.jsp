<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="${savedLanguage}">
<head>
    <c:import url="/WEB-INF/jsp/egovframework/inc/head.jsp">
        <c:param value="/resources/css/official/member.css" name="cssName"/>
    </c:import>
    <jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/script.jsp"/>
</head>

<!-- utiltop -->
<jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/utiltop.jsp"/>
<!-- //utiltop -->

<div id="wrapper" class="wrap">

    <!-- header -->
    <jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/header.jsp"/>
    <!-- //header -->
    <!-- utiltop -->

    <div id="container" class="container_wrap join_step join_step02"> <!-- 회원가입 정보 입력 -->
        <div class="content">
            <div class="section">
                <div class="sub_visual_area small_visual">
                    <div class="visual_cnt">
                        <div class="row-wide info_sbj_location">
                            <div class="col-5 breadcrumb">
                                <ul>
                                    <li class="bc_home"><a href="/ko/main/main.do">홈</a></li>
                                    <li class="bc_tit"><span>스터디 생성</span></li>
                                </ul>
                            </div>
                        </div>

                        <div class="grid-layout info_sbj_box txt_center">
                            <h2 class="sub_tl">스터디 생성</h2>
                        </div>
                    </div>
                </div>
                <!-- sub_visual_area-->

                <!-- 폼 요소 -->
                <div class="column_wide form_group_wrap">
                    <div class="grid-layout">
                        <div class="row">
                            <div class="col-12 form_cnt">
                                <div>
                                    <div class="fm_txt_info"><span class="txt_essential">*표기</span>는 필수 입력 항목입니다.</div>
                                    <fieldset>
                                        <legend>스터디 생성 폼</legend>
                                        <!--
                                            label for 값과 id값 동일하게 맞춰주세요
                                        -->
                                        <p>
                                            <label for="study_title">스터디 이름<span class="txt_essential">*</span></label>
                                            <input type="text" id="study_title">
                                        </p>
                                        <!-- 유효성 체크 -->
                                        <div class="col-12 msg_validate">스터디 이름을 2자 이상 입력해주세요.</div>

                                        <p>
                                            <label for="study_desc">스터디 설명<span class="txt_essential">*</span></label>
                                            <input type="text" id="study_desc">
                                        </p>

                                        <p>
                                            <label for="study_major">학과선택<span class="txt_essential">*</span></label>
                                            <select id="study_major" name="search_major" class="m_select">
                                                <option value="0">과별</option>
                                            </select>
                                        </p>
                                        <!-- 유효성 체크 -->

                                        <p>
                                            <input type="radio" id="grd_0" placeholder="" name="study_grd_limit" value="0" checked>
                                            <label for="grd_0">전학년</label>
                                            <input type="radio" id="grd_1" placeholder="" name="study_grd_limit" value="1">
                                            <label for="grd_1">1학년</label>
                                            <input type="radio" id="grd_2" placeholder="" name="study_grd_limit" value="2">
                                            <label for="grd_2">2학년</label>
                                            <input type="radio" id="grd_3" placeholder="" name="study_grd_limit" value="3">
                                            <label for="grd_3">3학년</label>
                                            <input type="radio" id="grd_4" placeholder="" name="study_grd_limit" value="4">
                                            <label for="grd_4">4학년</label>
                                        </p>
                                        <!-- 유효성 체크 -->
                                        <div class="col-12 msg_validate">비밀번호가 일치하지 않습니다.</div>
                                        <p>
                                            <label for="study_mem_limit">스터디 인원<span class="txt_essential">*</span></label>
                                            <input type="number" id="study_mem_limit" placeholder="5-50" onkeyup="reg.gFnNumOnly(this);">
                                        </p>
                                        <p>
                                            <input type="radio" id="study_flg_y" name="study_flg" value="y" checked>
                                            <label for="study_flg_y">공개</label>
                                            <input type="radio" id="study_flg_n" name="study_flg" value="n">
                                            <label for="study_flg_n">비공개</label>
                                        </p>
                                    </fieldset>

                                    <div class="btn_area col-12">
                                        <button type="button" class="col-3" onclick="reg.fnSetCalendar()"><span>가입신청</span></button>
                                        <button type="button" class="col-3" onclick="reg.fnGoMain()"><span>MAIN</span></button>
                                    </div>
                                </div>
                            </div> <!-- //form_cnt -->
                        </div>
                    </div>
                </div> <!-- // form_group_wrap -->
                <!-- //폼 요소 -->

            </div> <!-- //section -->
        </div> <!-- //content -->
    </div> <!-- //container -->

    <!-- footer -->
    <jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/footer.jsp"/>
    <!-- //footer -->
    <!-- search -->
    <%@ include file="/WEB-INF/jsp/egovframework/inc/search.jsp" %>
    <!-- //search -->

</div> <!--//wrapper -->
<script type="text/javascript">
    var language_cd = "${savedLanguage}" == "" ? "ko" : "${savedLanguage}";
    $(document).ready(function () {
        i18n.fnInit(
            options = {
                lang: language_cd,
                namespace: ['main', 'common'],
                defaultNs: 'main'
            },
            function () {
                majorList.fnInit();
            });
    });
    var majorList = {

        fnInit : function() {
            majorList.fnMajorList();
        },

        fnMajorList : function() {
            gFnObjSyncAjaxCall(false, '', "/calendar/getMajorList.ajax", function(res) {
                var result = res.result;
                if (result != "SUCCESS") {
                    alert("데이터를 불러오지 못했습니다. 잠시 후 다시 시도해주세요.");
                } else {
                    var resultList = res.resultList;
                    var appendHtml = "";

                    $.each(resultList, function(i, resultItem) {
                        appendHtml += "<option value=\""+resultItem.major_seq+"\">"+resultItem.major_nm+"</option>";
                    });

                    $("#study_major").append(appendHtml);
                }
            });
        }
    }
    var memberID = "${membershipVO.memberId}";
    var reg = {
        fnInit : function(){
            location.reload();
        },

        fnGetData : function() {

            var param = {
                memberId        : memberID == "" ? 1 : memberID
                , studyTitle    : $("#study_title").val()
                , studyDesc     : $("#study_desc").val()
                , studyMajor    : $("#study_major").val()
                , studyMemLimit : $("#study_mem_limit").val()
                , studyGrdLimit : $("input:radio[name='study_grd_limit']:checked").val()
                , studyFlg      : $("input:radio[name='study_flg']:checked").val()
            }
            return param;
        },

        fnSetCalendar : function(){
            if(reg.fnValidation()){
                gFnObjSyncAjaxCall(true, reg.fnGetData(), "/calendar/regCalendar.ajax", function(res){
                    if(res.result == '1'){
                        alert("스터디가 개설되었습니다.");
                        //location.href
                        reg.fnInit();
                    } else {
                        alert("스터디 개설에 실패했습니다./n다시 시도해주세요.")
                    }
                });
            }

        },

        fnValidation : function(){
            if(gFnIsNull(memberID)){
                alert("로그인 해주떼여 헤헤");
                return false;
            }
            if(gFnIsNull($("#study_title").val())) {
                alert("스터디 이름을 입력하세요.");
                $("#study_title").focus();
                return false;
            }
            if(gFnIsNull($("#study_desc").val())) {
                alert("스터디 설명을 입력하세요.");
                $("#study_desc").focus();
                return false;
            }
            if($("#study_major").val() == 0){
                alert("학과명을 선택하세요.");
                $("#study_major").focus();
                return false;
            }
            var memLimit =  $("#study_mem_limit").val();
            if(gFnIsNull(memLimit)) {
                alert("스터디 인원을 입력하세요.");
                $("#study_mem_limit").focus();
                return false;
            } else {
                if(memLimit < 5){
                    alert("스터디 인원은 최소 5명입니다.");
                    $("#study_mem_limit").val("");
                    $("#study_mem_limit").focus();
                    return false;
                } else if(memLimit > 50){
                    alert("스터디 인원은 최대 50명입니다.");
                    $("#study_mem_limit").val("");
                    $("#study_mem_limit").focus();
                    return false;
                }
            }
            return true;
        },

        gFnNumOnly : function(target){
            var val = target.value;
            target.value = val.replace(/[^0-9]/g, '');
        },

        fnGoMain : function(){
            $(location).attr("href","/ko/main/main.do");
        }
    }
</script>
</body>
</html>
