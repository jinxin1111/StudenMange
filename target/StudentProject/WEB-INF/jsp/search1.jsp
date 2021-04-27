<%--
  Created by IntelliJ IDEA.
  User: sercet
  Date: 2021/1/12
  Time: 18:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
        <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
        </script>
        <script type="text/javascript" src="layui/layui.js"></script>
        <link rel="stylesheet" href="layui/css/layui.css">

    </head>
    <title>Title</title>
<body>
<h1>这是search111</h1>
<table class="layui-hide" id="test" lay-filter="test"></table>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-xs" lay-event="bor">借阅</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>

    layui.use('table', function() {
        var table = layui.table;
        table.render({
            elem: '#test'
            , height: 500
            , page: true
            , method: 'get'
            , url: 'http://localhost:8080/StudentProject_war_exploded/finds?bookname=T'//数据接口
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: {
                limit: 10
                , limits: [1, 2, 3, 4, 5, 6]
            }
            //向后端穿2个参数，当前页和最大数
            , cols: [[
                {field: 'id', width: 80, title: 'ID', sort: true}
                , {field: 'bookname', width: 150, title: '图书名称'}
                , {field: 'typename', width: 150, title: '图书种类', sort: true}
                , {field: 'editor', width: 150, title: '作者'}
                , {title: '操作', toolbar: '#barDemo', width: 250}
            ]]
        });
    })
</script>
</body>
</html>
