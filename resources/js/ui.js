/**
 * ! Emotion ui.js v0.1
 * @comment     customize v0.1
 * @author      LJM / CWM
 * @date       2017-12-30
 * @Modify      empty
 */

/* =================================================================
	script description : console
	date : 2017.12.25
	revisions : empty
	description : 콘솔 출력 기능이 없는 웹브라우저에서 콘솔 로그를 피함
	================================================================= */
(function() {
    var method;
    var noop = function () {};
    var methods = [
        'assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error',
        'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log',
        'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd',
        'timeline', 'timelineEnd', 'timeStamp', 'trace', 'warn'
    ];
    var length = methods.length;
    var console = (window.console = window.console || {});

    while (length--) {
        method = methods[length];
        // methods 배열 변수에서 정의하지 않은 남은 부분의 method 변수값 처리
        if (!console[method]) {
            console[method] = noop;
        }
    }
}());

/**
 * @description PC/Mobile device 체크
 */

var isMobile = {
    Android: function () {
        return navigator.userAgent.match(/Android/i) == null ? false : true;
    },
    BlackBerry: function () {
        return navigator.userAgent.match(/BlackBerry/i) == null ? false : true;
    },
    IOS: function () {
        return navigator.userAgent.match(/iPhone|iPad|iPod/i) == null ? false : true;
    },
    Opera: function () {
        return navigator.userAgent.match(/Opera Mini/i) == null ? false : true;
    }
};

// PC or Mobile 체크
function deviceChk(){
    if(isMobile.Android()){
        return 'mobile';
    }else if(isMobile.IOS()){
        return 'mobile';
    }else if(isMobile.BlackBerry()){
        return 'mobile';
    }else if(isMobile.Opera()){
        return 'mobile';
    }else{
        return 'pc';
    }
}

window.deviceChk = deviceChk;

// 추가적인 함수들은 하단 ready에 추가
var rerenderScroll;
$(window).ready(function(){
    // 반복문용 공통 READY 전역변수
    var i,j,n;

    /* =================================================================
	script description : 커스텀 스크롤
	date : 2017.12.31
	revisions : empty
	description : 커스텀 스크롤(swiper.js)
	================================================================= */
    // 커스텀 스크롤 변수 배열
    var customScroll = [];
    $('.scroll-container').each(function(){
        var scroll = $(this).swiper({
            mode:'vertical',
            scrollContainer: true,
            mousewheelControl: true,
            scrollbar: {
                hide:false,
                draggable:true,
                container:$(this).find('.swiper-scrollbar')[0]
            }
        });
        customScroll.push(scroll);
    });

    rerenderScroll = function()
    {
        for(i=0;i<customScroll.length;i++)
        {
            if($(customScroll[i].container).children('.swiper-wrapper').height() > $(customScroll[i].container).height())
            {
                $(customScroll[i].container).children('.swiper-scrollbar').css({opacity:1});
            }else{
                $(customScroll[i].container).children('.swiper-scrollbar').css({opacity:0});
            }
            customScroll[i].swipeReset();
            customScroll[i].reInit();
        }
    };

    /* =================================================================
	script description : Snb
	date : 2017.12.31
	revisions : empty
	description : 'Snb open/close' & 'Snb 서브메뉴 아코디언'
	================================================================= */
    // 햄버거 메뉴 클릭 이벤트 등록
    $(document).on('click', '.gnb_btn_area .icon_snb', function(){
        snbControl(true);
    });
    $(document).on('click', '.snb_dimmed, .nav_top .user_info .btn_close', function(){
        snbControl(false);
    });

    function snbControl(flag)
    {
        if(flag == true)
        {
            scrollController("locked", true);

            TweenMax.to($('.snb_dimmed'), 0.5, {display:'block', opacity:0.8, ease:Cubic.easeInOut});
            TweenMax.to($('.side_nav'), 0.5, {display:'block', x:'-100%', ease:Cubic.easeInOut, onUpdate:function(){
               rerenderScroll();
            }});
        }else{
            TweenMax.to($('.snb_dimmed'), 0.5, {display:'block', opacity:0, ease:Cubic.easeInOut, onComplete:function(){
                $('.snb_dimmed, .side_nav').css({display:'none'});
            }});
            TweenMax.to($('.side_nav'), 0.5, {x:'0%', ease:Cubic.easeInOut});
            
			scrollController("unlocked", true);
        }
    }

    var device_snb = ($(window)[0].innerWidth <= 767)? false : true;

    function snbResizeHandler()
    {
        if ($(window)[0].innerWidth <= 767 && !device_snb) {

            for(i=0;i<$('.side_nav .level1.drop_menu > a').length;i++)
            {
                $('.side_nav .level1.drop_menu > a').eq(i)[0].toggle = false;
                if($('.side_nav .level1.drop_menu > a').eq(i)[0].tl)
                {
                    $('.side_nav .level1.drop_menu > a').eq(i)[0].tl.remove();
                    $('.side_nav .level1.drop_menu > a').eq(i)[0].tl = undefined;
                    $('.side_nav .level1.drop_menu > a').eq(i).next('.level2').removeAttr('style');
                }
                $('.side_nav .level1.drop_menu > a').eq(i)[0].tl = new TimelineMax();
                $('.side_nav .level1.drop_menu > a').eq(i)[0].tl.from($('.side_nav .level1.drop_menu > a').eq(i).next(), 0.5, {height:0, display:'none', ease:Cubic.easeInOut, onUpdate:function(){
                        rerenderScroll();
                    }}, 0);
                $('.side_nav .level1.drop_menu > a').eq(i)[0].tl.pause();
            }
            device_snb = true;
        } else if ($(window)[0].innerWidth > 767 && device_snb) {
            for(i=0;i<$('.side_nav .level1.drop_menu > a').length;i++)
            {
                $('.side_nav .level1.drop_menu > a').eq(i)[0].toggle = false;
                if($('.side_nav .level1.drop_menu > a').eq(i)[0].tl)
                {
                    $('.side_nav .level1.drop_menu > a').eq(i)[0].tl.remove();
                    $('.side_nav .level1.drop_menu > a').eq(i)[0].tl = undefined;
                    $('.side_nav .level1.drop_menu > a').eq(i).next('.level2').removeAttr('style');
                }
                $('.side_nav .level1.drop_menu > a').eq(i)[0].tl = new TimelineMax();
                $('.side_nav .level1.drop_menu > a').eq(i)[0].tl.from($('.side_nav .level1.drop_menu > a').eq(i).next(), 0.5, {height:0, display:'none', ease:Cubic.easeInOut, onUpdate:function(){
                        rerenderScroll();
                    }}, 0);
                $('.side_nav .level1.drop_menu > a').eq(i)[0].tl.pause();
            }

            device_snb = false;
        }
    }

    snbResizeHandler();

    rerenderScroll();

    // drop_menu 메뉴 클릭 이벤트 등록
    var prevSnb;
    $(document).on('click', '.nav_list .drop_menu > a', function(){
        if(prevSnb)
        {
            $(prevSnb).parent().removeClass('on');
            TweenMax.to($(prevSnb).children('i'),0.5,{rotation:0, ease:Cubic.easeInOut});
            $(prevSnb).children('i').html('닫힘');
            $(prevSnb)[0].tl.reverse();
        }

        if(prevSnb == this)
        {
            prevSnb=undefined;
        }else{
            $(this).parent().addClass('on');
            $(this)[0].tl.play();
            TweenMax.to($(this).children('i'),0.5,{rotation:180, ease:Cubic.easeInOut});
            $(this).children('i').html('열림');
            prevSnb = this;
        }
    });
    
    // 하위 뎁스 없는 level2 메뉴 블릿 삭제
    for(i=0;i<$('.nav_middle ul.level2 > li').length;i++)
    {
        if($('.nav_middle ul.level2 > li').eq(i).children('.level3')[0] == undefined)
        {
            $('.nav_middle ul.level2 > li').eq(i).children('a').addClass('non_child');
        }
    }

	/* =================================================================
	script description : 이미지맵 리사이즈 처리
	date : 2018.03.07
	revisions : empty
	description : 이미지맵 리사이즈 스크립트
	================================================================= */
	if($('img[usemap]').length>0){
		$('img[usemap]').rwdImageMaps();
	}

    /* =================================================================
    script description : iframe 리사이즈 처리
    date : 2018.06.21
    revisions : empty
    description : iframe 리사이즈 스크립트
    ================================================================= */
    var iframe_scale, table_scale;
    $(window).on('resize', function(){
        if($('iframe[name="ycpage"]')[0])
        {
            $('iframe[name="ycpage"]').removeAttr('height');
            var hh = $($('iframe[name="ycpage"]')[0].contentWindow.document.body).height();
            $('iframe[name="ycpage"]').attr('height', hh);
        }

        iframe_scale = $('iframe[name="ycpage"]').parent().parent().innerWidth() / $('iframe[name="ycpage"]').width();
        if(iframe_scale > 1) iframe_scale = 1;
        TweenMax.set($('iframe[name="ycpage"]'),{scale:iframe_scale,transformOrigin:"0px 0px"});
        TweenMax.set($('iframe[name="ycpage"]').parent(), {width:$('iframe[name="ycpage"]').width()*iframe_scale, height:$('iframe[name="ycpage"]').height()*iframe_scale});

        table_scale = $('table.__se_tbl_ext').parent().parent().innerWidth() / $('table.__se_tbl_ext').width();
        if(table_scale > 1) table_scale = 1;
        TweenMax.set($('table.__se_tbl_ext'),{scale:table_scale,transformOrigin:"0px 0px"});
        TweenMax.set($('table.__se_tbl_ext').parent(), {width:$('table.__se_tbl_ext').width()*table_scale, height:$('table.__se_tbl_ext').height()*table_scale});
    });
    if($('iframe[name="ycpage"]')[0] || $('table.__se_tbl_ext')[0]) $(window).trigger('resize');


	/* =================================================================
    script description : dimmed show, hide
    date : 2018.03.08
    revisions : empty
    description : dimmed show, hide / dimmed(true), dimmed(false)
    ================================================================= */
	var dimmed = function(flag){
	    var st_display = 'block';
	    var st_opacity = 0.8;

	    if(!flag){
			st_display = 'none';
			st_opacity = 0;
        }

        TweenMax.to($('.bg_layer'), 0.5, {display:st_display, opacity:st_opacity, ease:Cubic.easeInOut, onUpdate:function(){
            rerenderScroll();
        }});
	}

	window.dimmed = dimmed;

	/* =================================================================
    script description : lloading image(GIF) show, hide
    date : 2018.03.08
    revisions : empty
    description : loading image(GIF) show, hide / loading(true), loading(false)
    ================================================================= */
    var loading = function(flag) {
		var $modalEl = $('<div class="loading_img on"></div>');
		var $loadingImg = $('.loading_img');

		dimmed(flag);

		if(flag){
		    if($loadingImg.length < 1){
				$modalEl.appendTo('body');
            }else{
				$loadingImg.addClass('on');
            }
		}else{
			$loadingImg.removeClass('on');
		}

	}

    window.loading = loading;

    /* =================================================================
	script description : go to top
	date : 2017.12.22
	revisions : empty
	description : footer 페이지 상단 바로가기
	================================================================= */
    $(document).on('click', '.scroll_top_area a', function () {
        TweenMax.to($('html, body'), 0.5,{scrollTop:0, ease:Cubic.easeInOut});
    });

    /* =================================================================
	script description : custom select box
	date : 2017.12.22
	revisions : empty
	description : 커스텀된 셀렉트박스 기능 서포트
	================================================================= */
    $(document).on('change', 'select.c_select', function() {
        var select_name = $(this).children('option:selected').text();
        $(this).siblings('label').text(select_name);
    });

    /**
     * @description body scroll controller
     * @param type : scroll 활성화/비활성화 여부
     * @param flag : 숨김처리 후 기존 scroll 위치로 이동 여부
     */
    var scrollController = function(type, flag){
        // scroll disabled & current scrollTop save
        if(type == "locked"){
            $('body').addClass('locked'); 

            if(flag == true){
                $('body').attr('data-pos', $(window).scrollTop());
                $('#wrapper').scrollTop($('body').attr('data-pos'));
                
                if($('#careers #main').length){
                    $('#careers #main').scrollTop($('body').attr('data-pos'));
                }
            }

        // scroll visible
        } else if(type == "unlocked"){
            $("body").removeClass('locked');

            if(flag == true){
                $(window).scrollTop($('body').attr('data-pos'));
            }
        }
    }

    /**
     * @description layer popup 위치 setting
     * @param elem : position이 setting되어야 하는 target
     */
    var layerPosition = function(elem){
        var $this = $(elem),
            _plus = window.innerWidth > 767 ? 60 : 40,
            _searchPlus = window.innerWidth > 767 ? 100 : 60;

        var positionSetting = function(plus, searchPlus){
            if(plus != undefined) _plus = plus;
            if(searchPlus != undefined) _searchPlus = searchPlus;


            if($this.is(":visible")){
                // search popup일 경우 실행
                if($this.hasClass("search_wrap")){
                    $this.css({"position" : "fixed", "opacity" : "1", "top" : _searchPlus}); 
                    $this.height(window.innerHeight + 90);

                    scrollController("locked", true);
                } else {
                    if($this.outerHeight(true) + _plus > window.innerHeight){
                        $this.removeAttr("style");
                        $this.css({"opacity" : "1", "top" : $(window).scrollTop() + (_plus/2)}); 

                        scrollController("unlocked", true);
                    } else {
                        $this.removeAttr("style")
                        $this.css({"opacity" : "1", position : "fixed", top : "50%", "transform" : "translate(-50%, -50%)", "-webkit-transform" : "translate(-50%, -50%)"});

                        scrollController("locked", true);
                    }
                }
            }
        }

        positionSetting();

        var oldWidth = window.innerWidth;
        var oldHeight = window.innerHeight;

        $(window).on("resize", function(){
            _plus = window.innerWidth > 767 ? 60 : 40,
            _searchPlus = window.innerWidth > 767 ? 100 : 60;
            
            // IOS에서 scroll 시 resize event 발생하는 이슈 처리
            var currentWidth = window.innerWidth;
            var currentHeight = window.innerHeight;

            var changeWidthCheck = $("html").hasClass("ios") ? currentWidth == oldWidth : currentWidth == oldWidth && currentHeight == oldHeight;
            
            if(changeWidthCheck){
                return;
            } else {
                oldWidth = currentWidth;
                oldHeight = currentHeight;
                positionSetting(_plus, _searchPlus);
            }
        })
    }

    window.layerPosition = layerPosition;
    
    //팝업 열기
    $(document).on('click', '[data-layer-target]', function(){
        var $target = $($(this).data("layer-target"));

        $target.addClass('on');

        // search 팝업 레이어 비노출 처리
        if($target.hasClass("search_wrap") == false){
            $('.bg_layer').show();
            TweenMax.to($('.bg_layer'),0.3,{opacity:0.8, ease:Cubic.easeInOut});
        } 

        if($("#official .main_intro").length && $target.hasClass("search_wrap")){
            $('.header_inner').addClass('on');
            TweenMax.to($('.header_inner'), 0, {backgroundColor:'#fff', ease:Cubic.easeInOut});
        }

        TweenMax.to($target,0.3,{opacity:1, ease:Cubic.easeInOut, onUpdate:function(){
            // scroll있을 시 갱신 처리
            if($target.find(".swiper-container").length){
                rerenderScroll();
            }
        }});

        layerPosition($target);
    });

    //팝업 닫기
    $(document).on('click', '.layer_pop .btn_close', function(){
        scrollController("unlocked", true);

        TweenMax.to($('.layer_pop'),0.3,{opacity:0, ease:Cubic.easeInOut, onUpdate:function(){
            $('.layer_pop').removeClass('on');
        }});

        TweenMax.to($('.bg_layer'),0.3,{opacity:0, ease:Cubic.easeInOut, onComplete:function() {
            $('.bg_layer').css({display:'none'});
        }});

        // Official main에서 search popup close 실행 시 처리
        if($("#official .main_intro").length && $(this).closest(".layer_pop").hasClass("search_wrap")){
            $('.header_inner').removeClass('on');
            TweenMax.to($('.header_inner'), 0.5, {backgroundColor:'#0f111b', ease:Cubic.easeInOut});
        }
    });
	
	//소셜 팝업
	$(document).on('click', '.share_sbj', function(){
        if($(this).parent().next('.share_wrap')[0])
        {
            $(this).parent().next('.share_wrap').addClass('on');
            TweenMax.to($(this).parent().next('.share_wrap'),0.5,{opacity:1, ease:Cubic.easeInOut});
        }else{
            $('#pop_share').addClass('on');
            TweenMax.to($('#pop_share'),0.5,{opacity:1, ease:Cubic.easeInOut});
        }
	});

    // 메인 팝업
    if($(".main_alert").is(":visible")){
        layerPosition(".main_alert .layer_pop");
        $(window).on("load", function(){
            scrollController("locked", true);
        });
    }

    $(document).on('click', '.main_alert .btn_close', function(){
        TweenMax.to($('.main_alert'),0.5,{opacity:1, ease:Cubic.easeInOut}); 
        TweenMax.to($('.main_alert .bg_layer'),0.8,{opacity:0, ease:Cubic.easeInOut, onComplete:function(){
            scrollController("unlocked", true);
            $(".main_alert").hide();
        }});
    });
      

    /* =================================================================
	script description : f_dropdown
	date : 2017.12.27
	revisions : empty
	description : handler 호출시 인자로 flag를 넣으면 닫힘()
	================================================================= */
    
    /* for(i=0; i<$('.f_dropdown').length;i++)
    {
        $('.f_dropdown').eq(i)[0].openCheck = false;
    } */

    $(document).on('click', '.f_dropdown button', function(){
        f_dropdownHandler();
    });
    
    $(".f_dropdown").on("mouseleave", function(){
        f_dropdownHandler('open');
    })

    function f_dropdownHandler(flag){
        var $button = $(".f_dropdown button");

        if(flag == undefined){
            if($(".f_dropdown_list").height() == 0){
                 var flag = 'close';
            } else {
                 var flag = 'open';
            }
        }

        if(flag == 'close')
        {
            TweenMax.to($button.next(), 0.5, {height:$button.next().children().innerHeight()+1, ease:Cubic.easeInOut});
            TweenMax.to($button, 0.5, {backgroundColor:'#222', ease:Cubic.easeInOut});
            TweenMax.to($button.children('span'), 0.5, {borderColor:'#222', ease:Cubic.easeInOut});
            TweenMax.to($button.children('i'), 0.5, {rotation:180, ease:Cubic.easeInOut});
            $button.children('i').html('열림');
            $button.parent()[0].openCheck = true;
        }else if(flag == 'open'){
            TweenMax.to($button.next(), 0.5, {height:0, ease:Cubic.easeInOut});
            TweenMax.to($button, 0.5, {backgroundColor:'#333', ease:Cubic.easeInOut});
            TweenMax.to($button.children('span'), 0.5, {borderColor:'#444', ease:Cubic.easeInOut});
            TweenMax.to($button.children('i'), 0.5, {rotation:0, ease:Cubic.easeInOut});
            $button.children('i').html('닫힘');
            $button.parent()[0].openCheck = false;
        }
    }

    /* =================================================================
	script description : responsive tab menu
	date : 2017.12.22
	revisions : empty
	description : 반응형 탭메뉴 기능으로 PC는 탭메뉴 / 모바일은 드롭박스
	================================================================= */
    var categoryCheck = $("#official").length ? 1024 : 767; 
    var device = ($(window)[0].innerWidth <= categoryCheck) ? false : true;
    var navHeight = $('.header_inner').height();
    var mgHeight = navHeight + $('.tab_to_accordian .sec_list').height() + $('.tab_to_dropdown').height();

    // tab >> accordian 리사이즈 이벤트 핸들러 함수
    function tabAccordianResize()
    {
        if ($(window)[0].innerWidth <= categoryCheck && !device) {
            $('.tab_to_accordian .sec_content').hide();
            $('.tab_to_accordian .sec_content:first').show();
            $('.tab_to_accordian ul.top_anchors li').removeClass('active');

            $(document).on('click', '.tab_to_accordian .sec_accordian_h', tabResizeMobile);
            $(document).off('click', '.tab_to_accordian ul.top_anchors li a', tabResizePc);
            if($('.tab_to_dropdown .btn_dropdown')[0]) $('.tab_to_dropdown .btn_dropdown')[0].toggle = false;
            $(document).on('click', '.tab_to_dropdown .btn_dropdown', tabDropdownHandler);
            $(document).on('click', '.tab_to_dropdown .btn_dropdown + .top_anchors li a', tabDropdownListHandler);

            $('.tab_to_accordian').css({paddingTop:0});
            $(document).off('click', '.tab_to_accordian ul.top_anchors li a', tabResizePc);

            device = true;

        } else if ($(window)[0].innerWidth > categoryCheck && device) {
            $('.tab_to_accordian .sec_content').show();
            $(document).off('click', '.tab_to_accordian .sec_accordian_h', tabResizeMobile);
            $(document).on('click', '.tab_to_accordian ul.top_anchors li a', tabResizePc);
            $('.tab_to_dropdown .btn_dropdown + .top_anchors').removeAttr('style');
            $(document).off('click', '.tab_to_dropdown .btn_dropdown', tabDropdownHandler);
            $(document).off('click', '.tab_to_dropdown .btn_dropdown + .top_anchors li a', tabDropdownListHandler);

            TweenMax.to($(".tab_to_dropdown .btn_dropdown").children('i'),0.5,{rotation:0, ease:Cubic.easeInOut});

            $(".bg_tab_dimlayer").remove();
            $(".sub_visual_area").show();
            $(".scroll_top_area").removeClass("hidden");

            if($(".tab_to_dropdown .btn_dropdown").is(":hidden")){
                scrollController("unlocked", false);
            }

            device = false;
        }

        navHeight = $('.header_inner').height();

        if ($(window)[0].innerWidth <= categoryCheck){
            $('.tab_to_dropdown .top_anchors').css({"max-height" : window.innerHeight - $("#header").height() - $(".btn_dropdown").height(), "overflow-y" : "auto"});
        } else if($(window)[0].innerWidth > categoryCheck && $(".bg_tab_dimlayer").is(":visible")){
            scrollController("unlocked", false);
        }
    }

    function tabResizeMobile()
    {
        $('.tab_to_accordian .sec_content').hide();
        var h_activeTab = $(this).attr('rel');
        var isClassChk = $(this).attr('class').match('h_active');

        if(isClassChk){
			$(this).removeClass('h_active');

        }else{
			$('#'+h_activeTab).show();
			var $target = $('[rel^="'+h_activeTab+'"]');
			TweenMax.set($('html, body'), {scrollTop:$target.offset().top - navHeight, ease:Cubic.easeInOut});

			$('.tab_to_accordian .sec_accordian_h').removeClass('h_active');
			$(this).addClass('h_active');

			$('.tab_to_accordian ul.top_anchors li').removeClass('active');
			$('.tab_to_accordian ul.top_anchors li a[href^="#'+h_activeTab+'"]').addClass('active');

			$('.tab_to_dropdown .top_anchors').css({"max-height" : window.innerHeight - $("#header").height() - $(".btn_dropdown").height(), "overflow-y" : "auto"});

			ellipsis.resize();
		}
    }

    function tabResizePc(e)
    {
        e.preventDefault();

        // anchor 탭 클릭시 부드럽게 이동
        var target = this.hash;
        var $target = $(target);
        mgHeight = navHeight + $('.tab_to_accordian .sec_list').height() + $('.tab_to_dropdown').height();
        TweenMax.to($('html, body'), 0.5, {scrollTop:$target.offset().top - mgHeight, ease:Cubic.easeInOut});
    }

    var _oldScrollTop = 0;

    // tab 드롭다운 버튼 핸들러
    function tabDropdownHandler()
    {
        if(this.toggle)
        {
            $(".bg_tab_dimlayer").fadeOut();
            $(".sub_visual_area").show();
            TweenMax.to($(this).next('.top_anchors'), 0.5, {height:0, ease:Cubic.easeInOut, onComplete:function(){
                $(this).next('.top_anchors').css('display', 'none');
                $(".bg_tab_dimlayer").remove();
                $(".scroll_top_area").removeClass("hidden");
            }});

            scrollController("unlocked", true);

            this.toggle = false;
            TweenMax.to($(this).children('i'),0.5,{rotation:0, ease:Cubic.easeInOut});

        }else{

            scrollController("locked", true);

            $(".tab_to_dropdown").addClass("floting");
            $(".sub_visual_area").hide();

            TweenMax.set($(this).next('.top_anchors'),{display:'block'});
            $("#container").append("<div class='bg_tab_dimlayer'></div>");
            $(".bg_tab_dimlayer").show();
            $(".scroll_top_area").addClass("hidden");

            TweenMax.to($(this).next('.top_anchors'), 0.5, {height:$(this).next('.top_anchors').children('li').eq(0).height()*$(this).next('.top_anchors').children('li').length, ease:Cubic.easeInOut});
            $('.tab_to_dropdown .top_anchors').css({"max-height" : window.innerHeight - $("#header").height() - $(".btn_dropdown").height(), "overflow-y" : "auto"});

            this.toggle = true;
            TweenMax.to($(this).children('i'),0.5,{rotation:180, ease:Cubic.easeInOut});
        }
    }

    // tab 드롭다운 리스트 핸들러
    function tabDropdownListHandler()
    {
        $(".bg_tab_dimlayer").fadeOut();
        if($(this).attr('target') != '_blank')
        {
            $(this).closest('.top_anchors').prev('.btn_dropdown').children('span').html($(this).children('span').html());
        }
        TweenMax.to($('.tab_to_dropdown .btn_dropdown + .top_anchors'), 0.5, {height:0, ease:Cubic.easeInOut, onComplete:function(){
           //$(this).next('.top_anchors').css('display', 'none');
           $(".bg_tab_dimlayer").remove();
        }});
        $(this).closest('.top_anchors').prev()[0].toggle = false;
        TweenMax.to($(this).closest('.top_anchors').prev('.btn_dropdown').children('i'),0.5,{rotation:0, ease:Cubic.easeInOut});

        scrollController("unlocked", true);
    }

    tabAccordianResize();

    /* =================================================================
	script description : scroll event
	date : 2018.01.03
	revisions : empty
	description :
	================================================================= */
    $(window).on('scroll', scrollHandler);

    function scrollHandler()
    {
        if($('.tab_to_dropdown')[0])
        {
            for(i=0;i<$('.tab_to_dropdown').length;i++)
            {
                if($(window).scrollTop()+navHeight >= $('.tab_to_dropdown').eq(i).offset().top)
                {
                    $('.tab_to_dropdown').eq(i).css({height:$('.tab_to_dropdown').eq(i).children('.row').height()});
                    if($('.tab_to_dropdown').eq(i).hasClass('depth3'))
                    {
                        $('.tab_to_dropdown').eq(i).children('.row').css({position:'fixed', width:'100%', left:0, top:navHeight+1, zIndex:1});
                    }else{
                        $('.tab_to_dropdown').eq(i).children('.row').css({position:'fixed', width:'100%', left:0, top:navHeight+1, zIndex:2});
                        $('.tab_to_dropdown').eq(i).addClass('floting');
                    }
                } else {
                    $('.tab_to_dropdown').eq(i).css({height: 'auto'});
                    if($('.tab_to_dropdown').eq(i).hasClass('depth3'))
                    {
                        $('.tab_to_dropdown').eq(i).children('.row').css({position:'relative', width:'auto', left:'auto', top:'auto', zIndex:1});
                    }else{
                        $('.tab_to_dropdown').eq(i).children('.row').css({position:'relative', width:'auto', left:'auto', top:'auto', zIndex:2});
                        $('.tab_to_dropdown').eq(i).removeClass('floting');
                    }
                }
            }
        }

        if(!device)
        {
            $('.tab_to_dropdown.depth3').css({height:'auto'});
            $('.tab_to_dropdown.depth3 .row').css({position:'relative', width:'auto', left:'auto', top:'auto'});

            if($('.tab_to_accordian')[0]) {
                if ($(window).scrollTop() + navHeight >= $('.tab_to_accordian').offset().top) {
                    $('.tab_to_accordian').css({paddingTop: $('.tab_to_accordian .sec_list').height()});
                    $('.tab_to_accordian .row .sec_list').css({
                        position: 'fixed',
                        width: '100%',
                        top: navHeight + 1,
                        zIndex: 1
                    });
                } else {
                    $('.tab_to_accordian').css({paddingTop:0});
                    $('.tab_to_accordian .row .sec_list').css({
                        position: 'relative',
                        width: 'auto',
                        top: 'auto',
                        zIndex: 1
                    });
                }
            }
        }

        if($('.tab_to_accordian .top_anchors')[0])
        {
            var scrollPos = $(window).scrollTop();
            $('.tab_to_accordian .top_anchors li a').each(function () {
                var currLink = $(this);
                var refElement = $(currLink.attr('href'));
                if (refElement.offset().top - mgHeight -1 <= scrollPos && refElement.offset().top + refElement.outerHeight() - mgHeight > scrollPos) {
                    $('.tab_to_accordian .top_anchors li a').removeClass('active');
                    currLink.addClass('active');
                } else{
                    currLink.removeClass('active');
                }
            });
        }

        $('ul.top_anchors li a').blur();
    }

    scrollHandler();

    /* =================================================================
	script description : resize event
	date : 2017.12.25
	revisions : empty
	description : 전체 공통 resize 이벤트 등록 함수
	================================================================= */

    var oldWidth = window.innerWidth;

    $(window).on('resize', function() {
        var currentWidth = window.innerWidth;

        if(currentWidth == oldWidth){
            return;
        } else {
            oldWidth = currentWidth;
            // tab >> accordian resize 이벤트 핸들러 함수 호출
            tabAccordianResize();
            scrollHandler();
            snbResizeHandler();
        }

    });

    /* =================================================================
	script description : search placeholder
	date : 2018.01.10
	revisions : empty
	description : ie 하위버전을 위해 label로 검색영역의 placehoder 구현
    ================================================================= */
    var $inputWord = '.box_search .tf_word',
        $placeholder = '.box_search .label_word',
        $delWord = '.box_search .del_keyword';

    // 인풋에 포커스시 placeholder 사라짐
    $(document).on('focus', $inputWord, function () {
        if(!$(this).closest('.box_search').hasClass('deco'))
        {
            $(this).prev('.label_word').css('display', 'none');
        }
    });

    // placeholder 클릭시 placeholder 사라짐
    $(document).on('click', $placeholder, function () {
        if(!$(this).closest('.box_search').hasClass('deco')){
            $(this).css('display', 'none');
        }
    });

    // 인풋에 포커스가 빠졌는데 value값이 없으면 placeholder 보임
    $(document).on('focusout', $inputWord, function () {
        if(!$(this).closest('.box_search').hasClass('deco')) {
            if ($(this).val() == '') {
                $(this).prev('.label_word').css('display', 'block');
            }
        }
    });

    // 인풋에 value값 있으면 placeholder 없앰
    $($inputWord).each(function() {
        if(!$(this).closest('.box_search').hasClass('deco')) {
            if (!($(this).val() == '')) {
                $(this).prev('.label_word').css('display', 'none');
            }
        }
    });

    // 인풋에 포커스시 style (box-shadow)
    $(document).on('focusin', $inputWord, function() {
        if(!$(this).closest('.box_search').hasClass('deco')) {
            $(this).parents('.wrap_search').addClass('on');
        }
    });
    $(document).on('focusout', $inputWord, function(){
        if(!$(this).closest('.box_search').hasClass('deco')) {
            $(this).parents('.wrap_search').removeClass('on');
        }
    });

    $(document).on('keydown, keyup', $inputWord, function () {
        if(!$(this).closest('.box_search').hasClass('deco')) {
            if ($(this).val().length > 0) {
                $(this).siblings('.del_keyword').css({display: 'block'});
            } else {
                $(this).siblings('.del_keyword').css({display: 'none'});
            }
        }
    });

    $(document).on('click', $delWord, function () {
        if(!$(this).closest('.box_search').hasClass('deco')) {
            $(this).siblings('.tf_word').val('');
            $(this).css({display: 'none'});
            if ($(this).siblings('.tf_word').val() == '') {
                $(this).siblings('.label_word').css({display: 'block'});
            }
        }
    });

    /* =================================================================
        script description : 약관 전체동의 체크박스
        date : 2018.01.23
        revisions : empty
    ================================================================= */
    var $targetCheck = $(".terms_box_list input[type=checkbox]");

	$(document).on('click', '.terms_chk_all label', function(){
		if ( $(this).hasClass('active') ) {
			$(this).removeClass('active');
			$targetCheck.prop("checked",false);
		} else {
			$('.terms_chk_all label.active').removeClass('active');
			$(this).addClass('active');
			$targetCheck.prop("checked",true);
		}
	});

    $targetCheck.on("change", function(){
        var chkLength = $targetCheck.length;

        if($targetCheck.filter(":checked").length == chkLength){
            $(".terms_chk_all label").addClass("active");
        } else {
            $(".terms_chk_all label").removeClass("active");
        }
    })

    /* =================================================================
        script description : responsive images - pc/mobile image change
        date : 2018.02.09
        revisions : empty
    ================================================================= */

    // responsive event
    var responsiveImgEvent = function(){
        var $responsiveImg = $(".js-responsive-img");
        var device = '';
        var mobileDevice = window.innerWidth > 767;
        var tabletDevice = mobileDevice && window.innerWidth < 1025;

        if(mobileDevice){
            device = 'data-src-pc';
        } else {
            device = 'data-src-mobile';
        }

        $responsiveImg.each(function(idx){
            var $this = $responsiveImg.eq(idx);

            if(tabletDevice && $this.data("src-tablet") !== undefined){
                device = 'data-src-tablet';
            }

            $this.attr('src', $this.attr(device));
        });
    };

    responsiveImgEvent();

    $(window).resize(function(){
        responsiveImgEvent();
    });

    /* =================================================================
        script description : scroll top button
        date : 2018.02.21
        revisions : empty
    ================================================================= */

    var $topBtn = $(".scroll_top_area");

    $(window).on("load", function(){
        if($(window).scrollTop() > 0){
            $topBtn.fadeIn('fast');
        }
    })

    $(window).on("scroll", function(){
        if($(window).scrollTop() > 0){
            $topBtn.fadeIn('fast');
        } else {
            $topBtn.fadeOut('fast');
        }
    });

    /* =================================================================
        script description : Regulations accordion
        date : 2018.03.13
        revisions : empty
    ================================================================= */
    if($('[data-accordion]').length > 0){
        // accordion click
        $(document).on('click','[data-accordion-title]',function(){
            var _titleName = $(this).attr('data-accordion-title');
            var $titleAll = $('[data-accordion-title]');
            var $areaAll = $('[data-accordion-content]');
            var $titleCurrent = $('[data-accordion-title="'+_titleName+'"]');
            var $areaCurrent = $('[data-accordion-content="'+_titleName+'"]');

            var _htContent = $areaCurrent.children('.contnet_wrap').height();
            var _ptContent = parseInt($areaCurrent.children('.contnet_wrap').css('padding-top'));
            var _pbContent = parseInt($areaCurrent.children('.contnet_wrap').css('padding-bottom'));
            var _flContent = (_htContent + _ptContent + _pbContent);

            // accordion on(true)
            if($('[data-accordion]').data().accordion){

                $titleAll.children().removeClass('active');
                $areaAll.removeClass('active');
                $areaAll.css('height',0);

                $titleCurrent.children().addClass('active');
                $areaCurrent.addClass('active');
                $areaCurrent.css('height',_flContent);

            // accordion off(flase)
            }else{
                // close
                if($areaCurrent.attr('class').match('active')){
                    $titleCurrent.children().removeClass('active');
                    $areaCurrent.removeClass('active');

                    $areaCurrent.css('height',0);
                // open
                }else{
                    $titleCurrent.children().addClass('active');
                    $areaCurrent.addClass('active');

                    $areaCurrent.css('height',_flContent);
                }
            }
        });

        // accordion resize
        $(window).on('resize orientationchange', function(){
            var $accordionActive = $('.accordion_content.active');
            $accordionActive.css('height','auto');
        });
    }

    /* =================================================================
        script description : 직접입력 input 관련 활성화/비활성화 처리
        date : 2018.03.15
        revisions : empty
    ================================================================= */
    var fieldName = ".js-field";
    var activeName = 'js-field-active';

    // 채용 전용 변수
    var parentsName = '.item_list';

    $("#container").on("change", "[data-field-active]", function(){
        var $this = $(this);
        var $selectItem = $this.find(":selected");
        var $careerParent = $this.parents(parentsName).find(fieldName);

        // 채용과 마크업이 상이하여 parent selector 분기
        var $target = $careerParent.length ? $careerParent : $this.parent().find(fieldName);

        if($selectItem.hasClass(activeName)){
            $target.prop("disabled", false);
        } else {
            $target.prop("disabled", true);
        }
    });


    /* =================================================================
            script description : 이메일 자동완성
            date : 2018.04.12
            revisions : 2018.04.23 - 개발팀 요청사항 수정
        ================================================================= */
    function autoEmail(target)
    {
        function extractLast( val ) {
            var tmp, tmpObj = {arr:'', cont:''};
            if (val.indexOf("@")!=-1){
                tmp=val.split("@");
                tmpObj.arr = tmp;
                tmpObj.cont = tmp[tmp.length-1];
                return tmpObj;
            }
            console.log("returning empty");
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
                if(request.term.match(/@/g)!=null) {
                    var emailArray = request.term.split("@");
                    if(emailArray[1].length > 1) {
                        var that = this;
                        $.ajax( {
                            url: "/membership/getDomainList.ajax", // 이메일 도메인명 검색 API 주소 입력
                            //url: "../../../resources/js/ex/sample2.json",  // 퍼블리싱 테스트 파일 주소
                            dataType: "json",
                            data: {
                                term:emailArray[1]
                            },
                            success: function( data ) {
                                var extract = extractLast(request.term)
                                    ,mail = extract.cont
                                    ,matcher = new RegExp( "^" + mail, "i" )
                                    ,explen = request.term.match(/@/g);

                                if(typeof extract.arr == 'object' && extract.arr[1].length > 1 && explen.length == 1){
                                    // 아래 grep으로 걸러져야하는 data는 배열요소로 받아야함
                                    response( $.grep( data, function( item ){
                                        return matcher.test( item );
                                    }));
                                }else{
                                    $(that.element[0]).autocomplete( "close" );
                                    return false;
                                }
                            },
                            error: function (err)
                            {
                                console.log(err);
                            }
                        });
                    }
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
    
    // 이메일 자동완성 함수 호출
    //autoEmail($('.email-auto'));
});

$(window).load(function(){
    /* =================================================================
    script description : footer position control
    date : 2018.01.09
    revisions : empty
    ================================================================= */
    var bodyh;
    var footerResize = function(){
        $('.footer_wrap').css({marginTop:0});
        if($('.membership .full_visual')[0]) $('.container_wrap.membership').css({paddingBottom:0});
        if($('.professional .profession_visual')[0]) $('.professional .profession_visual').css({paddingBottom:0, boxSizing:'content-box'});
        bodyh = $('body').height();
        var hh = bodyh - $(window).height();
        var pb;

        if(hh < 0) {
            // main footer 공백 오류 분기
            if($(".main_intro").length){
                if($('.wrap').outerHeight() < $(window).height())
                {
                    var mt = $(window).height() - ($("#header").outerHeight() + $('.footer_wrap').outerHeight() + $('#container').outerHeight());
                    $('.footer_wrap').css({marginTop:mt});
                }else{
                    $('.footer_wrap').css({marginTop:0});
                }
            } else {
                $('.footer_wrap').css({marginTop: Math.abs(hh)});
            }

        }else if(hh > 0){
            $('.footer_wrap').css({marginTop: 0});
            if($('.professional .profession_visual')[0]) $('.professional .profession_visual').css({boxSizing:'initial'});
        }

        if($('.membership .full_visual')[0])
        {
            pb = parseInt($('.footer_wrap').css('marginTop').replace('px',''));
            $('.container_wrap.membership').css({paddingBottom:pb});
            $('.footer_wrap').css({marginTop:0});
        }

        if($('.professional .profession_visual')[0])
        {
            pb = parseInt($('.footer_wrap').css('marginTop').replace('px',''));
            $('.professional .profession_visual').css({paddingBottom:pb, boxSizing:'initial'});
            if(hh > 0) $('.professional .profession_visual').css({boxSizing:'border-box'});
            $('.footer_wrap').css({marginTop:0});
        }
    }

    window.footerResize = footerResize;

    footerResize();

    // IOS
    if(isMobile.IOS() == true){
        $("html").addClass("ios");
    }

	// 외부로 옮겼던 리사이즈 이벤트를 load이벤트 안으로 옮김
    $(window).on('resize', function(){
        footerResize();
    });

    // load 시 scroll plugin setPosition
    setTimeout(function(){
        rerenderScroll();
    }, 50);

	/* =================================================================
	    script description : 말줄임 처리
	    date : 2018.01.03
		revisions : empty
		description : 말줄임 처리 스크립트
	================================================================= */
	var ellipsis = function() {
		var render = {
			init: function () {
				var $ellipSync = $('*[data-ellipsis]');
				for (var i = 0; i < $ellipSync.length; i++) {
					var lineNum = $ellipSync.eq(i).data('ellipsis');
					if($ellipSync.eq(i).find('em.ellip').eq(0)[0])
                    {
                        //this.resize();
                    }else{
                        $ellipSync.eq(i).ellipsis({lines: lineNum, responsive: true});
                    }
				}
			},
			resize: function() {
				var resizeEvent = window.document.createEvent('UIEvents');

				window.ellipsisTabChk = false;
				resizeEvent.initUIEvent('resize', true, false, window, 0);
				window.dispatchEvent(resizeEvent);
				window.ellipsisTabChk = true;
			}
		}

		return render;
	}();

	window.ellipsis = ellipsis;
	ellipsis.init();

});