<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Java server page</title>
</head>
<body>
	<h1>User: Home</h1>

	<c:if test="${not empty userobj }">
		<h1>Name:${userobj.name}</h1>
		<h1>Email:${userobj.email}</h1>
	</c:if>
</body>
</html>
