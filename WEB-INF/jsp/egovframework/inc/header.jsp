<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="header" class="header_wrap">
    <!-- heder inner -->
    <div class="header_inner">

        <h1 class="logo"><a href="/${savedLanguage}/main/main.do">TEAM CAL</a></h1>

        <!-- 1depth area -->
        <div class="gnb_area">
            <ul class="nav_inner">
                <!-- 활성화시 클래스 .on 추가 -->
                <li>
	                <select id="majorList" name="search_major" class="m_select" onchange="fnChangeMajor();">
	                	<option value="0">과별</option>
					</select>
                </li>
                <li>
                	<select id="grdList" name="search_grd" class="m_select" onchange="fnChangeGrade();">
	                	<option value="0">학년별</option>
                        <option value="1">1학년</option>
                        <option value="2">2학년</option>
                        <option value="3">3학년</option>
                        <option value="4">4학년</option>
                    </select>
				</li>
            </ul>
        </div>
        <!-- //1depth area -->

        <!-- gnb & util area -->
        <div class="gnb_btn_area">
			<a href="javascript:head.fnGoEyulchon();" class="icon_eyulchon">eyulchon</a>
			<button class="icon_search" data-layer-target="#pop_search" id="header_search_btn">
                <span class="icon_search_in">
                    <em class="icos ico1"></em>
                    <em class="icos ico2"></em>
                </span>
                <span class="icon_search_box">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </span>
            </button>
        	<c:choose>
            	<c:when test="${membershipVO.memberId != null}">
            		<a href="/${savedLanguage}/membership/my-info.do" class="icon_login" data-i18n="common:login"><!-- My Account --></a>
            	</c:when>
            	<c:otherwise>
            		<a href="/${savedLanguage}/membership/login.do" class="icon_login" data-i18n="common:login"><!-- 로그인 --></a>
            	</c:otherwise>
            </c:choose>
            <button class="icon_snb"> </button>
        </div>
        <!-- //gnb & util area -->

    </div>
    <!-- //heder inner -->

    <!-- side menu -->
    <div class="snb_dimmed">&nbsp;</div>
    <div id="snb_menu" class="side_nav">
        <div class="nav_inner swiper-container scroll-container">
            <div class="swiper-scrollbar"></div>
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="nav_top">
                        <!-- user_area -->
                        <div class="user_info">
                        	<c:choose>
	                        	<c:when test="${membershipVO.memberId != null}">
		                            <p>${membershipVO.memberId}</p>
	                        	</c:when>
	                        	<c:otherwise>
		                            <p data-i18n="common:request_login"><!-- 로그인 해주세요 --></p>
	                        	</c:otherwise>
	                        </c:choose>
                            <button class="btn_close" data-i18n="common:button.close"><!-- 닫기 --></button>
                        </div>
                        <div class="user_area">
	                        <c:choose>
	                        	<c:when test="${membershipVO.memberId != null}">
		                            <a href="/${savedLanguage}/membership/my-info.do" class="btn_login">My Account</a>
		                            <a href="#none" class="btn_register" onclick="logout.fnLogout()">Logout</a>
	                        	</c:when>
	                        	<c:otherwise>
		                            <a href="/${savedLanguage}/membership/login.do" class="btn_login">Login</a><!-- 로그인시 My account -->
		                            <a href="/${savedLanguage}/membership/register.do" class="btn_register">Register</a>
	                        	</c:otherwise>
	                        </c:choose>
                        </div>
                        <!-- //user_area -->
                    </div>

                    <div class="nav_middle">
                        <!--
                            level01: 1depth 메뉴
                            level02: 2depth 메뉴 구분
                            2depth 메뉴 있을 경우 drop_menu 클래스 추가
                        -->
                        <!-- <ul class="nav_list menu1">
                            <li class="level1 drop_menu"><a href="javascript:void(0);"><span>학년별</span><i>닫힘</i></a>
                                <ul class="level2">
                                    <li><a href="javascript:void(0);"><span>1학년</span></a></li>
                                    <li><a href="javascript:void(0);"><span>2학년</span></a></li>
                                    <li><a href="javascript:void(0);"><span>3학년</span></a></li>
                                    <li><a href="javascript:void(0);"><span>4학년</span></a></li>
                                </ul>
                            </li>
                            <li class="level1 drop_menu"><a href="javascript:void(0);"><span>과목별</span><i>닫힘</i></a>
                                <ul class="level2">
                                    <li><a href="javascript:void(0);"><span>똥</span></a></li>
                                    <li><a href="javascript:void(0);"><span>예</span></a></li>
                                    <li><a href="javascript:void(0);"><span>뺌</span></a></li>
                                    <li><a href="javascript:void(0);"><span>뭔지알지</span></a></li>
                                </ul>
                            </li>
                        </ul> -->

                        <!-- utility menu -->
                        <ul id="myStudyLeftMenu" class="nav_list menu2">
                        	
                        </ul>
                        <!-- //utility menu -->
                    </div>

                    <div class="nav_bottom">
                        <ul class="lang_area">
                       	<c:if test="${membershipVO != null }">
                            <li class=""><a href="/${savedLanguage}/cal/calendar-create.do" >캘린더 생성</a></li>
                        </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div> <!-- //nav_inner -->
    </div> <!-- snb_menu -->
    <!-- //side menu -->
</div>
<script type="text/javascript">
$(document).ready(function(){
	var langCd = "${savedLanguage}";
	
	// 언어 on 처리
	$("#lang_area").find("li").removeClass("on");
	var a = $("#lang_area").find("a");
	$.each(a, function(i){
		var cd = $(this).data("value");
		if(langCd == cd){
			$(this).parent().addClass("on");
		}
	});
	
	// 언어 변경
	$(".languageSet").on('click', function(){
		var languageCd = $(this).data("value");
		var path = location.pathname;
		var paths = path.split("/");
		var url = '/'+languageCd+'/';
		for(var i = 2; i < paths.length; i++){
			url += paths[i];
			if(i != paths.length-1){
				url += "/";
			}
		}
		if(location.search != ""){
			url += location.search;
		}
		
		$(location).attr("href", url);
	});
	
	var sessionObj = "${membershipVO}";
	
	if (sessionObj != null) {
		myStudyList.fnInit();
	}
	
	majorList.fnInit();

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

				$("#majorList").append(appendHtml);
			}
		});
	}
}

var memberSeq = "${membershipVO.memberSeq}";

var myStudyList = {
		
	fnInit : function() {
		myStudyList.fnMyStudyLeftMenu();
	},
	
	fnGetData : function() {
		var param = {
				memberSeq : memberSeq
		}

		return param;
	},
	
	fnMyStudyLeftMenu : function() {
		gFnObjSyncAjaxCall(false, myStudyList.fnGetData(), "/membership/getMyStudyLeftMenu.ajax", function(res) {
			var result = res.result;
			if (result != "SUCCESS") {
				alert("데이터를 불러오는데 실패하였습니다.\n"+res.resultMsg);
			} else {
				var resultList = res.resultList;
				var appendHtml = "";
				
				$.each(resultList, function(i, resultItem) {
					appendHtml += "<li class=\"level1 drop_menu\"><a href=\"/${savedLanguage}/cal/calendar-view.do?calNo="+resultItem.study_seq+"\"><span>"+resultItem.study_title+"</span><!-- 닫힘 --></a></li>";
				});
				
				
				$("#myStudyLeftMenu").append(appendHtml);
			}
		});
	}
}

var logout = {
	fnLogout : function() {
		gFnObjSyncAjaxCall(false, '', "/membership/getLogout.ajax", function(res){
			alert("로그아웃 되었습니다.");
			location.href = "/ko/main/main.do";
		});
	}
}

function fnChangeMajor() {
	$("#cal_list").empty();
	list.fnInit();
}

function fnChangeGrade() {
	$("#cal_list").empty();
	list.fnInit();
}

</script>
