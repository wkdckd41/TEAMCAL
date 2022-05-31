var searchObjParams = {};	// 페이징 저장용 params
var iframe = null;			// 파일 다운용 iframe
/****************************************
 * 트랜잭션 처리
 * @name			: gFnObjSyncAjaxCall
 * @param 		: objParams, ctrUrl, callBackFunc
 * gfnTransactionCall을 기본으로 ocject를 받는 함수
 * @returns		: callBackFunc
 */
function gFnObjSyncAjaxCall(sync, objParams, ctrUrl, callBackFunc){
	if(sync == undefined){
		sync = true;
	}
	$.ajax({
		url 			: ctrUrl
		, async			: sync
		, type 			: 'post'
		, data			: objParams
		, beforeSend 	: function (){
			loading(true);
		}
		, complete 		: function (){
			loading(false);
		}
		, success 		: callBackFunc
		, error 		: function (request, error){
			console.log("code:" + request.status + "\n" + "error:" + error);
		}
	});
}
/****************************************
 * 트랜잭션 처리
 * @name			: gFnObjSyncAjaxCall
 * @param 		: objParams, ctrUrl, callBackFunc
 * gfnTransactionCall을 기본으로 ocject를 받는 함수
 * @returns		: callBackFunc
 */
function gFnObjJsonAjaxCall(sync, objParams, ctrUrl, callBackFunc){
	if(sync == undefined){
		sync = true;
	}
	
	$.ajax({
		url 			: ctrUrl
		, async			: sync
		, type 			: 'post'
		//, dataType 		: 'json'
		, data			: objParams
		, contentType	: "application/json"
		, beforeSend 	: function (){
			loading(true);
		}
		, complete 		: function (){
			loading(false);
		}
		, success 		: callBackFunc
		, error 		: function (request, error){
			console.log("code:" + request.status + "\n" + "error:" + error);
		}
	});
}
/****************************************
 * 트랜잭션 처리
 * @name		: gFnMultiPartAjaxCall
 * @param 		: objParams, ctrUrl, callBackFunc
 * gfnTransactionCall을 기본으로 ocject를 받는 함수
 * @returns		: callBackFunc
 */
function gFnMultiPartAjaxCall(sync, formData, ctrUrl, callBackFunc){
	
	$.ajax({
        url 			: ctrUrl
        , async			: sync
        , type 			: 'post'
        , dataType 		: 'json'
        , data			: formData
        , enctype		: 'multipart/form-data'
		, processData	: false
		, contentType	: false
		, cache			: false
        , beforeSend 	: function (){
            loading(true);
        }
        , complete 		: function (){
            loading(false);
        }
        , success 		: callBackFunc
        , error 		: function (request, error){
            console.log("code:" + request.status + "\n" + "error:" + error);
        }
	});
}


/********************************
 * gfnFormSerialize
 * @param objParams
 * @returns
 */
function gfnFormSerialize(objParams){
	if(typeof objParams.formId == 'undefined'){ // || objParams.formId == null || objParams.formId ==""
		return;
	}else{
		return $("#"+objParams.formId+"").serialize();
	}
}

// check.click function default set
function gFnActiveDelBtnWithCheckAll(allID, delID){
	$('#'+allID).click(function(event) {
		if(this.checked) {
			// Iterate each checkbox
			$(':checkbox').each(function() {
				this.checked = true;
				$('#'+delID).removeAttr('disabled');
			});
		}
		else {
			$(':checkbox').each(function() {
				this.checked = false;
				$('#'+delID).attr('disabled', 'disabled');
			});
		}
	});
}
/*******************************
 * null check
 * @param 
 * @returns
 */
function gFnIsEmpty(value) {
	if(value == null || value == '' || value == undefined || typeof(value)== 'undefined'){
		return true;
	} else {
		return false;
	}
}


// 다국어 세팅
var i18n = {
	fnInit : function(options, func){
		i18next
			.use(i18nextXHRBackend)
			.use(i18nextBrowserLanguageDetector)
			.init({
				lng			: options.lang,					// 변경 언어
				fallbackLng	: options.lang,
				debug		: false,						// console opt 정보
				ns			: options.namespace,			//	namespace
				defaultNS	: options.defaultNs,			// 기본 namespace 
				backend: {
					// load from i18next-gitbook repo
					loadPath: '/resources/i18n/{{lng}}/{{ns}}.json',
					crossDomain: false
				}
			}, function(err, t) {
				jqueryI18next.init(i18next, $);			// 
				$(document).localize();					// data-i18n 설정
				func();
			});
	}
}

// 다국어 함수 단축
function t(str, param) {
	if(!gFnIsNull(param)){
		return i18next.t(str, param);
	} else {
		return i18next.t(str);
	}
}

function gFnIsNull(str) {
    if (str == null) return true;
    if (str == "NaN") return true;
    if (new String(str).valueOf() == "undefined") return true;   
    var chkStr = new String(str);
    if( chkStr.valueOf() == "undefined" ) return true;
    if (chkStr == null) return true;   
    if (chkStr.toString().length == 0 ) return true;  
    return false;
}

function gFnSetGlobalName(mbItem) {
	var txt = '';
	if(language_cd == "ko"){
		txt +='				<p>'+mbItem.Names+'</p>';
	} else if(language_cd == "en"){
		txt +='<p>';
		txt += mbItem.EName+t("comma_space")+mbItem.SecondName;
		txt +='</p>';
	} else if(language_cd == "ja"){
		txt +='<p>';
		txt += mbItem.JName;
		if(mbItem.EName){
			txt +='	<span class="en">'+mbItem.EName+t("comma_space")+mbItem.SecondName+'</span>';
		}
		txt +='</p>';
	} else if(language_cd == "zh"){
		txt +='<p>';
		txt += mbItem.CName;
		if(mbItem.EName){
			txt +='	<span class="en">'+mbItem.EName+t("comma_space")+mbItem.SecondName+'</span>';
		}
		txt +='</p>';
	}
	return txt;
}

/*
@author https://github.com/macek/jquery-serialize-object
*/
$.fn.serializeObject = function () {
    "use strict";
    var result = {};
    var extend = function (i, element) {
        var node = result[element.name];
        if ('undefined' !== typeof node && node !== null) {
           if ($.isArray(node)) {
               node.push(element.value);
           } else {
               result[element.name] = [node, element.value];
           }
        } else {
            result[element.name] = element.value;
        }
    };
 
    $.each(this.serializeArray(), extend);
    return result;
};
// 날짜 2017-04-01 => 2017. 04. 01.로 변환
function gFnChangeDateDot(originDate){
	originDate = originDate.replace(/-/gi, '. ');
	originDate += ".";
	return originDate;
}
// 날짜 2017-04-01 => 2017. 04. 01.로 변환
function gFnChangeDateDotInSearch(originDate){
	originDate = originDate.substring(0, 8);
	var editDate = '';
	editDate += originDate.substring(0,4);
	editDate += '. ';
	editDate += originDate.substring(4,6);
	editDate += '. ';
	editDate += originDate.substring(6,8);
	editDate += ".";
	return editDate;
}

// 날짜 2017-04-01 => 2017 앞 4자리 추출
function gFnDatetoYear(originDate){
	var _date = "";
	if(!gFnIsNull(originDate)){
		_date = originDate;
		_date = _date.substring(0, 4);
	}
	return _date;
}

/*****
 * 파일 다운로드
 * account, filename 필수
 * account, date 조건에 따라서 멤버 다운, 게시물 다운
 */
function gFnFileDown(paramData){
	
	var defaultObj = null;
	
	if(!gFnIsNull(paramData)){
		defaultObj = paramData;
	}
	
	if(defaultObj != null){
		var form = document.createElement('form');
		form.setAttribute("name", "file_down");
		form.setAttribute("method", "POST");
		form.setAttribute("action", "/fileDownload.do");
		
		var _input = '';
		$.each(defaultObj, function(key, value){
			//console.log(key,value);
			_input += "<input type='hidden' name='"+key+"' value='"+value+"'></input>";
		});
		
		form.innerHTML = _input;
		document.body.appendChild(form);

		if(defaultObj.filename != null){
			form.submit();
		}
		
		$("form[name='file_down']").remove();
	}
}

/*****
 * 페이지 이동
 * 동적 input 생성하여 form 전송
 */
function gFnFormSend(dataObj){
	var defaultData = {
			name	:	"form_send",
			method	:	"POST",
			action	:	null,
			data	:	null
	}
	
	if(dataObj != undefined){
		defaultData = dataObj;
	}
	
	var form = document.createElement('form');
	form.setAttribute("name", defaultData.name);
	form.setAttribute("method", defaultData.method);
	form.setAttribute("action", defaultData.action);
	
	if(defaultData.data != null){
		form.innerHTML = gFnHiddenInput(defaultData.data);
	}
	document.body.appendChild(form);
	if(defaultData.action != null){
		form.submit();
	}
	
	$("form[name='"+defaultData.name+"']").remove();
}
/*****
 * hidden input 생성
 * gFnFormSend.data Object 참조
 */
function gFnHiddenInput(dataObj){
	var resultTxt = '';
	if(dataObj != undefined){
		$.each(dataObj, function(key, value){
			//console.log("key :: >> ", key);
			resultTxt += '<input type="hidden" name="'+key+'" value="'+value+'"></input>';
		});
	}
	return resultTxt;
}
/*****
 * page back
 * 이전 페이지 데이터와 함께 페이지 이동
 * dataObj, lang(언어)
 */
function gFnGoBackPage(dataObj){
	// sample
	var pageData = {
			name	:	"form_send",
			action	:	null,
			method	:	"POST",
			data	:	{	// 이전 페이지 데이터
				searching	: null,
				pageSize	: null,
				pageNumber	: null
			}
	}
	if(dataObj != undefined){
		pageData = dataObj;
	}
	
	if(pageData.action != null){
		gFnFormSend(pageData);
	} else {
		
		$(location).attr("href", "/"+language_cd+"/main/main.do");
	}
}
/*****
 * page back
 * 이전 페이지 데이터와 함께 페이지 이동
 * dataObj, lang(언어)
 */
function gFnGoBackParamPage(dataObj, param){
	// sample
	var pageData = {
			name	:	"form_send",
			action	:	null,
			method	:	"POST",
			data	:	{	// 이전 페이지 데이터
				searching	: null,
				pageSize	: null,
				pageNumber	: null
			}
	}
	if(dataObj != undefined){
		pageData = dataObj;
	}
	
	if(pageData.action != null){
		gFnFormSend(pageData);
	} else {
		
		$(location).attr("href", "/"+language_cd+"/main/main.do");
	}
}
/*****
 * 리스트 더보기 생성 유무
 * 전체페이지와 현재 페이지가 같으면 false
 */
function gFnViewYN(totalCount, pSize, cPage){
	if(totalCount != undefined){
		var page_size = 10;
		if(pSize != undefined){
			page_size = pSize;
		}
		var totalPage = Math.ceil(((totalCount -1) == 0? 1 : (totalCount)) / page_size);
		//console.log("totalCount :: >> ", totalCount, "totalPage :: >> ", totalPage);
		if(totalPage == cPage){
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}

/* =================================================================
script description : 이메일 자동완성
date : 2018.04.12
revisions : empty
================================================================= */
function autoEmail(objData)
{
	var defaultData = {
			target : $(".email-auto"),
			listdata : []
	}
	var availableTags = [];
	if(objData != undefined){
		defaultData = objData;
	}
	target = defaultData.target;
	availableTags = defaultData.listdata;
	
	function extractLast( val ) {
	    var tmp, tmpObj = {arr:'', cont:''};
	    if (val.indexOf("@")!=-1){
	        tmp=val.split("@");
	        tmpObj.arr = tmp;
	        tmpObj.cont = tmp[tmp.length-1];
	        return tmpObj;
	    }
	    //console.log("returning empty");
	    return tmpObj;
	}
	
	target.on( "keydown", function( event ) {
	        if ( event.keyCode === $.ui.keyCode.TAB &&
	            $( this ).data( "autocomplete" ).menu.active ) {
	            event.preventDefault();
	        }
	}).autocomplete({
	    minLength: 1,
	    source: function( request, response ) {
	        var extract = extractLast(request.term)
	            ,mail = extract.cont
	            ,matcher = new RegExp( "^" + mail, "i" )
	            ,explen = request.term.match(/@/g);
	
	        if(typeof extract.arr == 'object' && extract.arr[1].length == 0 && explen.length == 1){
	            response( $.ui.autocomplete.filter(availableTags, mail));
	            return;
	        }else if(typeof extract.arr == 'object' && extract.arr[1].length > 0 && explen.length == 1){
	            response( $.grep( availableTags, function( item ){
	                return matcher.test( item );
	            }));
	            return;
	        }else{
	            $(this.element[0]).autocomplete( "close" );
	            return false;
	        }
	    },
	    focus: function() {
	        // prevent value inserted on focus
	        return false;
	    },
	    select: function( event, ui ) {
	        var terms = this.value.split(", ");
	        // remove the current input
	        var ml=terms[terms.length-1].split("@")[0];
	        terms.pop();
	        // add the selected item
	        terms.push( ml+"@"+ui.item.value );
	        // add placeholder to get the comma-and-space at the end
	        this.value = terms;
	        return false;
	    }
	});
}

function gFnRemoveSpace(str){
	return str.replace(/\s/gi, "");
}

function gFnSpaceToHyphen(str){
	str = gFnSlashToHyphen(str);
	return str.replace(/\s/gi, "\-");
}

function gFnSlashToHyphen(str){
	return str.replace(/\//gi, "\-");
}

function gFnReplaceBR(str){
	return str.replace(/\/\%\-\/\-\%\//gi, "\n");
}

// 구분값에서 직접입력_ replace
function gFnReplaceGubun(str){
	return str.replace(/직접입력\_/gi, "");
}
// 구분값에서 구분없음 replace
function gFnReplaceNoneGubun(str){
	return str.replace(/구분없음/gi, "");
}

// 구분값에서 $C$ replace
function gFnReplaceTitle(str, replace_str){
	var _replace = "";
	if(!gFnIsNull(replace_str)){
		_replace = replace_str;
	}
	return str.replace(/\$C\$/gi, _replace);
}

// 앞, 뒤 공백제거
function gFnReplaceFirstEndSpace(str){
	return str.replace(/(^\s*)|(\s*$)/, '');
}

// 구분값 다국어 변경
function gFnGubunTrans(str){
	if(!gFnIsNull(str)){
		if(str == "공지"){
			return t("common:ref.notice");
		} else if(str == "수상"){
			return t("common:ref.award");
		} else if(str == "세미나"){
			return t("common:ref.seminar");
		} else if(str == "기고"){
			return t("common:ref.contribution");
		} else if(str == "행사"){
			return t("common:ref.event");
		} else if(str == "행사참석"){
			return t("common:ref.attended_event");
		} else if(str == "위촉"){
			return t("common:ref.commission");
		} else if(str == "선정"){
			return t("common:ref.selection");
		} else if(str == "발간"){
			return t("common:ref.publication");
		} else if(str == "임명"){
			return t("common:ref.appointment");
		} else if(str == "발표"){
			return t("common:ref.announcement");
		} else if(str == "인터뷰"){
			return t("common:ref.interview");
		} else if(str == "구분없음"){
			return gFnReplaceNoneGubun(str);
		} else {
			return gFnReplaceGubun(str);
		}
	} else {
		return "";
	}
}

function gFnMoveToTarget(target){
	if(!gFnIsNull(target)){
		$("html, body").animate({ scrollTop: target }, 500);
	}
}

$(document).ready(function() {
	$(".print_sbj").click(function() {
		window.print();
	});
});
/*****
 * 구성원 다국어 이름 (구성원 스토리보드)
 * language_cd가 없으면 동작 못함
 * @param kr
 * @param zh
 * @param en
 * @param en_s
 * @param ja
 * @param ja_s
 * @returns
 */
function gFnNaming(lang, kr, zh, en, en_s, ja, ja_s){
	var _name = '';
	
	if(lang == "ko") {
		_name = kr;
	} else if(lang == "en") {
		if(!gFnIsNull(en) && !gFnIsNull(en_s)){
			_name = en + t("common:comma_space") + en_s;
		} else {
			if(!gFnIsNull(en)){
				_name = en;
			} else if(!gFnIsNull(en_s)){
				_name = en_s;
			}
		}
	} else if(lang == "zh") {
		if(!gFnIsNull(zh)){
			_name = zh;
		} else {
			if(!gFnIsNull(en) && !gFnIsNull(en_s)){
				_name = en + t("common:comma_space") + en_s;
			} else {
				if(!gFnIsNull(en)){
					_name = en;
				} else if(!gFnIsNull(en_s)){
					_name = en_s;
				}
			}
		}
	} else if(lang == "ja") {
		if(!gFnIsNull(ja) && !gFnIsNull(ja_s)){
			_name = ja + " (" + ja_s + ")";
		} else {
			if(!gFnIsNull(ja)){
				_name = ja;
			} else if(!gFnIsNull(ja_s)){
				_name = ja_s;
			} else {
				if(!gFnIsNull(en) && !gFnIsNull(en_s)){
					_name = en + t("common:comma_space") + en_s;
				} else {
					if(!gFnIsNull(en)){
						_name = en;
					} else if(!gFnIsNull(en_s)){
						_name = en_s;
					}
				}
			}
		}
	}
	
	return _name;
}

/*****
 * seo url pattern ename-enameSecond 생성
 * 둘 다 있는 경우 하이픈 구분 아니면 있는 이름만 생성
 * @param en_name
 * @param en_nameSecond
 * @returns
 */
function gFnNamePath(en_name, en_nameSecond){
	var _name_path = '';
	if(!gFnIsNull(en_name) && !gFnIsNull(en_nameSecond)){
		_name_path = en_name + '-' + en_nameSecond;
	} else {
		if(!gFnIsNull(en_name)){
			_name_path = en_name;
		} else if(!gFnIsNull(en_name)){
			_name_path = en_nameSecond;
		}
	}
	return _name_path;
}

/*****
 * 날짜 다국어 변환
 */
function gFnGlobalDate(dateParam, start, end){
	// origin data 20180526000000
	// ko		2017. 10. 27. (금) 14:00~18:00
	// en		2017. 10. 27. (Fri) 14:00~18:00
	var year = '';
	var month = '';
	var date = '';
	var day = '';
	var local_time = '';
	var result_date = '';
	
	// DB 데이터 구조로 변경
	if(!gFnIsNull(dateParam)){
		var dateArr = dateParam.split(".");
		year = dateArr[0];
		month = dateArr[1];
		date = dateArr[2];
	}
	
	var _date = new Date();
	_date.setYear(year);
	_date.setMonth(month-1);
	_date.setDate(date);
	
	if(language_cd == "ko"){
		var ko_week = ["일","월","화","수","목","금","토"];
		day = ko_week[_date.getDay()];
	} else {
		day = _date.toString().substring(0,3);
		local_time = '<br>(Local time)';
	}
	result_date = year + '. ' + month + '. ' + date + '. (' +  day + ') ' + start + '~' + end + local_time;
	
	return result_date;
}

function gFnBrowserLangCheck() {
    var userLang = navigator.language || navigator.userLanguage;

    console.log(navigator.language, " +++++ ", navigator.userLanguage);

    console.log(userLang);

    var _lang = userLang.substring(0, 2);
    if (_lang != 'ko' && _lang != 'en' && _lang != 'ja' && _lang != 'zh') {
        _lang = 'en';
    }

    return _lang;
}
/*****
 * 
 * @param key	정렬할 obj key name
 * @param list	정렬할 리스트
 * @returns
 */
function gFnSortJsonList(key, list){
	var tempList = [];
	if(!gFnIsNull(list)){
		tempList = list;
	}
	if(tempList.length > 0){
		tempList.sort(function(a, b){
			return a[key] - b[key];
		});
	}
	return tempList;
}
function gFnGetLang(langCD){
	var lang_cd = "";
	switch (langCD) {
		case "2":
			lang_cd = "KO";
			break;
		case "3":
			lang_cd = "EN";
			break;
		case "4":
			lang_cd = "ZH";
			break;
		case "5":
			lang_cd = "JA";
			break;
			
		default:
			break;
	}
	return lang_cd;
}
function gFnGetNationName(nationCD){
	var nationName = "";
	switch (nationCD) {
		case "1":
			nationName = "KOREA";
			break;
		case "2":
			nationName = "RUSSIA";
			break;
		case "3":
			nationName = "MYANMAR";
			break;
		case "4":
			nationName = "CHINA";
			break;
		case "5":
			nationName = "VIETNAM_HOCHIMINH";
			break;
		case "6":
			nationName = "VIETNAM_HANOI";
			break;
		case "7":
			nationName = "INDONESIA";
			break;
	
		default:
			break;
	}
	
	return nationName;
}
function gFnImageUrlUtil(data){
	var _path = "/resources/file";
	var dataObj = {
			type		: null
			,account	: null
			,filename	: null
			,nation		: null
			,lang		: null
	}
	if(!gFnIsNull(data)){
		dataObj = data;
	}
	if(!gFnIsNull(dataObj.type)){
		if(dataObj.type == "profile"){
			// 구성원 이미지
			var temp_path = "/pf/"+dataObj.account+"/profile/stable/"+dataObj.filename;
			_path += temp_path;
		} else if(dataObj.type == "office"){
			// 사무소 이미지
			var temp_path = "/office/"+dataObj.nation+"/"+dataObj.lang+"/"+dataObj.filename;
			_path += temp_path;
		} else if(dataObj.type == "main"){
			// main 이미지
			var temp_path = "/site/main/"+dataObj.filename;
			_path += temp_path;
		} else if(dataObj.type == "popup"){
			//popup 이미지
			var temp_path = "/popup/"+dataObj.filename;
			_path += temp_path;
		} else if(dataObj.type == "menuSub"){
			//업무분야 배너
			var temp_path = "/site/menuSub/"+dataObj.filename;
			_path += temp_path;
		}
	}
	
	return _path;
}

function gFnResizeSetTimeout(){
	setTimeout(function() {
		  $(window).trigger('resize');
	}, 1500);
}

function gFnEllipsisSetTimeout(){
	setTimeout(function() {
		ellipsis.init();
	}, 1500);
}

function gFnHtmlDecode(input){
    var e = document.createElement('div');
    e.innerHTML = input;
    return e.childNodes.length === 0 ? "" : e.childNodes[0].nodeValue;
}

function gFnGetBoardName(boardType){
	var _name = '';

	if(!gFnIsNull(boardType)){
		switch (boardType) {
            case '4' :
                _name = t('common:periodicals');
                break;
            case '5' :
                _name = t('common:legal_update');
                break;
            case '6' :
                _name = t('common:paper_pub');
                break;
            default :
                break;
        }
	}

	return _name;
}

function gFnUrlProtocolCheck (url) {
	var _url = '';
    var _protocol = '';
	if(!gFnIsNull(url)){
        _url = url;
	}
    _protocol = _url.substring(0, 4);

	if(_protocol != 'http'){
        _url = "http://" + _url;
	}

	return _url;
}

function gFnRemoveEMTag(tag){
	var _result = '';
	if(!gFnIsNull(tag)){
		_result = tag.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");
        _result = gFnRemoveSpace(_result);
	}
	return _result;
}