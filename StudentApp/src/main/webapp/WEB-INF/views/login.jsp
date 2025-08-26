<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Student Login</title>
<style>
    /* Reset default styles */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: linear-gradient(to right, #6a11cb, #2575fc);
    }

    .login-container {
        background: #fff;
        padding: 40px 50px;
        border-radius: 12px;
        box-shadow: 0 15px 25px rgba(0,0,0,0.3);
        width: 350px;
    }

    .login-container h2 {
        text-align: center;
        margin-bottom: 30px;
        color: #333;
        font-size: 24px;
    }

    .login-container label {
        display: block;
        margin-bottom: 8px;
        font-weight: 600;
        color: #555;
    }

    .login-container input[type="text"],
    .login-container input[type="password"] {
        width: 100%;
        padding: 10px 12px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 6px;
        transition: 0.3s;
    }

    .login-container input[type="text"]:focus,
    .login-container input[type="password"]:focus {
        border-color: #2575fc;
        outline: none;
        box-shadow: 0 0 5px rgba(37, 117, 252, 0.5);
    }

    .login-container input[type="submit"] {
        width: 100%;
        padding: 12px;
        border: none;
        border-radius: 6px;
        background-color: #2575fc;
        color: white;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s;
    }

    .login-container input[type="submit"]:hover {
        background-color: #6a11cb;
    }

    .msg {
        text-align: center;
        margin-top: 15px;
        font-weight: 600;
        color: red;
    }

    @media (max-width: 400px) {
        .login-container {
            width: 90%;
            padding: 30px 20px;
        }
    }
</style>
</head>
<body>

<div class="login-container">
    <h2>Student Login</h2>
    <form action="loginStudent" method="post">
        <label for="email">Name or Email ID</label>
        <input type="text" id="email" name="email" placeholder="Enter your name or email" required />

        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" required />

        <input type="submit" value="Login" />
    </form>

    <div class="msg">
        ${msg}
    </div>
</div>

</body>
</html>
