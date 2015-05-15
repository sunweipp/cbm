$.ajaxSetup({
	contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
	global : true,
	complete : function(XMLHttpRequest, status) {
		switch (XMLHttpRequest.status) {
		case 0:
			alert("服务器连接中断，请稍后重试!");
			break;
		case 200:
			break;
		case 404:
			alert("404");
			break;
		}
		var sessionStatus = XMLHttpRequest.getResponseHeader("sessionStatus");
		if (sessionStatus == "sessionOut") {
			top.location = _ctx + "/";
		}
	}
});
