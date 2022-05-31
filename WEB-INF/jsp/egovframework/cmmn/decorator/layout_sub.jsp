<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<jsp:directive.include file="/WEB-INF/jsp/egovframework/cmmn/decorator/common.jsp"/>

<!DOCTYPE html>
<html lang="${savedLanguage}">
<head>
	<jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/head.jsp" />
	<!-- //head -->
	<!-- common script -->
	<jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/script.jsp" />
	<!-- //common script -->
	<sitemesh:write property="head" />
</head>
<body id="official">
<!-- utiltop -->
<jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/utiltop.jsp" />
<!-- //utiltop -->
<div id="wrapper" class="wrap">
	<!-- header -->
	<jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/header.jsp" />
	<!-- //header -->
	
	
	<sitemesh:write property="body" />
	
	
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

	<sitemesh:write property="page.local_script"/>
</body>
</html>