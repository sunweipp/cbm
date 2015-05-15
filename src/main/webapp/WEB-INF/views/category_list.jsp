<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="content">
	<div class="content-body">
		<table id="${ModelKey}sTable">
		</table>
		<div id="${ModelKey}sTableEidtDlg" class="easyui-dialog"
			data-options="modal:true"
			style="width: 420px; height: 420px; padding: 10px 20px" closed="true"
			buttons="#${ModelKey}sTableEidtDlgButtons">
			<div class="ftitle">${ModelValue}信息</div>
			<form id="${ModelKey}EidtFm" style="margin: 0px; padding: 10px 30px;"
				method="post" novalidate>
				<input type="hidden" value="" name="id"> <input type="hidden"
					value="" name="iconId" id="iconId">
				<div class="fitem">
					<label>${ModelValue}名:</label>
					<div>
						<input name="name" class="easyui-textbox" required="true" />
					</div>
				</div>
				<div class="fitem">
					<label>图标:</label>
					<div>
						<input id="iconUrl" name="iconUrl" /> <span class="fitem-info">请上传图片文件（.jpg/.png/.bmp）</span>
						<div id="divIconPreView"
							style="position: relative; width: 100px; height: 100px"></div>
					</div>
				</div>
				<div class="fitem">
					<label>排序:</label>
					<div>
						<input id="orderNum" name="orderNum" required="true" />
					</div>
				</div>
				<div class="fitem">
					<label>备注:</label>
					<div>
						<input class="easyui-textbox" multiline="true"
							style="height: 40px; padding: 0px;" remarks" />
					</div>
				</div>
			</form>
		</div>
		<div id="${ModelKey}sTableEidtDlgButtons">
			<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"
				onclick="categoryAct.save()" style="width: 90px">保存</a> <a
				href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
				onclick="javascript:$('#${ModelKey}sTableEidtDlg').dialog('close')"
				style="width: 90px">取消</a>
		</div>
		<div id="upload${ModelKey}PicDlg" class="easyui-dialog"
			data-options="modal:true"
			style="width: 480px; height: 150px; padding: 10px 20px" closed="true"
			buttons="#upload${ModelKey}PicDlgButtons">
			<form id="upload${ModelKey}PicFm" style="margin: 0px; padding: 10px 30px;"
				method="post" enctype="multipart/form-data">
				<input id="fb" name="images" />
			</form>
		</div>
		<div id="upload${ModelKey}PicDlgButtons">
			<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"
				onclick="categoryAct.upload()" style="width: 90px">上传</a> <a
				href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
				onclick="javascript:$('#upload${ModelKey}PicDlg').dialog('close')"
				style="width: 90px">取消</a>
		</div>
		<script type="text/javascript">
			var categoryAct = {
				url : "",
				create : function() {
					categoryInit.dialogOpen();
					this.url = _ctx + '${RequestRoute}/create';
				},
				modify : function() {
					var row = $("#${ModelKey}sTable").datagrid('getSelected');
					if (row) {
						categoryInit.dialogOpen(row);
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
								$("#${ModelKey}sTable").datagrid('reload'); // reload the category data
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
											$("#${ModelKey}sTable").datagrid('reload'); // reload the category data
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
					$('#upload${ModelKey}PicFm').form('submit', {
						url : _ctx + "/images/upload/3",
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
								$("#upload${ModelKey}PicDlg").dialog('close'); // close the dialog
								$('#iconUrl').textbox('setValue', result.datas[0].origin);
								categoryInit.iconPreView();
								$('#iconId').val(result.datas[0].id);
							}
						}
					});
				}

			};

			var categoryInit = {
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
							field : 'iconUrl',
							title : '图标',
							width : 100,
							formatter : function(value) {
								if (value) {
									return "<a href='#' onmouseover='popIconView(event,\"" + _ctx + value + "\")' onmouseout='misIconView()'>" + value + "</a>";
								}
							}
						}, {
							field : 'remarks',
							title : '备注',
							width : 100
						}, {
							field : 'orderNum',
							title : '排序号',
							width : 40
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
								categoryAct.create();
							}
						}, '-', {
							iconCls : 'icon-edit',
							text : '修改',
							plain : true,
							handler : function() {
								categoryAct.modify();
							}
						}, '-', {
							iconCls : 'icon-remove',
							text : '删除',
							plain : true,
							handler : function() {
								categoryAct.destroy();
							}
						} ]
					});
				},
				upload : function() {
					$('#iconUrl').textbox({
						buttonText : "附件",
						buttonIcon : "ips-icon-file",
						editable : false,
						icons : [ {
							iconCls : 'icon-clear',
							iconAlign : 'right',
							handler : function(e) {
								$('#iconUrl').textbox('clear');
								$('#iconId').val("");
								$("#divIconPreView").html("");
							}
						} ],
						onClickButton : function() {
							$('#upload${ModelKey}PicFm').form('clear');
							$("#upload${ModelKey}PicDlg").dialog('open').dialog('setTitle', '文件上传');
						}

					});
					$('#fb').filebox({
						buttonText : "选择文件",
						editable : false,
						required : true,
						width : 360,
						onChange : function(newValue, oldValue) {
							if (newValue == "") {
								return;
							}
							if (!verify.imageFile(newValue)) {
								easyUIMsg.alert("文件选择失败，请选择图片文件（jpg，jpeg，png或bmp文件）！");
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
				iconPreView : function() {
					var url = $('#iconUrl').textbox('getValue');
					if (url) {
						var preViewImg = $("<img width='100px' height='100px' src='" + _ctx + url + "' />");
						$("#divIconPreView").append(preViewImg);
					}

				},
				dialogOpen : function(data) {
					$("#divIconPreView").html("");
					if (data) {
						$('#${ModelKey}EidtFm').form('load', data);
						$("#${ModelKey}sTableEidtDlg").dialog('open').dialog('setTitle', '编辑${ModelValue}');
					} else {
						$('#${ModelKey}EidtFm').form('clear');
						categoryInit.orderText();
						$("#${ModelKey}sTableEidtDlg").dialog('open').dialog('setTitle', '新建${ModelValue}');
					}
					categoryInit.iconPreView();
				}
			};

			$(document).ready(function() {
				categoryInit.table();
				categoryInit.upload();
				categoryInit.orderText();
			});

			var iconView = null;
			function popIconView(e, url) {
				iconView = $("<div style='position:fixed;left:" + (e.clientX + 5) + "px;top:" + (e.clientY - 100) + "px'><img height='100px' width='100px' src='" + url + "'/></div>");
				$(document.body).append(iconView);
			}

			function misIconView() {
				if (iconView != null) {
					iconView.remove();
				}
			}
		</script>
	</div>
</div>