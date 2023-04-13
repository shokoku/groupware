<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
</head>
<body>
    <div>
        <form action="/member/login" method="post">
            <input type="text" name="memberEmail" placeholder="이메일">
            <input type="text" name="memberPassword" placeholder="비밀번호">
            <input type="submit" value="로그인">
        </form>
    </div>
</body>
</html>