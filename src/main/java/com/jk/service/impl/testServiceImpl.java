package com.jk.service.impl;

import com.jk.dao.ITestDao;
import com.jk.service.ITestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class testServiceImpl implements ITestService {

@Autowired
    private ITestDao testDao;

    @Transactional
    @Override
    public List queryRole() {
        return testDao.queryRole();
    }

    @Override
    public List queryUsers() {
        return testDao.queryUsers();
    }
}
