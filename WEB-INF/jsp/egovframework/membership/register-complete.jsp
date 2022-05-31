<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
									<li class="bc_home"><a href="#none">홈</a></li>
									<li class="bc_tit"><span>회원가입</span></li>
								</ul>
							</div> 
							<div class="col-2 share_area">
								<ul>
									<li><a href="#none" class="share_sbj">공유하기</a></li>
									<li><a href="#none" class="print_sbj">프린트</a></li>
								</ul> 
							</div>
						</div> 
						
						<div class="grid-layout info_sbj_box txt_center">
							<h2 class="sub_tl">회원가입</h2>
						</div> 
					</div>
				</div>
				<!-- sub_visual_area--> 
				
				<div class="row">
					<div class="step_list">
						<div class="grid-layout-np">
							<div class="col-12-nm">
								<ul class="top_step_area step_clear">
									<li class="j_step01"><span>1</span>정보 입력</li>
									<li class="j_step02 on_pass"><span>2</span>가입 완료</li>
								</ul>
							</div> <!-- //col-12 -->
						</div>
					</div> <!-- //step_list --> 
			</div> <!-- //row -->
				
				<!-- 폼 요소 -->
				<div class="column_wide">
					<div class="grid-layout confim_email_area">
						<div class="row">
							<div class="col-12">
								<div>
									<div class="mb_cnt_wrap">
										<div class="mb_info_dsc">
											<p>
												<span><%=request.getParameter("memberName") %></span>님 <span><%=request.getParameter("memberId") %></span>(으)로<br>회원 가입되었습니다.
											</p>
											<div class="add_dsc">
												<p>회원가입을 진심으로 축하드립니다!</p>
												<p>저희 사이트를 통해 스터디 일정 관리를 효율적으로 해주시기 바랍니다.</p>
											</div>
											<div class="btn_area">
												<button type="button" class="btn_white" onclick="fnMain();">메인 페이지</button>
											</div>
										</div>
									</div> <!-- //mb_cnt_wrap -->
								</div>
							</div>
						</div> <!--// row -->
					</div>
					<!-- //grid-layout -->
				</div> <!-- //column_wide -->
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
            });
    });
    
    function fnMain() {
    	location.href = "/ko/main/main.do";
    }
</script>
</body>
</html>
