<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
</head>
<body>
    <div>
    <form action="/member/save" method="post">
        <input type="text" name="memberEmail" placeholder="이메일" id="memberEmail">
        <input type="password" name="memberPassword" placeholder="비밀번호">
        <input type="text" name="memberName" placeholder="이름">
        <input type="text" name="memberAge" placeholder="나이">
        <input type="text" name="memberMobile" placeholder="전화번호">
        <input type="submit" value="회원가입">
        </form>
    </div>
</body>
</html>
