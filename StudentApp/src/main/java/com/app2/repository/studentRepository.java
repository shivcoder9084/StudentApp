package com.app2.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app2.entity.Student;

public interface studentRepository extends JpaRepository<Student, Long> {

}
