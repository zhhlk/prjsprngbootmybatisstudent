<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生信息管理</title>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script>
  /****jquery开始****/
  $(function(){
    /************初始化班级信息给下拉列表框赋值**********/
    //调用后台的doinit_Student方法获取下拉列表框的数据,数据以JsonArray格式组织
    $.getJSON('doinit_Student.do',function(lsclazz){
        //再循环中给select标签赋值&lt;option>
        for(var i=0;i<lsclazz.length;i++){
          var clazz=lsclazz[i];//获取json数组中的每一个对象元素
          $("#classid").append("<option value="+clazz.cid+">"+clazz.cname+"</option>");//向classid标签中设置子元素option

        }
    });
    /*************************************************/
    showAll();
  });

  /**********************动态生成表格的方法************************************/
  var page=1;//当前前页数的变量
  var rows=5;//当前页的记录数
  var maxpage=1;//最大页数值
  function showAll(){
      //使用$.getJSON方法访问findPagAll_Student.do
      $.getJSON("findPageAll_Student.do?page="+page+"&rows="+rows+"&t="+new Date().getTime(),function(map){
        page=map.page;
        rows=map.rows;
        maxpage=map.maxpage;
        //获取当前页记录的集合
        var lsst=map.lsst;

        var tablehead="<table width='800' border='1' align='center' cellpadding='1' cellspacing='0'>"
                      +"<tr align='center' bgcolor='#FFFF99'>"
                      +"<td width='66'>编号</td>"
                      +"<td width='114'>姓名</td>"
                      +"<td width='80'>性别</td>"
                      +"<td width='124'>地址</td>"
                  +"<td width='111'>生日</td>"
                  +"<td width='131'>班级</td>"
                  +"<td width='144'>操作</td>"
                  +"</tr>";
                  var trrows="";
                  for(var i=0;i<lsst.length;i++){
                      var st=lsst[i];//获取每条记录的值对象
                      trrows+="<tr align='center'>"
                      +"<td>"+st.sid+"</td>"
                      +"<td>"+st.sname+"</td>"
                      +"<td>"+st.sex+"</td>"
                      +"<td>"+st.address+"</td>"
                      +"<td>"+st.birthday+"</td>"
                      +"<td>"+st.cname+"</td>"
                      +"<td><input type='button' name='btdelete' id='btdelete' value='删除' onclick='dodelById("+st.sid+")' />"
                        +"<input type='button' name='btfind' id='btfind' value='编辑' onclick='dofindById("+st.sid+")' /></td>"
                      +"</tr>";
                  }
                  var tableend=tablehead+trrows+"</table>";
                  $("#ttable").html(tableend);

                  /*****处理分页控件****************/
                  //给每页记录数文本框赋值
                  $("#rows").val(rows);
                  $("#page").val(page);
                  $("#pagelabel").html(page+"/"+maxpage);
                  /********************************/
      })
  }
  /***************************************************************************/
  /******************************分页事件的处理**********************************/
  $(function(){
    $("#btfirst").click(function(){
        page=1;
        showAll();
    });
    $("#btup").click(function(){
        page=page-1;
        if(page<1){
          page=1;
        }
        showAll();
    });
    $("#btnext").click(function(){
        page=page+1;
        if(page>maxpage){
          page=maxpage;
        }
        showAll();
    });
    $("#btlast").click(function(){
        page=maxpage;

        showAll();
    });

    /***更改每页记录数事件******/
    $("#btchangesize").click(function(){
      //获取每页记录数文本框的值
      var currrows=$("#rows").val();
      if(isNaN(currrows)){
        alert("您输入的的不是数字，请重新输入整数数字！");
        $("#rows").val(rows);
        return;
      }
      rows=currrows;
      showAll();
    });
    /***更改页数的事件******/
    $("#btchangepage").click(function(){
      //获取每页记录数文本框的值
      var currpage=$("#page").val();
      if(isNaN(currpage)){
        alert("您输入的的不是数字，请重新输入整数数字！");
        $("#page").val(page);
        return;
      }
      page=currpage;
      showAll();
    });
  });
  /***************************************************************************/
  /**********************保存学生信息的事件方法**********************************/
  $(function(){
     $("#btsave").click(function(){
          //获取文本框的值
          var sname=$("#sname").val();
          var sex=$(":radio[name='sex']:checked").val();//获取单选按钮名为sex的选中的值
          var address=$("#address").val();
          var birthday=$("#birthday").val();
          var classid=$("#classid").val();

          //将数据封装为json对象准备发送给服务器
          var st={'sname':sname,'sex':sex,'address':address,'birthday':birthday,'classid':classid};

          //使用post方式发送数据到服务器的save方法
          $.post('save_Student.do',st,function(code){
              if(code==1){
                  alert("保存成功！");
                  showAll();//重新刷新列表
              }else{
                  alert("保存失败！");
              }

          });
     });
  });
  /****************************************************************************/
  /**********************更新学生信息的事件方法**********************************/
  $(function(){
     $("#btupdate").click(function(){
          alert("update");
          //获取文本框的值
          var sid=$("#sid").val();//重点，在更新时需要获取sid的编号主键值，方便根据主键值更新数据
          var sname=$("#sname").val();
          var sex=$(":radio[name='sex']:checked").val();//获取单选按钮名为sex的选中的值
          var address=$("#address").val();
          var birthday=$("#birthday").val();
          var classid=$("#classid").val();

          //将数据封装为json对象准备发送给服务器
          var st={'sid':sid,'sname':sname,'sex':sex,'address':address,'birthday':birthday,'classid':classid};

          //使用post方式发送数据到服务器的save方法
          $.post('update_Student.do',st,function(code){
              if(code==1){
                  alert("更新成功！");
                  showAll();//重新刷新列表
              }else{
                  alert("更新失败！");
              }

          });
     });
  });
  /****************************************************************************/

  /****************删除事件************************************/
  function dodelById(sid){
     if(window.confirm("是否真的删除")){
         $.get("delById_Student.do?sid="+sid,function(code){
           if(code==1){
             alert("删除成功！");
             showAll();//重新刷新列表
           }else{
             alert("删除失败！");
           }
         });
     }
  }
  /************************************************************/

  /*************编辑查询的事件方法*******************************/
  function dofindById(sid){
      $.getJSON("findById_Student.do?sid="+sid,function(st){
        //给表单元素赋值
        $("#sid").val(st.sid);
        $("#sname").val(st.sname);
        $(":radio[value="+st.sex+"]").attr("checked",true);//单选按钮的值与服务器返回的性别之相同，则设置checked属性为选中状态
        $("#address").val(st.address);
        $("#birthday").val(st.birthday);
        $("#classid").val(st.classid);
      });
  }
  /************************************************************/
</script>

</head>

<body>
<p align="center"><strong>学生列表</strong></p>
<hr />
<div id="ttable">

</div>
<form id="form1" name="form1" method="post" action="">
  <table width="800" border="1" align="center" cellpadding="1" cellspacing="0">
    <tr align="center" bgcolor="#FFFF99">
      <td><input type="button" name="btfirst" id="btfirst" value="首页" /></td>
      <td><input type="button" name="btup" id="btup" value="上页" /></td>
      <td><input type="button" name="btnext" id="btnext" value="下页" /></td>
      <td><input type="button" name="btlast" id="btlast" value="末页" /></td>
      <td>每页
        <label for="rows"></label>
      <input name="rows" type="text" id="rows" size="2" />
      条记录
      <input type="button" name="btchangesize" id="btchangesize" value="确定" /></td>
      <td>跳转到第
        <label for="page"></label>
        <input name="page" type="text" id="page" size="2" />
        页
        <input type="button" name="btchangepage" id="btchangepage" value="确定" /></td>
      <td><span id="pagelabel">1/1页</span></td>
    </tr>
  </table>
</form>
<hr />
<form id="form2" name="form2" method="post" action="">
  <table width="450" border="1" align="center" cellpadding="1" cellspacing="0">
    <tr>
      <td colspan="2" align="center" bgcolor="#FFFF99">学生管理</td>
    </tr>
    <tr>
      <td width="64">姓名</td>
      <td width="376"><label for="sname"></label>
      <input type="text" name="sname" id="sname" />
      <input type="hidden" name="sid" id="sid" />
      </td>
    </tr>
    <tr>
      <td>性别</td>
      <td><input name="sex" type="radio" id="radio" value="男" checked="checked" />
      <label for="sex">
        男
          <input type="radio" name="sex" id="radio2" value="女" />
      女</label></td>
    </tr>
    <tr>
      <td>地址</td>
      <td><input type="text" name="address" id="address" /></td>
    </tr>
    <tr>
      <td>生日</td>
      <td><input name="birthday" type="date" id="birthday" value="1995-01-01" /></td>
    </tr>
    <tr>
      <td>班级</td>
      <td><label for="classid"></label>
        <select name="classid" id="classid">
      </select></td>
    </tr>
    <tr>
      <td colspan="2" align="center" bgcolor="#FFFF99"><input type="button" name="btsave" id="btsave" value="保存" />
      <input type="button" name="btupdate" id="btupdate" value="修改" />
      <input type="button" name="btreset" id="btreset" value="重置" /></td>
    </tr>
  </table>
</form>
<p>&nbsp;</p>
</body>
</html>