package com.jk.action;

import com.jk.service.ITestService;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
@Action(value="test",results = {
        @Result(name="show",location = "/show.jsp")

})
public class TestAction {

    @Autowired
    private ITestService testService;

    private List list;
    private List  list1;
    public String queryRole(){

        list=testService.queryRole();
        return "show";
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }


    public String queryUsers(){
        list1 = testService.queryUsers();
        return "show";
    }

    public List getList1() {
        return list1;
    }

    public void setList1(List list1) {
        this.list1 = list1;
    }
}
