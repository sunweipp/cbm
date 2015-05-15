<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="content">
	<div class="content-body" id="content-body-${ModelKey}">
		<table id="${ModelKey}sTable">
		</table>
		<div id="${ModelKey}sTableEidtDlg" class="easyui-dialog"
			data-options="modal:true"
			style="width: 480px; height: 400px; padding: 10px 20px" closed="true"
			buttons="#${ModelKey}sTableEidtDlgButtons">
			<div class="ftitle">${ModelValue}信息</div>
			<form id="${ModelKey}EidtFm" style="margin: 0px; padding: 10px 30px;"
				method="post" novalidate>
				<input type="hidden" value="" name="id">
				<div class="fitem">
					<label>${ModelValue}名:</label>
					<div>
						<input name="username" class="easyui-textbox" required="true" />
					</div>
				</div>
				<div class="fitem">
					<label>昵称:</label>
					<div>
						<input name="nickname" class="easyui-textbox" />
					</div>
				</div>
				<div class="fitem">
					<label>手机号:</label>
					<div>
						<input name="phone" class="easyui-textbox" />
					</div>
				</div>
				<div class="fitem">
					<label>设备类型:</label>
					<div>
						<input name="deviceType" class="easyui-textbox" />
					</div>
				</div>
				<div class="fitem">
					<label>状态:</label>
					<div>
						<input id="memberStatusSel" name="status" />
					</div>
				</div>
				<div class="fitem" height="60px">
					<label>备注:</label>
					<div>
						<input class="easyui-textbox" multiline="true"
							style="height: 60px; padding: 0px;" name="remarks" />
					</div>
				</div>
			</form>
		</div>
		<div id="${ModelKey}sTableEidtDlgButtons">
			<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"
				onclick="memberAct.save()" style="width: 90px">保存</a> <a
				href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
				onclick="javascript:$('#${ModelKey}sTableEidtDlg').dialog('close')"
				style="width: 90px">取消</a>
		</div>
		<script type="text/javascript">
			var memberAct = {
				url : "",
				modify : function() {
					var row = $("#${ModelKey}sTable").datagrid('getSelected');
					if (row) {
						memberInit.dialogOpen(row);
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
								$("#${ModelKey}sTable").datagrid('reload'); // reload the member data
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
													'reload'); // reload the member data
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

			var memberInit = {
				table : function() {
					$("#${ModelKey}sTable").datagrid({
						title : "${ModelValue}列表",
						url : _ctx + '${RequestRoute}/list',
						method : 'POST',
						columns : [ [ {
							field : 'username',
							title : '${ModelValue}名',
							width : 100
						}, {
							field : 'nickname',
							title : '昵称',
							width : 100
						}, {
							field : 'phone',
							title : '绑定手机号',
							width : 100
						}, {
							field : 'deviceType',
							title : '设备类型',
							width : 100
						}, {
							field : 'status',
							title : '状态',
							width : 80
						}, {
							field : 'updateAt',
							title : '更新时间',
							width : 80
						} ] ],
						pagination : true,
						rownumbers : true,
						singleSelect : true,
						fitColumns : true,
						fixed : true,
						toolbar : [  {
							iconCls : 'icon-edit',
							text : '修改',
							plain : true,
							handler : function() {
								memberAct.modify();
							}
						}, '-', {
							iconCls : 'icon-remove',
							text : '删除',
							plain : true,
							handler : function() {
								memberAct.destroy();
							}
						} ]
					});
				},
				roleSelect : function() {
					$.ajax({
						url : _ctx + '/sysManage/roles/selList',
						dataType : "JSON",
						success : function(datas) {
							$("#userRoleSelect").combobox({
								data : datas,
								valueField : 'id',
								textField : 'roleName',
								editable : false,
								icons : [ {
									iconCls : 'icon-clear',
									iconAlign : 'right',
									handler : function(e) {
										$("#userRoleSelect").combobox('clear');
									}
								} ],
								onLoadError : function() {
									memberInit.roleSelect();
								}
							});
						}
					});
				},
				tagSelect : function() {
					$.ajax({
						url : _ctx + '/deviceManage/tags/selList',
						dataType : "JSON",
						success : function(datas) {
							$("#userTagSelect").combobox({
								data : datas,
								valueField : 'id',
								textField : 'tagName',
								editable : false,
								icons : [ {
									iconCls : 'icon-clear',
									iconAlign : 'right',
									handler : function(e) {
										$("#userTagSelect").combobox('clear');
									}
								} ],
								onLoadError : function() {
									console.log("error");
									memberInit.tagSelect();
								}
							});
						}
					});
				},
				dialogOpen : function(data) {
					if (data) {
						$('#${ModelKey}EidtFm').form('load', data);
						$("#${ModelKey}sTableEidtDlg").dialog('open').dialog(
								'setTitle', '编辑${ModelValue}');
					} else {
						$('#${ModelKey}EidtFm').form('clear');
						$("#${ModelKey}sTableEidtDlg").dialog('open').dialog(
								'setTitle', '新建${ModelValue}');
					}
				}
			};

			$(document).ready(function() {
				memberInit.table();
				//memberInit.roleSelect();
				//memberInit.tagSelect();
			});
		</script>
	</div>
</div>