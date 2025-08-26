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
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: start;
        padding: 40px 20px;
    }

    .container {
        background: rgba(255, 255, 255, 0.15);
        backdrop-filter: blur(15px);
        border-radius: 16px;
        border: 1px solid rgba(255, 255, 255, 0.25);
        padding: 35px;
        width: 100%;
        max-width: 520px;
        box-shadow: 0 8px 32px rgba(0,0,0,0.25);
        animation: fadeSlideIn 0.8s ease-in-out;
    }

    @keyframes fadeSlideIn {
        from { opacity: 0; transform: translateY(-25px); }
        to { opacity: 1; transform: translateY(0); }
    }

    h2 {
        text-align: center;
        color: #fff;
        margin-bottom: 25px;
        font-weight: 700;
        font-size: 26px;
        letter-spacing: 1px;
    }

    label {
        display: block;
        margin-bottom: 6px;
        font-size: 14px;
        color: #eee;
        font-weight: 500;
    }

    input, select {
        width: 100%;
        padding: 12px 14px;
        font-size: 15px;
        border: none;
        border-radius: 8px;
        margin-bottom: 6px;
        background: rgba(255, 255, 255, 0.2);
        color: #fff;
    }

    input:focus, select:focus {
        outline: none;
        border: 2px solid #00f2fe;
        background: rgba(255,255,255,0.3);
        box-shadow: 0 0 10px rgba(0,242,254,0.6);
    }

    select option {
        background: #333;
        color: #fff;
    }

    .error {
        color: #ff6b6b;
        font-size: 12px;
        margin-bottom: 12px;
        display: block;
    }

    .valid {
        border: 2px solid #28a745 !important;
        box-shadow: 0 0 8px rgba(40, 167, 69, 0.6) !important;
    }

    .invalid {
        border: 2px solid #ff4d4d !important;
        box-shadow: 0 0 8px rgba(255, 77, 77, 0.6) !important;
    }

    input[type="file"] {
        margin-bottom: 18px;
        background: rgba(255,255,255,0.15);
        padding: 10px;
        border-radius: 8px;
        border: 1px dashed #aaa;
        cursor: pointer;
        color: #fff;
    }

    input[type="file"]:hover {
        border-color: #00f2fe;
        background-color: rgba(0,242,254,0.2);
    }

    input[type="submit"] {
        width: 100%;
        padding: 14px;
        background: linear-gradient(to right, #4facfe, #00f2fe);
        border: none;
        color: white;
        font-size: 16px;
        font-weight: 600;
        border-radius: 8px;
        cursor: pointer;
        box-shadow: 0 6px 20px rgba(0, 242, 254, 0.5);
        letter-spacing: 1px;
        margin-top: 10px;
    }

    input[type="submit"]:hover {
        background: linear-gradient(to left, #4facfe, #00f2fe);
        transform: translateY(-2px) scale(1.02);
        box-shadow: 0 8px 24px rgba(0, 242, 254, 0.7);
    }

    .footer {
        text-align: center;
        font-size: 12px;
        color: #ddd;
        margin-top: 20px;
    }
</style>
</head>
<body>

<div class="container">
    <h2>Student Registration Form</h2>
    <form id="regForm" action="saveReg" method="post" enctype="multipart/form-data" novalidate>
        <label for="fullname">Full Name</label>
        <input type="text" id="fullname" name="fullName" placeholder="Enter your full name">
        <span class="error" id="fullnameError"></span>

        <label for="roll">Roll Number</label>
        <input type="text" id="roll" name="roll" placeholder="Enter roll number">
        <span class="error" id="rollError"></span>

        <label for="course">Course</label>
        <select id="course" name="course">
            <option value="">Select course</option>
            <option value="BCA">BCA</option>
            <option value="B.Tech">B.Tech</option>
            <option value="MCA">MCA</option>
            <option value="MBA">MBA</option>
        </select>
        <span class="error" id="courseError"></span>

        <label for="semester">Semester</label>
        <select id="semester" name="semester">
            <option value="">Select semester</option>
            <option value="1st">1st</option>
            <option value="2nd">2nd</option>
            <option value="3rd">3rd</option>
            <option value="4th">4th</option>
            <option value="5th">5th</option>
            <option value="6th">6th</option>
            <option value="7th">7th</option>
            <option value="8th">8th</option>
        </select>
        <span class="error" id="semesterError"></span>

        <label for="dob">Date of Birth</label>
        <input type="date" id="dob" name="dob">
        <span class="error" id="dobError"></span>

        <label for="email">Email</label>
        <input type="email" id="email" name="email" placeholder="Enter your email">
        <span class="error" id="emailError"></span>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Create password">
        <span class="error" id="passwordError"></span>

        <label for="gender">Gender</label>
        <select id="gender" name="gender">
            <option value="">Select gender</option>
            <option value="male">Male</option>
            <option value="female">Female</option>
            <option value="other">Other</option>
        </select>
        <span class="error" id="genderError"></span>

        <label for="city">City</label>
        <input type="text" id="city" name="city" placeholder="Enter your city">
        <span class="error" id="cityError"></span>

        <label>Upload Image:</label>
        <input type="file" name="image" accept="image/*">
        <span class="error" id="imageError"></span>

        <label>Upload PDF:</label>
        <input type="file" name="pdf" accept="application/pdf">
        <span class="error" id="pdfError"></span>

        <input type="submit" value="Register">
    </form>

    <div class="footer">
        &copy; 2025 EduPortal. All rights reserved.
    </div>
</div>

<c:out value="hello bird" />
${msg}

<script>
document.getElementById("regForm").addEventListener("submit", function(e) {
    let valid = true;

    // Reset errors
    document.querySelectorAll(".error").forEach(el => el.textContent = "");
    document.querySelectorAll("input, select").forEach(el => el.classList.remove("invalid", "valid"));

    // Full name validation
    const fullname = document.getElementById("fullname");
    if(fullname.value.trim() === "") {
        document.getElementById("fullnameError").textContent = "Full name is required";
        fullname.classList.add("invalid"); valid = false;
    } else { fullname.classList.add("valid"); }

    // Roll no
    const roll = document.getElementById("roll");
    if(roll.value.trim() === "") {
        document.getElementById("rollError").textContent = "Roll number is required";
        roll.classList.add("invalid"); valid = false;
    } else { roll.classList.add("valid"); }

    // Course
    const course = document.getElementById("course");
    if(course.value === "") {
        document.getElementById("courseError").textContent = "Please select a course";
        course.classList.add("invalid"); valid = false;
    } else { course.classList.add("valid"); }

    // Semester
    const semester = document.getElementById("semester");
    if(semester.value === "") {
        document.getElementById("semesterError").textContent = "Please select a semester";
        semester.classList.add("invalid"); valid = false;
    } else { semester.classList.add("valid"); }

    // DOB
    const dob = document.getElementById("dob");
    if(dob.value === "") {
        document.getElementById("dobError").textContent = "Date of birth is required";
        dob.classList.add("invalid"); valid = false;
    } else { dob.classList.add("valid"); }

    // Email
    const email = document.getElementById("email");
    const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if(!emailRegex.test(email.value)) {
        document.getElementById("emailError").textContent = "Enter a valid email address";
        email.classList.add("invalid"); valid = false;
    } else { email.classList.add("valid"); }

    // Password
    const password = document.getElementById("password");
    if(password.value.length < 6) {
        document.getElementById("passwordError").textContent = "Password must be at least 6 characters";
        password.classList.add("invalid"); valid = false;
    } else { password.classList.add("valid"); }

    // Gender
    const gender = document.getElementById("gender");
    if(gender.value === "") {
        document.getElementById("genderError").textContent = "Please select gender";
        gender.classList.add("invalid"); valid = false;
    } else { gender.classList.add("valid"); }

    // City
    const city = document.getElementById("city");
    if(city.value.trim() === "") {
        document.getElementById("cityError").textContent = "City is required";
        city.classList.add("invalid"); valid = false;
    } else { city.classList.add("valid"); }

    if(!valid) e.preventDefault();
});
</script>

</body>
</html>
