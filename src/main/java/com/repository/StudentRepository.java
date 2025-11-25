package com.repository;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.entity.Admin;
import com.entity.Course;
import com.entity.Enrollment;
import com.entity.Student;

@Repository
public class StudentRepository {

	@Autowired
	HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public boolean getIfPersonExistsByEmail(String email) {
		String hql = "from Student where email = :email";
		String[] names = { "email" };
		Object[] values = { email };
		List<Student> students = (List<Student>) this.hibernateTemplate.findByNamedParam(hql, names, values);

		if (students.size() > 0) {
			return true;
		} else {
			hql = "from Admin where email = ?0";
			List<Admin> admins = (List<Admin>) this.hibernateTemplate.find(hql, email);

			if (admins.size() > 0) {
				return true;
			}
		}
		return false;
	}

	@Transactional
	public void registerStudent(Student student) {
		BCryptPasswordEncoder brcyBCryptPasswordEncoder = new BCryptPasswordEncoder();
		// Set new password and encode it
		String password = student.getPassword();
		student.setPassword(brcyBCryptPasswordEncoder.encode(password));
		this.hibernateTemplate.save(student);
	}

	@Transactional
	public boolean enrollStudent(int studentId, int courseId) {
		String hql = "from Enrollment where studentId = ?0 and courseId = ?1";
		List<Enrollment> list = (List<Enrollment>) hibernateTemplate.find(hql, studentId, courseId);

		if (!list.isEmpty()) {
			return false; // already enrolled
		}
		Enrollment enrollment = new Enrollment();
		enrollment.setEnrollmentDate(LocalDate.now());
		enrollment.setCourseId(courseId);
		enrollment.setStudentId(studentId);
		this.hibernateTemplate.save(enrollment);
		return true;
	}

	public Student getStudentById(int studentId) {
		return this.hibernateTemplate.get(Student.class, studentId);
	}

	public List<Enrollment> getAllEnrollmentsByStudentId(int studentId) {
		String hql = "from Enrollment where studentId= ?0";
		List<Enrollment> list = (List<Enrollment>) this.hibernateTemplate.find(hql, studentId);
		return list.isEmpty() ? new ArrayList<Enrollment>() : list;
	}

	public List<Course> getEnrolledCoursesByStudent(int studentId) {
		String hql = "select courseId from Enrollment where studentId= ?0";
		List<Integer> courseIds = (List<Integer>) this.hibernateTemplate.find(hql, studentId);
		List<Course> courses = null;
		if(!courseIds.isEmpty()) {
		hql = "from Course where id IN (:courseIds)";
		courses = (List<Course>) this.hibernateTemplate.findByNamedParam(hql, "courseIds", courseIds);
		}
		return courses;
	}

	@Transactional
	public boolean unenrollCourse(int courseId, int studentId) {
		String hql = "from Enrollment where studentId = ?0 and courseId = ?1";
		List<Enrollment> enrollments = (List<Enrollment>) hibernateTemplate.find(hql, studentId, courseId);
		if(!enrollments.isEmpty()) {
			this.hibernateTemplate.deleteAll(enrollments);
		}
		return false;
	}

	public List<Student> getAllStudents() {
		return this.hibernateTemplate.loadAll(Student.class);
	}

	public boolean isStudentEnrolled(int studentId) {
		String hql = "select count(e.id) from Enrollment e where e.studentId = ?0";
		Long count = (Long) hibernateTemplate.find(hql, studentId).get(0);
		boolean enrolled = count > 0;
		return enrolled;
	}

	public long getTotalStudents() {
		String hql = "select count(s.id) from Student s";
		List<Long> count = (List<Long>)this.hibernateTemplate.find(hql);
		return count.isEmpty() ? 0 : count.get(0);
	}

	public long getTotalEnrolledStudents() {
		//SELECT count(distinct e.studentId) FROM course_management.enrollment e;
		String hql = "select count(distinct e.studentId) from Enrollment e";
		List<Long> count = (List<Long>)this.hibernateTemplate.find(hql);
		return count.isEmpty() ? 0 : count.get(0);
	}

	public long getTotalEnrolledCourses(int studentId) {
		String hql = "select count(distinct courseId) from Enrollment where studentId= ?0";
		List<Long> count = (List<Long>) this.hibernateTemplate.find(hql, studentId);
		return count.isEmpty() ? 0 : count.get(0);
	}

	public Enrollment getEnrollmentByStudentAndCourseId(int studentId, int courseId) {
		String hql = "from Enrollment where studentId = ?0 and courseId = ?1";
		List<Enrollment> list = (List<Enrollment>) hibernateTemplate.find(hql, studentId, courseId);
		return list.isEmpty() ? null : list.get(0);
	}
}
