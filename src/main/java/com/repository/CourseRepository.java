package com.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.entity.Course;
import com.entity.Enrollment;

@Repository
public class CourseRepository {
	@Autowired
	HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public List<Course> getAllCourses() {
		return this.hibernateTemplate.loadAll(Course.class);
	}

	public Course getCourseById(int id) {
		return this.hibernateTemplate.get(Course.class, id);
	}

	@Transactional
	public void updateCourse(Course courseToUpdate) {
		this.hibernateTemplate.update(courseToUpdate);
	}

	@Transactional
	public void addCourse(Course courseToAdd) {
		this.hibernateTemplate.save(courseToAdd);
	}

	@Transactional
	public void deleteCourse(Course course) {
		String hql = "from Enrollment where courseId= ?0";
		List<Enrollment> enrollments = (List<Enrollment>) this.hibernateTemplate.find(hql, course.getId());
		if (!enrollments.isEmpty()) {
			hibernateTemplate.deleteAll(enrollments); // Deletes entire list
		}

		this.hibernateTemplate.delete(course);
	}

	public long getTotalCourses() {
		String hql = "select count(c.id) from Course c";
		List<Long> count = (List<Long>) this.hibernateTemplate.find(hql);
		return count.isEmpty() ? 0 : count.get(0);
	}

	public List<Course> searchCourses(String keyword) {
		keyword = "%" + keyword + "%";

		String hql = "FROM Course c WHERE " + "LOWER(c.title) LIKE LOWER(?0) "
				+ "OR LOWER(c.description) LIKE LOWER(?1)";
		List<Course> courses = (List<Course>) this.hibernateTemplate.find(hql, keyword, keyword);
		return courses;
	}

}
