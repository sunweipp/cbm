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
<body class="easyui-layout">
	<div data-options="region:'north'"
		style="height: 85px; position: relative; background: rgb(102, 102, 102); border-width: 0px; color: #fff; overflow: hidden">
		<div style="margin-left: 200px; float: left;">
			<h1>寻学管理系统</h1>
			<p>Copyright © 2015 SUNWAY</p>
		</div>
		<div style="position: absolute; bottom: -15px; right: 200px">
			<p style="font-size: 20px">
				HI:&nbsp;<a href="javascript:void(0);" class="title-a">${nickname}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
					href="${ctx}/logout" class="title-a">退出</a>
			</p>
		</div>
		<div style="clear: both;"></div>
	</div>
	<div data-options="region:'west',title:'菜单',split:true" style="width: 250px;">
		<div id="accDiv" class="easyui-accordion" data-options="multiple:true"
			style="width: 100%;">
			<c:forEach var="menu" items="${menus}">
				<div title="${menu.title}" data-options="iconCls:'${menu.iconCls}'"
					style="padding: 10px;">
					<c:forEach var="cmenu" items="${menu.childMenu}">
						<ul class="easyui-tree">
							<li data-options="iconCls:'${cmenu.iconCls}'"><span><label
									data-url="${cmenu.url}">${cmenu.title}</label></span></li>
						</ul>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
	</div>
	<div data-options="region:'center'" style="padding: 5px; background: #eee;">
		<div id="tabDiv" class="easyui-tabs" style="width: 100%;" fit="true"
			border="false" plain="true">
			<div title="Welcome" href="${ctx}/welcome"></div>
		</div>
	</div>
	<%@ include file="/common/jsframe.jsp"%>
	<script>
		var lastDivTreeNode = null;
		$(document).ready(function() {
			$("div.tree-node").click(function() {
				if (lastDivTreeNode != null) {
					lastDivTreeNode.removeClass("tree-node-selected");
				}
				lastDivTreeNode = $(this);
				//$(this).find("a").click();
			});
		});

		$(".easyui-tree").tree({
			onClick : function(node) {
				var taget = $(node.text);
				openTab(taget.text(), taget.data("url"));
			}
		});

		function openTab(title, url) {
			if ($('#tabDiv').tabs('exists', title)) {
				$('#tabDiv').tabs('select', title);
			} else {
				$('#tabDiv').tabs('add', {
					title : title,
					href : _ctx + url,
					closable : true
				});
			}
		}
	</script>
</body>
</html>