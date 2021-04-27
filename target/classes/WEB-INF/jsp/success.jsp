<%--
  Created by IntelliJ IDEA.
  User: sercet
  Date: 2021/1/11
  Time: 8:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>主页</title>

    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
    </script>
    <script type="text/javascript" src="layui/layui.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>

<table class="layui-hide" id="test" lay-filter="test"></table>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-xs" lay-event="bor">参加</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>

    layui.use('table', function(){
        var table = layui.table;
        table.render({
            elem: '#test'
            ,height:500
            ,page:true
            ,method:'post'
            ,url:'BookAllListPage'//数据接口
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,page:{
                limit:10
                ,limits:[1,2,3,4,5,6]
            }
            //向后端穿2个参数，当前页和最大数
            ,cols: [[
                {field:'id', width:80, title: 'ID', sort: true}
                ,{field:'bookname', width:150, title: '比赛名称'}
                ,{field:'booktype', width:150, title: '比赛种类', sort: true}
                ,{field:'editor', width:150, title: '举办人'}
                ,{title:'操作', toolbar: '#barDemo', width:250}
            ]]
        });
        table.on('tool(test)', function(res){
            console.log(res);
            if(res.event=="edit")
            {
                layer.msg(res.data.bookname,{icon:1});
                var id=res.data.id;
                var bookname=res.data.bookname;
                var booktype=res.data.booktype;
                var editor=res.data.editor;
                layer.open({
                    title: '修改比赛信息',
                    area: ['300px', '240px'],
                    btnAlign: 'c',//按钮居中
                    closeBtn:'1',//右上角的关闭
                    content: "<div><table>"
                        +"<tr><td>比赛名称:</td><td><input type='text' id='bookname' value='"+bookname+"'></td></tr>"
                        +"<tr><td>比赛种类:</td><td><input type='text' id='booktype' value='"+booktype+"'></td></tr>"
                        +"<tr><td>举办人:</td><td><input type='text' id='editor' value='"+editor+"'></td></tr>"
                        +"</table></div>",
                    btn:['确认','取消'],
                    yes: function (index, layero) {
                        //获取文本框的值
                        bookName = $('#bookname').val();
                        bookType = $('#booktype').val();
                        editor = $('#editor').val();

                        $.ajax({
                            url:'BookModification',
                            data:{'id':id,'bookName':bookName,'bookType':bookType,'editor':editor},
                            type:'post',
                            success:function(res){
                                if(res=='success'){
                                    layer.msg("修改成功",{icon:6,time:1000},function(){
                                        window.location.href='ViewIndexServlet';
                                    })
                                }else{
                                    layer.msg("修改失败",{icon:5,time:1000})
                                }
                            }
                        })
                        layer.close(index);
                    },
                    no:function(index){
                        alert('您刚才点击了取消按钮');
                        layer.close(index);
                        return false;//点击按钮按钮不想让弹层关闭就返回false
                    }
                });

            }else if(res.event=="del")
            {
                layer.confirm("你是否决定要删除"+res.data.bookname,{icon:3},function()
                {
                    var id=res.data.id;
                    $.ajax({
                        url:'DeleteBook',
                        data:{'id':id},
                        type:'post',
                        success:function(res){
                            if(res=='success')
                            {
                                layer.msg("删除成功",{icon:6,time:1000},function(){
                                    window.location.href="ViewIndexServlet";
                                });
                            }else{
                                layer.msg("删除失败",{icon:5});
                            }
                        }
                    })
                })
            }else if(res.event=="bor")
            {
                layer.msg(res.data.bookname,{icon:1});
                var id=res.data.id;
                var bookname=null;
                var booktype=null;
                var editor=null;
                layer.open({
                    title: '参加比赛信息',
                    area: ['300px', '240px'],
                    btnAlign: 'c',//按钮居中
                    closeBtn:'1',//右上角的关闭
                    content: "<div><table>"
                        +"<tr><td>参加院系:</td><td><input type='text' id='bookname' value='"+bookname+"'></td></tr>"
                        +"<tr><td>参加班:</td><td><input type='text' id='booktype' value='"+booktype+"'></td></tr>"
                        +"<tr><td>参加人:</td><td><input type='text' id='editor' value='"+editor+"'></td></tr>"
                        +"</table></div>",
                    btn:['确认','取消'],
                    yes: function (index, layero) {
                        //获取文本框的值
                        bookName = $('#bookname').val();
                        bookType = $('#booktype').val();
                        editor = $('#editor').val();

                        $.ajax({
                            url:'Bookadd',
                            data:{'id':id,'bookName':bookName,'bookType':bookType,'editor':editor},
                            type:'post',
                            success:function(res){
                                if(res=='success'){
                                    layer.msg("修改成功",{icon:6,time:1000},function(){
                                        window.location.href='ViewIndexServlet';
                                    })
                                }else{
                                    layer.msg("修改失败",{icon:5,time:1000})
                                }
                            }
                        })
                        layer.close(index);
                    },
                    no:function(index){
                        alert('您刚才点击了取消按钮');
                        layer.close(index);
                        return false;//点击按钮按钮不想让弹层关闭就返回false
                    }
                });
            }else if(res.event=="add")
            {

            }

        });

    });

</script>

</body>
</html>
