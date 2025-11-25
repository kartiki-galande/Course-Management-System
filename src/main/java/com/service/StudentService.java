package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.Course;
import com.entity.Enrollment;
import com.entity.Student;
import com.repository.StudentRepository;

@Service
public class StudentService {
	@Autowired
	StudentRepository studentRepository;

	public boolean getIfPersonExistsByEmail(String email) {
		return this.studentRepository.getIfPersonExistsByEmail(email);
	}

	public void registerStudent(Student student) {
		this.studentRepository.registerStudent(student);
	}

	public boolean enrollStudent(int studentId, int courseId) {
		return this.studentRepository.enrollStudent(studentId, courseId);
	}

	public Student getStudentById(int studentId) {
		return this.studentRepository.getStudentById(studentId);
	}

	public List<Enrollment> getAllEnrollmentsByStudentId(int studentId) {
		return this.studentRepository.getAllEnrollmentsByStudentId(studentId);
	}

	public List<Course> getEnrolledCoursesByStudent(int studentId) {
		return this.studentRepository.getEnrolledCoursesByStudent(studentId);
	}

	public boolean unenrollCourse(int courseId, int studentId) {
		return this.studentRepository.unenrollCourse(courseId,studentId);
	}

	public List<Student> getAllStudents() {
		return this.studentRepository.getAllStudents();
	}

	public boolean isStudentEnrolled(int studentId) {
		return this.studentRepository.isStudentEnrolled(studentId);
	}

	public int getTotalStudents() {
		return (int) this.studentRepository.getTotalStudents();
	}

	public int getTotalEnrolledStudents() {
		return (int) this.studentRepository.getTotalEnrolledStudents();
	}

	public int getTotalEnrolledCourses(int studentId) {
		return (int) this.studentRepository.getTotalEnrolledCourses(studentId);
	}

	public Enrollment getEnrollmentByStudentAndCourseId(int studentId, int courseId) {
		return this.studentRepository.getEnrollmentByStudentAndCourseId(studentId, courseId);
	}
}
