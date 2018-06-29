package DAO;

import VO.RegisterVO;
import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class RegisterDAO {

	public void insert(RegisterVO registerVO) {
		
	try{	
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction tr = session.beginTransaction();
		
		session.save(registerVO);
		tr.commit();

		
	}catch(Exception e)
	{
		e.printStackTrace();
	}
		
	}
}


