package com.app2.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app2.entity.Student;
import com.app2.repository.studentRepository;

@Service
public class studentService {
     
	@Autowired
	private studentRepository studentRepo;
	
	public String saveRegistrationData(Student student) {
		// TODO Auto-generated method stub
		studentRepo.save(student);
		return "data saved";
		
	}

	public List<Student> getRegistrationList() {
		// TODO Auto-generated method stub
		List<Student> student = studentRepo.findAll();
		return student;
		
		
		
	}

	public void deleteRegistrtionById(long id) {
		// TODO Auto-generated method stub
		studentRepo.deleteById(id);
		
	}

	public Student getDataEditRegistration(long id) {
		Optional<Student> student = studentRepo.findById(id);
		if(student.isPresent()) {
			Student student2 = student.get();
			return student2;
		}
		else {
			return null;
		}
	}

	public void updateRegistration(Student student) {
		studentRepo.save(student);
		
	}

	public boolean loginByEmail(String email, String password) {
		// TODO Auto-generated method stub
		Student student=studentRepo.findByEmailAndPassword(email, password);
		return student != null;
		
	}
	

}
