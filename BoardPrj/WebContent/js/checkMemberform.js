/**
 * memberform에서의 비밀번호 체크
 */

	var submit = document.getElementById("submit");
	var checkId = document.getElementById("checkId");
	
	var btnCnt=0;
	
	var password = document.getElementById("password");
	var pw_confirm = document.getElementById("pw_confirm");
	
	var pw_msg1 = document.getElementById("pw");
	var pw_msg2 = document.getElementById("repeat");

	var pw = "";

	password.addEventListener("blur",check1);
	password.addEventListener("blur",check2);
	
	pw_confirm.addEventListener("blur",check2);

	function check1(){
		pw= password.value.toString();
		
		if(pw.length<4 || pw.length>12)
			pw_msg1.style.display="";
		else
			pw_msg1.style.display="none";

	}

	function check2(){
	if(pw!=""|| pw!=null){
		if(pw == pw_confirm.value)
			pw_msg2.style.display="none";
		else{
			pw_msg2.style.display="";
			
		}
		}
	}
	
	function submitCheck(){
		var userid = document.getElementById("userid").value;
		var name = document.getElementById("name").value;
		var email = document.getElementById("email").value;
		
		if(userid=="" || name=="" || email=="" || pw=="" || pw_confirm.value==""||
		   userid==null || name==null || email==null || pw==null || pw_confirm.value==null){
			alert("필수항목을 모두 입력하세요.");
			
			return false;
		}
		else if(btnCnt==0){
			alert("아이디 중복 확인을 해주세요.");
			
			return false;
		}
		else if(pw_msg1.style.display=="" || pw_msg2.style.display==""){
			alert("비밀번호를 올바르게 입력하세요.");
			
			return false;
		}
	}
	
	function checkUserId(){
		var userid = document.getElementById("userid");
		var id = userid.value;
		btnCnt++;
		
		url="checkId.jsp?id="+id;
		
		window.open(url,"confirm",'resizable=no,toolbar=no,location=no,menubar=no,width=300,height=200');

		return false;
	}