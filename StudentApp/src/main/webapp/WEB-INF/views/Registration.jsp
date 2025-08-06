<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="menu.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Registration</title>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap');

    * {
        box-sizing: border-box;
        transition: all 0.3s ease-in-out;
    }

    body {
        margin: 0;
        padding: 0;
        font-family: 'Inter', sans-serif;
        background: linear-gradient(to right, #4facfe, #00f2fe);
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: start;
        padding: 40px 20px;
    }

    .container {
        background-color: #ffffff;
        border-radius: 12px;
        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
        padding: 30px;
        width: 100%;
        max-width: 500px;
        animation: fadeSlideIn 0.6s ease-in-out;
    }

    @keyframes fadeSlideIn {
        from { opacity: 0; transform: translateY(-25px); }
        to { opacity: 1; transform: translateY(0); }
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 25px;
        font-weight: 700;
    }

    label {
        display: block;
        margin-bottom: 6px;
        font-size: 14px;
        color: #333;
        font-weight: 500;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"],
    input[type="date"],
    select {
        width: 100%;
        padding: 10px 12px;
        font-size: 14px;
        border: 1.5px solid #ccc;
        border-radius: 6px;
        margin-bottom: 18px;
        background-color: #fafafa;
    }

    input:focus,
    select:focus {
        border-color: #4facfe;
        background-color: #fff;
        box-shadow: 0 0 5px rgba(79, 172, 254, 0.3);
        outline: none;
    }

    input[type="file"] {
        margin-bottom: 18px;
        background-color: #f3f3f3;
        padding: 10px;
        border-radius: 6px;
        border: 1px dashed #aaa;
        cursor: pointer;
    }

    input[type="file"]:hover {
        border-color: #4facfe;
        background-color: #e8f4ff;
    }

    input[type="submit"] {
        width: 100%;
        padding: 12px;
        background: linear-gradient(to right, #4facfe, #00f2fe);
        border: none;
        color: white;
        font-size: 15px;
        font-weight: 600;
        border-radius: 6px;
        cursor: pointer;
        box-shadow: 0 4px 12px rgba(0, 242, 254, 0.4);
    }

    input[type="submit"]:hover {
        background: linear-gradient(to left, #4facfe, #00f2fe);
        transform: translateY(-2px);
        box-shadow: 0 6px 18px rgba(0, 242, 254, 0.5);
    }

    .footer {
        text-align: center;
        font-size: 12px;
        color: #666;
        margin-top: 20px;
    }

    /* Mobile responsiveness */
    @media (max-width: 600px) {
        .container {
            padding: 20px;
        }

        input, select {
            font-size: 13px;
        }

        h2 {
            font-size: 20px;
        }
    }

</style>
</head>
<body>

<div class="container">
    <h2>Student Registration Form</h2>
    <form action="saveReg" method="post" enctype="multipart/form-data">
        <label for="fullname">Full Name</label>
        <input type="text" id="fullname" name="fullName" placeholder="Enter your full name" required>

        <label for="roll">Roll Number</label>
        <input type="text" id="roll" name="roll" placeholder="Enter roll number" required>

        <label for="course">Course</label>
        <select id="course" name="course" required>
            <option value="" disabled selected>Select course</option>
            <option value="BCA">BCA</option>
            <option value="B.Tech">B.Tech</option>
            <option value="MCA">MCA</option>
            <option value="MBA">MBA</option>
        </select>

        <label for="semester">Semester</label>
        <select id="semester" name="semester" required>
            <option value="" disabled selected>Select semester</option>
            <option value="1st">1st</option>
            <option value="2nd">2nd</option>
            <option value="3rd">3rd</option>
            <option value="4th">4th</option>
            <option value="5th">5th</option>
            <option value="6th">6th</option>
            <option value="7th">7th</option>
            <option value="8th">8th</option>
        </select>

        <label for="dob">Date of Birth</label>
        <input type="date" id="dob" name="dob" required>

        <label for="email">Email</label>
        <input type="email" id="email" name="email" placeholder="Enter your email" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Create password" required>

        <label for="gender">Gender</label>
        <select id="gender" name="gender" required>
            <option value="" disabled selected>Select gender</option>
            <option value="male">Male</option>
            <option value="female">Female</option>
            <option value="other">Other</option>
        </select>

        <label for="city">City</label>
        <input type="text" id="city" name="city" placeholder="Enter your city">
        
        <label>Upload Image:</label>
        <input type="file" name="imagePath" accept="image/*" required />

        <label>Upload PDF:</label>
        <input type="file" name="pdfPath" accept="application/pdf" required />

        <input type="submit" value="Register">
    </form>

    <div class="footer">
        &copy; 2025 EduPortal. All rights reserved.
    </div>
</div>

<c:out value="hello bird" />
${msg}

</body>
</html>
