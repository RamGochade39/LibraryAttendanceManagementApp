package in.hb.controller;

import org.hibernate.LockMode;
import org.hibernate.Session;
import org.hibernate.Transaction;

import in.hb.model.RegisterStudent;
import in.hb.util.HibernateUtil2;

public class Test {

	public static void main(String[] args) {
		Session session=null;
		Transaction transaction=null;
		
		session=HibernateUtil2.getSession();
		transaction=session.beginTransaction();
		RegisterStudent res=(RegisterStudent)session.get(RegisterStudent.class, 1111808065L,LockMode.UPGRADE_NOWAIT);
		System.out.println(res.getStdName());
		System.out.println(res.getCourse());
		
	}
}
