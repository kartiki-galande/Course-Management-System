package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.Admin;
import com.entity.Student;
import com.repository.LoginRepository;

@Service
public class LoginService {

	@Autowired
	LoginRepository loginRepository;

	public Admin getIfAdminByMail(String email, String password) {
		return this.loginRepository.getIfAdminByMail(email, password);
	}

	public Student getIfStudentByMail(String email, String password) {
		return this.loginRepository.getIfStudentByMail(email, password);
	}
}
