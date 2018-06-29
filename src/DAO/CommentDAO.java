package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import VO.CityVO;
import VO.CommentVO;

public class CommentDAO {
	public List search()
	{
		List ls=new ArrayList();
		try{
			SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
			Session session=sessionFactory.openSession();
		    Query q=session.createQuery("from CommentVO");
		    ls= q.list();
			}
		     catch(Exception e)
		     {
			     e.printStackTrace();
		     }
		return ls;
	}

	public void insert(CommentVO commentVO) {
		// TODO Auto-generated method stub
try{
			
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction tr = session.beginTransaction();
			
			session.save(commentVO);
			tr.commit();

			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		
		
	}
}
