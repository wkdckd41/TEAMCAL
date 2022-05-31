<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 공유하기 레이어 팝업 --> 
<div id="pop_share" class="row layer_pop share_wrap" tabindex="1"  > 
    <div class="col-12_clear">
        <a href="javascript:void(0);" class="btn_close" data-i18n="close"><!-- 닫기 --></a>
        <div class="cnt_area cnt_clear">
            <div class="col-12_clear">  
                <!-- 레이어 팝업 컨텐츠 영역 -->
                <div class="share_list list_clear">
                    <ul id="shareList">
                        <!-- share 그리기 -->
                    </ul>
                    <div class="newsletter">
                    	<a href="/${savedLanguage}/newsletter/subscribe-to-newsletter.do" class="btn_newsletter" data-i18n="[html]common:request_newletter" ><!-- 뉴스레터 구독 신청 --></a>
                    </div>
                </div>
                <!-- //레이어 팝업  컨텐츠 영역 -->
            </div>
        </div> 
    </div> 
</div> <!-- //share_wrap--> 
<!-- // 공유하기 레이어 팝업 -->

<script type="text/javascript"> 

var language_cd = "${savedLanguage}" == "" ? "ko" : "${savedLanguage}";
var url = location.href;
if(url.indexOf("localhost")!= -1) {
	url = url.replace("localhost:8099","test.yulchon.com");
	url = url.replace("#","");
	url = url.replace("none","");
}
url = encodeURIComponent(url);

$(document).ready(function() {
	
	i18n.fnInit(
		options = {
			lang			: language_cd,
			namespace	:  ['common'],
			defaultNs		: 'common'
		},
		function(){
			share.fnInit();
	});
});

var share = {
		fnInit : function() {
			var txt = '';
			txt += '<li><a href="javascript:share.fnFacebook();" class="sh_fb" >facebook</a></li>';
			txt += '<li><a href="javascript:share.fnTwitter();" class="sh_tw" >twitter</a></li>';
			txt += '<li><a href="javascript:share.fnLinkedin();" class="sh_lin" >linkedin</a></li>';
			txt += '<li><a href="mailto:?subject='+document.title+'&body='+url+'" class="sh_email">email</a></li>';
			
			$("#shareList").empty();
			$("#shareList").append(txt);
		},
		
		fnFacebook : function() {
			/* if($("head meta[name='og_title']").length < 1 ){
				$('head').append('<meta name="og_title" property="og:title" content="' + document.title + '">');
				$('head').append('<meta name="og_description" property="og:description" content="'+$("head meta[name='description']").attr("content")+'">');
				$('head').append('<meta name="og_image" property="og:image" content="'+location.origin+'/resources/images/favicon/yulchon-favicon-192x192.png">');
			} */
			
			window.open("https://www.facebook.com/sharer/sharer.php?u="+url, "_blank"); 
		},

		fnTwitter : function() {
			var title = document.title;
            window.open("https://twitter.com/intent/tweet?text="+title+"&url="+url, "_blank"); 
		},

		fnLinkedin : function(url) {
			var title = document.title;
            window.open("https://www.linkedin.com/shareArticle?mini=true&title="+title+"&url="+url, "_blank"); 
		}
}

</script>
