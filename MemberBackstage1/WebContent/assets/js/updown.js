function up(p){
	var req=new XMLHttpRequest();
	req.open("get","http://localhost:8081/MemberBackstage1/transactionRecord.jsp");
	req.onload=function(){
		
		var transactionRecord=document.getElementById("transactionRecord"+p);
		transactionRecord.innerHTML=this.responseText;
	};
	req.send();
}
function down(p){
	var req=new XMLHttpRequest();
	req.open("get","http://localhost:8081/MemberBackstage1/transactionRecord2.jsp");
	req.onload=function(){
		
		var transactionRecord=document.getElementById("transactionRecord"+p);
		transactionRecord.innerHTML=this.responseText;
	};
	req.send();
}
function three(p){
	var req=new XMLHttpRequest();
	req.open("get","http://localhost:8081/MemberBackstage1/transactionRecord3.jsp");
	req.onload=function(){
		
		var transactionRecord=document.getElementById("transactionRecord"+p);
		transactionRecord.innerHTML=this.responseText;
	};
	req.send();
}

function ok(){
	var req=new XMLHttpRequest();
	req.open("get","http://localhost:8081/MemberBackstage1/transactionRecord3.jsp");
	req.onload=function(){
		var ta = document.getElementById('scrollingtext');
		alert("修改成功為"+ta.value)
		
	};
	req.send();
}
