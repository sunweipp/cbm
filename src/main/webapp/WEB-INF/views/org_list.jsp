<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="content">
	<div class="content-body">
		<table id="${ModelKey}sTable">
		</table>
		<div id="${ModelKey}sTableToolBar" style="padding: 2px 5px;">
			<div>
				机构名称: <input class="easyui-textbox" id="${ModelKey}sSearchOrgName"
					data-options="prompt:'请输入机构名称，支持模糊查询'" style="width: 200px;">&nbsp;&nbsp;&nbsp;&nbsp;
				分类: <input id="categorySelectFor${ModelKey}Search" /> <a href="#"
					class="easyui-linkbutton" iconCls="icon-search"
					onclick="javascript:orgAct.search();">查询</a>
			</div>
			<div>
				<table cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<td><a href="#" class="easyui-linkbutton" iconCls="icon-add"
								onclick="javascript:orgAct.create();">添加</a></td>
							<td><div class="datagrid-btn-separator"></div></td>
							<td><a href="#" class="easyui-linkbutton" iconCls="icon-edit"
								onclick="javascript:orgAct.modify();">修改</a></td>
							<td><div class="datagrid-btn-separator"></div></td>
							<td><a href="#" class="easyui-linkbutton" iconCls="sw-icon-excel"
								onclick="javascript:orgAct.popUploadExcelForm();">数据批量导入</a></td>
							<td><div class="datagrid-btn-separator"></div></td>
							<td><a href="#" class="easyui-linkbutton" iconCls="icon-remove"
								onclick="javascript:orgAct.destroy();">删除</a></td>
								<td><div class="datagrid-btn-separator"></div></td>
							<td><a href="#" class="easyui-linkbutton" iconCls="icon-remove"
								onclick="javascript:orgAct.destroyAll();">删除该页</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div id="${ModelKey}sTableEidtDlg" class="easyui-dialog"
			data-options="modal:true"
			style="width: 780px; height: 530px; padding: 10px 20px" closed="true"
			buttons="#${ModelKey}sTableEidtDlgButtons">
			<div class="ftitle">${ModelValue}信息</div>
			<form id="${ModelKey}EidtFm" style="margin: 0px; padding: 10px 30px;"
				method="post" novalidate>
				<input type="hidden" value="" name="id"> <input type="hidden"
					value="" name="imageId" id="${ModelKey}ImageId">
				<div class="fitem">
					<label>${ModelValue}名:</label>
					<div>
						<input name="name" class="easyui-textbox" required="true" />
					</div>
				</div>
				<div class="fitem-division"></div>
				<div class="fitem">
					<label>图片:</label>
					<div>
						<input id="${ModelKey}ImageUrl" name="imageUrl" /> <span
							class="fitem-info">请上传图片文件（.jpg/.png/.bmp）</span>
					</div>
				</div>
				<div class="fitem">
					<label>简介:</label>
					<div>
						<input class="easyui-textbox" multiline="true"
							style="height: 40px; padding: 0px; width: 568px" name="profile" />
					</div>
				</div>
				<div class="fitem">
					<label>联系电话:</label>
					<div>
						<input name="tel" class="easyui-textbox" />
					</div>
				</div>
				<div class="fitem-division"></div>
				<div class="fitem">
					<label>联系人:</label>
					<div>
						<input name="contacts" class="easyui-textbox" />
					</div>
				</div>
				<div class="fitem">
					<label>地址:</label>
					<div>
						<input name="address" class="easyui-textbox" />
					</div>
				</div>
				<div class="fitem-division"></div>
				<div class="fitem">
					<label>经度:</label>
					<div>
						<input name="longitude" class="easyui-textbox" />
					</div>
				</div>
				<div class="fitem">
					<label>维度:</label>
					<div>
						<input name="latitude" class="easyui-textbox" />
					</div>
				</div>
				<div class="fitem-division"></div>
				<div class="fitem">
					<label>好评数:</label>
					<div>
						<input name="goodCount" class="easyui-textbox" />
					</div>
				</div>
				<div class="fitem">
					<label>分类:</label>
					<div>
						<input id="categorySelect" name="categoryId" />
					</div>
				</div>
				<div class="fitem-division"></div>
				<div class="fitem">
					<label>星级:</label>
					<div>
						<input id="starSelect" name="starCount" />
					</div>
				</div>
				<div class="fitem">
					<label>排序:</label>
					<div>
						<input id="${ModelKey}OrderNum" name="orderNum" required="true" />
					</div>
				</div>
				<div class="fitem-division"></div>
				<div class="fitem">
					<label>首页推荐:</label>
					<div>
						<input id="${ModelKey}IsTopSelect" name="isTop" />
					</div>
				</div>
				<div class="fitem">
					<label>详细:</label>
					<div>
						<input class="easyui-textbox" multiline="true"
							style="height: 100px; padding: 0px; width: 568px" name="detail" />
					</div>
				</div>
			</form>
		</div>
		<div id="${ModelKey}sTableEidtDlgButtons">
			<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"
				onclick="orgAct.save()" style="width: 90px">保存</a> <a
				href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
				onclick="javascript:$('#${ModelKey}sTableEidtDlg').dialog('close')"
				style="width: 90px">取消</a>
		</div>
		<div id="upload${ModelKey}ExcelDlg" class="easyui-dialog"
			data-options="modal:true"
			style="width: 480px; height: 150px; padding: 10px 20px" closed="true"
			buttons="#upload${ModelKey}ExcelDlgButtons">
			<form id="upload${ModelKey}ExcelFm" style="margin: 0px; padding: 10px 30px;"
				method="post" enctype="multipart/form-data">
				<input id="fbExcel" name="excel" />
			</form>
		</div>
		<div id="upload${ModelKey}ExcelDlgButtons">
			<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"
				onclick="orgAct.uploadExcel()" style="width: 90px">导入</a> <a
				href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
				onclick="javascript:$('#upload${ModelKey}ExcelDlg').dialog('close')"
				style="width: 90px">取消</a>
		</div>
		<div id="upload${ModelKey}PicDlg" class="easyui-dialog"
			data-options="modal:true"
			style="width: 480px; height: 150px; padding: 10px 20px" closed="true"
			buttons="#upload${ModelKey}PicDlgButtons">
			<form id="upload${ModelKey}PicFm" style="margin: 0px; padding: 10px 30px;"
				method="post" enctype="multipart/form-data">
				<input id="fbPic" name="images" />
			</form>
		</div>
		<div id="upload${ModelKey}PicDlgButtons">
			<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"
				onclick="orgAct.uploadPic()" style="width: 90px">上传</a> <a
				href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
				onclick="javascript:$('#upload${ModelKey}PicDlg').dialog('close')"
				style="width: 90px">取消</a>
		</div>
		<script type="text/javascript">
			var orgAct = {
				url : "",
				create : function() {
					orgInit.dialogOpen();
					this.url = _ctx + '${RequestRoute}/create';
				},
				modify : function() {
					//var row = $("#${ModelKey}sTable").datagrid('getSelected');
					var rows = $("#${ModelKey}sTable").datagrid('getSelections');
					if (rows.length == 1) {
						orgInit.dialogOpen(rows[0]);
						this.url = _ctx + '${RequestRoute}/alter';
					} else {
						$.messager.alert('提醒', '请选择一条数据进行编辑操作', '确定');
					}
				},
				popUploadExcelForm : function() {
					$('#upload${ModelKey}ExcelFm').form('clear');
					$("#upload${ModelKey}ExcelDlg").dialog('open').dialog('setTitle', '数据文件导入');
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
								orgAct.tableReload() // reload the org data
							}
						}
					});
				},
				destroy : function() {
					var rows = $("#${ModelKey}sTable").datagrid('getSelections');
					if (rows.length > 0) {
						$.messager.confirm('确定', '是否确定需要删除所选数据？', function(r) {
							if (r) {
								var rowIds = "";
								for (var i = 0; i < rows.length; i++) {
									rowIds += "," + rows[i].id;
								}
								if (rowIds.length > 0) {
									rowIds = rowIds.substring(1)
								}
								$.ajax({
									type : "POST",
									url : _ctx + '${RequestRoute}/destroyByIds',
									data : {
										"ids" : rowIds
									},
									success : function(result) {
										if (result.success) {
											$("#${ModelKey}sTable").datagrid('reload'); // reload the org data
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
						$.messager.alert('提醒', '请至少选择一条数据进行删除操作', '确定');
					}
				},
				destroyAll : function() {
					var rows = $("#${ModelKey}sTable").datagrid('getRows');
					if (rows.length > 0) {
						$.messager.confirm('确定', '是否确定需要删除所选数据？', function(r) {
							if (r) {
								var rowIds = "";
								for (var i = 0; i < rows.length; i++) {
									rowIds += "," + rows[i].id;
								}
								if (rowIds.length > 0) {
									rowIds = rowIds.substring(1)
								}
								$.ajax({
									type : "POST",
									url : _ctx + '${RequestRoute}/destroyByIds',
									data : {
										"ids" : rowIds
									},
									success : function(result) {
										if (result.success) {
											$("#${ModelKey}sTable").datagrid('reload'); // reload the org data
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
						$.messager.alert('提醒', '无有效数据可进行删除操作', '确定');
					}
				},
				search : function() {
					orgAct.tableReload();
				},
				tableReload : function() {
					$("#${ModelKey}sTable").datagrid({
						queryParams : {
							name : $("#${ModelKey}sSearchOrgName").textbox('getValue'),
							categoryId : $("#categorySelectFor${ModelKey}Search").combobox('getValues').toString(),
						}
					});
				},
				uploadPic : function() {
					$('#upload${ModelKey}PicFm').form('submit', {
						url : _ctx + "/images/upload/1",
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
								$('#${ModelKey}ImageUrl').textbox('setValue', result.datas[0].origin);
								$('#${ModelKey}ImageId').val(result.datas[0].id);
							}
						}
					});
				},
				uploadExcel : function() {
					$('#upload${ModelKey}ExcelFm').form('submit', {
						url : _ctx + "${RequestRoute}/excels/upload",
						onSubmit : function() {
							var isSuccess = $(this).form('validate');
							if (isSuccess) {
								$.messager.progress();
							}

							return isSuccess;
						},
						success : function(result) {
							$.messager.progress('close');
							var result = eval('(' + result + ')');
							if (!result.success) {
								$.messager.show({
									title : 'Error',
									msg : result.message
								});
							} else {
								$.messager.show({
									title : '导入成功',
									msg : result.message
								});
								$("#upload${ModelKey}ExcelDlg").dialog('close'); // close the dialog
								orgAct.tableReload() // reload the org data
							}
						}
					});
				}
			};

			var orgInit = {
				table : function() {
					$("#${ModelKey}sTable").datagrid({
						title : "${ModelValue}列表",
						url : _ctx + '${RequestRoute}/listSearch',
						method : 'POST',
						columns : [ [ {
							field : 'name',
							title : '${ModelValue}名',
							width : 50
						}, {
							field : 'profile',
							title : '简介',
							width : 100
						}, {
							field : 'tel',
							title : '联系电话',
							width : 60
						}, {
							field : 'address',
							title : '地址',
							width : 100
						}, {
							field : 'updateAt',
							title : '更新时间',
							width : 80
						} ] ],
						pagination : true,
						rownumbers : true,
						singleSelect : false,
						fitColumns : true,
						fixed : true,
						toolbar : "#${ModelKey}sTableToolBar"
					});
				},
				uploadPic : function() {
					$('#${ModelKey}ImageUrl').textbox({
						buttonText : "附件",
						buttonIcon : "ips-icon-file",
						editable : false,
						icons : [ {
							iconCls : 'icon-clear',
							iconAlign : 'right',
							handler : function(e) {
								$('#${ModelKey}ImageUrl').textbox('clear');
								$('#${ModelKey}ImageId').val("");
							}
						} ],
						onClickButton : function() {
							$('#upload${ModelKey}PicFm').form('clear');
							$("#upload${ModelKey}PicDlg").dialog('open').dialog('setTitle', '文件上传');
						}

					});
					$('#fbPic').filebox({
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
				uploadExcel : function() {
					$('#fbExcel').filebox({
						buttonText : "选择数据文件",
						editable : false,
						required : true,
						width : 360,
						onChange : function(newValue, oldValue) {
							if (newValue == "") {
								return;
							}
							if (!verify.excelFile(newValue)) {
								easyUIMsg.alert("文件选择失败，请选择Excel文件（xls,xlsx或CSV文件）！");
								$(this).textbox('clear');
							}
						}
					})
				},
				dialogOpen : function(data) {
					if (data) {
						$('#${ModelKey}EidtFm').form('load', data);
						$("#categorySelect").combobox('setValues', data.categoryId.split(','));
						$("#${ModelKey}sTableEidtDlg").dialog('open').dialog('setTitle', '编辑${ModelValue}');
					} else {
						$('#${ModelKey}EidtFm').form('clear');
						orgInit.starSelect();
						orgInit.isTopSelect();
						orgInit.orderText();
						$("#${ModelKey}sTableEidtDlg").dialog('open').dialog('setTitle', '新建${ModelValue}');
					}
				},
				categorySelect : function() {
					$.ajax({
						url : _ctx + '/categories/sel',
						dataType : "JSON",
						success : function(datas) {
							$("#categorySelect").combobox({
								data : datas,
								valueField : 'id',
								textField : 'name',
								editable : false,
								multiple : true,
								icons : [ {
									iconCls : 'icon-clear',
									iconAlign : 'right',
									handler : function(e) {
										$("#categorySelect").combobox('clear');
									}
								} ],
								onLoadError : function() {
									easyUIMsg.error("数据加载失败！", "异常")
								}
							});
							$("#categorySelectFor${ModelKey}Search").combobox({
								data : datas,
								valueField : 'id',
								textField : 'name',
								editable : false,
								multiple : true,
								icons : [ {
									iconCls : 'icon-clear',
									iconAlign : 'right',
									handler : function(e) {
										$("#categorySelectFor${ModelKey}Search").combobox('clear');
									}
								} ],
								onLoadError : function() {
									easyUIMsg.error("数据加载失败！", "异常")
								}
							});
						}
					});
				},
				starSelectData : [ {
					"star" : "0"
				}, {
					"star" : "0.5"
				}, {
					"star" : "1"
				}, {
					"star" : "1.5"
				}, {
					"star" : "2"
				}, {
					"star" : "2.5"
				}, {
					"star" : "3"
				}, {
					"star" : "3.5"
				}, {
					"star" : "4",
					"selected" : true
				}, {
					"star" : "4.5"
				}, {
					"star" : "5"
				} ],
				starSelect : function() {
					$("#starSelect").combobox({
						data : orgInit.starSelectData,
						valueField : 'star',
						textField : 'star',
						editable : false
					});
				},
				orderText : function() {
					$('#${ModelKey}OrderNum').textbox({
						value : '10'
					})
				},
				isTopSelectData : [ {
					"key" : "0",
					"value" : "否"
				}, {
					"key" : "1",
					"value" : "是",
					"selected" : true
				} ],
				isTopSelect : function() {
					$("#${ModelKey}IsTopSelect").combobox({
						data : orgInit.isTopSelectData,
						valueField : 'key',
						textField : 'value',
						editable : false
					});
				},
			};

			$(document).ready(function() {

				orgInit.categorySelect();
				orgInit.starSelect();
				orgInit.isTopSelect();
				orgInit.orderText();
				orgInit.uploadPic();
				orgInit.uploadExcel();
				orgInit.table();
			});
		</script>
	</div>
</div>