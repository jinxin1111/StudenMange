<%--
  Created by IntelliJ IDEA.
  User: sercet
  Date: 2021/1/12
  Time: 14:45
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
<body>

    <form>
        <td>
    比赛名：<input type="text" name="bookname" id="bookname">
    <input type="button" value="搜索" onclick="finds()"/><br>
        </td>
    </form>

    <table class="layui-hide" id="test" lay-filter="test"></table>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
        <a class="layui-btn layui-btn-xs" lay-event="bor">参加</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>

<script>
    function finds(){
        var bookname =$("#bookname").val();
        if(bookname==""){
            alert("书名不能为空！");
            return false;
        }
        else
        {
            $.ajax({
                url: "finds", //提价的路径
                type: "get",       //提交方式
                data:{'bookname':bookname},
                dataType: "JSON",       //规定请求成功后返回的数据
                success: function (data) {
                    //请求成功之后进入该方法，data为成功后返回的数据
                    //window.location.href ="showSelectBookList";
                    layui.use('table', function() {
                        var table = layui.table;
                        table.render({
                            elem: '#test'
                            , height: 500
                            , page: true
                            , method: 'get'
                            , url: 'http://localhost:8080/StudentProject_war_exploded/finds?bookname='+bookname//数据接口
                            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                            , page: {
                                limit: 10
                                , limits: [1, 2, 3, 4, 5, 6]
                            }
                            //向后端穿2个参数，当前页和最大数
                            , cols: [[
                                {field: 'id', width: 80, title: 'ID', sort: true}
                                , {field: 'bookname', width: 150, title: '比赛名称'}
                                , {field: 'booktype', width: 150, title: '比赛种类', sort: true}
                                , {field: 'editor', width: 150, title: '举办人'}
                                , {title: '操作', toolbar: '#barDemo', width: 250}
                            ]]
                        });
                    })

                },
            })
<%--
$.ajax({
    type:'post',
    url:'finds',
    dataType:"json",//注意使用的是打他dataType，而不是Content-Type
    async: true,
    data:{bookname:bookname},
    success:function(res){
        if(res==null){
            alert("没有这本书！")
        }
        else{
            window.location.href ="showSelectBookList";
        }
    }
    --%>



}
}
</script>

</body>
</html>