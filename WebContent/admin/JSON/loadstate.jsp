<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="function" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="list" value="${sessionScope.stateList}"></c:set>
<c:set var="len" value="${function:length(list)}"></c:set>

[<c:forEach items="${sessionScope.stateList}" var="i" varStatus="j">{"stateId":"${i.sid}","stateName":"${i.sn}"}
<c:if test="${len ne j.count}">,</c:if></c:forEach>]
