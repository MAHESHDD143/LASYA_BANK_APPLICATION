<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<center>
    <h3>Student Details</h3>
    <c:if test="${not empty details}">
        <h3>Id:${details.id}</h3>
        <h3>Name:${details.name}</h3>
        <h3>Course:${details.course}</h3>
        <h3>Address:${details.address}</h3>
        <h3>CGPA:${details.cgpa}</h3>
    </c:if>
    <a href="/">Home</a><br><br>
    <a href="/addStudent">Register</a><br><br>
    <a href="/getDetails">ViewDetails</a><br><br>
    <a href="/getMarks">View CGPA</a><br><br>
    <a href="/close">CloseStudent</a>
</center>