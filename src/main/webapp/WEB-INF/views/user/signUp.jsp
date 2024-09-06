<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up - 오피스텔 주민 커뮤니티</title>
<style>
    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px;
        margin-top: 20px;
        height: 80vh; /* 화면 높이의 80%로 설정 */
    }

    /* 회원가입 폼 스타일 */
    .signup-form {
        width: 300px;
        padding: 20px;
        background-color: #f9f9f9;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .signup-form h2 {
        text-align: center;
        margin-bottom: 20px;
    }

    .signup-form input[type="text"],
    .signup-form input[type="password"],
    .signup-form input[type="email"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-sizing: border-box;
    }

    .signup-form input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: #333;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 1em;
    }

    .signup-form input[type="submit"]:hover {
        background-color: #444;
    }
    #error{
        color:red;
    }
</style>
<script type="text/javascript">
    function validateForm()
    {
    	var password = document.forms["signupForm"]["pwd"].value;
    	var confirmPassword = document.forms["signupForm"]["confirm_password"].value;
    	
    	if(password !== confirmPassword)
    		{
    		   document.getElementById("error").innerText="Passwords do not match.";
    		   return false;
    		}
    	
    	return true;
    }
</script>
</head>
<body>

<!-- 메인 컨텐츠 -->
<div class="container">
    <div class="signup-form">
        <h2>Sign Up</h2>
        <form  name="signupForm" action="../user/signUp" method="post" onsubmit="return validateForm()">
            <input type="text" name="username" placeholder="Username" required>
            <input type="text" name="userid" placeholder="User ID" required>
            <input type="email"  name="email" placeholder="Email">
            <input type="text"  name="floor" placeholder="Floor">
            <input type="password" name="pwd" placeholder="Password" required>
            <input type="password" name="confirm_password" placeholder="Confirm Password" required>
            <input type="submit" value="Sign Up">
        </form>
        
        <div id="error"></div>
        
    </div>
</div>

</body>
</html>
