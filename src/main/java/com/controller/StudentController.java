package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Course;
import com.entity.Enrollment;
import com.entity.PaymentInfo;
import com.entity.Student;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import com.razorpay.Utils;
import com.repository.PaymentInfoRepository;
import com.service.CourseService;
import com.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {
	@Autowired
	StudentService studentService;

	@Autowired
	CourseService courseService;

	@Autowired
	PaymentInfoRepository paymentInfoRepository;

	@RequestMapping(path = "/register")
	public String getRegisterPage() {
		return "student/register";
	}

	@RequestMapping(path = "/dashboard")
	public String getDashboard(Model model, HttpSession session) {
		int totalCourses = courseService.getTotalCourses();
		Student s = (Student) session.getAttribute("studentObj");
		int totalEnrolledCourses = studentService.getTotalEnrolledCourses(s.getId());

		model.addAttribute("totalCourses", totalCourses);
		model.addAttribute("totalEnrolledCourses", totalEnrolledCourses);
		model.addAttribute("activePage", "dashboard");

		return "student/index";
	}

	@RequestMapping(path = "/registerStudent")
	public String studentRegister(@ModelAttribute Student student, Model model) {
		Boolean isPresent = this.studentService.getIfPersonExistsByEmail(student.getEmail());
		if (isPresent) {
			model.addAttribute("msg", "Email already used!");
			return "student/register";
		} else {
			this.studentService.registerStudent(student);
		}
		return "login/login";
	}

	@RequestMapping(path = "/allCourses")
	public String getAllCourses(Model model, HttpSession session) {
		model.addAttribute("activePage", "allcourses");
		Student s = (Student) session.getAttribute("studentObj");
		List<Enrollment> enrollments = studentService.getAllEnrollmentsByStudentId(s.getId());
		List<Integer> courseIds = enrollments.stream().map(Enrollment::getCourseId).collect(Collectors.toList());

		List<Course> courses = courseService.getAllCourses();
		model.addAttribute("courses", courses);
		model.addAttribute("courseIds", courseIds);
		return "student/allCourses";
	}

	@RequestMapping(path = "/courseDetail/{id}/{isEnrolled}")
	public String courseDetail(@PathVariable("isEnrolled") boolean isEnrolled, @PathVariable("id") int id,
			Model model) {
		model.addAttribute("activePage", "allcourses");
		Course course = courseService.getCourseById(id);
		model.addAttribute("course", course);
		model.addAttribute("isEnrolled", isEnrolled);
		return "student/viewCourse";
	}

	@RequestMapping(path = "/pay/{courseId}")
	public String paymentPage(@PathVariable int courseId, HttpSession session, Model model) {
		model.addAttribute("activePage", "allcourses");
		Student s = (Student) session.getAttribute("studentObj");
		model.addAttribute("student", s);
		Course course = courseService.getCourseById(courseId);
		model.addAttribute("course", course);
		return "student/paymentPage";
	}

	@RequestMapping("/student/createOrder")
	@ResponseBody
	public Map<String, Object> createOrder(@RequestParam int courseId, @RequestParam String studentEmail) throws RazorpayException {

		Course c = courseService.getCourseById(courseId);

		int amount = (int) (c.getPrice() * 100);
		// Razorpay uses paise

		RazorpayClient client = new RazorpayClient("KEY", "SECRET");

		JSONObject orderRequest = new JSONObject();
		orderRequest.put("amount", amount);
		orderRequest.put("currency", "INR");
		orderRequest.put("receipt", "order_" + courseId);

		Order order = client.orders.create(orderRequest);

		Map<String, Object> response = new HashMap<>();
		response.put("key", "KEY");
		response.put("orderId", order.get("id"));
		response.put("amount", amount);
		return response;
	}

	@RequestMapping("/student/verifyPayment")
	@ResponseBody
	public String verifyPayment(@RequestParam String orderId, @RequestParam String paymentId,
			@RequestParam String signature, @RequestParam int amount, @RequestParam String email,
			@RequestParam int courseId,HttpSession session)
			throws RazorpayException {

		String generatedSignature = Utils.getHash(orderId + "|" + paymentId, "SECRET");

		if (!generatedSignature.equals(signature)) {
			return "fail";
		}

		// store in DB
		PaymentInfo payment = new PaymentInfo(0, orderId, paymentId, "PAID", amount / 100, email);
		paymentInfoRepository.save(payment);
		Student s = (Student) session.getAttribute("studentObj");
		studentService.enrollStudent(s.getId(), courseId);

		return "success";
	}

	@RequestMapping("/paymentSuccess")
	public String paymentSuccess() {
		return "student/paymentSuccess";
	}

	@RequestMapping("/paymentFailed")
	public String paymentFailed() {
		return "student/paymentFailed";
	}

	@RequestMapping("/enroll/{courseId}")
	public String enroll(@PathVariable int courseId, HttpSession session, Model model) {
		model.addAttribute("activePage", "allcourses");
		Student s = (Student) session.getAttribute("studentObj");
		studentService.enrollStudent(s.getId(), courseId);
		return "redirect:/student/allCourses";
	}

	@RequestMapping(path = "/enrolledCourses")
	public String getEnrolledCourses(Model model, HttpSession session) {
		model.addAttribute("activePage", "enrolled");
		Student s = (Student) session.getAttribute("studentObj");
		List<Course> courses = this.studentService.getEnrolledCoursesByStudent(s.getId());
		model.addAttribute("enrolledCourses", courses);
		return "student/enrolledCourses";
	}

	@RequestMapping(path = "/unenroll/{courseId}")
	public String unenrollCourse(@PathVariable("courseId") int courseId, Model model, HttpSession session) {
		model.addAttribute("activePage", "enrolled");
		Student s = (Student) session.getAttribute("studentObj");
		boolean isUnenrolled = this.studentService.unenrollCourse(courseId, s.getId());
		List<Course> courses = this.studentService.getEnrolledCoursesByStudent(s.getId());
		model.addAttribute("enrolledCourses", courses);
		return "student/enrolledCourses";
	}

	@RequestMapping(path = "/enrolledCourseDetails/{courseId}")
	public String getEnrolledCourseDetails(@PathVariable("courseId") int courseId, Model model, HttpSession session) {
		model.addAttribute("activePage", "enrolled");
		Student s = (Student) session.getAttribute("studentObj");
		Enrollment enrollment = studentService.getEnrollmentByStudentAndCourseId(s.getId(), courseId);

		model.addAttribute("enrollment", enrollment);
		Course course = courseService.getCourseById(courseId);
		model.addAttribute("course", course);
		return "student/enrolledCourseDetails";
	}

	@RequestMapping(path = "/myProfile")
	public String getMyProfile(Model model, HttpSession session) {
		model.addAttribute("activePage", "profile");
		Student s = (Student) session.getAttribute("studentObj");
		model.addAttribute("student", s);
		return "student/myProfile";
	}

	@RequestMapping(path = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login/login";
	}

}
