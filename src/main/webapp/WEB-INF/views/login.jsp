<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/common/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/common/meta.jsp"%>
<%@ include file="/common/cssframe.jsp"%>
</head>
<body onload="centerLogin();initTextbox()" onresize="centerLogin()">
	<h2>寻学管理系统</h2>
	<div class="easyui-panel" title="Login" style="width: 400px;">
		<div class="alter alert-danger" style="text-align: center"></div>
		<div style="padding: 20px 90px 20px 100px">
			<form id="form_login" method="post">
				<table cellpadding="5">
					<tr>
						<td><input class="easyui-textbox" type="text" name="username"></input></td>
					</tr>
					<tr>
						<td><input class="easyui-textbox" type="password" name="password"></input></td>
					</tr>
				</table>
			</form>
			<div style="text-align: center; padding: 5px; width: 200px;">
				<a href="javascript:void(0)" class="easyui-linkbutton" style="width: 50px"
					onclick="submitForm()" tabindex="3">登录</a>&nbsp;&nbsp;&nbsp;<a
					href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()"
					style="width: 50px" tabindex="4">清除</a>
			</div>
		</div>
	</div>
	<%@ include file="/common/jsframe.jsp"%>
	<script>
		var input_username = $("input[name='username']");
		var input_password = $("input[name='password']");
		var div_valid_res = $(".alert-danger");
		input_username.textbox({
			width : 200,
			height : 30,
			iconCls : 'icon-man',
			iconAlign : 'right',
			iconWidth : '30',
			prompt : "在此输入账号："
		});
		input_password.textbox({
			width : 200,
			height : 30,
			iconCls : 'icon-lock',
			iconAlign : 'right',
			iconWidth : '30',
			prompt : "在此输入密码："
		});
		$('#form_login').form({
			novalidate : false,
			url : "${ctx}/login",
			onSubmit : function() {
				//进行表单验证
				//如果返回false阻止提交
				var isOk = validator();
				if (!isOk) {
					$.messager.progress('close');
				}
				return isOk;
			},
			success : function(data) {
				var data = eval('(' + data + ')');
				if (data.success) {//true 登录成功
					top.location = "${ctx}/";
				} else {
					alertValid(data.message);
					$.messager.progress('close');
				}
			}
		});

		//Login Form居中
		function centerLogin() {
			$(".panel").css("position", "absolute");
			$(".panel").css("top", ($("h2").height() + 50) + "px");
			$(".panel").css(
					"left",
					($(window).width() - $(".panel").width()) / 2
							+ $(window).scrollLeft() + "px");
		}
		function initTextbox() {
			$(".textbox-text:eq(0)").attr("tabindex", 1);
			$(".textbox-text:eq(1)").attr("tabindex", 2);
			$(".textbox-text").keydown(function(event) {
				if (event.which == 13) {
					this.blur();
					submitForm();
				}
			});
		}

		function validator() {
			var username = input_username.val();
			var password = input_password.val();
			if (username == "") {
				alertValid("对不起，用户名不能为空");
				$(".textbox-text:eq(0)").focus();
				return false;
			}
			if (password == "") {
				alertValid("对不起，密码不能为空");
				$(".textbox-text:eq(1)").focus();
				return false;
			}
			return true;
		}

		function alertValid(context) {
			div_valid_res.html("<p style='font-size:14px;padding:8px'>"
					+ context + "</p>");
		}

		function submitForm() {
			$.messager.progress();
			$('#form_login').form('submit');
		}
		function clearForm() {
			$('#form_login').form('clear');
		}
	</script>
</body>
</html>