<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="function" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="list" value="${sessionScope.comments}"></c:set>
<c:set var="len" value="${function:length(list)}"></c:set>

[<c:forEach items="${sessionScope.comments}" var="i" varStatus="j">{"commentid":"${i.commentId}","comment":"${i.commentDesc}","user":"${i.loginVO.userName }"}
<c:if test="${len ne j.count}">,</c:if></c:forEach>]
