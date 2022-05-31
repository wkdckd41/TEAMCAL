<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="${savedLanguage}">
<head>
	<title data-i18n="common:head.main_title"></title>
	<meta name="description" data-i18n="[content]common:head.main_description">
	<meta name="keywords" data-i18n="[content]common:head.main_keyword">
	<link rel="stylesheet" type="text/css" href="<c:out value='/resources/css/official/seminar.css'/>">
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
									<li class="j_step01 on_pass"><span>1</span>정보 입력</li>
									<li class="j_step02"><span>2</span>가입 완료</li>
								</ul>
							</div> <!-- //col-12 -->
						</div>
					</div> <!-- //step_list -->
			</div> <!-- //row -->
				
				<!-- 폼 요소 -->
				<div class="column_wide form_group_wrap">
					<div class="grid-layout">
						<div class="row">							
							<div class="col-12 form_cnt">
								<div>
									<div class="fm_txt_info"><span class="txt_essential">*표기</span>는 필수 입력 항목입니다.</div>
									<form>
										<fieldset>
											<legend>회원가입 폼</legend>
											<!--
												label for 값과 id값 동일하게 맞춰주세요
											-->
											<p>
												<label for="user_name">이름<span class="txt_essential">*</span></label>
												<input type="text" id="user_name">
											</p>
											<!-- 유효성 체크 -->
											<div class="col-12 msg_validate">이름을 2자 이상 입력해주세요.</div>
											<p>
												<label for="user_id">이메일<span class="txt_essential">*</span></label>
												<input type="text" id="user_id" class="email-auto" placeholder="">
											</p>
											<!-- 유효성 체크 -->
											<div class="col-12 msg_validate">이메일을 입력해주세요.</div>
											<!-- 유효성 체크 -->
											<div class="col-12 msg_validate success">사용가능한 이메일입니다.</div>

											<p>
												<label for="user_pw1">비밀번호<span class="txt_essential">*</span></label>
												<input type="password" id="user_pw1" placeholder="">
											</p>
											<!-- 유효성 체크 -->
											<div class="col-12 msg_validate">비밀번호 형식에 따라 입력해 주세요.</div>
											<div class="col-12 fm_txt_dsc">영문 대문자, 소문자, 숫자, 특수문자 중 3가지 이상을 조합하여 8~20자리로 구성해야 합니다.</div>

											<p>
												<label for="user_pw2">비밀번호 확인<span class="txt_essential">*</span></label>
												<input type="password" id="user_pw2" placeholder="">
											</p>
											<!-- 유효성 체크 -->
											<div class="col-12 msg_validate">비밀번호가 일치하지 않습니다.</div>
											<p>
												<label for="user_phone">휴대전화번호<span class="txt_essential">*</span></label>
												<input type="tel" id="user_phone" placeholder="'-' 제외">
											</p>
							  			</fieldset>
									</form>
									
									<div class="btn_area col-12">
										<button type="button" class="col-3" onclick="reg.fnRegister()"><span>가입신청</span></button>
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
        });
});

var reg = {
    fnGetData : function(){
        var paramData = {
			user_name	: $("#user_name").val()
			,user_id	: $("#user_id").val()
			,password	: $("#user_pw1").val()
			,user_phone	: $("#user_phone").val()
		}

		return paramData;
    },

    fnRegister : function(){

        gFnObjJsonAjaxCall(true, reg.fnGetData(), "/membership/setMemberJoin.ajax", function(res){

            if(res){
                $(location).attr("href", "/" + language_cd + "/membership/register-complete.do");
			} else {
                alert("회원가입에 실패하였습니다./n잠시 후 다시 시도해 주세요.");
			}

		});
    }
}
</script>
</body>
</html>
