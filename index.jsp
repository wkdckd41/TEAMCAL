<%@page import="org.springframework.web.servlet.support.RequestContextUtils"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=utf-8" %>

<%
	String context = request.getContextPath();
	String acceptLang = request.getHeader("Accept-Language");
	//String lang = acceptLang.split(",")[0];
	String lang = RequestContextUtils.getLocale(request).toString().substring(0,2);
	if (lang.indexOf("ko") > -1) {
		lang =  "ko";
	} else if(lang.indexOf("zh") > -1){
	    lang = "zh";
	} else if(lang.indexOf("ja") > -1){
		lang = "ja";
	} else {
		lang =  "en";
	}
%>
<meta http-equiv="refresh" content="0;url='<%=context+"/"+lang %>/main/main.do" />