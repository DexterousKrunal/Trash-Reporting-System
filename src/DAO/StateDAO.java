package DAO;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.naming.NamingException;
import javax.naming.Reference;

import org.hibernate.HibernateException;
import org.hibernate.Interceptor;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.StatelessSession;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.engine.FilterDefinition;
import org.hibernate.metadata.ClassMetadata;
import org.hibernate.metadata.CollectionMetadata;
import org.hibernate.stat.Statistics;

import VO.StateVO;

public class StateDAO implements Serializable {
	public void insert(StateVO svo)
	{
		try{

			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction tr = session.beginTransaction();

			session.save(svo);
			tr.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public List Search(StateVO svo)
	{
		List ls=new ArrayList();
		try{
			SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
			Session session=sessionFactory.openSession();
		    Query q=session.createQuery("from StateVO");
		    ls= q.list();
			}
		     catch(Exception e)
		     {
			     e.printStackTrace();
		     }
		return ls;
	}
	public List edit(StateVO stateVO) {
		// TODO Auto-generated method stub
		List ls=new ArrayList();
		try{
			SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
			Session session=sessionFactory.openSession();
		    Query q=session.createQuery("from StateVO where id="+stateVO.getSid());
		    ls= q.list();
			}
		     catch(Exception e)
		     {
			     e.printStackTrace();
		     }
		return ls;
	
	}
	public void update(StateVO stateVO) {
		try{

			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction tr = session.beginTransaction();

			session.saveOrUpdate(stateVO);
			tr.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		
	}
	
	
	


}
