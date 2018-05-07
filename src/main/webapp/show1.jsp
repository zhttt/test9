<%--
  Created by IntelliJ IDEA.
  User: Hunter
  Date: 2018/5/4
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach items="${list}" var="r">
    ${r.name}<br/>
</c:forEach>
</body>
</html>
