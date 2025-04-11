package in.hb.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
import java.sql.Date;
import java.sql.Time;

import org.hibernate.Session;
import org.hibernate.Transaction;

import in.hb.model.StudentEntry;
import in.hb.util.HibernateUtil;

@WebServlet("/storedb")
public class StoreInDbServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Long id = (Long) request.getAttribute("id");
		String name = (String) request.getAttribute("name");
		String course = (String) request.getAttribute("course");

		System.out.println("ID: " + id);
		System.out.println("Name: " + name);
		System.out.println("Course: " + course);

		Session session = null;
		Transaction transaction = null;
		boolean flag = false;
		try {
			session = HibernateUtil.getSession();
			transaction = session.beginTransaction();

			LocalTime localTime = LocalTime.now().truncatedTo(ChronoUnit.MINUTES);
			Time time = Time.valueOf(localTime);
			StudentEntry studentEntry = new StudentEntry();

			studentEntry.setStdId(id);
			studentEntry.setStdName(name);
			studentEntry.setStdCourse(course);
			studentEntry.setEntryTime(time);

			Date date = new Date(System.currentTimeMillis());
			studentEntry.setDate(date);

			System.out.println("=====================================");

			session.persist(studentEntry);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (flag) {
				if (transaction != null) {
					transaction.commit();
					System.out.println("Object Saved Successfully");
				}
			} else {
				if (transaction != null) {
					transaction.rollback();
					System.out.println("Object Not Saved");
				}
			}

		}
		RequestDispatcher rd = request.getRequestDispatcher("./fetch");
		rd.forward(request, response);
	}
}
