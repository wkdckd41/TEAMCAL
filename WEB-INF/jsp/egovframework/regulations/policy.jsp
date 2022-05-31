<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="${savedLanguage}">
<head>
	<title data-i18n="head.privacy_policy_title"></title><!-- 개인정보처리방침 | TEAM KAL -->
	<meta name="description" data-i18n="[content]head.privacy_policy_description"><!-- content="TEAM KAL 웹사이트의 개인정보처리방침 페이지입니다." -->
	<meta name="keywords" data-i18n="[content]head.privacy_policy_keywords"><!-- content="TEAM KAL, 개인정보처리방침" -->
	<c:import url="/WEB-INF/jsp/egovframework/inc/head.jsp">
		<c:param value="" name="cssName"/>
	</c:import>
	<jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/script.jsp" />
</head>
<body id="official">
<!-- utiltop -->
<jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/utiltop.jsp" />
<!-- //utiltop -->
<div id="wrapper" class="wrap">
	<!-- header -->
	<jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/header.jsp" />
	<!-- //header -->

	<div id="container" class="container_wrap regulations"> <!-- 회원가입 약관 동의 -->
		<div class="content">
			<div class="section">
				<div class="sub_visual_area small_visual">
					<div class="visual_cnt">
						<div class="row-wide info_sbj_location">
							<div class="col-5 breadcrumb">
								<ul>
									<li class="bc_home"><a href="javascript:void(0)">홈</a></li>
									<li class="bc_tit"><span>개인정보처리방침</span></li>
								</ul>
							</div>
							<div class="col-2 share_area on">
								<ul>
									<li><a href="#none" class="share_sbj">공유하기</a></li>
									<li><a href="#none" class="print_sbj">프린트</a></li>
								</ul>
							</div>
						</div>

						<div class="grid-layout info_sbj_box txt_center">
							<h2 class="sub_tl">개인정보처리방침</h2>
						</div>
					</div>
				</div>
				<!-- sub_visual_area-->

				<!-- 개인정보처리방침 -->
				<div class="column_wide private_box_wrap">
					<div class="grid-layout">
						<div class="row private_wrap">
							<div class="col-12">
								<p class="description">TEAM KAL은 관련 법령에 따라 정보주체의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 정보주체의 고충을 원활하게 처리할 수 있도록 다음과 같이 개인정보 처리방침(이하 “본 방침”)을 수립ㆍ공개합니다.</p>
								<!-- accordion -->
								<div class="accordion" data-accordion="false">
									<a href="javascript:void(0)" data-accordion-title="accordion1">
										<h3 class="accordion_title">
											<span class="tit_article">제 1 조</span>
											<span>처리하는 개인정보의 항목, 처리 목적, 처리∙보유기간</span>
											<span class="ico_arrow"></span>
										</h3>
									</a>
									<div class="accordion_content t1" data-accordion-content="accordion1">
										<div class="contnet_wrap">
											<p class="content">① TEAM KAL이 처리하는 개인정보의 항목, 처리목적, 처리∙보유기간은 다음과 같습니다.</p>
											<h4 class="tit_article">1. 고객 개인정보</h4>
											<div class="content_table">
												<div class="content_tr">
													<div class="content_th">
														처리하는 개인정보 항목
													</div>
													<div class="content_td">
														<ul>
															<li>
																<span>성명, 연락처(주소, 전화번호, 이메일 등), 직장정보(회사명, 직급 및 직책 등)</span>
															</li>
															<li>
																<span>TEAM KAL이 고객을 위하여 또는 고객과 관련하여 수행하는 서비스 및 거래관계의 설정‧유지‧이행‧관리 과정에서 생성되었거나 제공받은 정보</span>
															</li>
														</ul>
													</div>
												</div>
												<div class="content_tr">
													<div class="content_th">
														개인정보의 처리목적
													</div>
													<div class="content_td">
														<ul>
															<li>
																<span>고객을 위한 서비스 제공, 거래관계의 설정ㆍ유지ㆍ이행ㆍ관리, 사고조사, 분쟁해결, 민원처리 및 기타 법령상 의무 이행</span>
															</li>
															<li>
																<span>세미나 초청장 및 뉴스레터 발송, 기타 정보 제공</span>
															</li>
														</ul>
													</div>
												</div>
												<div class="content_tr">
													<div class="content_th">
														개인정보의 처리‧보유기간
													</div>
													<div class="content_td">
														<ul>
															<li>
																<span>위 목적 달성 시 또는 정보주체의 동의 철회 시</span>
															</li>
														</ul>
													</div>
												</div>
											</div>
											<h4 class="tit_article">2. 전문직 및 일반직 지원자, 실무수습 및 인턴지원자 등 개인정보</h4>
											<div class="content_table">
												<div class="content_tr">
													<div class="content_th">
														처리하는 개인정보 항목
													</div>
													<div class="content_td">
														<ul>
															<li>
																<span>성명, 연락처(주소, 전화번호, 이메일 등), 직장정보(회사명, 직급 및 직책 등)</span>
															</li>
															<li>
																<span>TEAM KAL이 고객을 위하여 또는 고객과 관련하여 수행하는 서비스 및 거래관계의 설정‧유지‧이행‧관리 과정에서 생성되었거나 제공받은 정보</span>
															</li>
														</ul>
													</div>
												</div>
												<div class="content_tr">
													<div class="content_th">
														개인정보의 처리목적
													</div>
													<div class="content_td">
														<ul>
															<li>
																<span>
																	입사지원자<br>
																	[필수] : 성명, 생년월일, 연락처(주소, 전화번호, 이메일 등), 사진, 성별, 학력사항, 병역 및 보훈사항, 경력사항, 지원동기 및 자기소개 내용<br>
																	[선택] : 가족사항, 수상경력, 외국어 및 자격/면허, 기타 제출서류에 기재된 정보 및 참고사항
																</span>
															</li>
															<li>
																<span>
																	실무수습 및 인턴지원자<br>
																	[필수] : 성명, 생년월일, 연락처(주소, 전화번호, 이메일 등), 사진, 성별, 학력사항, 병역 및 보훈사항, 경력사항, 지원동기 및 자기소개 내용<br>
																	[선택] : 가족사항, 수상경력, 외국어 및 자격/면허, 기타 제출서류에 기재된 정보 및 참고사항, 실무수습 및 인턴 이수 결과 (※선발 시에 한함)
																</span>
															</li>
														</ul>
													</div>
												</div>
												<div class="content_tr">
													<div class="content_th">
														개인정보의 처리‧보유기간
													</div>
													<div class="content_td">
														<ul>
															<li>
																<span>입사지원자 : 본인 확인, 학력‧경력 확인, 채용 여부 검토‧결정 및 통지, 추가 채용 시 지원의사 확인</span>
															</li>
															<li>
																<span>실무수습 및 인턴지원자 : 본인 확인, 학력‧경력 확인, 실무수습 및 인턴채용 여부 검토‧결정 및 통지, 실무수습 및 실무수습 및 인턴지원자 : 인턴쉽 관계의 설정유지ㆍ이행ㆍ관리 등, 정식채용 여부 결정</span>
															</li>
														</ul>
													</div>
												</div>
											</div>
											<h4 class="tit_article">3. 임직원(전문직, 일반직 등) 개인정보</h4>
											<div class="content_table">
												<div class="content_tr">
													<div class="content_th">
														처리하는 개인정보 항목
													</div>
													<div class="content_td">
														<ul>
															<li>
																<span>[필수] : 성명, 주민등록번호 등 고유식별번호, 국적, 연락처(주소,전화번호,이메일 등), 사진, 근로관계 유지 목적상 인사관리 정보 (인사기록카드, 주민등록초본 등 입사시 제출서류상 기재 정보, 직원번호, 소속, 직무, 근태 및 평가 정보, 징계정보, (퇴직정보 등 근로관계에 따라 발생‧생성된 인사관리 정보 등)</span>
															</li>
															<li>
																<span>[선택] : 가족사항</span>
															</li>
														</ul>
													</div>
												</div>
												<div class="content_tr">
													<div class="content_th">
														개인정보의 처리목적
													</div>
													<div class="content_td">
														<ul>
															<li>
																<span>근로계약의 체결(채용) 및 유지</span>
															</li>
															<li>
																<span>인사발령, 평가, 급여지급, 복리후생, 교육훈련 등 인사관리 목적상 필요한 업무의 처리</span>
															</li>
															<li>
																<span>직원명부 작성, 그룹 메신저 게시(소속, 직책, 성명, 이메일 주소, 전화번호)</span>
															</li>
														</ul>
													</div>
												</div>
												<div class="content_tr">
													<div class="content_th">
														개인정보의 처리‧보유기간
													</div>
													<div class="content_td">
														<ul>
															<li>
																<span>
																	위 목적 달성 시 또는 정보주체의 동의 철회 시<br>
																	(단, 위 목적달성 후에는 분쟁해결, 민원처리 및 기타 법령상 의무 이행 등을 위해서만 보유)
																</span>
															</li>
														</ul>
													</div>
												</div>
											</div>
											<p class="content">② TEAM KAL은 정보주체의 사생활을 침해할 우려가 있는 민감정보는 원칙적으로 수집하지 않으며, 필요한 경우 정보주체의 별도 동의를 받아 수집하고 동의 목적을 위해서만 제한적으로 이용합니다. 다만, 민감정보의 정확성, 최신성을 주기적으로 확인합니다.</p>
										</div>
									</div>
									<a href="javascript:void(0)" data-accordion-title="accordion2">
										<h3 class="accordion_title">
											<span class="tit_article">제 2 조</span>
											<span>개인정보의 제3자 제공</span>
											<span class="ico_arrow"></span>
										</h3>
									</a>
									<div class="accordion_content t2" data-accordion-content="accordion2">
										<div class="contnet_wrap">
											<p class="content">① TEAM KAL은 원칙적으로 정보주체의 개인정보를 제1조에서 명시한 목적 범위 내에서 처리하며, 정보주체의 사전 동의 없이는 본래의 범위를 초과하여 처리하거나 제3자에게 제공하지 않습니다. 단, 다음의 각 호의 경우에는 정보주체 또는 제3자의 이익을 부당하게 침해할 우려가 있을 때를 제외하고는 개인정보를 목적 외의 용도로 이용하거나 이를 제3자에게 제공할 수 있습니다.</p>
											<ul class="decimal">
												<li>정보주체가 사전에 제3자 제공에 동의한 경우</li>
												<li>다른 법률에 특별한 규정이 있는 경우</li>
												<li>정보주체 또는 그 법정대리인이 의사표시를 할 수 없는 상태에 있거나 주소불명 등으로 사전 동의를 받을 수 없는 경우로서 명백히 고객 또는 제3자의 급박한 생명, 신체, 재산의 이익을 위하여 필요하다고 인정되는 경우</li>
												<li>통계작성 및 학술연구 등의 목적을 위하여 필요한 경우로서 특정 개인을 알아볼 수 없는 형태로 개인정보를 제공하는 경우</li>
											</ul>
											<br>
											<p class="content">② TEAM KAL은 제1항 제1호에 따른 동의를 받을 때에는 다음 각 호의 사항을 정보주체에게 알립니다. 다음 각 호의 어느 하나의 사항을 변경하는 경우에도 이를 정보주체에게 알리고 동의를 받습니다.</p>
											<ul class="decimal">
												<li>개인정보를 제공받는 자</li>
												<li>개인정보의 이용 목적(제공 시에는 제공받는 자의 이용 목적을 말한다)</li>
												<li>이용 또는 제공하는 개인정보의 항목</li>
												<li>개인정보의 보유 및 이용 기간(제공 시에는 제공받는 자의 보유 및 이용 기간을 말한다)</li>
												<li>동의를 거부할 권리가 있다는 사실 및 동의 거부에 따른 불이익이 있는 경우에는 그 불이익의 내용</li>
											</ul>
										</div>
									</div>
									<a href="javascript:void(0)" data-accordion-title="accordion3">
										<h3 class="accordion_title">
											<span class="tit_article">제 3 조</span>
											<span>개인정보처리 위탁</span>
											<span class="ico_arrow"></span>
										</h3>
									</a>
									<div class="accordion_content t3" data-accordion-content="accordion3">
										<div class="contnet_wrap">
											<p class="content">① TEAM KAL은 아래와 같이 정보주체의 개인정보 처리를 위탁하고 있습니다. 향후 수탁업체 및 위탁하는 업무의 내용이 변경될 경우 지체 없이 본 방침을 통해 고지하겠습니다.</p>
											<h4 class="tit_article">· TEAM KAL은 개인정보보호법 제26조에 따라 수탁업체의 현황과 업무의 내용을 아래와 같이 공개합니다.</h4>
											<div class="content_table half">
												<div class="content_tr">
													<div class="content_th">
														위탁업무 내용
													</div>
													<div class="content_th">
														수탁업체명
													</div>
												</div>
												<div class="content_tr">
													<div class="content_td">
														어플리케이션 개발.운영
													</div>
													<div class="content_td">
														구우정보기술㈜
													</div>
												</div>
												<div class="content_tr">
													<div class="content_td">
														채권 추심위임 업무
													</div>
													<div class="content_td">
														SCI평가정보㈜
													</div>
												</div>
												<div class="content_tr">
													<div class="content_td">
														이메일 발송
													</div>
													<div class="content_td">
														㈜ 넷퍼씨 메일링크
													</div>
												</div>
												<div class="content_tr">
													<div class="content_td">
														CRM 유지보수
													</div>
													<div class="content_td">
														윤형덕 
													</div>
												</div>
											</div>
											<p class="content">② TEAM KAL은 수탁업체와의 위탁계약 체결 시 관련 법령에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적ㆍ관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리ㆍ감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.</p>
										</div>
									</div>
									<a href="javascript:void(0)" data-accordion-title="accordion4">
										<h3 class="accordion_title">
											<span class="tit_article">제 4 조</span>
											<span>정보주체의 권리∙의무 및 그 행사방법</span>
											<span class="ico_arrow"></span>
										</h3>
									</a>
									<div class="accordion_content t3" data-accordion-content="accordion4">
										<div class="contnet_wrap">
											<p class="content">① 정보주체는 개인정보 보호법 등 관련 법령이 정하는 바에 따라 TEAM KAL에 대하여 개인정보의 열람, 정정 및 삭제, 처리정지 요구 등 개인정보 보호 관련 권리를 행사할 수 있습니다.</p>
											<p class="content">② 제1항에 따른 권리행사는 정보주체의 법정대리인이나 위임을 받은 사람을 통해서도 할 수 있습니다. 다만, 이 경우에는 개인정보 보호법 시행규칙에 따른 위임장을 TEAM KAL에 제출하여야 합니다.</p>
											<p class="content">③ TEAM KAL은 정보주체의 권리행사에 대하여 개인정보 보호법 등 관련 법령이 정하는 바에 따라 지체 없이 조치하겠습니다.</p>
										</div>
									</div>
									<a href="javascript:void(0)" data-accordion-title="accordion5">
										<h3 class="accordion_title">
											<span class="tit_article">제 5 조</span>
											<span>개인정보의 파기</span>
											<span class="ico_arrow"></span>
										</h3>
									</a>
									<div class="accordion_content t3" data-accordion-content="accordion5">
										<div class="contnet_wrap">
											<p class="content">① TEAM KAL은 원칙적으로 개인정보의 처리목적이 달성된 경우 등 그 개인정보가 불필요하게 되었을 때 지체 없이 해당 개인정보를 파기합니다.</p>
											<p class="content">② TEAM KAL은 개인정보의 관련 법령의 규정에 따라 개인정보를 파기하지 않고 계속 보존하여야 하는 경우에는 해당 개인정보를 다른 개인정보와 분리해서 저장‧관리합니다.</p>
											<p class="content">③ TEAM KAL은 파기사유가 발생한 개인정보를 선정하여 개인정보보호(관리)책임자의 승인을 받아 해당 개인정보를 파기합니다.</p>
											<p class="content">④ TEAM KAL은 파기하여야 할 개인정보가 전자적 파일 형태인 경우 복원이 불가능한 방법으로 영구 삭제하며, 그 밖의 기록물, 인쇄물, 서면 그 밖의 기록매체인 경우 파쇄 또는 소각합니다.</p>
										</div>
									</div>
									<a href="javascript:void(0)" data-accordion-title="accordion6">
										<h3 class="accordion_title">
											<span class="tit_article">제 6 조</span>
											<span>개인정보의 안전성 확보 조치</span>
											<span class="ico_arrow"></span>
										</h3>
									</a>
									<div class="accordion_content t3" data-accordion-content="accordion6">
										<div class="contnet_wrap">
											<h4 class="content">TEAM KAL은 다음 각 호와 같이 안전성 확보에 필요한 조치를 하고 있습니다.</h4>
											<ul class="decimal">
												<li>관리적 조치 : 내부관리계획의 수립 및 시행, 구성원에 대한 정기적인 개인정보 보호 교육 등</li>
												<li>기술적 조치 : 개인정보처리시스템에 대한 접근권한 관리, 접근통제시스템 설치, 암호화 및 보안프로그램의 설치 등</li>
												<li>물리적 조치 : 전산실 등 개인정보 보관장소에 대한 접근통제</li>
											</ul>
										</div>
									</div>
									<a href="javascript:void(0)" data-accordion-title="accordion7">
										<h3 class="accordion_title">
											<span class="tit_article">제 7 조</span>
											<span>개인정보 처리방침의 변경</span>
											<span class="ico_arrow"></span>
										</h3>
									</a>
									<div class="accordion_content t3" data-accordion-content="accordion7">
										<div class="contnet_wrap">
											<p class="content">
												본 방침은 관련 법령 및 지침, TEAM KAL의 내부규정 등에 따라 변경될 수 있으며, TEAM KAL은 본 방침을 변경하는 경우에는 변경 및 시행 시기, 변경된 내용을 홈페이지(<a href="http://www.yulchon.com"> www.yulchon.com</a>)를 통해 지속적으로 공개하며, 변경된 내용은 정보주체가 쉽게 확인할 수 있도록 변경 전ㆍ후를 비교하여 공개합니다.
											</p>
										</div>
									</div>
									<a href="javascript:void(0)" data-accordion-title="accordion8">
										<h3 class="accordion_title">
											<span class="tit_article">제 8 조</span>
											<span>권익침해 구제방법</span>
											<span class="ico_arrow"></span>
										</h3>
									</a>
									<div class="accordion_content t3" data-accordion-content="accordion8">
										<div class="contnet_wrap">
											<h4 class="content">정보주체는 개인정보침해로 인한 신고나 상담이 필요하신 경우 아래 기관에 문의하시기 바랍니다.</h4>
											<ul class="decimal">
												<li>개인정보분쟁조정위원회 : <a target="_blank" href="http://privacy.kisa.or.kr/">privacy.kisa.or.kr/</a> (국번없이)118</li>
												<li>한국인터넷진흥원 개인정보침해신고센터 : <a target="_blank" href="http://privacy.kisa.or.kr/">privacy.kisa.or.kr/</a> (국번없이)118</li>
												<li>대검찰청 사이버범죄수사단: <a target="_blank" href="http://www.spo.go.kr/">www.spo.go.kr/</a> 02-3480-3573</li>
												<li>경찰청 사이버테러대응센터: <a target="_blank" href="http://www.netan.go.kr/">www.netan.go.kr/</a> 1566-0112</li>
											</ul>
										</div>
									</div>
									<a href="javascript:void(0)" data-accordion-title="accordion9">
										<h3 class="accordion_title">
											<span class="tit_article">제 9 조</span>
											<span>개인정보 보호책임자</span>
											<span class="ico_arrow"></span>
										</h3>
									</a>
									<div class="accordion_content t3" data-accordion-content="accordion9">
										<div class="contnet_wrap">
											<ul class="decimal">
												<li>
													TEAM KAL의 개인정보 보호책임자는 다음과 같습니다.
													<ul>
														<li>개인정보 보호책임자: 송인보 변호사</li>
														<li>연락처: 02-528-5200, <a href="mailto:privacy@yulchon.com">privacy@yulchon.com</a></li>
													</ul>
												</li>
												<li>
													개인정보 열람청구 및 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 업무를 처리하는 담당자는 다음과 같습니다.
													<ul>
														<li>담당자: <span class="para">지식관리팀 이정현 차장,</span> <span class="para">정보전산팀 김정훈 대리,</span> <span class="para">경영지원실 김우리 대리</span></li>
														<li>연락처: 02-528-5200, <a href="mailto:privacy@yulchon.com">privacy@yulchon.com</a></li>
													</ul>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<!-- //accordion -->
								<!--
								<h3 class="txt_title">
									제1조 [처리하는 개인정보의 항목, 처리 목적, 처리∙보유기간]
								</h3>
								<p class="description">
									① TEAM KAL이 처리하는 개인정보의 항목, 처리목적, 처리∙보유기간은 다음과 같습니다.
								</p>
								<h4 class="txt_mid_title">
									1. 고객 개인정보
								</h4>
								<h5 class="txt_sml_title">
									처리하는 개인정보 항목
								</h5>
								<p class="description type2">
									- 성명, 연락처(주소, 전화번호, 이메일 등), 직장정보(회사명, 직급 및 직책 등)<br>
									- TEAM KAL이 고객을 위하여 또는 고객과 관련하여 수행하는 서비스 및 거래관계의 설정‧유지‧이행‧관리 과정에서 생성되었거나 제공받은 정보
								</p>
								<h5 class="txt_sml_title">
									개인정보의 처리목적
								</h5>
								<p class="description type2">
									- 고객을 위한 서비스 제공, 거래관계의 설정ㆍ유지ㆍ이행ㆍ관리, 사고조사, 분쟁해결, 민원처리 및 기타 법령상 의무 이행<br>
									- 세미나 초청장 및 뉴스레터 발송, 기타 정보 제공
								</p>
								<h5 class="txt_sml_title">
									개인정보의 처리‧보유기간
								</h5>
								<p class="description type2">
									- 위 목적 달성 시 또는 정보주체의 동의 철회 시
								</p> -->
							</div>
						</div>
					</div>
				</div>  <!-- //terms_box_wrap -->
				<!-- //개인정보처리방침 -->

			</div> <!-- //section -->
		</div> <!-- //content -->
	</div> <!-- //container -->

	<!-- footer -->
	<jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/footer.jsp" />
	<!-- //footer -->
	<!-- search -->
	<%@ include file="/WEB-INF/jsp/egovframework/inc/search.jsp"%>
	<!-- //search -->
	<!-- share -->
	<%@ include file="/WEB-INF/jsp/egovframework/inc/share.jsp"%>
	<!-- //share --> 
</div> <!--//wrapper -->

<!-- script innerpage -->
<script type="text/javascript">

var language_cd = "${savedLanguage}" == "" ? "ko" : "${savedLanguage}";

$(document).ready(function() {
	i18n.fnInit(
		options = {
			lang			: language_cd,
			namespace		:  ['regulations','common'],
			defaultNs		: 'regulations'
		},
		function(){
		});
});

</script>

</body>
</html>
