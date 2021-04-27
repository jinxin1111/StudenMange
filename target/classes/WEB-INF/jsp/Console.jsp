<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
</script>
<script type="text/javascript" src="layui/layui.js"></script>
<link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
    <div class="layui-layout-admin">
        <!--头部-->
        <div class="layui-header">
            <div class="layui-logo">比赛报名系统</div>
            <!--<ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item"><a href="javascript:void(0)">控制台</a></li>
                <li class="layui-nav-item"><a href="javascript:;">商品管理</a></li>
                <li class="layui-nav-item">
                    <a href="javascript:;">其他系统</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">邮件管理</a></dd>
                        <dd><a href="javascript:;">消息管理</a></dd>
                        <dd><a href="javascript:;">授权管理</a></dd>
                    </dl>
                </li>
            </ul>-->
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
                    <a href=""><img src="img/09.jpg" class="layui-nav-img">User</a>
                    <dl class="layui-nav-child">
                        <dd><a href="">基本资料</a></dd>
                        <dd><a href="">安全设置</a></dd>
                    </dl>
                </li>
            </ul>
        </div>

        <!--左侧-->
        <div class="layui-side layui-bg-black">
            <div class="layui-side-scroll">
                <ul class="layui-nav layui-nav-tree" lay-filter="hbkNavbar">
                    <li class="layui-nav-item">
                        <a href="javascript:;">基本功能</a>
                        <dl class="layui-nav-child">
                            <dd lay-id="11"><a href="javascript:;" data-options="{url:'ChangePwd.jsp',title:'密码修改',id:'11'}">密码修改</a></dd>
                            <dd lay-id="12"><a href="javascript:;" data-options="{url:'AddUser.jsp',title:'增加用户',id:'12'}">增加用户</a></dd>
                            <dd lay-id="13"><a href="javascript:;" data-options="{url:'DeleteUser.jsp',title:'删除用户',id:'13'}">删除用户</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;">比赛管理</a>
                        <dl class="layui-nav-child">
                            <dd lay-id="21"><a href="javascript:;" data-options="{url:'ViewIndexServlet',title:'比赛列表',id:'21'}">比赛列表</a></dd>
                            <dd lay-id="22"><a href="javascript:;" data-options="{url:'SelectBookList',title:'比赛查找',id:'22'}">比赛查找</a></dd>
                            <dd><a href=""></a></dd>
                            <dd><a href=""></a></dd>
                        </dl>
                    </li>
                    <!--  <li class="layui-nav-item">
                        <a href="">表格</a>
                        <dl class="layui-nav-child">
                        
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a href="">表单</a>
                    </li>
                    -->
                </ul>
            </div>
        </div>

        <!--中间主体-->
        <div class="layui-body" id="container">
            <div class="layui-tab" lay-filter="tabs" lay-allowClose="true" id="mytabs">
                <ul class="layui-tab-title">
                    <li class="layui-this">首页</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">首页内容</div>
                </div>
            </div>
        </div>

        <!--底部-->
        <div class="layui-footer">
            <center>制作人：Artemis</center>
        </div>
    </div>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
        element.on('nav(hbkNavbar)',function(elem){
            /*使用DOM操作获取超链接的自定义data属性值*/
            console.log(elem);
            //把JSON串变成我们JS对象格式
            var options =  eval('('+elem.context.dataset.options+')');
            var title = options.title; 
            var url = options.url;
			var id=options.id;
			//获取当前id在这个tabs里面的长度
			var li = $("li[lay-id="+id+"]").length;
			console.log(li);
			//如果大于0证明tabs里面已经有这个标签卡了，切换
			if(li>0)
				{
				element.tabChange('tabs',id);
				}
			//否则添加
			else{
            element.tabAdd('tabs',{
                title : title,
                content : '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:500px;"></iframe>',
                id: id
            });
            element.tabChange('tabs',id);
			}
        });

        /*使用下面的方式需要引用jquery*/
       /* $('.layui-nav-child a').click(function () {
            var options = eval('('+$(this).data('options')+')');
            var url = options.url;
            var title = options.title;
            element.tabAdd('tabs',{
                title : title,
                content : '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>'
            });
        });*/
    });
</script>
</body>
</html>