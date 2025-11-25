package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.Course;
import com.repository.CourseRepository;

@Service
public class CourseService {
	@Autowired
	CourseRepository courseRepository;

	public List<Course> getAllCourses() {
		return this.courseRepository.getAllCourses();
	}

	public Course getCourseById(int id) {
		return this.courseRepository.getCourseById(id);
	}

	public void updateCourse(Course courseToUpdate) {
		this.courseRepository.updateCourse(courseToUpdate);
	}

	public void addCourse(Course courseToAdd) {
		this.courseRepository.addCourse(courseToAdd);
	}

	public void deleteCourse(Course course) {
		this.courseRepository.deleteCourse(course);
	}

	public int getTotalCourses() {
		return (int)this.courseRepository.getTotalCourses();
	}

	public List<Course> searchCourses(String keyword) {
		 return this.courseRepository.searchCourses(keyword);
	}

}
