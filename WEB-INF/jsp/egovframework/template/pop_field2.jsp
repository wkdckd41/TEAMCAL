<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
	<link href="/resources/css/popup.css" rel="stylesheet" type="text/css">
</head>
<div id="pop_field" class="row layer_pop pop_center business_field_wrap" style="opacity: 0; position: fixed; top: 50%; transform: translate(-50%, -50%);">
	<div class="col-12-nm">
		<a href="javascript:field.fnClose();" class="btn_close" data-i18n="common:button.close"><!-- 닫기 --></a>
		<div class="pop_tl" data-i18n="common:partChoice"><!-- 분야선택 --></div>
		<div class="cnt_area">
			<!-- 레이어 팝업 컨텐츠 영역 -->
			<div class="col-12 form_area"> <!-- swiper-container scroll-container -->

				<div class="swiper-container scroll-container swiper-free-mode">
					<div class="swiper-scrollbar" style="opacity: 0;"><div class="swiper-scrollbar-drag swiper-scrollbar-cursor-drag" style="transition-duration: 0ms; transform: translate3d(0px, 0px, 0px);"></div></div>
					<div class="swiper-wrapper" style="transition-duration: 0s; transform: translate3d(0px, 0px, 0px); width: 0px; height: 0px;"> <!-- swiper-wrapper -->
						<div class="swiper-slide swiper-slide-visible swiper-slide-active"> <!-- swiper-slide -->
							<div class="box_choice_field">
								<div class="field_top">
									<div class="btn_area">
										<input type="checkbox" id="chk_all_pop" class="btn_chk_all btn_gray">
										<label for="chk_all_pop" data-i18n="common:check_all"><!-- 전체선택 --></label>
									</div>
								</div>

								<div class="field_middle">
									<!--
										label과 id 값 맞춰주세요: 현재 임으로 매칭해둠 ex)0A-a

										level01: 1depth 메뉴
										level02: 2depth 메뉴 구분
										2depth 메뉴 있을 경우 level01에 drop_menu 클래스 추가
										2depth 메뉴 없을 경우 level01에 no_drop_menu 클래스 추가
									-->
									<ul class="field_list non_br">
										<li class="level1 drop_menu">
											<div class="field_ctg">
												<input type="checkbox" id="01">
												<label for="01" data-i18n="common:practices"><!-- 분야별 --><span id="fieldCnt"></span></label>
											</div>
											<ul class="level2 inner_list" id="fieldList">
											<!-- 업무분야>분야별 List 출력 -->
											</ul>
										</li>

										<li class="level1 no_drop_menu">
											<div class="field_ctg">
												<input type="checkbox" id="02">
												<label for="02" data-i18n="common:industries"><!-- 산업별 --><span id="industryCnt"></span></label>
											</div>
											<ul class="level2 inner_list" id="industryList">
											<!-- 업무분야>산업별 List 출력 -->
											</ul>
										</li>

										<li class="level1 no_drop_menu">
											<div class="field_ctg">
												<input type="checkbox" id="03">
												<label for="03" data-i18n="common:international"><!-- 지역별 --><span id="localeCnt"></span></label>
											</div>
											<ul class="level2 inner_list" id="localeList">
											<!-- 업무분야>지역별 List 출력 -->
											</ul>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div> 
			</div>
			<!-- //레이어 팝업 컨텐츠 영역 -->

			<div class="btn_area al_center">
				<button type="button" class="btn_blue" onclick="field.fnChoice()"><span data-i18n="common:button.save"><!-- 저장 --></span></button>
			</div>
		</div>
		<!-- //cnt_area -->
	</div>
</div> <!-- //pop_field -->

<script type="text/javascript">
var language_cd = "${savedLanguage}" == "" ? "ko" : "${savedLanguage}";

$(document).ready(function() {
	i18n.fnInit(
		options = {
			lang			: language_cd,
			namespace		: ['common'],
			defaultNs		: 'common'
		}, 
		function(){
			field.fnInit();
	});
});

var field = {
		fnInit : function() {
			if(language_cd == 'ko') {
				// korea
			} else {
				// etc
			}
			
			field.fnFieldList(1);	// 분야별 조회
			field.fnFieldList(2);	// 산업별 조회
			field.fnFieldList(3);	// 지역별 조회
		},
		
		fnFieldList : function(groupType) {
			var nation_id = '1';
			if(language_cd == 'ko') {
				nation_id = '1';
			} else if(language_cd == 'en') {
				nation_id = '2';
			} else if(language_cd == 'zh') {
				nation_id = '3';
			} else if(language_cd == 'ja') {
				nation_id = '4';
			}
			var paramData = {
				groupYn			: 2,			// 1 그룹 0 팀 2 전체
				groupType		: groupType,	// 1.분야별 2: 산업별 3: 지역별 4:기타	
				nationID		: nation_id		//1: 한국 2: 영어 3: 중국어 4: 일본어 0: 전체
			}
			
			gFnObjSyncAjaxCall(false, paramData, "/membership/getFieldList.ajax", function(res) {
				if(groupType==1) {
					field.fnFieldListCallBack(res);
				} else if(groupType==2) {
					field.fnIndustryListCallBack(res);
				} else if(groupType==3) {
					field.fnLocaleListCallBack(res);
				}
			});
		},
		
		fnFieldListCallBack : function(res) {
			var resultList = res.resultList;
			var txt = '';
			var cnt = 0;
			var fieldCnt = 0;
			
			if(resultList.length!=0) {
				resultList = gFnSortJsonList("seq", resultList);
				$.each(resultList, function(i, resultListItem) {
					txt = '';
					cnt = 0;
					
					var title = '';
					if(language_cd == 'ko'){
						title = resultListItem.korea;
					} else if(language_cd == 'en') {
						title = resultListItem.english;
					} else if(language_cd == 'zh') {
						title = resultListItem.china;
					} else if(language_cd == 'ja') {
						title = resultListItem.japan;
					}
					
					if(resultListItem.groupYn==1) {
						// 1depth
						txt += '<li><span class="s_ctg"><input type="checkbox" name="interestCb" value="'+title+'" id="'+resultListItem.workPartID+'"><label for="'+resultListItem.workPartID+'">'+title+'<span id='+resultListItem.workPartID+'Cnt></span></label></span>';
						
						$.each(resultList, function(i, resultChildListItem) {
							if(resultListItem.workPartID==resultChildListItem.groupID && resultChildListItem.groupYn==0) {
								var childTitle = '';
								if(language_cd == 'ko'){
									childTitle = resultChildListItem.korea;
								} else if(language_cd == 'en') {
									childTitle = resultChildListItem.english;
								} else if(language_cd == 'zh') {
									childTitle = resultChildListItem.china;
								} else if(language_cd == 'ja') {
									childTitle = resultChildListItem.japan;
								}
								// 2depth
								if(cnt==0) {
									txt += '<ul class="level3 inner_list">';
								}
								txt += '<li><input type="checkbox" name="interestCb" value="'+childTitle+'" id="'+resultChildListItem.workPartID+'"><label for="'+resultChildListItem.workPartID+'">'+childTitle+'</label></li>';
								cnt++;
							}
						});
						
						if(cnt!=0) {
							txt += '</ul>';
						}
						txt += '</li>';
					}
					$("#fieldList").append(txt);
					
					if(cnt==0) {
						$("#"+resultListItem.workPartID+"Li").addClass('non_child');
						cnt++;
					} else {
						cnt++;
					}
					$("#"+resultListItem.workPartID+"Cnt").text('('+cnt+')');
					//fieldCnt += cnt;
					fieldCnt++;
				});
			}
			$("#fieldCnt").text('('+fieldCnt+')');
		},
		
		fnIndustryListCallBack : function(res) {
			var resultList = res.resultList;
			var txt = '';
			
			if(resultList.length!=0) {
				$("#industryCnt").text('('+resultList.length+')');
				
				$.each(resultList, function(i, resultListItem) {
					var title = '';
					if(language_cd == 'ko'){
						title = resultListItem.korea;
					} else if(language_cd == 'en') {
						title = resultListItem.english;
					} else if(language_cd == 'zh') {
						title = resultListItem.china;
					} else if(language_cd == 'ja') {
						title = resultListItem.japan;
					}
					txt += '<li class="non_child"><span class="s_ctg"><input type="checkbox" name="interestCb" value="'+title+'" id="'+resultListItem.workPartID+'"><label for="'+resultListItem.workPartID+'">'+title+'</label></span></li>';
				});
			}
			
			$("#industryList").append(txt);
		},
		
		fnLocaleListCallBack : function(res) {
			var resultList = res.resultList;
			var txt = '';
			
			if(resultList.length!=0) {
				$("#localeCnt").text('('+resultList.length+')');
				
				$.each(resultList, function(i, resultListItem) {
					var title = '';
					if(language_cd == 'ko'){
						title = resultListItem.korea;
					} else if(language_cd == 'en') {
						title = resultListItem.english;
					} else if(language_cd == 'zh') {
						title = resultListItem.china;
					} else if(language_cd == 'ja') {
						title = resultListItem.japan;
					}
					txt += '<li class="non_child"><span class="s_ctg"><input type="checkbox" name="interestCb" value="'+title+'" id="'+resultListItem.workPartID+'"><label for="'+resultListItem.workPartID+'">'+title+'</label></span></li>';
				});
			}
			
			$("#localeList").append(txt);
		},
		
		fnChoice : function() {
			var interest = [];
			var interest_check = $(":checkbox[name='interestCb']:checked");
			$.each(interest_check, function(index, checkBox) {
				interest.push(checkBox.value);
			});

			// 관심 분야 생성
			if(interest.length > 0) {
				$(".int_field").show();
				$("#interestCnt").text("("+interest.length+")");
				$("#interestList").empty();
				$.each(interest, function(i, interestItem){
					$("#interestList").append('<div name="interestPart"><a href="javascript:gFnInterest.fnInterestDel(\''+interestItem+'\');">X</a><span>'+interestItem+'</span><input type="hidden" name="interestPartArr" value="'+interest[i]+'"/></div>');
				});
			} else {
				$(".int_field").hide();
				$("#interestCnt").text("");
			}
			$('.btn_close').trigger('click');
		},
		
		fnClose : function() {
			// 분야선택 팝업 새로 그리기
			$("input[type=checkbox]").prop("checked", false);
			
			$("div[name='interestPart']").each(function() {
				var value=$(this).children('span').text();
				
				$(":checkbox[name='interestCb']").each(function() {
					if(value==$(this).val()) {
						$(this).prop("checked", true);
					}
				}); 
			});
			gFnInterest.fnParentChecked();
		}
}
</script>