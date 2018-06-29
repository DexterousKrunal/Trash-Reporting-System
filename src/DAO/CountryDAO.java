package DAO;




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

//remember
import VO.CountryVO;

public class CountryDAO {
	public void insert(CountryVO cvo)
	{
		try{
			
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction tr = session.beginTransaction();
			
			session.save(cvo);
			tr.commit();

			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public List search(CountryVO cvo)
	{
		List ls=new ArrayList();
		try{
			SessionFactory sessionFactory= new Configuration().configure().buildSessionFactory();
			Session session= sessionFactory.openSession();
			Query q = session.createQuery("from CountryVO");
			ls = q.list();
			
			System.out.println("list size ::dao : "+ls.size());
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
				
		}
		return ls;
			
		}
	public List edit(CountryVO countryVO) {
		// TODO Auto-generated method stub
		List ls1= new ArrayList();
		try{
			SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
			Session session=sessionFactory.openSession();
		    Query q=session.createQuery("from CountryVO where id="+countryVO.getCid());
		    ls1= q.list();
			}
		     catch(Exception e)
		     {
			     e.printStackTrace();
		     }
		return ls1;
	}
	public void update(CountryVO countryVO) {
		// TODO Auto-generated method stub
		try{
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
           
			Session session = sessionFactory.openSession();
			Transaction tr = session.beginTransaction();

			session.saveOrUpdate(countryVO);
		
			tr.commit();
			}catch(Exception e)
			{
				e.printStackTrace();
			}
	
	}
}
		
	


