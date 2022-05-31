// 인증메일 재전송
var gFnEmailResend = {
		fnEmailResend : function(gubun) {
			var email = $("#email").val();
			
			var paramData = { 
					account : email,
					gubun 	: gubun,
					lang  	: language_cd
			}
			gFnObjSyncAjaxCall(false, paramData, "/membership/setEmailResend.ajax", function(res) {
				gFnEmailResend.fnResult(res);
			});
		},
		
		fnResult : function(res) {
			// 0.실패 1.성공
			if(res == 1) {
				//alert("인증 메일이 재전송 되었습니다.");
				alert(t("alert_email_resend"));
			} else {
				location.href = "/"+language_cd+"/common/error.do";
			}
		}
}

// 분야선택 선택, 삭제 이벤트
var gFnInterest = {
		fnInterestDel : function(value) {
			
			var cnt = 0;
			$("div[name='interestPart']").each(function() {
				cnt++;
				if(value==$(this).children('span').data("value")) {
					$(this).remove();
					cnt--;
				}
			});
			
			if(cnt!=0) {
				$("#interestCnt").text("("+cnt+")");
			} else {
				$("#interestCnt").text("");
				$(".int_field").hide();
			}
			
			$(":checkbox[name='interestCb']:checked").each(function() {
				if(value == $(this).val()) {
					$(this).prop("checked", false);
				}
			});
			
			// 분야선택 팝업 새로 그리기
			$("input[type=checkbox]").prop("checked", false);
			$("div[name='interestPart']").each(function() {
				var value=$(this).children('span').data("value");
				
				$(":checkbox[name='interestCb']").each(function() {
					if(value==$(this).val()) {
						$(this).prop("checked", true);
					}
				}); 
			});
			gFnInterest.fnParentChecked();
		},
		
		fnParentChecked : function(){
			// 분야선택 부모 값 체크 여부
			var fieldList = $("#fieldList input[type=checkbox]");
			var fieldList_check = $("#fieldList input[type=checkbox]:checked");
			var industryList = $("#industryList input[type=checkbox]");
			var industryList_check = $("#industryList input[type=checkbox]:checked");
			var localeList = $("#localeList input[type=checkbox]");
			var localeList_check = $("#localeList input[type=checkbox]:checked");
			if(fieldList.length == fieldList_check.length){
				$("#01").prop("checked", true);
			}
			if(industryList.length == industryList_check.length){
				$("#02").prop("checked", true);
			}
			if(localeList.length == localeList_check.length){
				$("#03").prop("checked", true);
			}
			if($("#01").prop("checked")&&$("#02").prop("checked")&&$("#03").prop("checked")){
				$("#chk_all_pop").prop("checked", true);
			}
		}
}

// 기타 공통 스크립트
var gFnEtc = {
		// 숫자만 입력
		fnOnlyNum : function(obj) {
			var pattern = /[^0-9]/g;
			if(pattern.test($(obj).val())){
				$(obj).val($(obj).val().replace(pattern,""));
			}
		},
		
		// 특수문자 입력 제한
		fnLimitInput : function(obj) {
			//var pattern = /[~!@\#$%^&*\()\-=+_']/gi; // 원본 패턴
			//var pattern = /[~!@\#$%^&*\()\-=+_'`;:\.\,\-\_+=\|\?]/gi; // 추가
			
			var pattern = /[~!@\#$%^&*\()\-=+_']/gi;
			if(pattern.test($(obj).val())){
				$(obj).val($(obj).val().replace(pattern,""));
			}
		}
}

// 세션 관련
var gFnSession = {
		// 세션 확인
		fnCheck : function() { 
			if(email.length==0) {
				return false;
			} else {
				return true;
			}
		}
}

// 2018.05.09 about IE FOCUS() BUG
function gotoScroll(tg)
{
	var target = tg;
	var scrollY = target.offset().top;
	$('html, body').scrollTop(scrollY-300);
}