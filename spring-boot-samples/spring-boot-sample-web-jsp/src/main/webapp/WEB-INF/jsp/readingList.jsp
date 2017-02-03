<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Books</title>
</head>
<body>
	<div>
	<dl>
		<c:forEach items="${books}" var="book">
		<dt>
			<span>${book.title}</span>(<span>${book.isbn}</span>)&nbsp;
			<span>${book.author}</span>
		</dt>
		<dd>
			<span>${book.description}</span>
		</dd>
		</c:forEach>
	</dl>
	</div>
	<hr/>
	<sf:form method="POST" modelAttribute="book">
		<label for="title">Title :</label>
		<sf:input path="title" size="50"></sf:input><br>
		<label for="isbn">ISBN:</label>
		<sf:input path="isbn" size="50"></sf:input><br>
		<label for="author">Author:</label>
		<sf:input path="author" size="50"></sf:input><br>
		<label for="description">Description:</label>
		<sf:textarea path="description" cols="80" rows="5"></sf:textarea><br>
		<input type="submit"></input>	
	</sf:form>
</body>
</html>