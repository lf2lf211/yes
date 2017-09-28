/**
 * 
 */

$(function nameCheck() {
		('.name').on('click', function() {
			$.ajax({
				url : "/AjaxServlet.do",
				type : 'POST',
				dataType : 'HTML',
				data : {
					name : $('#name').val()
				},
				success : function(res) {
					if (res == '1') {
						alert('申请昵称重复，请输入其他昵称');
					} else {
						alert('可使用此昵称');
					}
				}
			});
		});
	});