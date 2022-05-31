var g_oConvert = "fw";							// 정방향, 역방향 값
var isArk = true;								// 자동완성 기능 사용 여부
var isKeydown = false;							// 브라우저가 파이어폭스, 오페라일 경우 keydown 사용 여부
var isListShow = true;
var cursorPos = -1;								// 자동완성 커서 위치 값
//var formName = "#search";						// 검색 form의 name을 설정한다.
var queryId_ori = "#inputWord2";				// result-search <input> 의 id를 저장
var queryId = "#inputWord2";					// 검색어 <input> 의 id을 설정한다
var arkId_ori = "#ark";							// 자동완성 전체 <div> 의 id을 설정한다
var arkId = "#ark";								// 자동완성 전체 <div> 의 id을 설정한다
var wrapId_ori = "ark_wrap";					// 자동완성 결과 <div> 의 id을 설정한다
var wrapId = "ark_wrap";						// 자동완성 결과 <div> 의 id을 설정한다
var contentListId_ori = "ark_content_list";			// 자동완성 Content List <li> 의 id을 설정한다
var contentListId = "ark_content_list";			// 자동완성 Content List <li> 의 id을 설정한다
var imgDownId_ori = "ark_img_down";					// 자동완성 down 이미지 id을 설정한다
var imgDownId = "ark_img_down";					// 자동완성 down 이미지 id을 설정한다
var imgUpId_ori = "ark_img_up";						// 자동완성 up 이미지 id을 설정한다
var imgUpId = "ark_img_up";						// 자동완성 up 이미지 id을 설정한다
var arkUpId_ori = "ark_up";							// 자동완성 up 이미지 <div> 의 id을 설정한다
var arkUpId = "ark_up";							// 자동완성 up 이미지 <div> 의 id을 설정한다
var arkDownId_ori = "ark_down";						// 자동완성 down 이미지 <div> 의 id을 설정한다
var arkDownId = "ark_down";						// 자동완성 down 이미지 <div> 의 id을 설정한다
var totalFwCount = 0;							// 전방 검색 전체 개수
var totalRwCount = 0;							// 후방 검색 전체 개수
var target = "";								// ARK 웹서버 설정파일의 목록에 있는 추천어 서비스 대상을 지정한다.
var charset = "utf-8";							// 인코딩 설정 (인코딩이 utf-8이 아닐 경우 8859_1 로 설정해야함)
var arkPath = getContextPathArk() + "/ark";						// 자동완성 경로
var transURL = "/search/ark_trans.ajax";		// trans 페이지의 URL을 설정한다.
var tempQuery = "";

//자동완서 켜기 끄기관련
var arkOpenClose = "arkOpenClose";
var openTag = "<button type=\"button\" class=\"btn_off\" onclick=\"setArkOn();\">"+t("common:turn_on_auto_complete")+"</button>";
var closeTag = "<button type=\"button\" class=\"btn_off\" onclick=\"setArkOff();\">"+t("common:turn_off_auto_complete")+"</button>";
/**
 *  ARK 구성요소의 위치 및 크기를 아래 변수를 통해 조정함.
 */
//browser detect
var browserDetect = (function() {
    var s = navigator.userAgent.toLowerCase();
    var match = /(webkit)[ \/](\w.]+)/.exec(s) ||
                /(opera)(?:.*version)?[ \/](\w.]+)/.exec(s) ||
                /(msie) ([\w.]+)/.exec(s) ||
               !/compatible/.test(s) && /(mozilla)(?:.*? rv:([\w.]+))?/.exec(s) ||
               [];
    return { name: match[1] || "", version: match[2] || "0" };
}());

var browser = "";


if (browserDetect.name == 'msie') {
	browser = "IE";
} else if (browserDetect.name == 'mozilla') {
	browser = "FF";
} else if (browserDetect.name == 'opera') {
	browser = "OPERA";
} else if (browserDetect.name == 'webkit') {
	browser = "CHROME";
}

//부모경로 가져오기
function getContextPathArk() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

$(document).ready(function() {
	$(document).on("click", "#header_search_btn", function(){
		queryId = "#header_word";
		arkId = "#header_ark";
		wrapId = "ark_wrap_2";
		contentListId = "ark_content_list_2";
		imgDownId = "ark_img_down_2";
		imgUpId	= "ark_img_up_2";
		arkUpId = "ark_up_2";
		arkDownId = "ark_down_2";
		drawArk();
		//console.log("ark.js header_search_btn", queryId, arkId);
	});
	
	$(document).on("click", "#header_search_close_btn", function(){
		$(queryId).parent().find(".del_keyword").click();
		queryId = queryId_ori;
		arkId = arkId_ori;
		wrapId = wrapId_ori;
		contentListId = contentListId_ori;
		imgDownId = imgDownId_ori;
		imgUpId	= imgUpId_ori;
		arkUpId = arkUpId_ori;
		arkDownId = arkDownId_ori;
		drawArk();
		//console.log("ark.js header_search_close_btn", queryId, arkId);
	});
	
	// 자동완성 기능 사용 여부 확인 한다.
	if(getCookie("ark")=="off") {
		isArk = false;
		$(queryId).attr("autocomplete","on");
	} else {
		$(queryId).attr("autocomplete","off");
	}

	// 자동완성 <div> 생성
	drawArk();

	// 자동완성 위치 설정
	// 화살표 닫기 이미지 위치 설정
//	$("#" + arkUpId).css({"top" : "30px"});
//	$("#" + arkUpId).css({"left" : "630px"});
//
//	// 화살표 열기 이미지 위치 설정
//	$("#" + arkDownId).css({"top" : "30px"});
//	$("#" + arkDownId).css({"left" : "630px"});
	
	$(document).keyup(function(event) {
		var query = $(queryId).val();
		
		if (event.keyCode == 38 || event.keyCode == 40) {
			// 아래(40), 위(38) 방향키 조작시의 이벤트 처리
			if (query != "") {
				showArk();
			}
			moveFocusEvent(event);
		} else if (event.keyCode == 16) {
		} else if (event.keyCode == 8 && query == "") {
			$("#" + contentListId).html("");
			hideArk();
		} else {
			if ($(event.target).is(queryId)) {
				if (isArk && $(queryId).val() != "") {
					requestArkJson($(queryId).val());
				} else if ($(queryId).val() == "") {
					hideArk();
				}
			}
		}
	});

	// Backspace 에 대한 처리
	$(queryId).keyup(function(event) {
		if(event.keyCode == 8 && $(this).val() == "") {
			$("#" + contentListId).html("");
			hideArk();
		}
	});

	// 브라우저에서 일어나는 클릭 이벤트를 체크한다.
	$(document).click(function(event) {
		stopEventBubble(event);
		if ($(event.target).is("#" + imgDownId)) {
			isListShow = false;
			showArk();
		} else if ($(event.target).is("#" + imgUpId)) {
			hideArk();
		} else if ($(event.target).is(queryId)) {
			if (isArk) {
				var query = $(queryId).val();
				if (query != "") {
					requestArkJson($(queryId).val());
					keyword = query;
				}
				isKeydown = true;
			}
		} else if (!$(event.target).is("#" + wrapId)) {
			hideArk();
		}
	});
	
});

/************************************************
 * jQuery Event Bubbling 방지를 위한 함수.
 * @name stopEventBubble
 * @param evt 페이지 이벤트
 ************************************************/
function stopEventBubble(evt) {
	var eventReference = (typeof evt !== "undefined") ? evt : event;

	if(eventReference.stopPropagation) {
		eventReference.stopPropagation();
	} else {
		eventReference.cancelBubble = true;
	}
}

/************************************************
 * 자동완성 키워드 목록 출력을 위한 DIV 생성
 * @name drawArk
 ************************************************/
function drawArk() {
	var str;
	
	str = "";

	// 자동완성 접기/펼침 이미지 생성
	str += "<div id=\"" + arkDownId + "\" style=\"position:absolute; display:block; cursor:pointer;\"><img id=\"" + imgDownId + "\" src=\"/resources/images/ark/arrow_auto.png\" alt=\"자동완성펼치기\"></div>";
	str += "<div id=\"" + arkUpId + "\" style=\"position:absolute; display:none; cursor:pointer;\"><img id=\"" + imgUpId + "\" src=\"/resources/images/ark/arrow_auto2.png\" alt=\"자동완성접기\" ></div>";
	

	// 자동완성 결과 생성
	
	str += "<div id=\"" + wrapId +"\" class=\"box_search_result\">"
	str += "	<ul id=\"" + contentListId + "\">";
	str += "	</ul>";
	str += "	<div id=\""+arkOpenClose+"\"><button type=\"button\" class=\"btn_off\" onclick=\"setArkOff();\">"+t("common:turn_off_auto_complete")+"</button></div>";
	//str += "	<button type=\"button\" class=\"btn_off\" onclick=\"setArkOff();\">자동완성 끄기</button>";
	str += "<div>";

	$(arkId).html(str);
	
	// 자동완성 위치 설정
	// 화살표 닫기 이미지 위치 설정
	$("#" + arkUpId).css({"top" : "30px"});
	$("#" + arkUpId).css({"left" : "630px"});

	// 화살표 열기 이미지 위치 설정
	$("#" + arkDownId).css({"top" : "30px"});
	$("#" + arkDownId).css({"left" : "630px"});
}


/************************************************
 * 자동완성 결과 요청
 * @name requestArk
 * @param query 키보드 입력된 문자열
 ************************************************/
function requestArkJson(query) {
	jQuery.support.cors = true;

	cursorPos = -1;

	$.ajaxSetup({cache:false});
	$.ajax({
		url: transURL,
		type: "POST",
		dataType: "json",
		data: {"convert":g_oConvert, "target":target, "charset":charset, "query":query},
		success: function(data) {
			
			if(data.result.length <= 0) {
				totalFwCount = 0;
				totalRwCount = 0;
			}

			var str = "";

			$.each(data.result, function(i, result) {
				var totalCount = parseInt(result.totalcount);
				if (i == 0) {
					totalFwCount = totalCount;
				} else {
					totalRwCount = totalCount;
				}

				if (totalCount > 0) {
					// 정방향, 역방향 구분선
					if (i > 0 && totalFwCount > 0 && totalRwCount > 0) {
						str += "<li style=\"border-top:1px solid #f3f3f3;\"></li>";
					}

					// 자동완성 리스트 설정
					$.each(result.items, function(num,item){
						if (i != 0) {
							num = totalFwCount + num;
						}
						
						//manager에 하드코딩되어있는 하이라이팅 치환하기
						var hkeyword = item.hkeyword;
						
						hkeyword = hkeyword.replace("<font style='color:#CC6633'>", "<span>");
						hkeyword = hkeyword.replace("</font>", "</span>");
						
						hkeyword = hkeyword.replace("<font style='font-size:13px'>", "");
						hkeyword = hkeyword.replace("</font>", "");
						
						str += "<li id=\"bg" + num + "\" onclick=\"onClickKeyword(" + num + ");\" onmouseover=\"onMouseOverKeyword(" + num + ");\"";
						str += " onmouseout=\"onMouseOutKeyword(" + num + ");\"><a href=\"#\">" + hkeyword + "</a></li>";
						str += " <span id=\"f" + num + "\" style=display:none;>" + item.keyword + "</span>";
						str += "</li>";
					});
				}
			});

			if ((totalFwCount + totalRwCount) == 0) {
				$("#" + contentListId).html("<li><a>"+t("common:no_keyword_result")+"</a></li>");//해당 단어로 시작하는 검색어가 없습니다.
			} else {
				$("#" + contentListId).html(str);
			}

			showArk();
		}
    });
}


var keyword = "";

/************************************************
 * 브라우저가 FireFox, Opera 일 경우 한글 입력
 * @name eventKeydown
 ************************************************/
function eventKeydown() {
	// 방향키 이동시 메소드 실행을 중지시킨다.
	if(!isKeydown) {
		return;
	}

	if (keyword != $(queryId).val()) {
		keyword = $(queryId).val();
		if (keyword != "" && isArk) {
			requestArkJson($(queryId).val());
		} else {
			hideArk();
		}
	}
	setTimeout("eventKeydown()", 20);
}


/************************************************
 * 방향키 이벤트 처리
 * @name moveFocusEvent
 * @param event 페이지 이벤트
 ************************************************/
function moveFocusEvent(event) {
	isKeydown = false;

	if (event.keyCode == 38) {
		if (cursorPos==-1 || cursorPos==0) {
			cursorPos = -1;
			hideArk();
			$(queryId).val(tempQuery);
			tempQuery = "";
		} else {
			onMouseOutKeyword(cursorPos);
			cursorPos = cursorPos - 1;
			onMouseOverKeyword(cursorPos);
			$(queryId).val($("#f" + cursorPos).text());
		}
	} else if (event.keyCode == 40) {
		if(cursorPos == -1) {
			tempQuery = $(queryId).val();
		}
		if ((totalFwCount + totalRwCount) > (cursorPos + 1)) {
			onMouseOutKeyword(cursorPos);
			cursorPos = cursorPos + 1;
			onMouseOverKeyword(cursorPos);
			$(queryId).val($("#f" + cursorPos).text());
		}
	}
}

/************************************************
 * MouseOver 일 경우 선택한 배경을 설정
 * @name onMouseOverKeyword
 * @param cursorNum 커서의 위치 인덱스 값
 ************************************************/
function onMouseOverKeyword(cursorNum) {
	clearCursorPos();
	cursorPos = cursorNum;
	$("#bg" + cursorNum).css({"backgroundColor" : "#eeeeee"});
	$("#bg" + cursorNum).css({"cursor" : "pointer"});
}

/************************************************
 * MouseOut 일 경우 설정한 배경을 초기화
 * @name onMouseOutKeyword
 * @param cursorNum 커서의 위치 인덱스 값
 ************************************************/
function onMouseOutKeyword(curSorNum) {
	cursorPos = curSorNum;
	$("#bg" + cursorPos).css({"backgroundColor" : "#ffffff"});
}

/************************************************
 * 커서 위치가 변경될 때마다 선택되지 않은 부분 초기화
 * @name clearCursorPos
 ************************************************/
function clearCursorPos() {
	for(var i=0; i<(totalFwCount + totalRwCount); i++){
		$("#bg" + i).css({"backgroundColor" : "#ffffff"});
	}
}

/************************************************
 * 마우스 클릭시 검색을 수행
 * @name onClickKeyword
 * @param cursorPos 커서의 위치
 ************************************************/
function onClickKeyword(cursorPos) {
    $(queryId).val($("#f" + cursorPos).text());
    // 검색 함수 (자동완성 리스트 클릭했을 때 실행 함수)
    var search = $("#f" + cursorPos).text();
    var searchKey = encodeURIComponent($(queryId).val());
    $(location).attr("href", "/"+language_cd+"/search/search-result.do?keyword="+searchKey);
}

/************************************************
 * 자동완성 목록을 화면에 보여줌
 * @name showArk
 ************************************************/
function showArk() {
  if(  $(queryId).val() != ""){
	    $("#" + wrapId).show();
	    $("#" + arkUpId).show();
	    $("#" + arkDownId).hide();
	    var openTag = "<button type=\"button\" class=\"btn_off\" onclick=\"setArkOn();\">"+t("common:turn_on_auto_complete")+"</button>";
	    var closeTag = "<button type=\"button\" class=\"btn_off\" onclick=\"setArkOff();\">"+t("common:turn_off_auto_complete")+"</button>";
	    if(isArk == false){
	    	$('#'+contentListId).html('');
	    	$('#'+arkOpenClose).html(openTag);
	    }else{
	    	$('#'+arkOpenClose).html(closeTag);
	    }
	    
	}
}

/************************************************
 * 자동완성 목록을 화면에서 감춤
 * @name hideArk
 ************************************************/
function hideArk() {
	$("#" + wrapId).hide();
	$("#" + arkUpId).hide();
	$("#" + arkDownId).show();
}

/************************************************
 * 자동완성 기능 끄기
 * @name setArkOff
 ************************************************/
function setArkOff() {
	$(queryId).attr("autocomplete", "on");
	isArk = false;

	var today = new Date();
	var expire_date = new Date(today.getTime() + 365*60*60*24*1000);
	setCookie("ark", "off", expire_date);
}

/************************************************
 * 자동완성 기능 켜기
 * @name setARkOn
 ************************************************/
function setArkOn() {
	$(queryId).attr("autocomplete", "on");
	isArk = true;

	var today = new Date();
	var expireDate = new Date(today.getTime() - 60*60*24*1000);
	setCookie("ark", "on", expireDate);

	var query = $(queryId).val();
	if (query != "") {
		requestArkJson(query);
	}
}

/************************************************
 * 쿠키 설정값을 저장
 * @name setCookie
 * @param name 쿠키 항목명
 * @param value 쿠키 항목의 값
 * @param expire 쿠키 만료일자
 ************************************************/
function setCookie(name, value, expire) {
	var expire_date = new Date(expire);
	document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expire_date.toGMTString();
}

/************************************************
 * 쿠키 설정값을 로드
 * @name getCookie
 * @param name 쿠키 항목명
 ************************************************/
function getCookie(name) {
	var dc = document.cookie;
	var prefix = name + "=";
	var begin = dc.indexOf("; " + prefix);
	if (begin == -1) {
		begin = dc.indexOf(prefix);
		if (begin != 0) {
			return null;
		}
	} else {
		begin += 2;
	}

	var end = document.cookie.indexOf(";", begin);

	if (end == -1) {
		end = dc.length;
	}

	return unescape(dc.substring(begin + prefix.length, end));
}
