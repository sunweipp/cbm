var treeJson = [ {

} ]

function treeInit() {

}

var verify = {
	pat : "",
	macAddr : function(str) {
		this.pat = new RegExp("^([0-9a-fA-F]{2})(([/\s:][0-9a-fA-F]{2}){5})$");
		return this.pat.test(str);
	},
	imageFile : function(str) {
		this.pat = new RegExp(".jpg$|.jpeg$|.png$|.bmp$");
		return this.pat.test(str);
	},
	excelFile : function(str) {
		this.pat = new RegExp(".xls$|.xlsx$|.csv$");
		return this.pat.test(str);
	},
	apkFile : function(str) {
		this.pat = new RegExp(".apk$");
		return this.pat.test(str);
	}
}

var easyUIMsg = {
	alert : function(content) {
		$.messager.alert('提醒', content, '确定');
	},
	error : function(content, title) {
		$.messager.show({ // show error message
			title : title ? title : '警告',
			msg : content
		});
	}
}