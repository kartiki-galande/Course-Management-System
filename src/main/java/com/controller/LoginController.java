package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.entity.Admin;
import com.entity.Student;
import com.model.LoginRequest;
import com.service.CourseService;
import com.service.LoginService;
import com.service.StudentService;

@Controller
public class LoginController {

	@Autowired
	LoginService loginService;

	@Autowired
	CourseService courseService;

	@Autowired
	StudentService studentService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@RequestMapping("/login")
	public String getLoginPage() {
		return "login/login";
	}

	@RequestMapping(path = "/loginCheck", method = RequestMethod.POST)
	public String getWelcomePage(@ModelAttribute LoginRequest loginRequest, Model model, HttpSession session) {

		Admin admin = this.loginService.getIfAdminByMail(loginRequest.getEmail(), loginRequest.getPassword());

		if (admin != null && passwordEncoder.matches(loginRequest.getPassword(), admin.getPassword())) {
			model.addAttribute("activePage", "dashboard");

			int totalCourses = courseService.getTotalCourses();
			int totalStudents = this.studentService.getTotalStudents();
			int totalEnrolledStudents = this.studentService.getTotalEnrolledStudents();

			model.addAttribute("totalCourses", totalCourses);
			model.addAttribute("totalStudents", totalStudents);
			model.addAttribute("totalEnrolledStudents", totalEnrolledStudents);
			model.addAttribute("totalNonEnrolledStudents", (totalStudents - totalEnrolledStudents));

			session.setAttribute("adminObj", admin);
			return "admin/index";
		} else {
			Student student = this.loginService.getIfStudentByMail(loginRequest.getEmail(), loginRequest.getPassword());
			if (student != null && passwordEncoder.matches(loginRequest.getPassword(), student.getPassword())) {
				model.addAttribute("activePage", "dashboard");
				session.setAttribute("studentObj", student);

				int totalCourses = courseService.getTotalCourses();
				int totalEnrolledCourses = studentService.getTotalEnrolledCourses(student.getId());

				model.addAttribute("totalCourses", totalCourses);
				model.addAttribute("totalEnrolledCourses", totalEnrolledCourses);
				return "student/index";
			}
			model.addAttribute("msg", "Invalid email or password!");
			return "login/login";
		}
	}
}
