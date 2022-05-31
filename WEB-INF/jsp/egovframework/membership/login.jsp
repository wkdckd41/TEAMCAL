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

	<div id="container" class="container_wrap membership">
		<div class="content">
			<div class="section">
				<div class="sub_visual_area full_visual">
					<div class="visual_cnt">
						<div class="row-wide info_sbj_location">
							<div class="col-5 breadcrumb">
								<ul>
									<li class="bc_home"><a href="#none">홈</a></li>
									<li class="bc_tit"><span>로그인</span></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- sub_visual_area-->

				<div class="column_wide">
					<div class="grid-layout login_area">
						<div class="row">
							<div class="col-12">
								<div class="containbox_wrap">
									<div class="containbox_mb">
										<div class="mb_logo">TEAM CAL</div>
										<div>
											<div class="col-5 mb_cnt_wrap">
												<form id="loginForm" method="post" accept-charset="UTF-8">
													<legend> 로그인 폼</legend>
													<label for="memberId">ID</label>
													<input type="email" id="memberId" name="memberId" class="col-12">
													<!-- 유효성 체크 -->
													<div class="col-12 msg_validate idAlert" id="idEmpty">ID를 입력해주세요</div>
													<label for="memberPw">PW</label>
													<input type="password" id="memberPw" name="memberPw" class="col-12" placeholder="비밀번호">
													<!-- 유효성 체크 -->
													<div class="col-12 msg_validate pwAlert" id="pwEmpty">Password를 입력해 주세요.</div>
													<div class="btn_area">
														<button type="button" class="col-12" onclick="login.fnLogin();"><span>로그인</span></button>
													</div>
												</form>

												<div class="custom_etc fl_clear">
													<ul class=" fl_clear">
														<li><a href="/${savedLanguage}/membership/register.do">회원가입</a></li>
													</ul>
												</div>
											</div> <!-- //mb_cnt_wrap -->
										</div>
									</div>
								</div>
							</div>
						</div> <!--// row -->
					</div>
					<!-- //grid-layout -->
				</div> <!-- //column_wide -->
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
    	}
    );
    
    $("#memberPw").on("keyup", function(e) {
    	if (e.keyCode == 13) {
    		login.fnLogin();
    	}
    })
});

var login = {
	fnInit : function() {
		$(".idAlert").hide();
		$(".pwAlert").hide();
	},
	
	fnLogin : function() {
		var memberId = $("#memberId").val();
		var memberPw = $("#memberPw").val();

		if(!login.fnValidationCheck(memberId, memberPw)) {
			return false;
		}
		
		var paramData = {
				memberId 	: memberId,
				memberPw 	: memberPw
		}
		gFnObjSyncAjaxCall(false, paramData, "/membership/getLogin.ajax", login.fnResult);
	},
	
	fnValidationCheck : function(memberId, memberPw) {
		
		$(".idAlert").hide();
		$(".pwAlert").hide();
		
		// 이메일 입력 확인
		if(memberId.length==0) {
			$("#idEmpty").show();
			$("#memberId").focus();
			return false;
		} else {
			$("#idEmpty").hide();
		}
		
		// 비밀번호 입력 확인
		if(memberPw.length==0) {
			$("#pwEmpty").show();
			$("#memberPw").focus();
			return false;
		} else {
			$("#pwEmpty").hide();
		}
		
		return true;
	},
	
	fnResult : function(res) {
		
		var result = res.result;
		var resultVo = res.resultVo;
		
		if (res.result == 'FAIL') {
			if (res.resultMsg != '') {
				alert(res.resultMsg);
			}
		} else {
			if (resultVo != null) {
				location.href = '/ko/main/main.do';
			}
		}
	}
}

</script>
</body>
</html>
