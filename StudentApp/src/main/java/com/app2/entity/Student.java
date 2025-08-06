package com.app2.entity;

import jakarta.persistence.*;

@Entity
@Table(name="student")
public class Student {
	@Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)  // Use strategy if your DB auto-increments ID
	    private long id;

	    @Column(name = "full_name", nullable = false)
	    private String fullName;

	    @Column(name = "roll", unique = true, nullable = false)
	    private String roll;

	    @Column(name = "course")
	    private String course;

	    @Column(name = "semester")
	    private String semester;
	    
	    @Column(name="image_path")
	    private String imagePath;
	    
	    @Column(name="pdf_path")
	    private String pdfPath;

	    public long getId() {
			return id;
		}

		public void setId(long id) {
			this.id = id;
		}

		public String getFullName() {
			return fullName;
		}

		public void setFullName(String fullName) {
			this.fullName = fullName;
		}

		public String getRoll() {
			return roll;
		}

		public void setRoll(String roll) {
			this.roll = roll;
		}

		public String getCourse() {
			return course;
		}

		public void setCourse(String course) {
			this.course = course;
		}

		public String getSemester() {
			return semester;
		}

		public void setSemester(String semester) {
			this.semester = semester;
		}

		public String getDob() {
			return dob;
		}

		public void setDob(String dob) {
			this.dob = dob;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getGender() {
			return gender;
		}

		public void setGender(String gender) {
			this.gender = gender;
		}

		public String getCity() {
			return city;
		}

		public void setCity(String city) {
			this.city = city;
		}

		@Column(name = "dob")
	    private String dob;

	    @Column(name = "email", unique = true, nullable = false)
	    private String email;

	    @Column(name = "password", nullable = false)
	    private String password;

	    @Column(name = "gender")
	    private String gender;

	    @Column(name = "city")
	    private String city;

		public String getImagePath() {
			return imagePath;
		}

		public void setImagePath(String imagePath) {
			this.imagePath = imagePath;
		}

		public String getPdfPath() {
			return pdfPath;
		}

		public void setPdfPath(String pdfPath) {
			this.pdfPath = pdfPath;
		}

		
}
