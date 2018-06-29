package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import VO.FileVO;
import VO.PostVO;

public class FileDAO {

	public void insert(FileVO fileVO) {
		try{

			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction tr = session.beginTransaction();

			session.save(fileVO);
			tr.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		
	}

	public List search(FileVO fileVO) {
		// TODO Auto-generated method stub
		List ls=new ArrayList();
		
		try{
			SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
			Session session=sessionFactory.openSession();
		    Query q=session.createQuery("from FileVO");
		    ls= q.list();
		    System.out.println("image size" +ls.size());
			}
		     catch(Exception e)
		     {
			     e.printStackTrace();
		     }
		return ls;
	
	}
}
