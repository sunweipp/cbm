<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="content">
	<div class="content-body">
		<table id="${ModelKey}sTable">
		</table>
		<div id="${ModelKey}sTableToolBar" style="padding: 2px 5px;">
			<div>
				课程名称: <input class="easyui-textbox" id="${ModelKey}sSearchCouName"
					data-options="prompt:'请输入课程名称，支持模糊查询'" style="width: 200px;">&nbsp;&nbsp;&nbsp;&nbsp;
				地址: <input class="easyui-textbox" id="${ModelKey}sSearchAddress"
					data-options="prompt:'请输地址名称，支持模糊查询'" style="width: 200px;">&nbsp;&nbsp;&nbsp;&nbsp;
				所属机构: <input id="couSelectFor${ModelKey}Search" /> <a href="#"
					class="easyui-linkbutton" iconCls="icon-search"
					onclick="javascript:courseAct.search();">查询</a>
			</div>
			<div>
				<table cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<td><a href="#" class="easyui-linkbutton" iconCls="icon-add"
								onclick="javascript:courseAct.create();">添加</a></td>
							<td><div class="datagrid-btn-separator"></div></td>
							<td><a href="#" class="easyui-linkbutton" iconCls="icon-edit"
								onclick="javascript:courseAct.modify();">修改</a></td>
							<td><div class="datagrid-btn-separator"></div></td>
							<td><a href="#" class="easyui-linkbutton" iconCls="sw-icon-excel"
								onclick="javascript:courseAct.popUploadExcelForm();">数据批量导入</a></td>
							<td><div class="datagrid-btn-separator"></div></td>
							<td><a href="#" class="easyui-linkbutton" iconCls="icon-remove"
								onclick="javascript:courseAct.destroy();">删除</a></td>
							<td><div class="datagrid-btn-separator"></div></td>
							<td><a href="#" class="easyui-linkbutton" iconCls="icon-remove"
								onclick="javascript:courseAct.destroyAll();">删除该页</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div id="${ModelKey}sTableEidtDlg" class="easyui-dialog"
			data-options="modal:true"
			style="width: 780px; height: 560px; padding: 10px 20px" closed="true"
			buttons="#${ModelKey}sTableEidtDlgButtons">
			<div class="ftitle">${ModelValue}信息</div>
			<form id="${ModelKey}EidtFm" style="margin: 0px; padding: 10px 30px;"
				method="post" novalidate>
				<input type="hidden" value="" name="id" /> <input type="hidden" value=""
					name="imageId" id="${ModelKey}ImageId" />
				<div class="fitem">
					<label>${ModelValue}名:</label>
					<div>
						<input name="name" class="easyui-textbox" required="true" />
					</div>
				</div>
				<div class="fitem-division"></div>
				<div class="fitem">
					<label>所属机构:</label>
					<div>
						<input id="orgSelect" name="orgId" class="easyui-textbox" />
					</div>
				</div>
				<div class="fitem">
					<label>开始日期:</label>
					<div>
						<input id="startDate" name="startDate" class="easyui-datebox" />
					</div>
				</div>
				<div class="fitem-division"></div>
				<div class="fitem">
					<label>结束时间:</label>
					<div>
						<input id="endDate" name="endDate" class="easyui-datebox" />
					</div>
				</div>
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
						<input name="profile" class="easyui-textbox" multiline="true"
							style="height: 40px; padding: 0px; width: 568px" />
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
					<label>地址:</label>
					<div>
						<input name="address" class="easyui-textbox" />
					</div>
				</div>
				<div class="fitem">
					<label>目标:</label>
					<div>
						<input name="goal" class="easyui-textbox" />
					</div>
				</div>
				<div class="fitem-division"></div>
				<div class="fitem">
					<label>价格:</label>
					<div>
						<input name="price" class="easyui-textbox" />
					</div>
				</div>
				<div class="fitem">
					<label>适合学习:</label>
					<div>
						<input name="suitFor" class="easyui-textbox" />
					</div>
				</div>
				<div class="fitem-division"></div>
				<div class="fitem">
					<label>适合年龄:</label>
					<div class="fitem-division" style="width: 80px">
						<input name="ageStart" class="easyui-textbox" style="width: 80px" />
					</div>
					<div class="fitem-division" style="width: 40px; text-align: center">----</div>
					<div class="fitem-division" style="width: 80px">
						<input name="ageEnd" class="easyui-textbox" style="width: 80px" />
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
				onclick="courseAct.save()" style="width: 90px">保存</a> <a
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
				onclick="courseAct.uploadExcel()" style="width: 90px">导入</a> <a
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
				onclick="courseAct.uploadPic()" style="width: 90px">上传</a> <a
				href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
				onclick="javascript:$('#upload${ModelKey}PicDlg').dialog('close')"
				style="width: 90px">取消</a>
		</div>
		<script type="text/javascript">
			var courseAct = {
				url : "",
				create : function() {
					courseInit.dialogOpen();
					this.url = _ctx + '${RequestRoute}/create';
				},
				modify : function() {
					var row = $("#${ModelKey}sTable").datagrid('getSelected');
					if (row) {
						courseInit.dialogOpen(row);
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
								courseAct.tableReload(); // reload the course data
							}
						}
					});
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
					courseAct.tableReload();
				},
				tableReload : function() {
					$("#${ModelKey}sTable").datagrid({
						queryParams : {
							name : $("#${ModelKey}sSearchCouName").textbox('getValue'),
							orgId : $("#couSelectFor${ModelKey}Search").combobox('getValue'),
							address : $("#${ModelKey}sSearchAddress").textbox('getValue')
						}
					});
				},
				destroy : function() {
					var rows = $("#${ModelKey}sTable").datagrid('getSelections');
					if (rows.length > 0) {
						$.messager.confirm('确定', '是否确定需要删除该条数据？', function(r) {
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
											courseAct.tableReload(); // reload the course data
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
				uploadPic : function() {
					$('#upload${ModelKey}PicFm').form('submit', {
						url : _ctx + "/images/upload/2",
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
								courseAct.tableReload(); // reload the org data
							}
						}
					});
				}

			};

			var courseInit = {
				table : function() {
					$("#${ModelKey}sTable").datagrid({
						title : "${ModelValue}列表",
						url : _ctx + '${RequestRoute}/listSearch',
						method : 'POST',
						columns : [ [ {
							field : 'name',
							title : '${ModelValue}名',
							width : 60
						}, {
							field : 'orgName',
							title : '所属机构',
							width : 60
						}, {
							field : 'profile',
							title : '简介',
							width : 100
						}, {
							field : 'tel',
							title : '绑定手机号',
							width : 60
						}, {
							field : 'address',
							title : '地址',
							width : 100
						}, {
							field : 'updateAt',
							title : '更新时间',
							width : 60
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
				orgSelect : function() {
					$.ajax({
						url : _ctx + '/orgs/sel',
						dataType : "JSON",
						success : function(datas) {
							$("#orgSelect").combobox({
								data : datas,
								valueField : 'id',
								textField : 'name',
								editable : false,
								icons : [ {
									iconCls : 'icon-clear',
									iconAlign : 'right',
									handler : function(e) {
										$("#orgSelect").combobox('clear');
									}
								} ],
								onLoadError : function() {
									easyUIMsg.error("数据加载失败！", "异常")
								}
							});
							$("#couSelectFor${ModelKey}Search").combobox({
								data : datas,
								valueField : 'id',
								textField : 'name',
								editable : false,
								icons : [ {
									iconCls : 'icon-clear',
									iconAlign : 'right',
									handler : function(e) {
										$("#couSelectFor${ModelKey}Search").combobox('clear');
									}
								} ],
								onLoadError : function() {
									easyUIMsg.error("数据加载失败！", "异常")
								}
							});
						}
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
						data : courseInit.isTopSelectData,
						valueField : 'key',
						textField : 'value',
						editable : false
					});
				},
				dialogOpen : function(data) {
					if (data) {
						$('#${ModelKey}EidtFm').form('load', data);
						$("#${ModelKey}sTableEidtDlg").dialog('open').dialog('setTitle', '编辑${ModelValue}');
					} else {
						$('#${ModelKey}EidtFm').form('clear');
						courseInit.isTopSelect();
						courseInit.orderText();
						$("#${ModelKey}sTableEidtDlg").dialog('open').dialog('setTitle', '新建${ModelValue}');
					}
				}
			};

			$(document).ready(function() {
				courseInit.table();
				courseInit.orgSelect();
				courseInit.isTopSelect();
				courseInit.orderText();
				courseInit.uploadPic();
				courseInit.uploadExcel();
			});
		</script>
	</div>
</div>