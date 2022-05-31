<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="${savedLanguage}">
<head>
	<title data-i18n="head.legal_notice_title"></title><!-- 면책공고 | 법무법인(유) 율촌 -->
	<meta name="description" data-i18n="[content]head.legal_notice_description"><!-- content="율촌 웹사이트의 면책공고 페이지입니다." -->
	<meta name="keywords" data-i18n="[content]head.legal_notice_keywords"><!-- content="율촌, 면책공고" -->
	<c:import url="/WEB-INF/jsp/egovframework/inc/head.jsp">
		<c:param value="/resources/css/official/notice.css" name="cssName"/>
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
							<div class="col-2 share_area">
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
					<div class="row list_wrap">
						<div class="col-12">
							<form>
								<div class="list_search box_search">
									<label for="listInputWord" class="label_word">검색</label>
									<input type="search" id="listInputWord" class="tf_word"  title="검색어 입력">
									<button type="button" class="del_keyword">
										<span class="hide">검색어 삭제</span>
									</button>
									<button type="submit" class="btn_search">
										<span class="hide">검색</span>
									</button>
								</div>

								<ul class="list_type_post">
									<li>
										<div class="inner">
											<a href="#" class="post_link">
												<strong class="category">Q&A</strong>
												<p class="title" data-ellipsis="2">Q&A 01</p>
												<p class="date">2017. 10. 18.</p>
											</a>
										</div>
									</li>
									<li>
										<div class="inner">
											<a href="#" class="post_link">
												<strong class="category">Q&A</strong>
												<p class="title" data-ellipsis="2">Q&A 02</p>
												<p class="date">2017. 10. 18.</p>
											</a>
										</div>
									</li>
								</ul>

								<div class="list_btn_area">
									<button type="button" class="btn_list_more">
										<span>더보기</span>
									</button>
								</div>

								<!-- 검색결과 없을 시 -->
								<!--
                                    <div class="list_nodata">
                                        <p>검색결과가 없습니다.</p>
                                    </div>
                                -->
							</form>
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
