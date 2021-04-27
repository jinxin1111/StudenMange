<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/layui/layui.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/layui/css/layui.css"
	media="all">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/adminLogin.css">
<script type="text/javascript"
	src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
</head>
<body>
	<div class="wrap">
		<img src="${pageContext.request.contextPath }/img/back.jpg"
			class="imgStyle">
		<div class="loginForm">
			<form>
				<div class="logoHead" >
					<h2 style="margin-top: 15px;text-align:center">比赛报名系统</h2>
				</div>
				<div class="usernameWrapDiv">
					<div class="usernameLabel">
						<label>用户名:</label>
					</div>
					<div class="usernameDiv">
						<i class="layui-icon layui-icon-username adminIcon"></i> 
						<input id="loginUsername" class="layui-input adminInput" type="text"
							name="username"  placeholder="输入用户名">
					</div>
				</div>
				<div class="usernameWrapDiv">
					<div class="usernameLabel">
						<label>密码:</label>
					</div>
					<div class="passwordDiv">
						<i class="layui-icon layui-icon-password adminIcon"></i> 
						<input id="loginPassword" class="layui-input adminInput" type="password"
							name="password" placeholder="输入密码">
					</div>
				</div>
				<div class="usernameWrapDiv">
					<div class="usernameLabel">
						<label>验证码:</label>
					</div>
					<div class="cardDiv">
						<input id="loginCard" class="layui-input cardInput" type="text"
							name="card" placeholder="输入验证码">
					</div>
					<div class="codeDiv">
						<input id="loginCode" class="layui-input codeInput" type="button">
					</div>
				</div>
				<div class="usernameWrapDiv">
					<div class="submitLabel">
						<label>没有账号？<a href="#" id="loginRegister">点击注册</a></label>
					</div>
					<div class="submitDiv">
						<input id="loginBtn" type="button"
							class="submit layui-btn layui-btn-primary" value="登录"></input>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script>
		layui.use([ 'layer' ], function() {
			var layer = layui.layer;
		})
		$(function() {
			// 页面初始化生成验证码
			window.onload = createCode('#loginCode');
			// 验证码切换
			$('#loginCode').click(function() {
				createCode('#loginCode');
			});
			// 登陆事件绑定
			$('#loginBtn').click(function() {
				login();
			});
			// 注册事件
			$('#loginRegister').click(function() {
				register();
			});
		});
		// 生成验证码
		function createCode(codeID) {
			var code = "";
			// 验证码长度
			var codeLength = 4;
			// 验证码dom元素
			var checkCode = $(codeID);
			// 验证码随机数
			var random = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D',
					'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
					'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' ];
			for (var i = 0; i < codeLength; i++) {
				// 随机数索引
				var index = Math.floor(Math.random() * 36);
				code += random[index];
			}
			// 将生成的随机验证码赋值
			checkCode.val(code);
		}
		// 登录校验验证码、用户名、密码
		function validateCode(inputID, codeID) {
			var inputCode = $(inputID).val().toUpperCase();
			var cardCode = $(codeID).val();
			var loginUsername = $('#loginUsername').val();
			var loginPassword = $('#loginPassword').val();
			if ($.trim(loginUsername) == ''|| $.trim(loginUsername).length <= 0) {
				layer.alert("用户名不能为空");
				return false;
			}
			if ($.trim(loginPassword) == ''|| $.trim(loginPassword).length <= 0) {
				layer.alert("密码不能为空");
				return false;
			}
 			if (inputCode.length <= 0)
		    {
				layer.alert("验证码不能为空");
				return false;
			}
 			if (inputCode != cardCode)
		    {
				layer.alert("请输入正确验证码");
				return false;
			}
			return true;
		}
		// 登录流程
		function login() {
			//校验用户名,密码,验证码是否为空
			if (!validateCode('#loginCard', '#loginCode')) {
				//阻断提示
			} else {//不为空的情况下
				//获取前端页面输入的用户名和密码
				var loginUsername = $('#loginUsername').val();
				var loginPassword = $('#loginPassword').val();
// 				var params = {};
//  			params.loginUsername = loginUsername;
// 				params.loginPassword = loginPassword;
// 				var jsonData1 = JSON.stringify(params);
				var loginLoadIndex = layer.load(2);
				$('#loginBtn').val("正在登录...");
				$.ajax({
					type : 'get',
					url : '/StudentProject_war_exploded/login',
					data : {'username':loginUsername,'password':loginPassword},
					success : function(data) {
						layer.close(loginLoadIndex);
						
						var jsonData = JSON.parse(data);
						if (jsonData.code == '0') {
							layer.msg(jsonData.msg);//登陆成功之后通过controller层去跳转到想要进入的页面
							window.location.href = 'http://localhost:8080/StudentProject_war_exploded/home';
						}
						else{
							layer.msg(jsonData.msg);//登陆 成功
							$('#loginBtn').val("登录");
						}
					}
// 					error : function() {
// 						layer.close(loginLoadIndex);
// 						$('#loginBtn').val("登录");
// 					}
				});
			}

		}
		// 注册校验用户名,密码,确认密码
		function validateCode2() {
			var registerUsername = $('#registerUsername').val();
			var registerPassword = $('#registerPassword').val();
			var registerWellPassword = $('#registerWellPassword').val();
			if ($.trim(registerUsername) == ''|| $.trim(registerUsername).length <= 0) {
				layer.alert("用户名不能为空");
				return false;
			}
			if ($.trim(registerPassword) == ''|| $.trim(registerPassword).length <= 0) {
				layer.alert("密码不能为空");
				return false;
			}
			if ($.trim(registerWellPassword) == ''|| $.trim(registerWellPassword).length <= 0) {
				layer.alert("密码不能为空");
				return false;
			}
			return true;
		}
		// 注册流程
		function register() {
			layer.open({
				type : '1',
				content : $('.registerPage'),
				title : '注册',
				area : [ '430px', '400px' ],
				btn : [ '注册', '重置', '取消' ],
				closeBtn : '1',
				btn1 : function(index, layero) {
					//注册校验用户名,密码,确认密码是否为空
					if (!validateCode2()) {
						//阻断提示
					}else{
						//注册回调
						layer.close(index);
						var registerUsername = $('#registerUsername').val();
						var registerPassword = $('#registerPassword').val();
						var registerWellPassword = $('#registerWellPassword').val();
// 						var params = {};
// 						params.registerUsername = registerUsername;
// 						params.registerPassword = registerPassword;
// 						params.registerWellPassword = registerWellPassword;
						var registerLoadIndex = layer.load(2);
						//注册要1.先判断用户名是否已经存在 2.看两次输入密码是否一致
						//3在两者前提下都是正确的再注册
						$.ajax({
							url:'/StudentProject_war_exploded/checkSameUser',
							data:{'username' :registerUsername},
							type:'get',
							success:function(result){
								if (!(result == "Success")) {
									layer.msg("用户名已存在",{icon:5,time:1000},function(){
										location.href="login2";//注册成功后点击确定跳转到登录界面	
									});
								}//if
								else{
									//来确认两次密码输入不一致的问题
								
									 if(!(registerPassword==registerWellPassword)){ 
										 layer.msg("两次输入密码不一致",{icon:5,time:1000},function(){
											 location.href="login2";//注册成功后点击确定跳转到登录界面	 
										 });
							    		 return false;
							    	 } //if
						
						$.ajax({
							type : 'get',
							url : '/StudentProject_war_exploded/register',
// 							dataType : 'json',
							data : {'username':registerUsername,'password':registerPassword,'password':registerWellPassword},
// 							contentType : 'application/json',
							success : function(data) {
								if(data=="suc")
								layer.close(registerLoadIndex);
								layer.msg("注册成功");
								location.href="login2";//注册成功后点击确定跳转到登录界面
							},
							error : function() {
								layer.close(registerLoadIndex);
								layer.alert("请求超时！")
							}
						});
						
					}
					
				},
// 				btn2 : function(index, layero) {
// 					//重置回调
// 					var registerUsername = $('#registerUsername').val("");
// 					var registerPassword = $('#registerPassword').val("");
// 					var registerWellPassword = $('#registerWellPassword').val("");
// 					// 防止注册页面关闭
// 					return false;
// 				},
// 				btn3 : function(index, layero) {
// 					//取消回调
// 				}
			})		
			
					}
					}	
					});//第一个ajax	
		
		
		}
				
			
			
					
	</script>

</body>
<div class="registerPage">
	<div class="registerDiv">
		<form>
			<div class="usernameWrapDiv">
				<div class="usernameLabel">
					<label>用户名:</label>
				</div>
				<div class="usernameDiv">
					<i class="layui-icon layui-icon-username adminIcon"></i> <input
						id="registerUsername" class="layui-input adminInput" type="text"
						name="username" placeholder="输入用户名">
				</div>
			</div>
			<div class="usernameWrapDiv">
				<div class="usernameLabel">
					<label>密码:</label>
				</div>
				<div class="passwordDiv">
					<i class="layui-icon layui-icon-password adminIcon"></i> <input
						id="registerPassword" class="layui-input adminInput"
						type="password" name="password" placeholder="输入密码">
				</div>
			</div>
			<div class="usernameWrapDiv">
				<div class="usernameLabel">
					<label>确认密码:</label>
				</div>
				<div class="passwordDiv">
					<i class="layui-icon layui-icon-password adminIcon"></i> <input
						id="registerWellPassword" class="layui-input adminInput"
						type="password" name="password" placeholder="输入密码">
				</div>
			</div>
		</form>
	</div>
</div>
</html>