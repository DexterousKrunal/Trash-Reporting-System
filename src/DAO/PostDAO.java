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

public class PostDAO {
	public void insert(PostVO postVO) {
		try{

			SessionFactory sessionFactory = HibernateUtil.sessionFactory;
			Session session = sessionFactory.openSession();

			Transaction tr = session.beginTransaction();

			session.save(postVO);
			tr.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		
	}
	public List search(PostVO postVO) {
		// TODO Auto-generated method stub
		List ls=new ArrayList();
		
		try{
			SessionFactory sessionFactory=HibernateUtil.sessionFactory;
			Session session=sessionFactory.openSession();
		    Query q=session.createQuery("from PostVO");
		    ls= q.list();
		    System.out.println("post size" +ls.size());
			}
		     catch(Exception e)
		     {
			     e.printStackTrace();
		     }
		return ls;
	
	}

 	public List increment(PostVO postVO) {
		// TODO Auto-generated method stub
              List ls=new ArrayList();
		
		try{
			SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
			Session session=sessionFactory.openSession();
		    Query q=session.createQuery("from PostVO where postId="+postVO.getPostId());
		    ls= q.list();
		    
		    System.out.println("post size" +ls.size());
		    
			}
		     catch(Exception e)
		     {
			     e.printStackTrace();
		     }
		return ls;
		
	}
	public void update(PostVO postVO) {
		// TODO Auto-generated method stub
		try{

			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction tr = session.beginTransaction();

			session.saveOrUpdate(postVO);
			tr.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		

		
		
	}

}
