package com.jk.dao.impl;

import com.jk.dao.ITestDao;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TestDaoImpl implements ITestDao{

    @Autowired
    private SessionFactory sessionfactory;

    @Override
    public List queryRole() {
        return sessionfactory.getCurrentSession().createQuery(" from role").list();
    }

    @Override
    public List queryUsers() {
        return sessionfactory.getCurrentSession().createQuery("from Users").list();
    }
}
