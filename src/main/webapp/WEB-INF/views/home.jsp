<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="commons/header.jsp" />
<jsp:include page="commons/navi.jsp" />

<div class="content" style="padding: 30px;">
    <c:choose>
        <c:when test="${menu eq 'permission'}">
            <jsp:include page="include/per_main.jsp" />
        </c:when>
        <c:when test="${menu eq 'emp'}">
            <jsp:include page="include/emp_main.jsp" />
        </c:when>
        <c:when test="${menu eq 'dept'}">
            <jsp:include page="include/dept_main.jsp" />
        </c:when>
        <c:when test="${menu eq 'board'}">
            <jsp:include page="include/board_main.jsp" />
        </c:when>
        <c:when test="${menu eq 'work'}">
            <jsp:include page="include/work_main.jsp" />
        </c:when>
    </c:choose>
</div>
