<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="${savedLanguage}">
<head>
    <title >TEAM CALENDAR</title>
    <meta name="description" >
    <meta name="keywords" >
    <c:import url="/WEB-INF/jsp/egovframework/inc/head.jsp">
        <c:param value="/resources/css/official/notice.css" name="cssName"/>
    </c:import>
    <jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/script.jsp"/>
</head>

<body id="official">
<!-- utiltop -->
<jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/utiltop.jsp"/>
<!-- //utiltop -->
<div id="wrapper" class="wrap">
    <!-- header -->
    <jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/header.jsp"/>
    <!-- //header -->
    <!-- container -->
    <div id="container" class="container_wrap notice">
        <div class="content">
            <div class="section">

                <div class="sec_content bg_lightblue">
                    <div class="grid-layout page_highlight">
                        <div class="row" data-pages="1">
                            <!-- [D]
                                box background-color 정의
                                .info_box.bg_light :  #fff  (흰색)
                                .info_box.bg_deep01 : #01a4b6 (에메랄드색)
                                .info_box.bg_deep02 : #1c5db1 (파란색)
                                .info_box.bg_deep03 : #109cf3 (하늘색)
                                .info_box.bg_deep04 : #002951 (군청색)

                            -->
                            <div class="col-12-nm" data-pagenum="1" id="cal_list">
                                <!-- 배경 이미지가 존재할 시 color관련 class 삭제 -->
                               <%-- <div class="col-4 info_box" style="background-image:url('/resources/images/official/notice/img_highlight_expertise.png')">
                                    <a href="/${savedLanguage}/cal/calendar-view.do">
                                        <div class="full_box">
                                            <div class="txt_ctg"><span>1학년</span></div>
                                            <div class="txt_ctg"><span>컴퓨터과학과</span></div>
                                            <div class="txt_article" data-ellipsis="2">
                                                시험기간 공지 캘린더
                                            </div>
                                        </div>
                                    </a>
                                </div>--%>
                            </div> <!-- //col-12 -->

                            <div class="list_btn_area" id="more_view_btn" style="display: none">
                                <button type="button" class="btn_list_more" onclick="list.fnMoreView()">
                                    <span>더보기</span>
                                </button>
                            </div>
                            
                            <div class="list_nodata" id="no_result" style="display:none;">
					 			<p data-i18n="common:no_result"><!-- 검색결과가 없습니다. --></p>
					 		</div>
                        </div> <!-- // row -->
                    </div>
                </div>

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
            list.fnInit();
            window.trigger("resize");
        });
});
var CURRENT_PAGE = 1;
var PAGE_SIZE = 6;
var list = {
    fnInit : function(){
        list.fnGetList();
    },

    fnGetData : function(){
        var startPage   = 0;
        //var endPage     = CURRENT_PAGE * PAGE_SIZE;

        if(CURRENT_PAGE-1 > 0){
            startPage = (CURRENT_PAGE-1) * PAGE_SIZE + 1;
        }

        var paramData = {
            startPage        : startPage
            ,pageSize        : PAGE_SIZE
            ,search_grd      : $("#grdList").val()
            ,search_major    : $("#majorList").val()
            ,search_title	 : $("#header_word").val()
        }
        return paramData;
    },

    fnGetList : function(){
        gFnObjSyncAjaxCall(true, list.fnGetData(), "/calendar/getMainList.ajax", list.fnSetList);
    },

    fnSetList : function (res) {
        if(res != null){
            console.log(res);
            var totalCount = res.totalCount;
            var mainList = res.mainList;

            if(totalCount > 0){
            	
            	if (res.listCount == 0) {
            		if ($(".col-4").length > 0) {
            			alert("마지막 페이지입니다.");
            		} else {
            			$("#more_view_btn").hide();
                    	$("#no_result").show();
            		}
            	} else {
	                var txt = '';
	
	                $.each(mainList, function (i, mainItem) {
	                    /*
	                    .info_box.bg_light :  #fff  (흰색)
	                    .info_box.bg_deep01 : #01a4b6 (에메랄드색)
	                    .info_box.bg_deep02 : #1c5db1 (파란색)
	                    .info_box.bg_deep03 : #109cf3 (하늘색)
	                    .info_box.bg_deep04 : #002951 (군청색)
	                    */
	                    var colorClass = '';
	                    switch (i) {
	                        case 0:
	                            colorClass = 'bg_light';
	                            break;
	                        case 1:
	                            colorClass = 'bg_deep01';
	                            break;
	                        case 2:
	                            colorClass = 'bg_deep02';
	                            break;
	                        case 3:
	                            colorClass = 'bg_deep03';
	                            break;
	                        case 4:
	                            colorClass = 'bg_deep04';
	                            break;
	                        case 5:
	                            colorClass = 'bg_deep05';
	                            break;
	                    }
	                    txt += '<div class="col-4 info_box ' + colorClass + '">';
	                    txt += '<a href=\"/${savedLanguage}/cal/calendar-view.do?calNo='+mainItem.study_seq+'\">';
	                    txt += '<div class=\"full_box\">';
	                    var grade = '';
	                    if(mainItem.study_grd_limit < 1){
	                        grade = '전체학년';
	                    } else {
	                        grade = mainItem.study_grd_limit + "학년";
	                    }
	                    txt += '<div class=\"txt_ctg\"><span>' + grade + '</span></div>';
	                    txt += '<div class=\"txt_ctg\"><span>' + mainItem.major_nm + '</span></div>';
	                    txt += '<div class=\"txt_article\" data-ellipsis=\"2\">' + mainItem.study_title + '</div>';
	                    txt += '</div>';
	                    txt += '</a>';
	                    txt += '</div>';
	
	                });
	
	                if(gFnViewYN(totalCount, PAGE_SIZE, CURRENT_PAGE)){
	                    $("#more_view_btn").show();
	                }
	
	                if(CURRENT_PAGE == 1){
	                    $("#cal_list").empty();
	                }
	                $("#cal_list").append(txt);
            	}
            	
            }
        }
    },

    fnMoreView : function(){
        CURRENT_PAGE++;
        list.fnGetList();
    }
}
</script>
</body>
</html>