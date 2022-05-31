
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- layer_popup -->
<div id="pop_search" class="row layer_pop search_wrap ">
    <div class="col-12-nm">
        <a href="javascript:void(0);" class="btn_close" data-i18n="common:button.close" id="header_search_close_btn"><!-- 닫기 --></a>
        <div class="cnt_area">
            <!-- 레이어 팝업 컨텐츠 영역 -->
            <div class="col-8 form_area al_center">
                <div class="box_search">
                    <div class="wrap_search">
                        <div class="area_word">
                            <label for="header_word" class="label_word" data-i18n="common:labe_word_part_member_news"><!-- 업무분야, 구성원, 소식/자료 검색 --></label>
                            <input type="text" id="header_word" class="tf_word" value="" name="search_title" onkeydown="common.fnKeydown(event)">
                            <button type="button" class="del_keyword">
                                <span class="blind" data-i18n="common:searchkey_delete"><!-- 검색어 삭제 --></span>
                            </button>
                        </div>
                        <div class="area_search_btn">
                            <button class="btn_search" onclick="list.fnInit()">스터디 명을 입력하여 검색하세요.(메인 리스트만 검색 가능합니다.)</button>
                        </div>
                    </div>

                    <!-- Wisenut Ark -->
                    <div class="search_result_wrap" id="header_ark" >
						<div class="box_search_result">
							<ul>
							</ul>
							<button type="button" class="btn_off">자동완성 끄기</button>
						</div>
					</div>
					<!-- //Wisenut Ark -->

                </div>
                
            </div>
            <!-- //레이어 팝업 컨텐츠 영역 -->
        </div>
    </div>
</div>
<!-- //layer_popup -->
<script>
var common = {
		fnGoSearch : function(){
			var keyword = $("#header_word").val();
			
			$(location).attr("href", encodeURI("/"+language_cd+"/search/search-result.do?keyword="+keyword));
		},
		
		fnKeydown : function(e){
			if(e.keyCode == 13){
				list.fnInit();
			}
		}
}
</script>