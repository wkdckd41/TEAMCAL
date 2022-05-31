<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/egovframework/cmmn/decorator/common.jsp"/>
<!DOCTYPE html>
<html lang="${savedLanguage}">
<head>
	<!-- head -->
	<jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/head.jsp" />
	<sitemesh:write property="head" />
	<!-- title -->
	<!-- //head -->
	<!-- common script -->
	<jsp:directive.include file="/WEB-INF/jsp/egovframework/inc/script.jsp" />
	<!-- //common script -->
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
</div> <!--//wrapper -->

	<sitemesh:write property="page.local_script"/>
</body>

</html>