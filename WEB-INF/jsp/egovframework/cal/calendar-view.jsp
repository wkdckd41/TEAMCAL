<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <link href='/resources/css/plugin/fullcalendar.min.css' rel='stylesheet' />
    <link href='/resources/css/plugin/fullcalendar.print.min.css' rel='stylesheet' media='print' />
    <c:import url="/WEB-INF/jsp/egovframework/inc/head.jsp">
        <c:param value="/resources/css/official/notice.css" name="cssName"/>
    </c:import>
    <jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/script.jsp"/>
    <script src='/resources/js/moment.min.js'></script>
    <script src='/resources/js/fullcalendar.min.js'></script>
</head>
<body id="official">

<!-- utiltop -->
<jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/utiltop.jsp"/>
<!-- //utiltop -->

<div id="wrapper" class="wrap">

    <!-- header -->
    <jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/header.jsp"/>
    <!-- //header -->

    <div id="container" class="container_wrap notice">
        <div class="content">
            <div class="section">
                <div class="sub_visual_area small_visual">
                    <div class="visual_cnt">
                        <div class="row-wide info_sbj_location">
                            <div class="col-8 breadcrumb">
                                <ul>
                                    <li class="bc_home"><a href="/${savedLanguage}/main/main.do" data-i18n="common:breadcrumb.home"><!-- 홈 --></a></li>
                                    <li class="bc_tit"><a href="/${savedLanguage}/resources/highlight.do" data-i18n="resources:resources"><!-- 소식/자료 --></a></li>
                                    <li class="bc_tit"><span data-i18n="in_the_press"><!-- 언론보도 --></span></li>
                                </ul>
                            </div>
                            <div class="col-2 share_area on">
                                <ul>
                                    <li><a href="#none" class="share_sbj" data-i18n="common:breadcrumb.share"><!-- 공유하기 --></a></li>
                                    <li><a href="#none" class="print_sbj" data-i18n="common:breadcrumb.print_out"><!-- 프린트 --></a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="grid-layout info_sbj_box txt_center">
                            <h2 class="sub_tl" id="study_subtitle"></h2>
                        </div>
                    </div>
                </div>

                <div class="grid-layout page_work">
                    <div class="row view_wrap view_wrap_member"><!-- 관련 구성원이 있을 경우에만 view_wrap_member 추가 -->
                        <div class="col-12">
                            <div class="inner">
                                <div class="view_type_post">
                                    <div class="subject">
                                        <p class="title" id="study_title"></p>
                                        <p class="date" id="study_desc"></p>
                                    </div>

                                    <div class="detail">
                                        <div class="content">
                                            <div class="additional" id="calendar"></div>

                                        </div>

                                        <%--<div class="additional">
                                            <div class="related_news">
                                                <span class="text">공유링크</span>
                                                <ul class="list">
                                                    <li><a href="https://www.knou.ac.kr/" target="_blank">방통대홈페이지</a></li>
                                                    <li><a href="https://www.knou.ac.kr/" target="_blank">컴퓨터과학과</a></li>
                                                </ul>
                                            </div>
                                        </div>--%>
                                    </div>
                                </div>

                                <div class="view_member_list">
                                    <div class="view_member_list_box">
                                        <button onclick="cal.fnJoinStudy();" class="btn_view_list" >스터디가입</button>
                                    </div>
                                    <div class="view_member_list_box">
                                        <button onclick="cal.fnShowNewPlan();" class="btn_view_list" >새일정</button>
                                        <br/>
                                        <div id="new_plan" style="display:none;">
                                        
                                            <span class="all_day"><input type="checkbox" id="chk_year_all" class="chk_year_all">
                                            <label for="chk_year_all">종일 일정</label></span>
                                            
                                            <input type="text" id="plan_title" class="" placeholder="일정 제목">

                                            <input type="text" id="start_date" class="datepicker" placeholder="시작일">

                                            <input type="text" id="end_date" class="datepicker" placeholder="종료일">
                                            <br/>
                                            <p class="page_btn">
													<button onclick="cal.fnSetEvent()"
														class="btn_view_list02 bg_blue">등록</button>
													<button onclick="cal.fnHideNewPlan()"
														class="btn_view_list02 bg_gray">취소</button>
											</p>
                                        </div>
                                    </div>

                                    <div class="view_member_list_box">
                                        <button onclick="cal.fnShowNewMemo();" class="btn_view_list" >새메모</button>
                                        <br/>
											<div id="new_memo" style="display: none;">
												<input type="text" id="memo_content"
													placeholder="50자 이내"> <br />

												<p class="page_btn">
													<button onclick="cal.fnSetMemo()" class="btn_view_list02  bg_blue">
														등록</button>
													<button onclick="cal.fnHideNewMemo()" class="btn_view_list02 bg_gray">
														취소</button>
												</p>
											</div>
									</div>
									
									
                                    <ul class="member_list" id="memo_list">
                                    </ul>
                                    <ul class="member_list" id="member_list">

                                    </ul>
                                </div>
                            </div>

                            <div class="view_pagination">
                                <a href="/${savedLanguage}/main/main.do" class="btn_view_list mb20">목록</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- //section -->


        </div> <!-- //content -->

    </div> <!-- //container -->

    <%--<jsp:directive.include file="/WEB-INF/jsp/egovframework/cal/newPlan.jsp"/>--%>
    <%--<jsp:directive.include file="/WEB-INF/jsp/egovframework/cal/newMemo.jsp"/>--%>
    <!-- footer -->
    <jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/footer.jsp"/>
    <!-- //footer -->
    <!-- search -->
    <%@ include file="/WEB-INF/jsp/egovframework/inc/search.jsp" %>

</div> <!--//wrapper -->
<script type="text/javascript">
    var calendarSeq = "${param.calNo}";
    var language_cd = "${savedLanguage}" == "" ? "ko" : "${savedLanguage}";
    $(document).ready(function () {
        i18n.fnInit(
            options = {
                lang: language_cd,
                namespace: ['main', 'common'],
                defaultNs: 'main'
            },
            function () {
                cal.fnInit();

                $( ".datepicker" ).datepicker({
                    changeMonth: true,
                    changeYear: true,
                    nextText: '다음 달',
                    prevText: '이전 달',
                    changeMonth: true,
                    dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
                    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
                    monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
                    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                    currentText: '오늘',
                    closeText: '닫기',
                    dateFormat: "yy-mm-dd"
                });
                cal.fnGetEvent();
                cal.fnGetCalendarInfo();
                cal.fnGetMemo();
                cal.fnGetMember();
            });
    });

    var cal = {
        fnShowNewPlan : function(){
            $("#new_plan").show();
        },

        fnShowNewMemo : function(){
            $("#new_memo").show();
        },

        fnHideNewPlan : function(){
            if(confirm("취소하시겠습니까?")){
                $("#plan_title").val("");
                $("#start_date").val("");
                $("#end_date").val("");
                $("#new_plan").hide();
            }
        },

        fnHideNewMemo : function(){
            if(confirm("취소하시겠습니까?")){
                $("#memo_content").val("");
                $("#new_memo").hide();
            }
        },

        fnInit : function(){
            var paramData = {
                study_seq   : calendarSeq
            }

            gFnObjSyncAjaxCall(true, paramData, "/calendar/getScheduleList.ajax", function(res){
                if(res.result == "SUCCESS"){
                    var scheduleList = res.scheduleList;
                    calendar = $('#calendar').fullCalendar({
                        header: {
                            left:   'month,agendaWeek,agendaDay',
                            center: 'title',
                            right:  'prev today next'
                        },
                        buttonIcons:{
                            prev: 'left-single-arrow',
                            next: 'right-single-arrow',
                            prevYear: 'left-double-arrow',
                            nextYear: 'right-double-arrow'
                        },
                        buttonText : {
                            today:    '오늘',
                            month:    '월',
                            week:     '주',
                            day:      '일',
                            list:     'list'
                        },
                        defaultDate: cal.fnGetDate(),
                        editable: true,
                        eventLimit: true, // allow "more" link when too many events
                        events: scheduleList
                    });
                }
            });


        },

        fnGetDate : function() {
            var _date = new Date();

            var month = _date.getMonth()+1;
            var day = _date.getDate();
            var year = _date.getFullYear();

            return month + '-' + day + '-' + year;
        },

        fnGetEvent : function () {

        },

        fnSetEvent : function(){
            var _title = $("#plan_title").val();
            var _start_date = $("#start_date").val();
            var _end_date = $("#end_date").val();

            var paramData = {
                study_seq                   : calendarSeq
                ,start_date                 : _start_date
                ,end_date                   : _end_date
                ,study_schedule_content     : _title
            }

            gFnObjSyncAjaxCall(true, paramData, "/calendar/setScheduleList.ajax", function(res){
                if(res.result == "SUCCESS"){
                    calendar.fullCalendar('renderEvent', {
                        title   : _title,
                        start   : _start_date,
                        end     : _end_date
                    });

                    cal.fnInitPlan();
                }
            });
        },

        fnInitPlan : function(){
            $("#plan_title").val("");
            $("#start_date").val("");
            $("#end_date").val("");
            $("#new_plan").hide();
        },

        fnGetCalendarInfo : function(){
            var paramData = {
                studySeq : calendarSeq
            }

            gFnObjSyncAjaxCall(true, paramData, "/calendar/getStudyInfo.ajax", function(res){
                if(res.result == "SUCCESS"){
                    var studyInfo = res.calendarVO;

                    $("#study_subtitle").append(studyInfo.studyTitle);
                    $("#study_title").append(studyInfo.studyTitle);
                    $("#study_desc").append(studyInfo.studyDesc);

                }
            });
        },

        fnGetMemo : function(){

            var paramData = {
                study_seq : calendarSeq
            }

            gFnObjSyncAjaxCall(true, paramData, "/calendar/getMemoList.ajax", function(res){
                if(res.result == "SUCCESS"){
                    var memoList = res.memoList;

                    var resultTxt = '';
                    $.each(memoList, function (i, memoItem) {
                        resultTxt += '<li>';
                        resultTxt += '<strong class=\"name\"><span>' + memoItem.memo_content + '</span></strong> <a href="javascript:cal.fnDelMemo('+memoItem.memo_seq+')">X</a>';
                        resultTxt += '</li>';
                    });
                    $("#memo_list").empty();
                    $("#memo_list").append(resultTxt);
                    $("#memo_content").val("");
                    $("#new_memo").hide();
                }
            });
        },

        fnSetMemo : function(){
            if(cal.fnValidation()){

                if(!gFnIsNull($("#memo_content").val())){

                    var paramData = {
                        study_seq       : calendarSeq
                        ,memo_content   : $("#memo_content").val()
                    }
                    gFnObjSyncAjaxCall(true, paramData, "/calendar/setMemoList.ajax", function(res){
                        if(res.result == "SUCCESS"){
                            cal.fnGetMemo();
                        }
                    });
                } else {
                    alert("메모를 입력해주세요.");
                    $("#memo_content").focus();
                }
            }
        },

        fnDelMemo : function(memoSeq){
            var paramData = {
                memo_seq : memoSeq
            }
            gFnObjSyncAjaxCall(true, paramData, "/calendar/delMemoList.ajax", function(res){
                if(res.result == "SUCCESS"){
                    alert("메모가 삭제되었습니다.");
                    cal.fnGetMemo();
                }
            });
        },

        fnGetMember : function () {
            var paramData = {
                study_seq : calendarSeq
            }
            gFnObjSyncAjaxCall(true, paramData, "/calendar/getMemberList.ajax", function(res){
                if(res.result == "SUCCESS"){
                    var memberList = res.memberList;

                    var resultTxt = '';
                    $.each(memberList, function (i, memberItem) {
                        resultTxt += '<li>';

                        if(memberItem.study_mbr_flg == 'c'){
                            resultTxt += '<strong class=\"name\">';
                        }

                        resultTxt += '<span>' + memberItem.study_mbr_nm + '</span>';
                        if(memberItem.study_mbr_flg == 'c'){
                            resultTxt += '</strong>';
                        }
                        resultTxt += '</li>';
                    });

                    $("#member_list").empty();
                    $("#member_list").append(resultTxt);
                }
            });
        },

        fnValidation : function () {
            var member_id = "${membershipVO.memberId}";
            if(gFnIsNull(member_id)){
                alert("로그인 후 이용해주세요.");
                return false;
            }

            return true;
        },

        fnJoinStudy : function () {
            if(!gFnIsNull(cal.fnValidation())){
                var paramData = {
                    study_seq: calendarSeq
                    ,member_seq : "${membershipVO.memberSeq}"
                }
                gFnObjSyncAjaxCall(true, paramData, "/calendar/getMemberRegList.ajax", function(res){
                    if(res.result == "SUCCESS"){
                        if(gFnIsNull(res.memberVO)){
                            paramData = {
                                study_seq : calendarSeq
                                ,member_seq : "${membershipVO.memberSeq}"
                                ,study_mbr_nm : "${membershipVO.memberName}"
                                ,study_mbr_flg : 'm'
                            }
                            gFnObjSyncAjaxCall(true, paramData, "/calendar/setMemberList.ajax", function(res){
                                if(res.result == "SUCCESS"){
                                    alert("스터디에 가입되었습니다.");
                                    cal.fnGetMember();
                                }
                            });
                        } else {
                            alert("이미 가입된 스터디입니다.");
                        }
                    }
                });

            }
        }
    }
</script>
</body>
</html>
