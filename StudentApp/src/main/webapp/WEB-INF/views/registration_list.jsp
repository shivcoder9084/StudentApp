<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Registration List</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-gradient-light: linear-gradient(135deg, #fbc2eb, #a6c1ee);
            --bg-gradient-dark: linear-gradient(135deg, #1f1f2e, #2c2c3d);
            --table-bg-light: rgba(255, 255, 255, 0.2);
            --table-bg-dark: rgba(0,0,0,0.4);
            --text-color-light: #000;
            --text-color-dark: #fff;
        }

        body {
            background: var(--bg-gradient-light);
            min-height: 100vh;
            padding: 30px;
            display: flex;
            flex-direction: column;
            align-items: center;
            overflow-x: hidden;
            position: relative;
            color: var(--text-color-light);
            transition: all 0.5s ease;
        }

        body.dark-mode {
            background: var(--bg-gradient-dark);
            color: var(--text-color-dark);
        }

        /* Background floating blobs */
        body::before, body::after {
            content: '';
            position: absolute;
            width: 400px;
            height: 400px;
            border-radius: 50%;
            background: radial-gradient(circle at center, rgba(255,255,255,0.4), transparent);
            z-index: 0;
        }
        body.dark-mode::before {
            background: radial-gradient(circle at center, rgba(255,255,255,0.1), transparent);
        }
        body::after {
            right: 10%;
            top: 10%;
            background: radial-gradient(circle at center, rgba(0, 114, 255, 0.25), transparent);
        }
        body.dark-mode::after {
            background: radial-gradient(circle at center, rgba(255,255,255,0.05), transparent);
        }

        /* Top buttons */
        .top-btns {
            display: flex;
            gap: 15px;
            margin-bottom: 25px;
            z-index: 1;
        }

        .top-btns a, .dark-toggle {
            background: linear-gradient(135deg, #00c6ff, #0072ff);
            color: white;
            padding: 14px 28px;
            border-radius: 12px;
            font-weight: bold;
            text-decoration: none;
            position: relative;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0,0,0,0.25);
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }

        .top-btns a:hover, .dark-toggle:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 12px 25px rgba(0,0,0,0.35);
        }

        /* Table container */
        .table-container {
            width: 100%;
            overflow-x: auto;
            margin-top: 20px;
            z-index: 1;
        }

        /* Glassmorphism table */
        table {
            width: 100%;
            border-collapse: collapse;
            background: var(--table-bg-light);
            backdrop-filter: blur(14px);
            border-radius: 16px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.25);
            overflow: hidden;
        }

        body.dark-mode table {
            background: var(--table-bg-dark);
        }

        th, td {
            padding: 16px;
            text-align: center;
            word-break: break-word;
            font-size: 14px;
        }

        th {
            background: linear-gradient(90deg, #667eea, #764ba2);
            color: white;
            text-transform: uppercase;
            position: sticky;
            top: 0;
            z-index: 2;
            font-size: 13px;
            letter-spacing: 1px;
        }

        tbody tr {
            transition: transform 0.25s ease, background 0.25s ease;
        }
        tbody tr:nth-child(odd) {
            background-color: rgba(255, 255, 255, 0.3);
        }
        tbody tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.15);
        }
        tbody tr:hover {
            background: rgba(255,255,255,0.6);
            transform: scale(1.015);
            box-shadow: 0 6px 15px rgba(0,0,0,0.15);
        }
        body.dark-mode tbody tr:nth-child(odd) {
            background-color: rgba(255,255,255,0.1);
        }
        body.dark-mode tbody tr:nth-child(even) {
            background-color: rgba(255,255,255,0.05);
        }

        /* Images */
        img {
            width: 55px;
            height: 55px;
            object-fit: cover;
            border-radius: 50%;
            box-shadow: 0 3px 10px rgba(0,0,0,0.25);
            cursor: pointer;
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }
        img:hover {
            transform: scale(1.25);
            box-shadow: 0 6px 15px rgba(0,0,0,0.35);
        }

        /* Tooltip */
        td[data-label="Image"] {
            position: relative;
        }
        td[data-label="Image"] img::after {
            content: attr(alt);
            position: absolute;
            bottom: -25px;
            left: 50%;
            transform: translateX(-50%);
            background: #333;
            color: white;
            font-size: 12px;
            padding: 4px 8px;
            border-radius: 6px;
            opacity: 0;
            white-space: nowrap;
            pointer-events: none;
            transition: opacity 0.3s;
        }
        td[data-label="Image"]:hover img::after {
            opacity: 1;
        }

        /* Action Buttons */
        .action-btn {
            padding: 8px 16px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            text-decoration: none;
            color: white;
            display: inline-block;
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }
        .edit-btn {
            background: linear-gradient(to right, #00b09b, #96c93d);
        }
        .delete-btn {
            background: linear-gradient(to right, #ff416c, #ff4b2b);
        }
        .edit-btn:hover, .delete-btn:hover {
            transform: scale(1.12);
            box-shadow: 0 6px 15px rgba(0,0,0,0.25);
        }

        /* PDF link */
        .pdf-link {
            color: #0072ff;
            font-weight: 600;
            text-decoration: none;
        }
        .pdf-link:hover {
            text-decoration: underline;
            color: #ff416c;
        }

        /* Mobile view */
        @media (max-width: 768px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }
            thead tr { display: none; }
            tr {
                margin-bottom: 20px;
                border-radius: 10px;
                border: 1px solid #ddd;
                padding: 12px;
                background: rgba(255,255,255,0.4);
            }
            td {
                text-align: left;
                padding: 14px;
                border: none;
                position: relative;
            }
            td::before {
                content: attr(data-label);
                font-weight: bold;
                display: block;
                margin-bottom: 6px;
                color: #333;
            }
        }
    </style>
</head>
<body>

<div class="top-btns">
    <a href="studentReg">➕ Register Here</a>
    <a href="loginform">🔑 Login</a>
    <button class="dark-toggle" onclick="toggleDarkMode()">🌙 Dark Mode</button>
</div>

<div class="table-container">
    <table id="studentTable">
        <thead>
            <tr>
                <th>S.No</th>
                <th>Name</th>
                <th>Roll Number</th>
                <th>Course</th>
                <th>Semester</th>
                <th>Date of Birth</th>
                <th>Email</th>
                <th>Gender</th>
                <th>City</th>
                <th>Image</th>
                <th>PDF</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="student" items="${students}" varStatus="loop">
                <tr>
                    <td data-label="S.No">${loop.index + 1}</td>
                    <td data-label="Name">${student.fullName}</td>
                    <td data-label="Roll Number">${student.roll}</td>
                    <td data-label="Course">${student.course}</td>
                    <td data-label="Semester">${student.semester}</td>
                    <td data-label="DOB">${student.dob}</td>
                    <td data-label="Email">${student.email}</td>
                    <td data-label="Gender">${student.gender}</td>
                    <td data-label="City">${student.city}</td>
                    <td data-label="Image">
                        <img src="${student.imagePath}" alt="${student.fullName}" />
                    </td>
                    <td data-label="PDF">
                        <a href="${student.pdfPath}" class="pdf-link" target="_blank">📄 View PDF</a>
                    </td>
                    <td data-label="Edit">
                        <a href="editReg?id=${student.id}" class="action-btn edit-btn" 
                           onclick="return confirm('Are you sure you want to edit this record?')">✏️ Edit</a>
                    </td>
                    <td data-label="Delete">
                        <a href="deleteReg?id=${student.id}" class="action-btn delete-btn" 
                           onclick="return confirm('Are you sure you want to delete this record?')">🗑 Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- GSAP CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.14.1/gsap.min.js"></script>
<script>
    function toggleDarkMode() {
        document.body.classList.toggle('dark-mode');
    }

    // GSAP Animations
    window.onload = function() {
        // Animate blobs
        gsap.to("body::before", {y:-50, repeat:-1, yoyo:true, duration:10, ease:"sine.inOut"});
        gsap.to("body::after", {y:40, repeat:-1, yoyo:true, duration:12, ease:"sine.inOut"});

        // Animate table rows on load
        gsap.from("#studentTable tbody tr", {
            opacity:0, 
            y:30, 
            stagger:0.1, 
            duration:0.8, 
            ease:"power2.out"
        });

        // Animate buttons
        gsap.from(".top-btns a, .dark-toggle", {
            opacity:0,
            y:-20,
            stagger:0.1,
            duration:0.6,
            ease:"power2.out"
        });
    };
</script>

</body>
</html>
