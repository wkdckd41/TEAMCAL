<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="${savedLanguage}">
<head>
	<title data-i18n="head.limited_liability_title"></title><!-- 유한책임 | 법무법인(유) 율촌 -->
	<meta name="description" data-i18n="[content]head.limited_liability_description"><!-- content="율촌 웹사이트의 유한책임 페이지입니다." -->
	<meta name="keywords" data-i18n="[content]head.limited_liability_keywords"><!-- content="율촌, 유한책임" -->
	<c:import url="/WEB-INF/jsp/egovframework/inc/head.jsp">
		<c:param value="" name="cssName"/>
	</c:import>
	<jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/script.jsp" />
</head>
<body id="official">
<!-- utiltop -->
<jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/utiltop.jsp" />
<!-- //utiltop -->
<div id="wrapper" class="wrap">
	<!-- header -->
	<jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/header.jsp" />
	<!-- //header -->

	<div id="container" class="container_wrap notice">
		<div class="content">
			<div class="section">
				<div class="sub_visual_area small_visual">
					<div class="visual_cnt">
						<div class="row-wide info_sbj_location">
							<div class="col-8 breadcrumb">
								<ul>
									<li class="bc_home"><a href="#none">홈</a></li>
									<li class="bc_tit"><span>Q&A</span></li>
								</ul>
							</div>
							<div class="col-2 share_area on">
								<ul>
									<li><a href="#none" class="share_sbj">공유하기</a></li>
									<li><a href="#none" class="print_sbj">프린트</a></li>
								</ul>
							</div>
						</div>

						<div class="grid-layout info_sbj_box txt_center">
							<h2 class="sub_tl">Q&A</h2>
						</div>
					</div>
				</div>

				<!-- sub_visual_area-->
				<div class="grid-layout page_yulchon_news">
					<div class="row view_wrap view_wrap_member"><!-- 관련 구성원이 있을 경우에만 view_wrap_member 추가 -->
						<div class="col-12">
							<div class="inner">
								<div class="view_type_post">
									<div class="subject">
										<p class="title">Q&A 01</p>
										<p class="date">2017. 10. 18.</p>
									</div>

									<div class="detail">
										<div class="content">
											Q&A 내용넣기 
										</div>

										<!-- 첨부파일이 있을 시 노출 -->
										<!-- <div class="additional">
											<div class="file">
												<span class="text">첨부파일</span>
												<a href="#" title="다운로드" class="download">업무사례보고서.pdf</a>
											</div>
										</div> -->
									</div>
								</div>

								<div class="view_member_list">
									<p class="title">관련 구성원</p>

									<ul class="member_list">
										<li>
											<a href="#" class="link">
												<div class="img"><img src="../../../resources/images/official/notice/img_thumb_member.jpg"></div>
												<strong class="name"><span>Cha, Brandon Jinsup</span></strong>
											</a>
										</li>
										<li>
											<a href="#" class="link">
												<div class="img"><img src="../../../resources/images/official/notice/img_thumb_member.jpg"></div>
												<strong class="name"><span>White, Andrew</span></strong>
											</a>
										</li>
										<li>
											<a href="#" class="link">
												<div class="img"><img src="../../../resources/images/official/notice/img_thumb_member.jpg"></div>
												<strong class="name"><span>윤세리</span></strong>
											</a>
										</li>
										<li>
											<a href="#" class="link">
												<div class="img"><img src="../../../resources/images/official/notice/img_thumb_member.jpg"></div>
												<strong class="name"><span>Cha, Brandon Jinsup</span></strong>
											</a>
										</li>
										<li>
											<a href="#" class="link">
												<div class="img"><img src="../../../resources/images/official/notice/img_thumb_member.jpg"></div>
												<strong class="name"><span>White, Andrew</span></strong>
											</a>
										</li>
										<li>
											<a href="#" class="link">
												<div class="img"><img src="../../../resources/images/official/notice/img_thumb_member.jpg"></div>
												<strong class="name"><span>윤세리</span></strong>
											</a>
										</li>
									</ul>
								</div>
							</div>

							<div class="view_pagination">
								<a href="#" class="btn_prev"><span>이전 글</span></a>
								<a href="#" class="btn_view_list">목록</a>
								<a href="#" class="btn_next"><span>다음 글</span></a>
							</div>
						</div>
					</div>
				</div>
			</div> <!-- //section -->

		</div> <!-- //content -->

	</div> <!-- //container -->

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

<!-- script alone page -->
<!-- script innerpage -->
<script type="text/javascript">

var language_cd = "${savedLanguage}" == "" ? "ko" : "${savedLanguage}";

$(document).ready(function() {
	i18n.fnInit(
		options = {
			lang			: language_cd,
			namespace		:  ['regulations','common'],
			defaultNs		: 'regulations'
		},
		function(){
		});
});

</script>

</body>
</html>
