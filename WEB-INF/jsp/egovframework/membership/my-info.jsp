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
											<li class="bc_tit"><span>My Account</span></li>
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
												<li><a href="#none" class="active"><span>My Info</span></a></li> <!-- 활성화시 active  클래스 -->
												<li><a href="/${savedLanguage }/membership/my-study.do"><span>My Study</span></a></li> <!-- 활성화시 active  클래스 -->
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div> 
						 
						<!-- 폼 요소 리뷰 -->
						<div class="column_wide form_group_wrap">
							<div class="grid-layout">
								<div class="row">							
									<div class="col-12 form_cnt view_list">
										<div>
											<div class="fm_txt_info" data-i18n="[html]my_info.fm_txt_info"><!-- <span class="txt_essential">*표기</span>는 필수 입력 항목입니다. --></div>
											<form id="updateInfoForm" method="post" accept-charset="UTF-8">
											  <fieldset>
												<legend>My Account Info </legend> 
												<!-- 
													label for 값과 id값 동일하게 맞춰주세요
												--> 
												<p>
													<label for="memberId">ID</label>
													<!-- <div class="enter_txt">email@email.com</div> -->
													<input type="text" id="memberId" value="" readonly />
													<input type="hidden" id="hMemberId" name="memberId" value="" />
												</p>										
												<p>
													<label>비밀번호</label> 
													<input type="password" id="memberPw" name="memberPw" value="" />
												</p>
												<!-- 유효성 체크 -->
												<div class="col-12 msg_validate pw1Alert" id="pw1Empty">비밀번호를 입력해주세요</div>
												<div class="col-12 msg_validate pw1Alert" id="pw1Format">비밀번호 형식에 따라 입력해 주세요.</div>
												<div class="col-12 msg_validate pw1Alert" id="pw1Blank">비밀번호는 공백 없이 입력해 주세요.</div>
												<div class="col-12 msg_validate pw1Alert" id="pw1Email">비밀번호는 이메일 주소와 동일할 수 없습니다.</div>
												<!-- 유효성 체크 -->
												<div class="col-12 msg_validate success pw1Alert" id="pw1Success">안전합니다.</div>
												<div class="col-12 fm_txt_dsc">영문 대문자, 소문자, 숫자, 특수문자 중 3가지 이상을 조합하여 8~20자리로 구성해야 합니다.</div>
												<p>
													<label for="memberPw2">비밀번호 확인</label>
													<input type="password" id="memberPw2" />
												</p>
												<!-- 유효성 체크 -->
												<div class="col-12 msg_validate pw2Alert" id="pw2Empty">비밀번호를 한번 더 입력해 주세요.</div>
												<div class="col-12 msg_validate pw2Alert" id="pw2Matching">비밀번호가 일치하지 않습니다.</div>
												<!-- 유효성 체크 -->
												<div class="col-12 msg_validate success pw2Alert" id="pw2Success">비밀번호가 일치합니다.</div>
												<p>
													<label for="memberName">이름</label>
													<input type="text" id="memberName" value="" readonly />
													<input type="hidden" id="hMemberName" name="memberName" value="" />
												</p>
												<p>
													<label for="memberEmail">회원 E-mail</label>
													<input type="text" id="memberEmail" name="memberEmail" class="email-auto" placeholder="" />
												</p>
												<div class="col-12 msg_validate emailAlert" id="emailEmpty">이메일을 입력해주세요.</div>
												<div class="col-12 msg_validate emailAlert" id="emailFormat">이메일 형식에 따라 입력해주세요.</div>
												<!-- 유효성 체크 -->
												<div class="col-12 msg_validate success emailAlert" id="emailSuccess">사용가능한 이메일입니다.</div>
												<p>
													<label for="memberPhone">휴대전화번호</label>
													<input type="tel" id="memberPhone" name="memberPhone" value="" onkeyup="gFnEtc.fnOnlyNum(this)" maxlength="11" />
												</p> 
													<!-- 유효성 체크 -->
													<div class="col-12 msg_validate phAlert" id="phEmpty" data-i18n="phEmpty">휴대전화 번호를 입력해 주세요.</div>
													<div class="col-12 msg_validate phAlert" id="phFormat" data-i18n="phFormat">형식에 따라 입력해 주세요.</div>
												<p>
													<label for="memberSchool">학교명</label>
													<input type="text" id="memberSchool" name="memberSchool" value="" /> 
												</p>
												<p>
													<label for="memberMajor">학과명</label>
													<input type="text" id="memberMajor" name="memberMajor" value="" /> 
												</p>
												<p>
													<label for="memberGrade">학년</label>
													<input type="text" id="memberGrade" name="memberGrade" placeholder="숫자로만 입력하세요" />
												</p>
											  </fieldset> 
											</form>
											
											<div class="btn_area col-12">
												<button type="button" class="col-3 w_100" onclick="myInfo.fnUpdate()">수정완료</button>  
											</div>
										</div>		
										<div class="leave_area col-12-nm">
											<span class="info_txt">회원 탈퇴 시 가입된 스터디 일괄 탈퇴 및 작성된 메모 일괄 삭제됩니다.<br/>
											본인이 만든 스터디가 있을 경우 해당 스터디를 위임하고 탈퇴를 진행해주시기 바랍니다.</span>
											<span>
												<button type="button" class="btn_gray mt_30" onclick="myInfo.fnWithdrawal()">탈퇴하기</button>
											</span> 
										</div>
									</div> <!-- //form_cnt -->
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
			myInfo.fnInit();
			// 분야선택 값 레이어 팝업에 연동하기
			field.fnClose();
	});
});

var myInfo = {
		
		fnInit : function() {
			
			$(".msg_validate").hide();
			
			var paramData = {
					memberId : memberId
			}
			gFnObjSyncAjaxCall(false, paramData, "/membership/getLoginMember.ajax", myInfo.fnResult);
		},
		
		fnResult : function(res) {
			
			var resultVo = res.resultVo;
			$("#memberId").val(resultVo.memberId);
			$("#hMemberId").val(resultVo.memberId);
			$("#memberName").val(resultVo.memberName);
			$("#hMemberName").val(resultVo.memberName);
			$("#memberEmail").val(resultVo.memberEmail);
			$("#memberPhone").val(resultVo.memberPhone);
			$("#memberSchool").val(resultVo.memberSchool);
			$("#memberMajor").val(resultVo.memberMajor);
			$("#memberGrade").val(resultVo.memberGrade);
		},
		
		fnGetData : function() {
			var param = {
		            memberId			: $("#hMemberId").val(),
		            memberPw			: $("#memberPw").val(),
		            memberEmail			: $("#memberEmail").val(),
		            memberPhone			: $("#memberPhone").val(),
		            memberSchool		: $("#memberSchool").val(),
		            memberMajor			: $("#memberMajor").val(),
		            memberGrade			: $("#memberGrade").val()
		        }

		        return param;
		},
			
		fnUpdate : function() {
			
			// 유효성검사
			if(!myInfo.fnEmailCheck($("#memberEmail").val())) {
				$("#emailSuccess").hide();
				gotoScroll($("#memberEmail"));
				$("#memberEmail").focus();
				return false;
			} else {
				$("#emailSuccess").show();
			}
			if(!myInfo.fnPwCheck($("#memberPw").val(), 1)) {
	        	$("#pw1Success").hide();
	        	gotoScroll($("#memberPw"));
	        	$("#memberPw").focus();
	            return false;
			} else {
	        	$("#pw1Success").show();
			}
			if(!myInfo.fnPwCheck($("#memberPw2").val(), 2)) {
				$("#pw2Success").hide();
				gotoScroll($("#memberPw2"));
				$("#memberPw2").focus();
	            return false;
			} else {
				$("#pw2Success").show();
			}
			if(!myInfo.fnPhoneCheck($("#memberPhone").val())) {
				gotoScroll($("#memberPhone"));
				$("#memberPhone").focus();
				return false;
			}
			
			gFnObjSyncAjaxCall(true, myInfo.fnGetData(), "/membership/setMemberUpdate.ajax", function(res){
	            if(res.result == 'SUCCESS'){
	            	alert(res.resultMsg);
	            	location.href = res.redirectUrl;
	            }else{
	            	location.href = res.redirectUrl;
	            }
	        });
		},
		
		// 이메일 check
		fnEmailCheck : function(email) {
			$(".emailAlert").hide();
			
			// 이메일을 입력하지 않은 경우
			if(email == '' || email == 'undefined') {
				$("#emailEmpty").show();
		    	return false;
		    } else {
		    	$("#emailEmpty").hide();
		    }
			
			// 예시와 같지 않은 형태의 Text를 입력했을 경우
			var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			if(!(email != '' && email != 'undefined' && regex.test(email))) {
				$("#emailFormat").show();
				return false;
			} else {
				$("#emailFormat").hide();
			}
			
			
			return true;
		},
		
		// 비밀번호 check
		fnPwCheck : function(pw, gb) {
			
			if(gb == 1) {	// 비밀번호
				$(".pw1Alert").hide();
			
				// 비밀번호 입력을 하지 않은 경우
				if(pw == '' || pw == 'undefined') {
					$("#pw1Empty").show();
			    	return false;
			    } else {
			    	$("#pw1Empty").hide();
			    }
			
				// 비밀번호에 공백을 입력한 경우
				var blank_pattern = /[\s]/g;
				if(blank_pattern.test(pw)) {
					$("#pw1Blank").show();
					return false;
				} else {
					$("#pw1Blank").hide();
				}
				
				// 비밀번호를 형식에 따라 입력하지 않은 경우
				if(!(/^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-z])(?=.*[^0-9a-zA-Z]).*$/.test(pw)) // 숫자,소문자,특수문자
						&& !(/^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).*$/.test(pw)) // 숫자,소문자,대문자
							&& !(/^.*(?=^.{8,20}$)(?=.*\d)(?=.*[A-Z])(?=.*[^0-9a-zA-Z]).*$/.test(pw)) // 숫자,대문자,특수문자
								&& !(/^.*(?=^.{8,20}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[^0-9a-zA-Z]).*$/.test(pw)) // 소문자,대문자,특수문자
				) {
					$("#pw1Format").show();
					return false;
				} else {
					$("#pw1Format").hide();
				}
				
				// 비밀번호에 회원 ID를 입력한 경우
				var email = $("#memberId").val();
				if(email.toLowerCase()==pw.toLowerCase()) {
					$("#pw1Email").show();
					return false;
				} else {
					$("#pw1Email").hide();
				}
				
			} else if(gb == 2) {	// 비밀번호 확인
				$(".pw2Alert").hide();
			
				// 비밀번호 입력을 하지 않은 경우
				if(pw == '' || pw == 'undefined') {
					$("#pw2Empty").show();
					return false;
			    } else {
			    	$("#pw2Empty").hide();
			    }
				
				// 비밀번호가 일치하지 않는 경우
				var pw1 = $("#memberPw").val();
				if(!(pw1==pw)) {
					$("#pw2Matching").show();
					return false;
				} else {
					$("#pw2Matching").hide();
				}
			}
			return true;
		},
		
		fnPhoneCheck : function(ph) {
			// 휴대전화번호를 입력하지 않은 경우
			if(ph == '' || ph == 'undefined') {
				$("#phEmpty").show();
		    	return false;
		    } else {
		    	$("#phEmpty").hide();
		    }
			
			// 휴대전화번호를 제대로 입력하지 않은 경우
            if(ph.length==11 || ph.length==10) {   
                var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
                if(!regExp_ctn.test(ph))
                {
                	$("#phFormat").show();
    		    	return false;
                } else {
                	$("#phFormat").hide();
                }
            } else {
            	$("#phFormat").show();
		    	return false;
            }
			return true;
		},
		
		fnWithdrawal : function() {
			//if(confirm("회원 탈퇴를 하시면 율촌의 회원전용\n서비스를 더이상 받아보실 수 없으며,\n동일한 이메일로 30일간 재가입이\n불가능합니다.\n탈퇴하시겠습니까?")) {
			if(confirm("회원 탈퇴 하시면 가입된 스터디, 작성된 메모 등 일괄적으로 삭제됩니다.\n탈퇴하시겠습니까?")) {
				var paramData = {
						memberSeq : memberSeq
				}
				gFnObjSyncAjaxCall(false, paramData, "/membership/withdrawalMember.ajax", function(res) {
					// 0.실패 1.성공
					if(res==1) {
						alert("탈퇴하였습니다.\n애용해 주셔서 감사합니다.");
						location.href = "/ko/main/main.do";
					} else {
						location.href = "/ko/common/error.do";
					}
				});
			}
		}
		
}

</script>

</body>
</html>