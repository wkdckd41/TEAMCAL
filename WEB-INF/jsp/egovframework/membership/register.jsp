<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="${savedLanguage}">
<head>
	<title>TEAM CALENDAR</title>
	<meta name="description" data-i18n="[content]common:head.main_description">
	<meta name="keywords" data-i18n="[content]common:head.main_keyword">
	<link rel="stylesheet" type="text/css" href="<c:out value='/resources/css/official/seminar.css'/>">
	<c:import url="/WEB-INF/jsp/egovframework/inc/head.jsp">
		<c:param value="/resources/css/official/member.css" name="cssName"/>
	</c:import>
	<jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/script.jsp"/>
	<script type="text/javascript" src="/resources/js/membership.js"></script>
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
									<form id="joinForm" method="post" accept-charset="UTF-8">
										<fieldset>
											<legend>회원가입 폼</legend>
											<!--
												label for 값과 id값 동일하게 맞춰주세요
											-->
											<p>
												<label for="memberId">회원 ID<span class="txt_essential">*</span></label>
												<input type="text" id="memberId" name="memberId" />
											</p>
											<!-- 유효성 체크 -->
											<div class="col-12 msg_validate" id="idEmpty" data-i18n="entry_of_information.cnmEmpty">ID를 입력해 주세요.</div>	
											<p>
												<label for="memberPw">비밀번호<span class="txt_essential">*</span></label>
												<input type="password" id="memberPw" name="memberPw" />
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
												<label for="memberName">이름<span class="txt_essential">*</span></label>
												<input type="text" id="memberName" name="memberName" />
											</p>
											<!-- 유효성 체크 -->
											<div class="col-12 msg_validate nmAlert" id="nmEmpty">이름을 입력해주세요.</div>
											<div class="col-12 msg_validate nmAlert" id="nmFormat">이름을 2자 이상 입력해주세요.</div>
											<div class="col-12 msg_validate nmAlert" id="nmMax">입력 가능한 이름의 최대 길이를 초과하였습니다.</div>
											<p>
												<label for="memberEmail">이메일<span class="txt_essential">*</span></label>
												<input type="text" id="memberEmail" name="memberEmail" class="" placeholder="" />
											</p>
											<div class="col-12 msg_validate emailAlert" id="emailEmpty">이메일을 입력해주세요.</div>
											<div class="col-12 msg_validate emailAlert" id="emailFormat">이메일 형식에 따라 입력해주세요.</div>
											<!-- 유효성 체크 -->
											<div class="col-12 msg_validate success emailAlert" id="emailSuccess">사용가능한 이메일입니다.</div>
											<p>
												<label for="memberPhone">전화번호<span class="txt_essential">*</span></label>
												<input type="text" id="memberPhone" name="memberPhone" placeholder="'-' 제외" />
											</p>
											<p>
												<label for="memberSchool">학교<span class="txt_essential">*</span></label>
												<input type="text" id="memberSchool" name="memberSchool" />
											</p>
											<p>
												<label for="memberMajor">학과<span class="txt_essential">*</span></label>
												<input type="text" id="memberMajor" name="memberMajor" />
											</p>
											<p>
												<label for="memberGrade">학년<span class="txt_essential">*</span></label>
												<input type="text" id="memberGrade" name="memberGrade" placeholder="숫자로만 입력하세요" />
											</p>
							  			</fieldset>
									</form>
									
									<div class="btn_area col-12">
										<button type="button" class="col-3" onclick="reg.fnJoin()"><span>가입신청</span></button>
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
        	reg.fnInit();
        });
    
    $("input[id='memberEmail']").blur(function() {
		var email = $(this).val();
		
		if(reg.fnEmailCheck(email)) {
        	$("#emailSuccess").show();
        } else {
        	$("#emailSuccess").hide();
        }
	});
	
    // 비밀번호 check
	$("input[id='memberPw']").blur(function() {
		var pw = $(this).val();
	 	
		if(reg.fnPwCheck(pw, 1)) {
        	$("#pw1Success").show();
        } else {
        	$("#pw1Success").hide();
       }
	});
	
    // 비밀번호 확인 check
	$("input[id='memberPw2']").blur(function() {
		var pw = $(this).val();
		
		if(reg.fnPwCheck(pw, 2)) {
        	$("#pw2Success").show();
        } else {
        	$("#pw2Success").hide();
       }
	});
	
    // 이름 check
	$("input[id='memberName']").blur(function() {
		var nm = $(this).val();
		reg.fnNmCheck(nm);
	});
	
    // 휴대전화번호 check
	$("input[id='memberPhone']").blur(function() {
		var ph = $(this).val();
		reg.fnPhCheck(ph);
	});
	
    // 회원ID check
	$("input[name='memberId']").blur(function() {
		var cnm = $(this).val();
		reg.fnCnmCheck(cnm);
	});
});
var reg = {

	fnInit : function() {
		if(language_cd == 'ko') {
			// korea
		} else {
			// etc
		}
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
	
	fnResult : function(res) {
		if(res == 1) {
			emailCheck = false;
		} else {
			emailCheck = true;
		}
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
	
	// 이름 check
	fnNmCheck : function(nm) {
		$(".nmAlert").hide();
		
		// 이름을 입력하지 않은 경우
		if(nm == '' || nm == 'undefined') {
			$("#nmEmpty").show();
			return false;
	    } else {
	    	$("#nmEmpty").hide();
	    }
		
		// 입력한 이름이 2글자가 안되는 경우
		if(nm.length < 2) {
			$("#nmFormat").show();
			return false;
		} else {
			$("#nmFormat").hide();
		}
		
		// 이름 최대 띄어쓰기 포함 10byte 까지
		/* 2018.05.24 이름 최대길이 체크 해지(by.전홍란 책임)
		var len = 0;
		for (var i=0;i<nm.length; i++) {
			var n = nm.charCodeAt(i); 
	        var nv = nm.charAt(i); // charAt : string 개체로부터 지정한 위치에 있는 문자를 꺼낸다.

	        if ((n>= 0)&&(n<256)) {
	        	len ++; // ASCII 문자코드 set.
	        } else {
	        	len += 2; // 한글이면 2byte로 계산한다.
	        }
	        
	        if (len > 10) {
	        	$("#nmMax").show();
	        	return false;
	        } else {
	        	$("#nmMax").hide();
	        }
		}
		*/

		return true;
	},
	
	fnPhCheck : function(ph) {
		$(".phAlert").hide();
		
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
	
	fnCnmCheck : function(cnm) {
		
		// 법인명을 입력하지 않은 경우
		if(cnm == '' || cnm == 'undefined') {
			$("#idEmpty").show();
			return false;
	    } else {
	    	$("#idEmpty").hide();
	    }
		
		return true;
	},
	
	fnGetData : function() {

        var param = {
            memberId			: $("#memberId").val(),
            memberPw			: $("#memberPw").val(),
            memberName			: $("#memberName").val(),
            memberEmail			: $("#memberEmail").val(),
            memberPhone			: $("#memberPhone").val(),
            memberSchool		: $("#memberSchool").val(),
            memberMajor			: $("#memberMajor").val(),
            memberGrade			: $("#memberGrade").val()
        }

        return param;
    },
	
	fnJoin : function() {
		
		// 유효성검사
		if(!reg.fnEmailCheck($("#memberEmail").val())) {
			$("#emailSuccess").hide();
			gotoScroll($("#memberEmail"));
			$("#memberEmail").focus();
			return false;
		} else {
			$("#emailSuccess").show();
		}
		if(!reg.fnPwCheck($("#memberPw").val(), 1)) {
        	$("#pw1Success").hide();
        	gotoScroll($("#memberPw"));
        	$("#memberPw").focus();
            return false;
		} else {
        	$("#pw1Success").show();
		}
		if(!reg.fnPwCheck($("#memberPw2").val(), 2)) {
			$("#pw2Success").hide();
			gotoScroll($("#memberPw2"));
			$("#memberPw2").focus();
            return false;
		} else {
			$("#pw2Success").show();
		}
		if(!reg.fnNmCheck($("#memberName").val())) {
			gotoScroll($("#memberName"));
			$("#memberName").focus();
            return false;
        }
		if(!reg.fnPhCheck($("#memberPhone").val())) {
			gotoScroll($("#memberPhone"));
			$("#memberPhone").focus();
			return false;
		}
		if(!reg.fnCnmCheck($("input[name='memberId']").val())) {
			gotoScroll($("input[name='memberId']"));
			$("input[name='memberId']").focus();
            return false;
        }
		
		gFnObjSyncAjaxCall(true, reg.fnGetData(), "/membership/setMemberJoin.ajax", function(res){
            if(res.result == 'SUCCESS'){
            	location.href = res.redirectUrl;
            }else{
            	location.href = res.redirectUrl;
            }
        });
	}
		
}
</script>
</body>
</html>
