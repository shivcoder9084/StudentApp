<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Registration List</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: linear-gradient(to right, #fbc2eb, #a6c1ee);
            min-height: 100vh;
            padding: 30px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .top-btn {
            margin-bottom: 20px;
        }

        .top-btn a {
            background: linear-gradient(to right, #00c6ff, #0072ff);
            color: white;
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: bold;
            text-decoration: none;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

       .table-container {
    width: 100%;
    max-width: 100%;
    margin-top: 20px;
}

       table {
    width: 100%;
    table-layout: fixed; /* Prevents overflow by breaking long text */
    border-collapse: collapse;
    background: rgba(255, 255, 255, 0.9);
    backdrop-filter: blur(8px);
    border-radius: 12px;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
    word-wrap: break-word;
}

       td, th {
    word-break: break-word;
}

        th {
            background: linear-gradient(90deg, #667eea, #764ba2);
            color: white;
            text-transform: uppercase;
        }

        tr:hover {
            background-color: #f1f5ff;
        }

        img {
            width: 50px;
            height: 50px;
            object-fit: cover;
            border-radius: 6px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .action-btn {
            padding: 6px 14px;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            text-decoration: none;
            color: white;
            display: inline-block;
        }

        .edit-btn {
            background: linear-gradient(to right, #00b09b, #96c93d);
        }

        .delete-btn {
            background: linear-gradient(to right, #ff416c, #ff4b2b);
        }

        .edit-btn:hover, .delete-btn:hover {
            opacity: 0.9;
            transform: scale(1.05);
        }

        .pdf-link {
            color: #0072ff;
            font-weight: 600;
            text-decoration: none;
        }

        .pdf-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }

            thead tr {
                display: none;
            }

            tr {
                margin-bottom: 20px;
                border-radius: 10px;
                border: 1px solid #ddd;
                padding: 10px;
                background: white;
            }

            td {
                text-align: left;
                padding: 10px;
                border: none;
                position: relative;
                  overflow-wrap: anywhere;
            }

            td::before {
                content: attr(data-label);
                font-weight: bold;
                display: block;
                margin-bottom: 5px;
                color: #333;
            }
        }
    </style>
</head>
<body>

<div class="top-btn">
    <a href="studentReg">Register Here</a>
</div>

<div class="table-container">
    <table>
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
                        <img src="${student.imagePath}" alt="Student Image" />
                    </td>
                    <td data-label="PDF">
                        <a href="${student.pdfPath}" class="pdf-link" target="_blank">View PDF</a>
                    </td>
                    <td data-label="Edit">
                        <a href="editReg?id=${student.id}" class="action-btn edit-btn" 
                           onclick="return confirm('Are you sure you want to edit this record?')">Edit</a>
                    </td>
                    <td data-label="Delete">
                        <a href="deleteReg?id=${student.id}" class="action-btn delete-btn" 
                           onclick="return confirm('Are you sure you want to delete this record?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
