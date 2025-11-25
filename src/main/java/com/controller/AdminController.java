package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.Admin;
import com.entity.Course;
import com.entity.Student;
import com.service.AdminService;
import com.service.CourseService;
import com.service.StudentService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminService;

	@Autowired
	StudentService studentService;

	@Autowired
	CourseService courseService;

	@RequestMapping(path = "/logout")
	public String logout() {
		return "login/login";
	}

	@RequestMapping(path = "/dashboard")
	public String getDashboard(Model model) {
		model.addAttribute("activePage", "dashboard");
		int totalCourses = courseService.getTotalCourses();
		int totalStudents = this.studentService.getTotalStudents();
		int totalEnrolledStudents = this.studentService.getTotalEnrolledStudents();

		model.addAttribute("totalCourses", totalCourses);
		model.addAttribute("totalStudents", totalStudents);
		model.addAttribute("totalEnrolledStudents", totalEnrolledStudents);
		model.addAttribute("totalNonEnrolledStudents", (totalStudents - totalEnrolledStudents));
		return "admin/index";
	}

	@RequestMapping(path = "/manageCourses")
	public String getManageCourses(Model model) {
		model.addAttribute("activePage", "manageCourses");
		List<Course> courses = courseService.getAllCourses();
		model.addAttribute("courses", courses);
		return "admin/manageCourses";
	}

	@RequestMapping("/searchCourses")
	public String searchCourses(@RequestParam("keyword") String keyword, Model model) {

		List<Course> list = courseService.searchCourses(keyword);
		model.addAttribute("courses", list);
		System.out.println(list);
		return "admin/manageCourses";
	}

	@RequestMapping(path = "/addCourseForm")
	public String addCourseForm(Model model) {
		model.addAttribute("activePage", "manageCourses");
		return "admin/addCourse";
	}

	@RequestMapping(path = "/addCourse")
	public String addCourse(@ModelAttribute("course") Course courseToAdd, Model model) {
		model.addAttribute("activePage", "manageCourses");
		courseService.addCourse(courseToAdd);
		List<Course> courses = courseService.getAllCourses();
		model.addAttribute("courses", courses);
		return "admin/manageCourses";
	}

	@RequestMapping(path = "/courseDetail/{id}")
	public String courseDetail(@PathVariable("id") int id, Model model) {
		model.addAttribute("activePage", "manageCourses");
		Course course = courseService.getCourseById(id);
		model.addAttribute("course", course);
		return "admin/viewCourse";
	}

	@RequestMapping(path = "/updateCoursePage/{id}")
	public String updateCoursePage(@PathVariable("id") int id, Model model) {
		model.addAttribute("activePage", "manageCourses");
		Course course = courseService.getCourseById(id);
		model.addAttribute("course", course);
		return "admin/updateCourse";
	}

	@RequestMapping(path = "/deleteCourse/{id}")
	public String deleteCourse(@PathVariable("id") int id, Model model) {
		model.addAttribute("activePage", "manageCourses");
		Course course = courseService.getCourseById(id);
		this.courseService.deleteCourse(course);
		List<Course> courses = courseService.getAllCourses();
		model.addAttribute("courses", courses);
		return "admin/manageCourses";
	}

	@RequestMapping(path = "/updateCourse")
	public String updateCourse(@ModelAttribute("course") Course courseToUpdate, Model model) {
		model.addAttribute("activePage", "manageCourses");
		courseService.updateCourse(courseToUpdate);
		return "admin/viewCourse";
	}

	@RequestMapping(path = "/myProfile")
	public String getMyProfile(Model model, HttpSession session) {
		model.addAttribute("activePage", "profile");
		Admin a = (Admin) session.getAttribute("adminObj");
		model.addAttribute("admin", a);
		return "admin/myProfile";
	}

	@RequestMapping(path = "/viewStudent/{studentId}")
	public String getMyProfile(@PathVariable("studentId") int studentId, Model model) {
		model.addAttribute("activePage", "students");
		Student student = studentService.getStudentById(studentId);
		List<Course> enrolledCourses = this.studentService.getEnrolledCoursesByStudent(studentId);
		model.addAttribute("student", student);
		model.addAttribute("courses", enrolledCourses);
		return "admin/viewStudent";
	}

	@RequestMapping(path = "/manageStudents")
	public String manageStudents(Model model, HttpSession session) {
		model.addAttribute("activePage", "students");
		Admin a = (Admin) session.getAttribute("adminObj");
		List<Student> students = this.studentService.getAllStudents();
		Map<Integer, Boolean> enrollmentStatus = new HashMap<>();
		for (Student s : students) {
			boolean enrolled = studentService.isStudentEnrolled(s.getId());
			enrollmentStatus.put(s.getId(), enrolled);
		}
		model.addAttribute("enrollmentStatus", enrollmentStatus);

		model.addAttribute("admin", a);
		model.addAttribute("students", students);
		return "admin/studentsList";
	}
}
