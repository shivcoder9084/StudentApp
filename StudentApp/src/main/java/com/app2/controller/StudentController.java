 package com.app2.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.app2.entity.Student;
import com.app2.service.studentService;
import com.app2.utils.EmailSender;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class StudentController {
	@Autowired
	private studentService studentservice;
	
	@Autowired
	private EmailSender emailSender;
	
	@RequestMapping("/studentReg")
	public String studentRegistration() {
		return "Registration";
	}
	
//  my name is shivansh rastogi and i am java devloper 	@RequestMapping("/saveReg")
//	public String saveRegistrations(@ModelAttribute Student student, ModelMap model ) {
//		String message=studentservice.saveRegistrationData(student);
//		model.addAttribute("msg", message);
//		return "Registration";  
//	}
	
	
	@RequestMapping("/saveReg")
	public String saveRegistrations(
	        @ModelAttribute Student student,
	        @RequestParam("image") MultipartFile imageFile,
	        @RequestParam("pdf") MultipartFile pdfFile,
	        HttpServletRequest request,
	        ModelMap model) {

	    try {
	        // Folder path on disk (inside /webapp/uploads/)
	        String uploadDir = request.getServletContext().getRealPath("/uploads/");
	        File dir = new File(uploadDir);
	        if (!dir.exists()) dir.mkdirs();

	        // Save image
	        String imageName = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename();
	        imageFile.transferTo(new File(uploadDir + File.separator + imageName));
	        student.setImagePath("uploads/" + imageName);

	        // Save PDF
	        String pdfName = System.currentTimeMillis() + "_" + pdfFile.getOriginalFilename();
	        pdfFile.transferTo(new File(uploadDir + File.separator + pdfName));
	        student.setPdfPath("uploads/" + pdfName);

	        // Save to DB
	        String message = studentservice.saveRegistrationData(student);
	        emailSender.sendEmail("shivanshrastogimzn2002@gmail.com", "email integration", "welcome you are sucessfully registred");
	        model.addAttribute("msg", message);

	    } catch (Exception e) {
	        e.printStackTrace();
	        emailSender.sendEmail("shivanshrastogimzn2002@gmail.com", "email integration", "welcome you are not  sucessfully registred");
	        model.addAttribute("msg", "Failed to upload files.");
	    }

	    return "Registration";
	}

	
	@RequestMapping("/getList")
	public String getRegistrationList(ModelMap model) {
	List<Student>student=studentservice.getRegistrationList();
	model.addAttribute("students", student);
	return "registration_list";
	}
	
	@RequestMapping("/deleteReg")
	public String deleteRegistrationById(@RequestParam long id, ModelMap model) {
		studentservice.deleteRegistrtionById(id);
		List<Student>student=studentservice.getRegistrationList();
		model.addAttribute("students", student);
		
		return "redirect:/getList";

	}
	
	@RequestMapping("/editReg")
	public String editRegistrationById(@RequestParam() long id, ModelMap model) {
		Student student=studentservice.getDataEditRegistration(id);
	      model.addAttribute("student", student);
	      return "updateRegistration";
	}
	
	@RequestMapping("/updateReg")
	public String updateRegistration(Student student) {
		studentservice.updateRegistration(student);
		  return "redirect:/getList";
	}
	
	@RequestMapping("/loginform")
	public String loginForm() {
		return "login";
	}
	
	@RequestMapping("/loginStudent")
	public String loginStudent(@RequestParam() String email, @RequestParam() String password, ModelMap model) {
		boolean value=studentservice.loginByEmail(email, password);
		if(value) {
			model.addAttribute("msg", "Welcome to the home page ");
			return "home";
		}
		else {
			model.addAttribute("msg","invaild username or password");
			return "login";
		}
	}
	
	

}
