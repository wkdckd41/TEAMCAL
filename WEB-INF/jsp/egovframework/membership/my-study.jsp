<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="${savedLanguage}">
<head>
	<title>TEAM CALENDAR</title>
	<meta name="description" data-i18n="[content]common:head.main_description">
	<meta name="keywords" data-i18n="[content]common:head.main_keyword">
	<c:import url="/WEB-INF/jsp/egovframework/inc/head.jsp">
		<c:param value="/resources/css/official/member.css" name="cssName"/>
	</c:import>
	<jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/script.jsp" />
</head>

<c:choose>
	<c:when test="${membershipVO.memberId eq null or membershipVO.memberId eq ''}">
		<script>
			if("${savedLanguage}"=="ko") {
				alert("로그인 후 이용 가능합니다.");
			} else if("${savedLanguage}"=="en") {
				alert("Login please.");
			}
			location.href = "/${savedLanguage}/membership/login.do";
		</script>
	</c:when>
	<c:otherwise>
		<body id="official">
		<!-- utiltop -->
		<jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/utiltop.jsp" />
		<!-- //utiltop -->
		<div id="wrapper" class="wrap">
			<!-- header -->
			<jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/header.jsp" />
			<!-- //header -->
			
			<div id="container" class="container_wrap  myaccount">
				<div class="content"> 
					<div class="section"> 
						<div class="sub_visual_area small_visual">
							<div class="visual_cnt">
								<div class="row-wide info_sbj_location">
									<div class="col-5 breadcrumb">
										<ul>
											<li class="bc_home"><a href="/${savedLanguage}/main/main.do" data-i18n="common:breadcrumb.home"><!-- 홈 --></a></li>
											<li class="bc_tit"><a href="#none">Membership</a></li>
											<li class="bc_tit"><span>My Study</span></li>
											<!-- <li class="bc_tit"><span>회원가입</span></li> -->
										</ul>
									</div>							
									<div class="col-2 share_area">
										<ul>
											<li><a href="#none" class="share_sbj" data-i18n="common:breadcrumb.share"><!-- 공유하기 --></a></li>
											<li><a href="#none" class="print_sbj" data-i18n="common:breadcrumb.print_out"><!-- 프린트 --></a></li>
										</ul> 
									</div>
								</div> 
								
								<div class="grid-layout info_sbj_box txt_center">
									<h2 class="sub_tl">My Account</h2>
								</div> 
							</div>
						</div>
						<!-- //sub_visual_area--> 
						
						<div class="tab_to_dropdown">
							<div class="row">
								<div class="sec_list">
									<div class="grid-layout-np">
										<div class="col-12-nm dropdown_wrap">
											<button class="btn_dropdown"><span>My Info</span><i>닫힘</i></button>
											<ul class="top_anchors top_anchors_clear column-2">
												<li><a href="/${savedLanguage }/membership/my-info.do"><span>My Info</span></a></li> <!-- 활성화시 active  클래스 -->
												<li><a href="#none" class="active"><span>My Study</span></a></li> <!-- 활성화시 active  클래스 -->
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div> 
						 
						<!-- 폼 요소 리뷰 -->
						<div class="grid-layout page_yulchon_news">
							<div class="row list_wrap">
								<div class="col-12">
									<div id="resultList">
										<ul id="myStudyList" class="list_type_post" data-pagenum="1">
										</ul>
		
										<div class="list_btn_area" style="margin-bottom:60px;">
											<button type="button" class="btn_list_more" onclick="list.fnMoreView()">
												<span>더보기</span>
											</button>
										</div>
									</div>
	
									<!-- 검색결과 없을 시 -->
									
                                    <div id="noResult" class="list_nodata" style="display:none;">
                                        <p>자신이 개설하거나 속해있는 스터디가 존재하지 않습니다.</p>
                                    </div>
		                               
								</div>
							</div>
						</div> <!-- // form_group_wrap -->
						<!-- //폼 요소 리뷰 -->
						
					</div> <!-- //section -->  
				</div> <!-- //content -->
			</div> <!-- //container -->
			
			<!-- layer pop-->
			<%@ include file="/WEB-INF/jsp/egovframework/template/pop_field2.jsp"%>
			<!-- //layer pop -->
			
			<!-- footer -->
			<jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/footer.jsp" />
			<!-- //footer -->
			<!-- search -->
			<%@ include file="/WEB-INF/jsp/egovframework/inc/search.jsp"%>
			<!-- //search -->
			<!-- share -->
			<%@ include file="/WEB-INF/jsp/egovframework/inc/share.jsp"%>
			<!-- //share --> 
		</div> <!--//wrapper -->
	</c:otherwise>
</c:choose>


<script type="text/javascript" src="<c:out value='/resources/js/membership.js'/>"></script>
<script type="text/javascript">

var language_cd = "${savedLanguage}" == "" ? "ko" : "${savedLanguage}";
var memberId = "${membershipVO.memberId}";
var memberSeq = "${membershipVO.memberSeq}";
$(document).ready(function() {
	i18n.fnInit(
		options = {
			lang			: language_cd,
			namespace		: ['membership', 'common'],
			defaultNs		: 'membership'
		},
		function(){
			list.fnInit();
// 			myInfo.fnInit();
			// 분야선택 값 레이어 팝업에 연동하기
// 			field.fnClose();
	});
});

var memberSeq = "${membershipVO.memberSeq}";
var CURRENT_PAGE = 1;
var PAGE_SIZE = 6;
var list = {
	fnInit : function() {
		$("#resultList").show();
		$("#noResult").hide();
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
            ,memberSeq 		 : memberSeq
        }
        return paramData;
    },
    
    fnGetList : function(){
        gFnObjSyncAjaxCall(true, list.fnGetData(), "/membership/getMyStudyList.ajax", list.fnSetList);
    },
    
    fnSetList : function (res) {
    	var result = res.result;
    	if (result != "SUCCESS") {
    		alert("데이터를 불러올 수 없습니다. 잠시 후 다시 시도해주세요.\n"+res.resultMsg);
    	} else {
    		console.log(res.resultList);
    		var resultList = res.resultList;
    		if (resultList != null) {
    			
    			var cnt = res.resultCount;
    			if (cnt == 0) {
    				alert("마지막 페이지입니다.");
    			} else {
		    		var appendHtml = "";
		    		
		    		$.each(resultList, function(i, resultItem) {
		    			var mem_limit = resultItem.study_mem_limit;
			    		var grd_limit = resultItem.study_grd_limit;
			    		
			    		if (grd_limit == 0) {
			    			grd_limit = "학년제한없음";
			    		} else {
			    			grd_limit = grd_limit + "학년";
			    		}
			    		
			    		mem_limit = mem_limit + "명";
		    			
		    			appendHtml += "<div class=\"inner\">";
		    			appendHtml += "  <a href=\"/${savedLanguage}/cal/calendar-view.do?calNo="+resultItem.study_seq+"\" class=\"post_link\">";
		    			appendHtml += "    <p class=\"title\" data-ellipsis=\"2\">"+resultItem.study_title+"</p>";
		    			appendHtml += "    <p class=\"date\">"+resultItem.study_major+" | "+mem_limit+" | "+grd_limit+"</p>";
		    			appendHtml += "  </a>";
		    			appendHtml += "</div>";
		    		});
		    		
		    		$("#myStudyList").append(appendHtml);
    			}
    			
    		} else {
    			$("#noResult").show();
    			$("#resultList").hide();
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