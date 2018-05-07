<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="base.jsp"></jsp:include>
<% String path = request.getContextPath(); %>
<html>
<head>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- <button type="button" class="btn btn-success" id="addbtn">新增信息</button> -->
	<div class="row" style="height: 625px;">
		<div class="col-xs-10 " style="height: 100%;">
			<div class="nav col-xs-2">
				<div id="tree1"></div>
			</div>
			<div class="col-xs-10">
				<table id="table" class="table"></table>
			</div>
		</div>
	</div>
	<!-- <div id="cha">
		<form id="where">
			用户名称:<input type="text" name="uname" >
		</form>
	</div>  -->
		
	
	
	<script type="text/javascript">
	$("#addbtn").click(function(){
		 BootstrapDialog.show({
		        type : BootstrapDialog.TYPE_SUCCESS,
		        title : '新增 ',
		        message : $("<div></div>").load("add.jsp"),
		        //size : BootstrapDialog.SIZE_SMALL,//size为小，默认的对话框比较宽
		        buttons : [ {// 设置关闭按钮
		            label : '关闭',
		            action : function(dialogItself) {
		                dialogItself.close();
		            },
		        	},{
			            label : '保存',
			            action : function(dialogItself) {
			            	 var formData = new FormData(document.getElementById("addform"));
			            	 $.ajax({
			        			 url:"<%=request.getContextPath()%>/fly/addUser",
			        			 type:"post",
			        			 data:formData,
			        			 dataType:"text",
			        			 async:false,
                                 cache: false, 
                                 contentType: false, 
                                 processData: false, 
			        			 success:function(data){
			        				 if(data=="success"){
			        					 alert("成功");
			        					 dialogItself.close();
			        					 $("#table").bootstrapTable("refresh",{pageNumber:1});
			        				 }else{
			        					 alert("失败")
			        				 }
			        			 },
			        			 error:function(){
			        				 alert("新增失败")
			        			 }
			        		 	
			        		 })
			            }
		        	}
		        ]
		    });
	})
	</script>

	<script type="text/javascript">
		$("#table").bootstrapTable({
			url:"<%=request.getContextPath()%>/test!queryUsers.action",//获取数据的请求路径
			columns:[//绑定数据
			       {checkbox:true},
			       {field:"id",title:"编号"},
			       {field:"uname",title:"姓名"},
			       {field:"uage",title:"年龄",align:"center",sortable:true},
			       {field:"uaddress",title:"地址"},
			       {field:"uhobby",title:"爱好",formatter:function(value,row,index){
			    	 var iss=[row.uhobby];
			    	 var d="";
			    	// alert(iss)
			    	 for (var i = 0; i < iss.length; i++) {
			    		 var tt=iss[i].split(",")
			    	 for (var j = 0; j < tt.length; j++) {
			    			  if(tt[j]==1){
									d="吃";
								}
								if(tt[j]==2){
									d+=",喝";
								}
								if(tt[j]==3){
									d+=",玩";
								}
								if(tt[j]==4){
									d+=",睡";
								}
			    		  }
					}
			    	   return d;
			       }},
			       {field:"ubirthday",title:"生日",formatter:function(value,row,index){
			    	   return new Date(value).toLocaleString();
			       }},
			       {field:"usex",title:"性别",formatter:function(value,row,index){
			    	   if(value==1){
			    		   return "男";
			    	   }
			    	   if(value==2){
			    		   return "女";
			    	   }
			       }},
			       {field:"uimg",title:"照片" ,formatter:function(value,row,index){  
			    	   if(value != null){
			    	   	return '<img width="100" height="100" src="'+value+'"/>';
			    	   }else{
			    		   return "";
			    	   }
			       } },
			       {field:"  ",title:"操作" ,formatter:function(value,row,index){
			    	  return "<button type='button' class='btn btn-primary' data-toggle='button' aria-pressed='false' autocomplete='off' onclick='updateUser("+row.id+")'>修改</button><button type='button' class='btn btn-primary' data-toggle='button' aria-pressed='false' autocomplete='off' onclick='deleteUser("+row.id+")'>删除</button>";
			    	   
			    	   
			       } }
			       ],
			       pagination:true,//显示分页条
				   pageNumber:1,//初始化 页数
				   pageSize:5,//初始化 条数
				   pageList:[5,10,15],//初始化 可选择的条数
				  // paginationLoop:false,//关闭分页的无限循环
				   height:530,//高度
				   undefinedText:"暂无信息",//有数据为空时 显示的内容
				   striped:true,//斑马线
				   sortName:"uage",//排序的字段
				   sortOrder:"desc",//排序的方式 desc或asc
				   //onlyInfoPagination:true,//设置true时  只显示总条数   
				   //selectItemName:"name",
				   //smartDisplay:false,
				   //search:true,//启用搜索框
				   //strictSearch:true,//设置精确匹配 还是模糊匹配     默认模糊匹配false
				   //showFooter:true,//表格底部角
				   showColumns:true,//显示选择展示列的按钮
				   showRefresh:true,//刷新按钮
				   showToggle:true,//切换显示格式
				   showPaginationSwitch:true,//展示所有数据 和分页数据的切换按钮
				   //detailView:true,//列的详细页
				  /*  detailFormatter:function(index,row){
					   //格式化详细页
					   return '<a href="#">'+row.p_name+'</a>';
				   }, */
				   searchAlign:"left",//搜索框的显示位置
				   paginationHAlign:"left",//分页按钮的显示位置
				   paginationDetailHAlign:"right",//总页数 和条数的显示位置
				   paginationPreText:"上一页",//设置上一页显示的文本
				   paginationNextText:"下一页",//设置下一页显示的文本
				   clickToSelect:true,//选中行  默认选中  单选或复选
				   toolbar:"#cha",
				  // sidePagination:"server",
				   method:"post",
				   contentType:"application/x-www-form-urlencoded",
				   queryParams:function(){
					   var sort=this.sortName;
					   var order=this.sortOrder;
					   var offset=(this.pageNumber-1)*this.pageSize;
					   var limit=this.pageSize;
					   return formToJson("where",limit,offset,sort,order);
				   }
			  
		})
		
		function formToJson(id,limit,offset,sort,order) {
		//序列化表当为数组对象
	    var arr = $("#" + id).serializeArray();
		//准备拼接字符串
	    var jsonStr = "";
		//拼接开始位置的{
	    jsonStr += '{';
	    //循环所有的
	    for (var i = 0; i < arr.length; i++) {
	    	//拼接字符串     "name值":"value值",
	        jsonStr += '"' + arr[i].name + '":"' + arr[i].value + '",'
	    }
	    //拼接上我们分页必要几个参数
	    jsonStr +='"limit":"'+limit+'",';
	    jsonStr +='"offset":"'+offset+'",';
	    jsonStr +='"sort":"'+sort+'",';
	    jsonStr +='"order":"'+order+'",';
	    //去掉最后一个，
	    jsonStr = jsonStr.substring(0, (jsonStr.length - 1));
	    //拼接结束的}   
	    /*
	    {
	    	“name”:"123",
	    	"age":"12"
	    }
	    */
	    jsonStr += '}'
	    var json = JSON.parse(jsonStr)
	    return json
	}
		
		
		//-============================----修改-----=============================================================$
			function updateUser(id){
			BootstrapDialog.show({
				    title:"修改页面",//标题
		   			message:$("<div></div>").load("<%=request.getContextPath()%>/fly/queryById?id="+id),//弹框内容
		   			type:BootstrapDialog.TYPE_WARNING,//弹框的类型
		   			closable: true,
		   			draggable : true,
		   			buttons:[
		   			         {
		   			        	 label:"确定",
		   			        	 cssClass:"btn-success",
		   			        	 action:function(dialog){
		   			        		 //var formData = new FormData(document.getElementById("addform"));
		   			        		 $.ajax({
		   			        			 url:"<%=request.getContextPath()%>/fly/updateUser",
		   			        			 type:"post",
		   			        			 data:$("#addform").serialize(),
		   			        			 dataType:"text",
		   			        			 success:function(result){
		   			        				if(result=="success"){
		   			        					 dialog.close();
		   			        					 $("#table").bootstrapTable("refresh",{pageNumber:1});
		   			        				}else{
		   			        					alert("修改失败")
		   			        				}
		   			        			 }
		   			        		 	
		   			        		 })
		   			        	 }
		   			         }
		   			         ]
			  })
			
			
			
		}
//-============================----删除-----=============================================================$
			function deleteUser(id){
			var msg = "你确定要删除么";
			if(confirm(msg)==true){
				 $.ajax({
        			 url:"<%=request.getContextPath()%>/fly/deleteUser",
        			 type:"post",
        			 data:{"id":id},
        			 dataType:"text",
        			 async:false,
        			 success:function(data){
        				 if(data=="success"){
        					 $("#table").bootstrapTable("refresh",{pageNumber:1});
        				 }else{
        					 alert("失败")
        				 }
        			 }
        		 	
        		 })
			}
		}
	</script>
</body>
</html>