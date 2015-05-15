<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="content">
	<div class="content-body">
		<table id="${ModelKey}sTable">
		</table>
		<div id="${ModelKey}sTableEidtDlg" class="easyui-dialog"
			data-options="modal:true"
			style="width: 410px; height: 370px; padding: 10px 20px" closed="true"
			buttons="#${ModelKey}sTableEidtDlgButtons">
			<div class="ftitle">${ModelValue}信息</div>
			<form id="${ModelKey}EidtFm" style="margin: 0px; padding: 10px 30px;"
				method="post" novalidate>
				<input type="hidden" value="" name="id"> 
				<div class="fitem">
					<label>${ModelValue}名:</label>
					<div>
						<input name="name" class="easyui-textbox" required="true" />
					</div>
				</div>

				<div class="fitem">
					<label>${ModelValue}编号:</label>
					<div>
						<input name="code" class="easyui-textbox" required="true" />
					</div>
				</div>

				<div class="fitem">
					<label>APK文件:</label>
					<div>
						<input id="apkUrl" name="apkUrl" /> <span class="fitem-info">请上传Android版安装包（.apk）</span>
					</div>
				</div>

				<div class="fitem">
					<label>更新信息:</label>
					<div>
						<input class="easyui-textbox" multiline="true"
							style="height: 90px; padding: 0px;" name="updateInfo" />
					</div>
				</div>
			</form>
		</div>
		<div id="${ModelKey}sTableEidtDlgButtons">
			<a href="javascript:void(0)" class="easyui-linkbutton c6"
				iconCls="icon-ok" onclick="versionAct.save()" style="width: 90px">保存</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-cancel"
				onclick="javascript:$('#${ModelKey}sTableEidtDlg').dialog('close')"
				style="width: 90px">取消</a>
		</div>
		<div id="upload${ModelKey}ApkDlg" class="easyui-dialog"
			data-options="modal:true"
			style="width: 480px; height: 150px; padding: 10px 20px" closed="true"
			buttons="#upload${ModelKey}ApkDlgButtons">
			<form id="upload${ModelKey}ApkFm"
				style="margin: 0px; padding: 10px 30px;" method="post"
				enctype="multipart/form-data">
				<input id="${ModelKey}fb" name="apk" />
			</form>
		</div>
		<div id="upload${ModelKey}ApkDlgButtons">
			<a href="javascript:void(0)" class="easyui-linkbutton c6"
				iconCls="icon-ok" onclick="versionAct.upload()" style="width: 90px">上传</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-cancel"
				onclick="javascript:$('#upload${ModelKey}ApkDlg').dialog('close')"
				style="width: 90px">取消</a>
		</div>
		<script type="text/javascript">
			var versionAct = {
				url : "",
				create : function() {
					versionInit.dialogOpen();
					this.url = _ctx + '${RequestRoute}/create';
				},
				modify : function() {
					var row = $("#${ModelKey}sTable").datagrid('getSelected');
					if (row) {
						versionInit.dialogOpen(row);
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
								$("#${ModelKey}sTable").datagrid('reload'); // reload the version data
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
											$("#${ModelKey}sTable").datagrid('reload'); // reload the version data
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
				},
				upload : function() {
					$('#upload${ModelKey}ApkFm').form('submit', {
						url : _ctx + "${RequestRoute}/upload/apk",
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
								$("#upload${ModelKey}ApkDlg").dialog('close'); // close the dialog
								$('#apkUrl').textbox('setValue', result.datas);
							}
						}
					});
				}

			};

			var versionInit = {
				table : function() {
					$("#${ModelKey}sTable").datagrid({
						title : "${ModelValue}列表",
						url : _ctx + '${RequestRoute}/list',
						method : 'POST',
						columns : [ [ {
							field : 'name',
							title : '${ModelValue}名',
							width : 50
						}, {
							field : 'code',
							title : '${ModelValue}编号',
							width : 100
						}, {
							field : 'updateInfo',
							title : '更新信息',
							width : 140
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
						toolbar : [ {
							iconCls : 'icon-add',
							text : '添加',
							plain : true,
							handler : function() {
								versionAct.create();
							}
						}, '-', {
							iconCls : 'icon-edit',
							text : '修改',
							plain : true,
							handler : function() {
								versionAct.modify();
							}
						}, '-', {
							iconCls : 'icon-remove',
							text : '删除',
							plain : true,
							handler : function() {
								versionAct.destroy();
							}
						} ]
					});
				},
				upload : function() {
					$('#apkUrl').textbox({
						buttonText : "附件",
						buttonIcon : "ips-icon-file",
						editable : false,
						icons : [ {
							iconCls : 'icon-clear',
							iconAlign : 'right',
							handler : function(e) {
								$('#apkUrl').textbox('clear');
							}
						} ],
						onClickButton : function() {
							$('#upload${ModelKey}ApkFm').form('clear');
							$("#upload${ModelKey}ApkDlg").dialog('open').dialog('setTitle', '文件上传');
						}

					});
					$('#${ModelKey}fb').filebox({
						buttonText : "选择文件",
						editable : false,
						required : true,
						width : 360,
						onChange : function(newValue, oldValue) {
							if (newValue == "") {
								return;
							}
							if (!verify.apkFile(newValue)) {
								easyUIMsg.alert("文件选择失败，请选择APK文件（apk文件）！");
								$(this).textbox('clear');
							}
						}
					})
				},
				orderText : function() {
					$('#orderNum').textbox({
						value : '10'
					})
				},
				dialogOpen : function(data) {
					if (data) {
						$('#${ModelKey}EidtFm').form('load', data);
						$("#${ModelKey}sTableEidtDlg").dialog('open').dialog('setTitle', '编辑${ModelValue}');
					} else {
						$('#${ModelKey}EidtFm').form('clear');
						versionInit.orderText();
						$("#${ModelKey}sTableEidtDlg").dialog('open').dialog('setTitle', '新建${ModelValue}');
					}
				}
			};

			$(document).ready(function() {
				versionInit.table();
				versionInit.upload();
				versionInit.orderText();
			});
		</script>
	</div>
</div>