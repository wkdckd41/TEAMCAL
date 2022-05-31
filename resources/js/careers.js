(function($){
	/**
	* common
	*/

	$(function(){
		/**
		 * show/hide
		 */
		var $elem = $("[data-view-elem]");
		var $boxItem = $("[data-target-box]");
		var $boxTarget = $($boxItem.data("target-box"));
		var boxName = '.box_detail';

		// 1. type : input radio
		$elem.bind("change",function(){
			var $this = $(this);
			var $target = $this.closest("[data-view-target]");
			var $targetElem = $($target.attr("data-view-target"));

			$elem.each(function(index){
				if($(this).is(":checked")){
					if($(this).data("view-elem") !== ""){
						idx = ($(this).data("view-elem"));
					}
				}
			})

			$targetElem.hide();

			var $viewTarget = $targetElem.filter("[data-view-index="+idx+"]");

			if($this.attr("type") == "checkbox"){
				if($(this).is(":checked")){
					$viewTarget.show();
				} else {
					$viewTarget.hide();
				}
			}else if ($this.data("view-elem") !== ""){
				$viewTarget.show();
			}
		})


		// reverse type checkbox
		var $toggleElem = $("[data-toggle-elem]");

		$("#container").on("change", "[data-toggle-elem]", function(){
			var $this = $(this);
			var $target = $this.closest("[data-toggle-target]");
			var $targetElem = $($target.attr("data-toggle-target"));

			if($(this).is(":checked")){
				$(this).parents(".select_group").find($targetElem).hide();
			} else {
				$(this).parents(".select_group").find($targetElem).show();
			}
		})

		// default toggle type
		$("#container").on("change", "[data-target-view]", function(){
			var $this = $(this);
			var $targetView = $($(this).attr("data-target-view"));

			if($(this).is(":checked")){
				$targetView.show();
			} else {
				$targetView.hide();
			}
		})

		// 2. type : box
		$boxItem.bind("click", function(e){
			var $this = $(this);
			var idx = $this.data("target-box");
			var $target = $("[data-box-index="+idx+"]");

			$("body").append('<span class="box_arrow"></span>');

			if($target.css("display") == "block"){
				$target.hide();
				$boxItem.removeClass("active");
				$("span.box_arrow").remove();

			 	footerResize();
			} else {
				$(boxName).hide();
				$boxItem.removeClass("active");
				$target.show();
				$this.addClass("active");

				$("html, body").animate({scrollTop : $this.parents(".box_item").offset().top - $("#header").height() }, 500)

				positionArrow($this, $target);

				var oldWidth = window.innerWidth;

				$(window).on("resize", function(){

					var currentWidth = window.innerWidth;

					if(currentWidth == oldWidth){
						return;
					} else {
						oldWidth = currentWidth;
						positionArrow($this, $target);
					}
				})
			}

			e.preventDefault();
		})

		$(boxName).find(".btn_detail_close").bind("click", function(){
			$(this).closest(boxName).hide();
			$boxItem.filter(".active").removeClass("active");
			$("span.box_arrow").remove();
		});


		/**
		 * @description career page 활성화 되는 버튼에 화설표 위치 설정
		 * @param elem : 활성화 되는 버튼
		 * @param target : 상세내용 영역
		 */
		function positionArrow(elem, target){
			var offsetLeft = elem.offset();
			var $arrowTarget = $("span.box_arrow")

			$arrowTarget.removeAttr("style");
			$arrowTarget.css({"left" : offsetLeft.left + (elem.width() / 2) - 14, "top" : target.offset().top - 14});
		}

		// 3. type : mark
		var $mark = $(".btn_mark")
		var $markTarget = '.tooltip';

		$mark.bind("click", function(){
			var $this = $(this);
			var $target = $this.find($markTarget);

			if($target.css("display") == "block"){
				$target.fadeOut();
			} else {
				$target.fadeIn();
			}
		})

		// save tooltip
		var $saveTarget = $(".btn_save .tooltip");
		window.onload = function(){
			if(window.innerWidth > 767){
				$saveTarget.fadeIn();
				setTimeout(function(){
					if($saveTarget.css("display") == "block"){
						$saveTarget.fadeOut();
					}
				}, 3000)
			}
		}

		/**
		 * tel link disabled (PC)
		 */
		$("a[href^='tel']").on("click", function(e){
			if(deviceChk() == "pc"){
				e.preventDefault();
			}
		})

		/**
		 * all agree
		 * 1. all checkbox on/off
		 */

		var $allBtn = $("[data-all-agree-target]");
		var $agreeCheck = $($allBtn.data('all-agree-target')).find("input[type='checkbox']");

		$allBtn.on("click", function(){
			var $this = $(this);
			var $target = $($(this).data('all-agree-target')).find("input[type='checkbox']");

			if($this.hasClass("active")){
				$target.attr("checked", false).prop("checked", false);
				$this.removeClass("active");
			} else {
				$target.attr("checked", true).prop("checked", true);
				$this.addClass("active");
			}
		})

		$agreeCheck.on("change", function(){
			var chkLength = $agreeCheck.length;

			if($agreeCheck.filter(":checked").length == chkLength){
				$allBtn.addClass("active");
			} else {
				$allBtn.removeClass("active");
			}
		})

		// Mac screen bug fix
		if($(".page_career .bg_gray").length){
			$("body").addClass("bg_gray");
		}
	})


	/**
	* main
	* 1. full visual fade in/out slide
	* 2. notice vertical slide
	*/
	$(function(){
		if($("main").length){

			// 1. full visual fade in/out slide
			var $visual = $(".visual_slide .visual");
			var $dot = $(".visual_slide .slide_dot");
			var $play = $(".autoplay_controller .btn_play");
			var $stop = $(".autoplay_controller .btn_stop");
			var $notice = $(".notice_slide");
			var dotHtml = "";

			/**
			 * @description resize event 실행 시 window창 사이즈에 따른 height/minHeight setting
			 */
			var responsiveEvent = function(){
				var device = '';
				var _footerHeight = $("#footer").height();

				// PC
				if(window.innerWidth > 1024){
					device = 'data-src-pc';
					$visual.find(".slide").height(window.innerHeight).css("min-height", 1020 - _footerHeight + 100);

				// Tablet
				} else if(window.innerWidth < 1025 && window.innerWidth > 767){
					device = 'data-src-tablet';

					// landscape
					if(window.innerWidth > 960){
						$visual.find(".slide").height(1640).css("min-height", "auto");

					// portrait
					} else {
						$visual.find(".slide").height(1580).css("min-height", "auto");
					}

				// Mobile
				} else {
					device = 'data-src-mobile';

					// landscape
					if(window.innerWidth > 480){
						$visual.find(".slide").height(1040).css("min-height", "auto");

					// portrait
					} else {
						$visual.find(".slide").height(window.innerHeight + 40).css("min-height", "auto");
					}

				}

				// Visual images change
				$visual.find(".slide").each(function(idx){
					var $this = $visual.find(".slide").eq(idx);
					$this.css('background-image', 'url(' + $this.attr(device) + ')');
				});
			}

			// Init
			responsiveEvent();

			var oldWidth = window.innerWidth;

			// Resize
			$(window).resize(function(){
				var currentWidth = window.innerWidth;

				if(currentWidth == oldWidth){
					return;
				} else {
					oldWidth = currentWidth;
					responsiveEvent();
				}
			})

			// visual slide
			$visual.find(".slide").each(function(idx){
				dotHtml += '<button type="button"><span class="hide">'+(idx+1)+'</span></button>';
			})

			$dot.append(dotHtml);
			$dot.find("button").filter(":first").addClass("active");

			$visual.slick({
			  dots: false,
			  arrows : false,
			  infinite: true,
			  speed: 800,
			  autoplay: 5000,
			  fade: true,
			  cssEase: 'linear'
			});

			$dot.find("button").on("click", function(){
				var idx = $(this).index();
				$(this).addClass("active").siblings().removeClass("active");
				$visual.slick('slickGoTo', idx);
				$stop.click();
			});

			$visual.on('beforeChange', function(event, slick, currentSlide, nextSlide){
				$dot.find("button").eq(nextSlide).addClass("active").siblings().removeClass("active");
			})

			$stop.on("click", function(){
				$stop.hide();
				$play.show()
				$visual.slick('slickPause');
			});

			$play.on("click", function(){
				$play.hide();
				$stop.show()
				$visual.slick('slickPlay');
			});

			// 2. notice vertical slide
			$notice.find(".notice").slick({
			  slidesToShow: 1,
			  slidesToScroll: 1,
			  arrows : false,
			  vertical : true,
			  arrows: false,
			  dots: false,
			  speed: 800,
			  autoplay: 5000
			});

			var $headerTarget = $("#main .header_inner");
			var fixedHeader = function(){
				if($(window).scrollTop() > 0){
					$headerTarget.css({"background" : "#fff", "border-bottom" : "1px solid #c3c3c3"});
				} else if($(window).scrollTop() == 0) {
					$headerTarget.removeAttr("style")
				}
			}

			$(window).on("scroll load", function(){
				fixedHeader();
			})
	    }
	})

}(jQuery))