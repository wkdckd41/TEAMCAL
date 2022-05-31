<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 분야 선택 -->
<div id="new_memo" class="row layer_pop pop_center business_field_wrap about pop_office">
	<div class="pop_offset_inner">
		<div class="col-12-nm">
			<div class="col-12-nm">
				<a href="javascript:void(0);" class="btn_close">닫기</a>
				<div class="pop_tl">메모 등록</div>
			</div>
			<div class="col-12-nm scroll_wrap">
				<div class="swiper-container scroll-container">
					<div class="swiper-scrollbar"></div>
					<div class="swiper-wrapper"> <!-- swiper-wrapper -->
						<div class="swiper-slide"> <!-- swiper-slide -->
							<div class="cnt_area">
								<!-- 레이어 팝업 컨텐츠 영역 -->
								<div class="col-12 form_area"> <!-- swiper-container scroll-container -->
									<div class="year_wrap">
										<div class="chk_year_wrap">

											<span>메모</span>
											<input type="text" id="memo_content">
										</div>
									</div>
								</div>
							</div>
							<div class="btn_area al_center">
								<button type="button" class="btn_blue"><span>등록</span></button>
							</div>
						</div>
					</div>
					<!-- //레이어 팝업 컨텐츠 영역 -->
				</div>
				<!-- //cnt_area -->
			</div>
		</div>
	</div>
</div> 
<!--// 분야 선택 -->
