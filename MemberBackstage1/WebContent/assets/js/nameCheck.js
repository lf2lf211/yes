/**
 * 
 */

$(function nameCheck() {
		$("#checkAjax").on('click', function() {
			$.ajax({
				url : "/AjaxServlet.do",
				type : "POST",
				dataType : "json",
				data : {
					name : $("#name").val()
				},
				success : function(response) {
					if (response == '1') {
						alert('申请昵称重复，请输入其他昵称');
					} else {
						alert('可使用此昵称');
					}
				}
			});
		});
	});