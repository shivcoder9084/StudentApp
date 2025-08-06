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
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        padding: 30px;
        width: 100%;
        max-width: 480px;
        animation: fadeSlideIn 0.5s ease-in-out;
    }

    @keyframes fadeSlideIn {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 25px;
        font-weight: 600;
    }

    label {
        display: block;
        margin-bottom: 6px;
        font-size: 14px;
        color: #333;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"],
    input[type="date"],
    select {
        width: 100%;
        padding: 10px 12px;
        font-size: 14px;
        border: 1px solid #ccc;
        border-radius: 6px;
        margin-bottom: 16px;
        transition: border-color 0.3s ease;
    }

    input:focus,
    select:focus {
        border-color: #4facfe;
        outline: none;
    }

    input[type="submit"] {
        width: 100%;
        padding: 12px;
        background-color: #4facfe;
        border: none;
        color: white;
        font-size: 15px;
        font-weight: 600;
        border-radius: 6px;
        cursor: pointer;
        transition: background 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #00c6ff;
    }

    .footer {
        text-align: center;
        font-size: 12px;
        color: #666;
        margin-top: 20px;
    }

</style>
</head>
<body>

<div class="container">
    <h2>Student Registration Form</h2>
    <form action="updateReg" method="post">
    <input type="hidden" name="id" value="${student.id}" />
        <label for="fullname">Full Name</label>
        <input type="text" id="fullname" name="fullName" value="${student.fullName }" placeholder="Enter your full name" required>

        <label for="roll">Roll Number</label>
        <input type="text" id="roll" name="roll" value="${student.roll }" placeholder="Enter roll number" required>

        <label for="course">Course</label>
        <select id="course" name="course" value="${student.course }" required>
            <option value="" disabled selected>Select course</option>
            <option value="BCA">BCA</option>
            <option value="B.Tech">B.Tech</option>
            <option value="MCA">MCA</option>
            <option value="MBA">MBA</option>
        </select>

        <label for="semester">Semester</label>
        <select id="semester" name="semester" required>
    <option value="" disabled ${student.semester == null ? 'selected' : ''}>Select semester</option>
    <option value="1st" ${student.semester == '1st' ? 'selected' : ''}>1st</option>
    <option value="2nd" ${student.semester == '2nd' ? 'selected' : ''}>2nd</option>
    <option value="3rd" ${student.semester == '3rd' ? 'selected' : ''}>3rd</option>
    <option value="4th" ${student.semester == '4th' ? 'selected' : ''}>4th</option>
    <option value="5th" ${student.semester == '5th' ? 'selected' : ''}>5th</option>
    <option value="6th" ${student.semester == '6th' ? 'selected' : ''}>6th</option>
    <option value="7th" ${student.semester == '7th' ? 'selected' : ''}>7th</option>
    <option value="8th" ${student.semester == '8th' ? 'selected' : ''}>8th</option>
</select>


        <label for="dob">Date of Birth</label>
        <input type="date" id="dob" name="dob" value="${student.dob }" required>

        <label for="email">Email</label>
        <input type="email" id="email" name="email" value="${student.email }" placeholder="Enter your email" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" value="${student.password }" placeholder="Create password" required>

        <label for="gender">Gender</label>
        <select id="gender" name="gender" required>
    <option value="" disabled ${student.gender == null ? 'selected' : ''}>Select gender</option>
    <option value="male" ${student.gender == 'male' ? 'selected' : ''}>Male</option>
    <option value="female" ${student.gender == 'female' ? 'selected' : ''}>Female</option>
    <option value="other" ${student.gender == 'other' ? 'selected' : ''}>Other</option>
</select>


        <label for="city">City</label>
        <input type="text" id="city" name="city" value="${student.city }" placeholder="Enter your city">

        <input type="submit" value="Update">
    </form>

    <div class="footer">
        &copy; 2025 EduPortal. All rights reserved.
    </div>
</div>
<c:out  value="hello bird"></c:out>
${msg }

</body>
</html>
