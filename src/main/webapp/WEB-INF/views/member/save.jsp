<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>save</title>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>
<div>
    <form action="/member/save" method="post" onsubmit="return allCheck()" name="memberForm">
        <input type="text" name="memberEmail" placeholder="이메일" id="memberEmail" onblur="emailCheck()">
        <div id="check-result"></div>
        <input type="text" name="memberPassword" placeholder="비밀번호" onkeyup="passwordCheck(this.value)">
        *10자 이상, 영문 대소문자, 숫자, 특수문자를 사용하세요.
        <div id="check-result2"></div>
        <input type="text" name="memberName" placeholder="이름" onkeyup="nameCheck(this)">
        <input type="text" name="memberAge" placeholder="나이" onkeyup="ageCheck(this)" maxlength="3">
        <input type="text" name="memberMobile" placeholder="전화번호 '-'없이 입력" onkeyup="mobileCheck(this)" maxlength="11">
        <input type="submit" value="회원가입">
</form>
</div>
</body>
<script>
    // 이메일 입력값을 가져오고,
    // 입력값을 서버로 전송하고 똑같은 이메일이 있는지 체크한 후
    // 사용 가능 여부를 이메일 입력창 아래에 표시
    const emailCheck = () => {
        const email = document.getElementById("memberEmail").value;
        const checkResult = document.getElementById("check-result");
        const regex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
        console.log("입력한 이메일", email);
        $.ajax({
            // 요청방식: post, url: "email-check", 데이터: 이메일
            type: "post",
            url: "/member/email-check",
            data: {
                "memberEmail": email
            },
            success: function(res) {
                if (regex.test(email)) {
                    console.log("요청성공", res);
                    if (res == "ok") {
                        console.log("사용가능한 이메일");
                        checkResult.style.color = "green";
                        checkResult.innerHTML = "사용가능한 이메일";
                    } else {
                        console.log("이미 사용중인 이메일");
                        checkResult.style.color = "red";
                        checkResult.innerHTML = "이미 사용중인 이메일";
                    }
                } else {
                    console.log("올바른 형식으로 입력하세요");
                    checkResult.style.color = "red";
                    checkResult.innerHTML = "올바른 형식으로 입력하세요";
                }
            },
            error: function(err) {
                console.log("에러발생", err);
            }
        });
    }

    function passwordCheck(password) {
        const checkResult2 = document.getElementById("check-result2");
        const regex=/^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+\-=])\S{10,}$/;
        if (password.trim().length != 0) {
            if (regex.test(password)) {
                console.log("");
                checkResult2.innerText = "";
            } else {
                console.log("올바른 형식으로 입력하세요");
                checkResult2.style.color = "red";
                checkResult2.innerText = "올바른 형식으로 입력하세요";
            }
        } else {
                console.log("");
                checkResult2.innerText = "";
        }
    }

    function nameCheck(name) {
        name.value = name.value.replace(/[0-9a-zA-Z;!]/g, "");
    }

    function ageCheck(age) {
        age.value = age.value.replace(/[^0-9]/g, "");
    }

    function mobileCheck(mobile) {
        mobile.value = mobile.value.replace(/[^0-9]/g, "");
    }

    function allCheck() {
        const memberEmail=document.memberForm.memberEmail.value;
        const memberPassword=document.memberForm.memberPassword.value;
        const memberName=document.memberForm.memberName.value;
        const memberAge=document.memberForm.memberAge.value;
        const memberMobile=document.memberForm.memberMobile.value;
        if (memberEmail.trim().length == 0) {
            alert("이메일을 입력해주세요.");
            return false;
        }
        else if (memberPassword.trim().length == 0) {
            alert("비밀번호를 입력해주세요.");
            return false;
        }
        else if (memberName.trim().length == 0) {
            alert("이름을 입력해주세요.");
            return false;
        }
        else if (memberAge.trim().length == 0) {
            alert("나이를 입력해주세요.");
            return false;
        }
        else if (memberMobile.trim().length < 11) {
            alert("전화번호를 올바르게 입력해주세요.");
            return false;
        }
        else
            return true;
    }
</script>
</html>