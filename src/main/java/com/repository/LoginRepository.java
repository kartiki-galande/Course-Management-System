package com.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.entity.Admin;
import com.entity.Student;

@Repository
public class LoginRepository {

	@Autowired
	HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public Admin getIfAdminByMail(String email, String password) {
		String hql = "from Admin where email = ?0";
		List<Admin> admins = (List<Admin>) this.hibernateTemplate.find(hql, email);
		return admins.isEmpty() ? null : admins.get(0);
	}

	public Student getIfStudentByMail(String email, String password) {
		String hql = "from Student where email = :email";
		String[] names = { "email"};
		Object[] values = { email };
		List<Student> students = (List<Student>) this.hibernateTemplate.findByNamedParam(hql, names, values);
		return students.isEmpty() ? null : students.get(0);
	}
}
