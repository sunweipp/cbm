<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="content">
	<div class="content-body">
		<form id="${PrefixKey}EidtFm" style="margin: 0px; padding: 10px 30px;"
			method="post" novalidate>
			<input type="hidden" id="${PrefixKey}OrgId"
				value='<c:if test="${not empty org.id}">${org.id}</c:if>' name="id">
			<input type="hidden"
				value='<c:if test="${not empty org.imageId}">${org.imageId}</c:if>'
				name="imageId" id="${PrefixKey}ImageId">
			<div class="fitem">
				<label>机构名:</label>
				<div>
					<input name="name" class="easyui-textbox" required="true"
						value='<c:if test="${not empty org.name}">${org.name}</c:if>' />
				</div>
			</div>
			<div class="fitem-division"></div>
			<div class="fitem">
				<label>图片:</label>
				<div>
					<input id="${PrefixKey}ImageUrl" name="imageUrl"
						value='<c:if test="${not empty org.imageUrl}">${org.imageUrl}</c:if>' />
					<span class="fitem-info">请上传图片文件（.jpg/.png/.bmp）</span>
				</div>
			</div>
			<div style="width: 100%"></div>
			<div class="fitem">
				<label>简介:</label>
				<div>
					<input class="easyui-textbox" multiline="true"
						style="height: 40px; padding: 0px; width: 568px" name="profile"
						value='<c:if test="${not empty org.profile}">${org.profile}</c:if>' />
				</div>
			</div>
			<div style="width: 100%"></div>
			<div class="fitem">
				<label>联系电话:</label>
				<div>
					<input name="tel" class="easyui-textbox"
						value='<c:if test="${not empty org.tel}">${org.tel}</c:if>' />
				</div>
			</div>
			<div class="fitem-division"></div>
			<div class="fitem">
				<label>联系人:</label>
				<div>
					<input name="contacts" class="easyui-textbox"
						value='<c:if test="${not empty org.contacts}">${org.contacts}</c:if>' />
				</div>
			</div>
			<div style="width: 100%"></div>
			<div class="fitem">
				<label>地址:</label>
				<div>
					<input name="address" class="easyui-textbox" style="width: 568px"
						value='<c:if test="${not empty org.address}">${org.addresss}</c:if>' />
				</div>
			</div>
			<div style="width: 100%"></div>
			<div class="fitem">
				<label>经度:</label>
				<div>
					<input name="longitude" class="easyui-textbox"
						value='<c:if test="${not empty org.longitude}">${org.longitude}</c:if>' />
				</div>
			</div>
			<div class="fitem-division"></div>
			<div class="fitem">
				<label>维度:</label>
				<div>
					<input name="latitude" class="easyui-textbox"
						value='<c:if test="${not empty org.latitude}">${org.latitude}</c:if>' />
				</div>
			</div>
			<div style="width: 100%"></div>
			<div class="fitem">
				<label>好评数:</label>
				<div>
					<c:if test="${empty org.goodCount}">
						<label>暂无数据</label>
					</c:if>
					<c:if test="${not empty org.goodCount}">
						<label>${org.goodCount}</label>
					</c:if>
				</div>
			</div>
			<div class="fitem-division"></div>
			<div class="fitem">
				<label>分类:</label>
				<div>
					<input id="${PrefixKey}CategorySelect" name="categoryId"
						value='<c:if test="${not empty org.categoryId}">${org.categoryId}</c:if>' />
				</div>
			</div>
			<div style="width: 100%"></div>
			<div class="fitem">
				<label>星级:</label>
				<div>
					<c:if test="${empty org.starCount}">
						<label>暂无数据</label>
					</c:if>
					<c:if test="${not empty org.starCount}">
						<label>${org.starCount}</label>
					</c:if>
				</div>
			</div>
			<div class="fitem-division"></div>
			<div class="fitem">
				<label>首页推荐:</label>
				<div>
					<c:if test="${empty org.isTop}">
						<label>暂无数据</label>
					</c:if>
					<c:if test="${org.isTop == 1}">
						<label>已被首页推荐</label>
					</c:if>
					<c:if test="${org.isTop == 0}">
						<label>未被首页推荐</label>
					</c:if>
				</div>
			</div>
			<div style="width: 100%"></div>
			<div class="fitem">
				<label>详细:</label>
				<div>
					<input class="easyui-textbox" multiline="true"
						style="height: 100px; padding: 0px; width: 568px" name="detail"
						value='<c:if test="${not empty org.detail}">${org.detail}</c:if>' />
				</div>
			</div>
			<div style="width: 100%"></div>
			<div style="width: 648px; margin-top: 5px">
				<center>
					<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"
						onclick="orgMemberAct.formSave()" style="width: 90px">保存</a> <a
						href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
						onclick="orgMemberAct.formReload()" style="width: 90px">重置</a>
				</center>
			</div>
		</form>
		<div id="upload${PrefixKey}PicDlg" class="easyui-dialog"
			data-options="modal:true"
			style="width: 480px; height: 150px; padding: 10px 20px" closed="true"
			buttons="#upload${PrefixKey}PicDlgButtons">
			<form id="upload${PrefixKey}PicFm" style="margin: 0px; padding: 10px 30px;"
				method="post" enctype="multipart/form-data">
				<input id="${PrefixKey}fbPic" name="images" />
			</form>
		</div>
		<div id="upload${PrefixKey}PicDlgButtons">
			<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"
				onclick="orgAct.uploadPic()" style="width: 90px">上传</a> <a
				href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
				onclick="javascript:$('#upload${PrefixKey}PicDlg').dialog('close')"
				style="width: 90px">取消</a>
		</div>
		<script type="text/javascript">
			var orgMemberInit = {
				url : "",
				uploadPic : function() {
					$('#${PrefixKey}ImageUrl').textbox({
						buttonText : "附件",
						buttonIcon : "ips-icon-file",
						editable : false,
						icons : [ {
							iconCls : 'icon-clear',
							iconAlign : 'right',
							handler : function(e) {
								$('#${PrefixKey}ImageUrl').textbox('clear');
								$('#${PrefixKey}ImageId').val("");
							}
						} ],
						onClickButton : function() {
							$('#upload${PrefixKey}PicFm').form('clear');
							$("#upload${PrefixKey}PicDlg").dialog('open').dialog('setTitle', '文件上传');
						}
					});
					$('#${PrefixKey}fbPic').filebox({
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
				categorySelect : function() {
					$.ajax({
						url : _ctx + '/categories/sel',
						dataType : "JSON",
						success : function(datas) {
							$("#${PrefixKey}CategorySelect").combobox({
								data : datas,
								valueField : 'id',
								textField : 'name',
								editable : false,
								multiple : true,
								icons : [ {
									iconCls : 'icon-clear',
									iconAlign : 'right',
									handler : function(e) {
										$("#${PrefixKey}CategorySelect").combobox('clear');
									}
								} ],
								onLoadError : function() {
									easyUIMsg.error("数据加载失败！", "异常")
								}
							});
						}
					});
				},
			}

			var orgMemberAct = {
				formSave : function() {
					$('#${PrefixKey}EidtFm').form('submit', {
						url : orgMemberInit.url,
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
								orgMemberAct.formReload(); // reload the org data
							}
						}
					});
				},
				formReload : function() {
					var selectedTab = $('#tabDiv').tabs('getSelected');
					selectedTab.panel('refresh');
				}
			}

			$(document).ready(function() {
				if ($("#${PrefixKey}OrgId").val()) {
					orgMemberInit.url = _ctx + "${RequestRoute}/member/alter";
				} else {
					orgMemberInit.url = _ctx + "${RequestRoute}/member/create";
				}
				orgMemberInit.categorySelect();
				orgMemberInit.uploadPic();
			})
		</script>
	</div>
</div>