<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="${savedLanguage}">
<head>
	<link href="/resources/css/util.css" rel="stylesheet" type="text/css">
	<c:import url="/WEB-INF/jsp/egovframework/inc/head.jsp"></c:import>
	<jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/script.jsp" />
</head>
<body id="official">
<div id="wrapper" class="wrap"> 
	<div id="container" class="container_wrap page_error ">
		<div class="content"> 
			<div class="section">
				<div class="grid-layout error_box_wrap">
					<div class="row"> 
						<div class="col-8">
							<div class="top_logo" data-i18n="error.top_logo"><!-- 법무법인 (유)율촌 --></div>
							<div class="error_msg">
								<p class="msg_tl" data-i18n="[html]error.msg_tl">
									<!-- 죄송합니다.<br>
									<span>일시적 오류가 발생 했습니다.</span> -->
								</p>
								<p class="msg_des" data-i18n="[html]error.msg_des">
									<!-- 요청하신 페이지에 오류가 있어 표시할 수 없습니다.<br>
									<a href="javascript:void(0);" class="reload">새로고침</a>을 해보시기 바랍니다. -->
								</p>
								<div class="btn_area col-12">
									<button type="button" class="col-3 btn_blue" data-i18n="error.msg_button" onclick="goHome();"><!-- 홈으로 이동 --></button> 
								</div> 
							</div> <!-- //error_msg --> 
						</div>
					</div>
				</div> <!-- //grid-layout -->
			</div> <!-- //section -->
		</div> <!-- //content -->
	</div> <!-- //container -->
</div> <!--//wrapper --> 
<script type="text/javascript">
var language_cd = "${savedLanguage}" == "" ? "ko" : "${savedLanguage}";
$(document).ready(function(){
	i18n.fnInit(
		options = {
			lang		: language_cd,
			namespace	:  ['error', 'common'],
			defaultNs	: 'error'
		},
		function(){
		});
	$(document).on("click", ".reload", function(){
		location.reload();
	});
});
function goHome(){
	$(location).attr("href", "/"+language_cd+"/main/main.do")
}
</script>
</body>
</html>