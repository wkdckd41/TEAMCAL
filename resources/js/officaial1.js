/**
 * @description Official Main
 */
function mainAnimation(){
	if($('.main_intro').length){
	   var i,j,n;

	    TweenMax.to($('.main_intro'), 1, {delay:0.7, autoAlpha:0, ease:Sine.easeInOut, onComplete:function(){
	            $('.main_intro').css({display:'none'});
	            $('.footer_wrap').css({zIndex:'auto'});
	        }});
	    TweenMax.to($('.header_inner'), 1, {delay:1, opacity:1, ease:Sine.easeInOut});
	    TweenMax.to($('.box_search.deco'), 0.5, {delay:0.8, opacity:1, ease:Sine.easeInOut});

	    for(i=0;i<$('.main_list .swiper-slide .slide_inner').length;i++)
	    {
	        TweenMax.set($('.main_list .swiper-slide').eq(i), {opacity:0, x:60});
            TweenMax.set($(this).find('.slide_img img'), {scale:1, ease:Cubic.easeInOut});
	        TweenMax.to($('.main_list .swiper-slide').eq(i), 0.5, {delay:i*0.2+0.8, opacity:1, x:0, ease:Sine.easeInOut});
	    }

	    var mainSwiper = new Swiper('.main_list .swiper-container', {
	        slidesPerView: 'auto'
	        , keyboardControl:true
	        , calculateHeight:true
	    });

	    function listOverHandler()
	    {
	        TweenMax.to($(this).find('.slide_line'), 0.5, {opacity:1, ease:Cubic.easeInOut});
	        TweenMax.to($(this).find('.slide_ctg'), 0.5, {marginLeft:'-60%', ease:Cubic.easeInOut});
	        TweenMax.to($(this).find('.txt_tit'), 0.5, {color:'#fff', ease:Cubic.easeInOut});
	        TweenMax.to($(this).find('.share_area'), 0.5, {opacity:1, display:'inline-block', ease:Cubic.easeInOut});
	        TweenMax.to($('.main_list .slide_inner').find('.slide_img img'), 0.5, {opacity:0.5, ease:Cubic.easeInOut});
	        TweenMax.to($('.main_list .slide_inner').find('.slide_img'), 0.5, {backgroundColor:'#000000', ease:Cubic.easeInOut});
	        TweenMax.to($(this).find('.slide_img img'), 0.5, {scale:1.1, opacity:1, ease:Cubic.easeInOut});
	    }

	    function listOutHandler()
	    {
	        TweenMax.to($(this).find('.slide_line'), 0.5, {opacity:0, ease:Cubic.easeInOut});
	        TweenMax.to($(this).find('.slide_ctg'), 0.5, {marginLeft:0, ease:Cubic.easeInOut});
	        TweenMax.to($(this).find('.txt_tit'), 0.5, {color:'#b9babb', ease:Cubic.easeInOut});
	        TweenMax.to($(this).find('.share_area'), 0.5, {opacity:0, ease:Cubic.easeInOut});
	        TweenMax.to($('.main_list .slide_inner').find('.slide_img img'), 0.5, {opacity:1, ease:Cubic.easeInOut});
            TweenMax.to($('.main_list .slide_inner').find('.slide_img'), 0.5, {backgroundColor:'transparent', ease:Cubic.easeInOut});
	        TweenMax.to($(this).find('.slide_img img'), 0.5, {scale:1, ease:Cubic.easeInOut});
	       var tg = $(this).find('.share_wrap');
	        TweenMax.to(tg, 0.5, {opacity:0, ease:Cubic.easeInOut, onComplete:function(){
	                tg.removeClass('on');
	            }});
	    }

	    var device = ($(window)[0].innerWidth <= 1024)? false : true;
	    var deviceM = ($(window)[0].innerWidth <= 767)? false : true;
	    $(window).on('resize', mainResizeHandler);

	    function mainResizeHandler(){

	        //$('.main_intro').css({height:$('.wrap').height()});

	        if ($(window)[0].innerWidth <= 1024 && !device) {
	            device = true;
	        } else if ($(window)[0].innerWidth > 1024 && device) {
	            device = false;
	        }

	        if ($(window)[0].innerWidth <= 767 && !deviceM) {
	            $(document).off('mouseenter', '.main_list .slide_inner', listOverHandler)
	                .off('mouseleave', '.main_list .slide_inner', listOutHandler)
	                .off('focus', '.main_list .slide_inner', listOverHandler)
	                .off('blur', '.main_list .slide_inner', listOutHandler);

	            $('.main_list .slide_inner').find('.slide_line').removeAttr('style');
	            $('.main_list .slide_inner').find('.slide_ctg').removeAttr('style');
	            $('.main_list .slide_inner').find('.txt_tit').removeAttr('style');
	            $('.main_list .slide_inner').find('.share_area').removeAttr('style');
	            $('.main_list .slide_inner').find('.slide_img img').removeAttr('style');
	            deviceM = true;
	        } else if ($(window)[0].innerWidth > 767 && deviceM) {
	            $(document).on('mouseenter', '.main_list .slide_inner', listOverHandler)
	                .on('mouseleave', '.main_list .slide_inner', listOutHandler)
	                .on('focus', '.main_list .slide_inner', listOverHandler)
	                .on('blur', '.main_list .slide_inner', listOutHandler);
	            deviceM = false;
	        }
	    }

	    mainResizeHandler();

	    // 메인 검색영역 클릭시 통합검색 레이어 팝업 띄움
	    $(document).on('click', '.box_search.deco .wrap_search', function(){
	        $('#pop_search').addClass('on');
	        $('.header_inner').addClass('on');
	        TweenMax.to($('.header_inner'), 0, {backgroundColor:'#fff', ease:Cubic.easeInOut});
	        layerPosition(".layer_pop.search_wrap");
	        TweenMax.to($('#pop_search'),0.5,{opacity:1, ease:Cubic.easeInOut});
	    });

		//$('.main_intro').css({height:$('.wrap').height()});
	}
};

/**
 * @description About (수상내역 검색 체크박스 이벤트)
 */
$(function(){
	var popChk = function(){

		var render = {
			bind: function(el,elAll){
				$(document).on('click',el, function(){
					render.chkClick(el,elAll);
				});
				$(document).on('click',elAll, function(){
					render.chkAll(this,el);
				});
			},
			chkClick: function(el,elAll){
				var _allCnt = $(el).length;
				var _crtCnt = render.chkCnt(el);

				if(_allCnt == _crtCnt){
					render.chkAll(el, el);
					$(elAll).prop("checked", true);
				}else{
					render.chkAll(el, elAll);
				}
			},
			chkAll : function(el, elAll){
				var isChk = $(el).is(":checked");

				if(isChk) $(elAll).prop("checked", false);
			},
			chkCnt : function(el){
				var chkNum = 0;

				$(el).each(function(i){
					var isChk = $(el).eq(i).is(":checked");
					if(isChk) chkNum++;
				});
				return chkNum;
			}
		}

		return render;
	}();

	popChk.bind('.chk_year','.chk_year_all');
	popChk.bind('.chk_work','.chk_work_all');
})

/**
 * @description Official Sitemap
 */
$(function(){
	if($("#official #container").hasClass("sitemap")){

	    $(window).on('resize orientation', resizeAccordion);
	   
	  	var isChk = ($(window)[0].innerWidth <= 767) ? true : false;
	    var i, prevMap;

	    function resizeAccordion()
	    {
	        if ($(window)[0].innerWidth <= 767) {
	            if(isChk)
	            {
	                TweenMax.to($('.sitemap .level1.drop_menu:not(.outlink) > span').children('i'),0.5,{rotation:0, ease:Cubic.easeInOut});
	                $('.sitemap .level1.drop_menu').removeClass("on");
	                
	                //메뉴 아코디언 모션 등록
	                for(i=0;i<$('.sitemap .level1.drop_menu:not(.outlink) > span').length;i++)
	                {
	                    if($('.sitemap .level1.drop_menu:not(.outlink) > span').eq(i).next('.level2')[0] == undefined)
	                    {
	                        $('.sitemap .level1.drop_menu:not(.outlink) > span').eq(i).children('i').css({display:'none'});
	                    }

	                    $('.sitemap .level1.drop_menu:not(.outlink) > span').eq(i)[0].toggle = false;
	                    if($('.sitemap .level1.drop_menu:not(.outlink) > span').eq(i)[0].tl)
	                    {
	                        $('.sitemap .level1.drop_menu:not(.outlink) > span').eq(i)[0].tl.remove();
	                        $('.sitemap .level1.drop_menu:not(.outlink) > span').eq(i)[0].tl = undefined;
	                        $('.sitemap .level1.drop_menu:not(.outlink) > span').eq(i).next('.level2').removeAttr('style');
	                    }
	                    $('.sitemap .level1.drop_menu:not(.outlink) > span').eq(i)[0].tl = new TimelineMax();
	                    $('.sitemap .level1.drop_menu:not(.outlink) > span').eq(i)[0].tl.from($('.sitemap .level1.drop_menu:not(.outlink) > span').eq(i).next(), 0.5, {height:0, display:'none', ease:Cubic.easeInOut, onUpdate:function(){
	                            rerenderScroll();
	                            if(prevMap)
	                            {
	                                TweenMax.to($('html, body'), 0.5, {scrollTop:$(prevMap).offset().top - $('.header_inner').height()});
	                            }
	                        }}, 0);
	                    $('.sitemap .level1.drop_menu:not(.outlink) > span').eq(i)[0].tl.seek(0.01);
	                    $('.sitemap .level1.drop_menu:not(.outlink) > span').eq(i)[0].tl.reverse();
	                    $('.sitemap .level1.drop_menu:not(.outlink) > span').eq(i)[0].tl.pause();
	                }

	                $('.s_map_top button')[0].check = false;

	                $(document).on('click', '.s_map_top button', sitemapAllHandler);
	                // drop_menu 메뉴 클릭 이벤트 등록
	                $(document).on('click', '.s_map_list .drop_menu:not(.outlink) > span', sitemapHandler);

	                isChk = false;
	            }
	        } else {
	            if(!isChk)
	            {
	                $(document).off('click', '.s_map_top button', sitemapAllHandler);
	                $(document).off('click', '.s_map_list .drop_menu > span', sitemapHandler);
	                $('.sitemap .level2').removeAttr('style');
	                isChk = true;
	            }
	        }
	        rerenderScroll();
	    }

	    function sitemapHandler()
	    {
	        if($(this)[0].toggle)
	        {
	            $(this).parent().removeClass('on');
	            $(this)[0].tl.reverse();
	            TweenMax.to($(this).not(".outlink").children('i'),0.5,{rotation:0, ease:Cubic.easeInOut});
	            $(this).children('i').not(".outlink").html('닫힘');
	            $(this)[0].toggle = false;
	        }else{
	            $(this).parent().addClass('on');
	            $(this)[0].tl.play();
	            TweenMax.to($(this).not(".outlink").children('i'),0.5,{rotation:180, ease:Cubic.easeInOut});
	            $(this).children('i').not(".outlink").html('열림');
	            $(this)[0].toggle = true;
	        }

	        prevMap = this;
	        var len = 0;
	        for(i=0;i<$('.sitemap .level1.drop_menu:not(.outlink) > span').length;i++)
	        {
	            if($('.sitemap .level1.drop_menu:not(.outlink) > span').eq(i)[0].toggle == true)
	            {
	                len++;
	            }
	        }

	        if($('.sitemap .level1.drop_menu:not(.outlink) > span').length == len)
	        {
	            $('.s_map_top button')[0].check = true;
	            $('.s_map_top button').html($('.s_map_top button').data('close'));
	        }else{
	            $('.s_map_top button')[0].check = false;
	            $('.s_map_top button').html($('.s_map_top button').data('open'));
	        }
	    }

	    function sitemapAllHandler(){
	        if(this.check)
	        {
	            $(this).html($(this).data('open'));
	            $('.sitemap .level1.drop_menu').removeClass("on");
	            for(i=0;i<$('.sitemap .level1.drop_menu:not(.outlink) > span').length;i++)
	            {
	                $('.sitemap .level1.drop_menu:not(.outlink) > span').eq(i)[0].tl.reverse();
	                $('.sitemap .level1.drop_menu:not(.outlink) > span').eq(i)[0].toggle = false;
	            }

	            TweenMax.to($('.sitemap .level1.drop_menu:not(.outlink) > span').children('i'),0.5,{rotation:0, ease:Cubic.easeInOut});

	            this.check = false;
	        }else{
	            $(this).html($(this).data('close'));
	            $('.sitemap .level1.drop_menu').addClass("on");
	            for(i=0;i<$('.sitemap .level1.drop_menu:not(.outlink) > span').length;i++)
	            {
	                $('.sitemap .level1.drop_menu:not(.outlink) > span').eq(i)[0].tl.play();
	                $('.sitemap .level1.drop_menu:not(.outlink) > span').eq(i)[0].toggle = true;
	            }

	            TweenMax.to($('.sitemap .level1.drop_menu:not(.outlink) > span').children('i'),0.5,{rotation:180, ease:Cubic.easeInOut});
	            
	            this.check = true;
	        }
	    }

        resizeAccordion();
	}
});

/**
 * @description 분야 선택 팝업
 */
$(function(){
	// 리사이즈 이벤트 등록
    $(window).on('resize orientation', fn_accordion);
    
    // 함수전역 화면 해상도 체크
    var isChk = ($(window)[0].innerWidth < 767) ? true : false;

    // 함수 전역 변수 선언
    var prevThisDep1, prevThisDep2, i;

    // 각 분야의 하위분야의 존재 유무를 체크하여 없을시 non_child 클래스를 넣어줌
    for(i=0;i<$('.level2.inner_list .s_ctg').length;i++)
    {
        if($('.level2.inner_list .s_ctg').eq(i).next('.level3')[0] == undefined)
        {
            $('.level2.inner_list .s_ctg').eq(i).parent().addClass('non_child');
        }
    }
    for(i=0;i<$('.level3.m_hide').length;i++)
    {
        $('.level3.m_hide').eq(i).parent().addClass('non_child');
    }

	// label의 기본 이벤트동작을 막음
    $(document).on('click', '.field_ctg label, .s_ctg label', function(e){e.stopPropagation();});
    // input의 클릭 이벤트 등록
    $(document).on('change', '.field_ctg input[type="checkbox"], .s_ctg input[type="checkbox"], .s_ctg + .level3 input[type="checkbox"]', fn_labelHandler);
    // 전체선택 버튼 클릭 이벤트 등록
    $(document).on('click', '.field_top .btn_area', function(){
        var $this = $(this);
        if($this.children('input[type="checkbox"]').prop('checked'))
        {
            $('.field_list').find('input[type="checkbox"]').prop('checked', true);
        }else{
            $('.field_list').find('input[type="checkbox"]').prop('checked', false);
        }
    });

    // pop_field 아이디를 가진 테그가 있으면 fn_accordion() 함수 실행
    if($('#pop_field')[0] || $('#pop_practice')[0]) fn_accordion();

    // 리사이즈 핸들러 함수
    function fn_accordion(){
        //분야선택 아코디언
        if ($(window)[0].innerWidth < 768) {
            if(isChk){
                $('.field_list ul').css({display:'none'});
                $(document).on('click', '.field_ctg', fn_accordionHandler1);
                for(i=0;i<$('.level2.inner_list .s_ctg').length;i++)
                {
                    if ($('.level2.inner_list .s_ctg').eq(i).next('.level3')[0])
                    {
                        $('.level2.inner_list .s_ctg').eq(i).on('click', fn_accordionHandler2);
                    }
                }
                isChk = false;
            }
        } else {
            if(!isChk)
            {
                $('.field_list ul').css({display:'block'});
                $(document).off('click', '.field_ctg', fn_accordionHandler1);
                for(i=0;i<$('.level2.inner_list .s_ctg').length;i++)
                {
                    if ($('.level2.inner_list .s_ctg').eq(i).next('.level3')[0])
                    {
                        $('.level2.inner_list .s_ctg').eq(i).off('click', fn_accordionHandler2);
                    }
                }
                $('.field_ctg').next('.inner_list').removeAttr('style');
                $('.s_ctg').next('.inner_list').removeAttr('style');
                $('.field_list').find('.active').removeClass('active');
                $('.field_list').find('.on').removeClass('on');
                prevThisDep1 = false;
				prevThisDep2 = false;
                isChk = true;
            }
        }
        rerenderScroll();
    }

    // 인풋 체크 핸들러 함수
    function fn_labelHandler () {
        var $this = $(this);

		if($(this).prop('checked'))
		{
		    $this.parent().next('ul').find('.s_ctg input[type="checkbox"]').prop('checked', true);
            $this.parent().next('ul').find('.level3 input[type="checkbox"]').prop('checked', true);
			var len, checkLen;

		    /*if($this.closest('.level3')[0])
			{
                len = $this.parent().siblings().length+1;
				checkLen = $this.parent().parent().find('input[type="checkbox"]:checked').length;
                if(len == checkLen)
				{
                    $this.closest('.level3').prev('.s_ctg').children('input[type="checkbox"]').prop('checked', true);
				}
			}*/
            if($this.closest('.level2')[0])
			{
				len = $this.closest('.level2').find('input[type="checkbox"]').length;
				checkLen = $this.closest('.level2').find('input[type="checkbox"]:checked').length;
                if(len == checkLen){
                    $this.closest('.level2').prev('.field_ctg').children('input[type="checkbox"]').prop('checked', true);
				}
			}

		}else{
            $this.parent().next('.level2').find('input[type="checkbox"]').prop('checked', false);

            $this.closest('.level2').prev('.field_ctg').children('input[type="checkbox"]').prop('checked', false);
            //$this.closest('.level3').prev('.s_ctg').children('input[type="checkbox"]').prop('checked', false);

		}

		if($('.field_list').find('input[type="checkbox"]').length == $('.field_list').find('input[type="checkbox"]:checked').length)
		{
			$('.field_top').find('input[type="checkbox"]').prop('checked', true);
		}else{
            $('.field_top').find('input[type="checkbox"]').prop('checked', false);
		}
    }

	var listHeight, defaultHeight;
	function fn_accordionHandler1(e) {
        var $this = $(this);

        if($(e.target).attr('type')) {
			if($(e.target).prop('checked')) {
                if($this.hasClass('active') == false) {
                    if (prevThisDep1) {
                        prevThisDep1.removeClass('active');
                        TweenMax.to(prevThisDep1.next(), 0.5, {height: 0, ease: Cubic.easeInOut, onCompleteScope:prevThisDep1, onComplete: function () {
                                TweenMax.set(this.next(), {height:'auto', display:'none'});
                            }, onUpdate: function () {
                                rerenderScroll();
                            }
                        });
                    }
                    $this.addClass('active');
                    TweenMax.set($this.next(), {display: 'block'});
                    listHeight = $this.next().height();
                    TweenMax.set($this.next(), {height: 0});
                    TweenMax.to($this.next(), 0.5, {height: listHeight, ease: Cubic.easeInOut, onCompleteScope:$this, onComplete: function () {
                            prevThisDep1 = this;
                        }, onUpdate: function () {
                            rerenderScroll();
                        }
                    });
                }
			}
		}else{
            if (prevThisDep1) {
                prevThisDep1.removeClass('active');
                TweenMax.to(prevThisDep1.next(), 0.5, {height:0, ease:Cubic.easeInOut, onCompleteScope:prevThisDep1, onComplete:function(){
                        TweenMax.set(this.next(), {height:'auto', display:'none'});
                        prevThisDep1 = undefined;
					}, onUpdate:function(){
						rerenderScroll();
					}});
                if(prevThisDep1[0] == $this[0]) {
                    //prevThisDep1 = undefined;
                } else {
                    $this.addClass('active');
                    listHeight = $this.next().height();
                    TweenMax.set($this.next(), {height:0, display:'block'});
                    TweenMax.to($this.next(), 0.5, {height:listHeight, ease:Cubic.easeInOut, onCompleteScope:$this, onComplete:function(){
							prevThisDep1 = this;
						}, onUpdate:function(){
                            rerenderScroll();
                        }});
                }
            } else{
                $this.addClass('active');
				listHeight = $this.next().height();
				TweenMax.set($this.next(), {height:0, display:'block'});
				TweenMax.to($this.next(), 0.5, {height:listHeight, ease:Cubic.easeInOut, onCompleteScope:$this, onComplete:function(){
						prevThisDep1 = this;
					}, onUpdate:function(){
                        rerenderScroll();
                    }});
            }
		}
    }

    function fn_accordionHandler2(e) {
        var $this = $(this);
		if($(e.target).hasClass('s_ctg'))
		{
            if($(e.target)[0].tagName.toLowerCase() != 'input')
            {
                if(prevThisDep2)
                {
                    prevThisDep2.parent().removeClass('on');
                    TweenMax.to(prevThisDep2.next(), 0.5, {height:0, ease:Cubic.easeInOut, onCompleteScope:prevThisDep2, onComplete:function(){
                            TweenMax.set(this.next(), {height:'auto', display:'none'});
                            rerenderScroll();
                        }});

                    if(prevThisDep2[0] == $this[0]){
                        TweenMax.to($this.closest('.inner_list'), 0.5, {height:defaultHeight, ease:Cubic.easeInOut, onUpdate:function(){
                                rerenderScroll();
                            }, onComplete:function(){rerenderScroll();}});
                        prevThisDep2 = undefined;
                    } else {
                        handlers($this);
                    }
                }else{
                    defaultHeight = $this.closest('.inner_list').height();
                    handlers($this);
                }
            }
		}
    }

    function handlers(tg)
    {
        var $that = tg;
        $that.parent().addClass('on');
        TweenMax.set($that.next(), {display:'block'});
        listHeight = $that.next().height();
        if(listHeight < 0) listHeight = 0;
        TweenMax.set($that.next(), {height:0});
        TweenMax.to($that.next(), 0.5, {height:listHeight, ease:Cubic.easeInOut, onCompleteScope:$that, onComplete:function(){
                prevThisDep2 = this;
                rerenderScroll();
            }});
        TweenMax.to($that.closest('.inner_list'), 0.5, {height:defaultHeight+listHeight, ease:Cubic.easeInOut, onUpdate:function(){
                rerenderScroll();
            }, onComplete:function(){rerenderScroll();}});
        prevThisDep2 = $that;
    }
});

/**
 * @description 구성원
 */
$(function(){
	var device = ($(window)[0].innerWidth <= 767) ? false : true;

	$(document).on('click', '.btn_search_toggle button', function(){
		if($('.search_area.search').is(":visible"))
		{
        	$('.search_area.search').css({display:'none'});
        	$(this).removeClass('on');
		}else{
            $('.search_area.search').css({display:'block'});
            $(this).addClass('on');
		}
		
		footerResize();
	});

	function searchEvent(){
		 if ($(window)[0].innerWidth <= 767 && !device) {
            device = true;
        } else if ($(window)[0].innerWidth > 767 && device) {
            $('.search_area.search').removeAttr('style');
            device = false;
        }
	}

	$(window).on('resize', searchEvent);

	searchEvent();
});

/**
 * @description 구성원 상세
 */
$(function(){
	$('.more_field, .more_area').hide();
	//상단 주요업무분야
	$(document).on('click','.more_list', function(){
		$(this).hide();
		$('.more_field').addClass('on').fadeIn();
	});

	//하단 소식 펼쳐보기 
	$(document).on('click','.more_news button', function(){
		var txtMore = $(this);
		$(this).parent().parent('.mb_detail').children('.more_area').slideToggle('slow', function() { 
			if ($(this).is(":visible")) {
				txtMore.text(txtMore.data("close-text")).addClass('active');
			} else {
				txtMore.text(txtMore.data("open-text")).removeClass('active');
			} 
		});
	});
});


/**
 * @description 세미나
 */
$(function(){
	function tabReisze(){
		if ($(window)[0].innerWidth <= 767) { 
			$(".tabcontent").hide();
			$(".tabcontent").eq($(".tablinks.active").index()).show();  
		} else{
			$(".tabcontent").css('display','block');
		}
	}

	$(window).on("resize", tabReisze);

	tabReisze();

	function openTabCnt(evt, mbFilter) {
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className.replace(" active", "");
		}
		document.getElementById(mbFilter).style.display = "block";
		evt.currentTarget.className += " active";
	}

	window.openTabCnt = openTabCnt;

	$(".tablinks").eq(0).addClass("active")
});

/**
 * @description 세미나 참석신청
 */
$(function(){
	$(document).on('change', '.gender.en_non_member .radio_g input[type="radio"]', function(){
		if($(this).prop('class') == 'other')
		{
            $('.user_gender').removeAttr('disabled');
		}else{
            $('.user_gender').attr('disabled', 'disabled');
			$('.user_gender').val('');
		}
	});
});
/**
 * @description selectbox 말줄임
 */
$(function(){
	var ie9selbox = function(){

		var $chkIe9selbox = $('[data-ie9selbox = true]');

		var render = {
			init: function(){
				var _deviceChk = deviceChk();

				if(_deviceChk === 'pc'){
					$.each($chkIe9selbox, function(index){
						selectbox.init(index);
					});

					ellipse.init();

				}else{
					$chkIe9selbox.find('select').show();
				}

			},
			destroy: function(){
				var _makeSelbox = $chkIe9selbox;
				var _title = _makeSelbox.find('label');
				var _option = _makeSelbox.find('ul');

				_title.remove();
				_option.remove();

				selectbox.unbind();
			}
		}

		var selectbox = {
			init: function(index){
				selectbox.make(index);
				selectbox.bind(index);
			},
			bind: function(index){
				var $wrapper = $chkIe9selbox.eq(index);
				var $label = $wrapper.find('label');
				var $ul = $wrapper.find('ul');
				var $li = $wrapper.find('li');

				$wrapper.on('click', function(){
					var _display = $ul.css('display');

					$chkIe9selbox.find('ul').hide();

					if(_display === 'none'){
						$ul.show();
					}else{
						$ul.hide();
					}
				});

				$li.on('click', function(){
					var _text = $(this).html();
					var _gab = 0;
					var $option = $(this).parent().siblings('select').children('option');

					$.each($option, function(){
						if($(this).data('ie9selboxHidden')){
							_gab++;
						};
					});

					var _index = $(this).index() + _gab;
					var _selboxAll = $(this).parent().siblings().children();
					var _selbox = _selboxAll.eq(_index);

					$label.html(_text);

					_selbox.prop("selected", true).change();
				});
			},
			unbind: function(){
				var $wrapper = $chkIe9selbox;
				var $li = $wrapper.find('li');

				$wrapper.unbind('click');
				$li.unbind('click');
			},
			make: function(index){
				var $wrapper = $chkIe9selbox.eq(index);
				var $select = $wrapper.find('select');
				var $option = $select.children('option');

				if($select.length < 1) return;

				$.each($option, function(index) {
					var _text = $(this).text();
                    var _params = $(this).val();
                    var _textHiddenChk = $(this).data('ie9selboxHidden');

                    if(index === 0){
                        $wrapper.append('<label data-ie9selbox-ellipse="true">' + _text + '</label>');
                        $wrapper.append('<ul></ul>');
                    }

                    if(_textHiddenChk != true){
                        $wrapper.find('ul').append('<li data-ie9selbox-ellipse="true" class="'+ _params +'" title="' + _text + '">' + _text + '</li>');
                    }

					if($option.eq(index).prop('selected') === true){
						$wrapper.find('label').text(_text);
					}
				});
			},
		}

		var ellipse = {
			init: function(){
				ellipse.make();
			},
			make: function(){
				var $ellip = $('[data-ie9selbox-ellipse = true]');

				for (var i = 0; i < $ellip.length; i++) {
					$ellip.eq(i).ellipsis({lines: 1, responsive: true});
				}
			}
		};

		/*if($chkIe9selbox.length > 0){
			render.init();
		}*/

		return render;
	}();

	window.ie9selbox = ie9selbox;
});


/**
 * @description 법인명
 */
$(function() {
    $( "#search_company" ).autocomplete({
        source: function( request, response ) {
            $.ajax( {
                url: "/membership/getComNmList.ajax", // 법인명 검색 API 주소 입력
                //url: "../../../resources/js/ex/sample1.json", // 퍼블리싱 테스트 파일 주소
                dataType: "json",
                data: {
                    term:request.term
                },
                success: function( data ) {
                    response( data );
                },
                error: function (err)
                {
                    console.log(err)
                }
            } );
        },
        minLength: 2, // 이 옵션에서 설정하는 숫자에 따라 검색 시작글자 수가 결정됨
        select: function( event, ui ) {
            // 테스트 콘솔
            //console.log( "Selected: " + ui.item.value + " aka " + ui.item.id );
        }
    } );
});