<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="content">
	<div class="content-body">
		<table id="${ModelKey}sTable">
		</table>
		<div id="${ModelKey}sTableEidtDlg" class="easyui-dialog"
			data-options="modal:true"
			style="width: 780px; height: 560px; padding: 10px 20px" closed="true"
			buttons="#${ModelKey}sTableEidtDlgButtons">
			<div class="ftitle">${ModelValue}信息</div>
			<form id="${ModelKey}EidtFm" style="margin: 0px; padding: 10px 30px;"
				method="post" novalidate>
				<input type="hidden" value="" name="id" />
				<div class="fitem">
					<label>${ModelValue}内容:</label>
					<div>
						<input name="content" class="easyui-textbox" multiline="true"
							style="height: 100px; padding: 0px; width: 568px" />
					</div>
				</div>
				<div class="fitem">
					<label>分数:</label>
					<div>
						<input id="startDate" name="startDate" class="easyui-datebox" />
					</div>
				</div>
				<div class="fitem">
					<label>${ModelValue}时间:</label>
					<div>
						<input id="endDate" name="endDate" class="easyui-datebox" />
					</div>
				</div>
			</form>
		</div>
		<div id="${ModelKey}sTableEidtDlgButtons">
			<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"
				onclick="commentCouAct.save()" style="width: 90px">保存</a> <a
				href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
				onclick="javascript:$('#${ModelKey}sTableEidtDlg').dialog('close')"
				style="width: 90px">取消</a>
		</div>
		<script type="text/javascript">
			var commentCouAct = {
				url : "",
				create : function() {
					commentCouInit.dialogOpen();
					this.url = _ctx + '${RequestRoute}/create';
				},
				modify : function() {
					var row = $("#${ModelKey}sTable").datagrid('getSelected');
					if (row) {
						commentCouInit.dialogOpen(row);
						this.url = _ctx + '${RequestRoute}/alter';
					} else {
						$.messager.alert('提醒', '请选择一条数据进行编辑操作', '确定');
					}
				},
				save : function() {
					$('#${ModelKey}EidtFm').form('submit', {
						url : this.url,
						onSubmit : function() {
							return $(this).form('validate');
						},
						success : function(result) {
							var result = eval('(' + result + ')');
							if (!result.success) {
								$.messager.show({
									title : 'Error',
									msg : result.message
								});
							} else {
								$("#${ModelKey}sTableEidtDlg").dialog('close'); // close the dialog
								$("#${ModelKey}sTable").datagrid('reload'); // reload the commentCou data
							}
						}
					});
				},
				destroy : function() {
					var row = $("#${ModelKey}sTable").datagrid('getSelected');
					if (row) {
						$.messager.confirm('确定', '是否确定需要删除该条数据？', function(r) {
							if (r) {
								$.ajax({
									type : "POST",
									url : _ctx + '${RequestRoute}/destroy',
									data : {
										"id" : row.id
									},
									success : function(result) {
										if (result.success) {
											$("#${ModelKey}sTable").datagrid(
													'reload'); // reload the commentCou data
										} else {
											$.messager.show({ // show error message
												title : 'Error',
												msg : result.message
											});
										}
									},
									dataType : "json"
								});
							}
						});
					} else {
						$.messager.alert('提醒', '请选择一条数据进行删除操作', '确定');
					}
				}

			};

			var commentCouInit = {
				table : function() {
					$("#${ModelKey}sTable").datagrid({
						title : "${ModelValue}列表",
						url : _ctx + '${RequestRoute}/list',
						method : 'POST',
						columns : [ [ {
							field : 'content',
							title : '${ModelValue}内容',
							width : 150
						}, {
							field : 'score',
							title : '分数',
							width : 80
						}, {
							field : 'createrName',
							title : '评论人',
							width : 80
						}, {
							field : 'createAt',
							title : '评论时间',
							width : 60
						} ] ],
						pagination : true,
						rownumbers : true,
						singleSelect : true,
						fitColumns : true,
						fixed : true,
						toolbar : [ {
							iconCls : 'icon-add',
							text : '添加',
							plain : true,
							handler : function() {
								commentCouAct.create();
							}
						}, '-', {
							iconCls : 'icon-edit',
							text : '修改',
							plain : true,
							handler : function() {
								commentCouAct.modify();
							}
						}, '-', {
							iconCls : 'icon-remove',
							text : '删除',
							plain : true,
							handler : function() {
								commentCouAct.destroy();
							}
						} ]
					});
				},
				dialogOpen : function(data) {
					if (data) {
						$('#${ModelKey}EidtFm').form('load', data);
						$("#${ModelKey}sTableEidtDlg").dialog('open').dialog(
								'setTitle', '编辑${ModelValue}');
					} else {
						$('#${ModelKey}EidtFm').form('clear');
						commentCouInit.isTopSelect();
						commentCouInit.orderText();
						$("#${ModelKey}sTableEidtDlg").dialog('open').dialog(
								'setTitle', '新建${ModelValue}');
					}
				}
			};

			$(document).ready(function() {
				commentCouInit.table();
			});
		</script>
	</div>
</div>