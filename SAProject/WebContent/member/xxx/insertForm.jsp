<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
body {

  font-family: Arial, Helvetica, sans-serif;
}

* {
  box-sizing: border-box;
}

/* style the container */

.container {
  position: relative;
  border-radius: 5px;
  border: 1px solid white;
  
  /* background-color: #f2f2f2; */
  padding: 20px 0 30px 0;
 
  margin-left: 300px;
  margin-top: 100px;
} 

/* style inputs and link buttons */
input,
.btn {
  width: 100%;
  padding: 12px;
  border: none;
  border-radius: 4px;
  margin: 5px 0;
  opacity: 0.85;
  display: inline-block;
  font-size: 17px;
  line-height: 20px;
  text-decoration: none; /* remove underline from anchors */
}

input:hover,
.btn:hover {
  opacity: 1;
}


 /* style the submit button */
input[type=submit] {
  background-color: transparent;
  color: white;
  cursor: pointer;
  width: 100px;
  margin-left: 30px;
}

input[type=submit]:hover {
  color: red;
} 

/* Two-column layout */
.col {
  
  float: left;
  padding: 0 50px;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* vertical line */
/* .vl {
  position: absolute;
  left: 50%;
  transform: translate(-50%);
  border: 2px solid #ddd;
  height: 175px;
}
 */
/* text inside the vertical line */


/* hide some text on medium and large screens */
.hide-md-lg {
  display: none;
}

/* bottom container */
 .bottom-container {
  text-align: center;
  background-color: #666;
  width: 900px;
  border-radius: 0px 0px 4px 4px;
  margin: 30px 50px;
} 

/* Responsive layout - when the screen is less than 650px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 650px) {
  .col {
    width: 100%;
    margin-top: 0;
    
  }
  /* hide the vertical line */

  /* show the hidden text on small screens */
  .hide-md-lg {
    display: block;
    text-align: center;
  }
}


.su {
  border-radius: 4px;
  background-color: transparent;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 17px;
  padding: 20px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
  float: left;
}

.su span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.su span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.su:hover span {
  padding-right: 25px;
}

.su:hover span:after {
  opacity: 1;
  right: 0;
   color: #5D8AA6;
}


.button {
  border-radius: 4px;
  background-color: transparent;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 17px;
  padding: 20px;
  transition: all 0.5s;
  cursor: pointer;
  
  margin: 5px;
  margin-left: 90px;
  clear: both;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
  
}

.button:hover span:after {
  opacity: 1;
  right: 0;
  color: #5D8AA6;
}

.dup {
  border:2px solid black;
  border-radius: 5px;
  background-color: transparent;
  color: black;
  padding: 4px 8px;
  width:100px;
  font-size: 14px;
  cursor: pointer;
  float: left;
}
.dup {
  border-color: #023373;
  color: dodgerblue
}

.dup:hover {
  background: #023373;
  color: white;
}
</style>

</head>
<body>

<jsp:include page="../include/top3.jsp"/>


<div class="container" style="width:800px;">
  <form action="insertPro.jsp" method="post" name="fr" id="join">
    <div class="row">
 	<h4 style="text-align:center; color:white;" >JOIN</h4><br>
      <div class="col" >

        <input type="text" name="id" placeholder="Id" style="background-color: transparent; color: #5D8AA6;"required>
        <input type="button" value="ID CHECK" class="dup" onclick="winopen();">
        <input type="password" name="pass" placeholder="Password" style="background-color: transparent; color: #5D8AA6;"required>
        <input type="text" name="name" placeholder="Name" style="background-color: transparent; color: #5D8AA6;"required>
        <input type="text" id="sample4_postcode" placeholder="Address" name="addr" style="background-color: transparent; color: #5D8AA6;">
		<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="dup1"><br>
		<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="addr1" style="background-color: transparent; color: #5D8AA6;">
		<input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="addr2" style="background-color: transparent; color: #5D8AA6;">
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="addr3" style="background-color: transparent; color: #5D8AA6;" required>
		<input type="text" id="sample4_extraAddress" placeholder="참고항목" name="addr4" style="background-color: transparent; color: #5D8AA6;">
		
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		    function sample4_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var roadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 참고 항목 변수
		
		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('sample4_postcode').value = data.zonecode;
		                document.getElementById("sample4_roadAddress").value = roadAddr;
		                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
		                
		                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
		                if(roadAddr !== ''){
		                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
		                } else {
		                    document.getElementById("sample4_extraAddress").value = '';
		                }
		
		                var guideTextBox = document.getElementById("guide");
		                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
		                if(data.autoRoadAddress) {
		                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
		                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
		                    guideTextBox.style.display = 'block';
		
		                } else if(data.autoJibunAddress) {
		                    var expJibunAddr = data.autoJibunAddress;
		                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
		                    guideTextBox.style.display = 'block';
		                } else {
		                    guideTextBox.innerHTML = '';
		                    guideTextBox.style.display = 'none';
		                }
		            }
		        }).open();
		    }
		</script>
        <!-- id 중복체크 function() -->
<script type="text/javascript">
function winopen() {
	//alert("클릭");	
	//아이디 중복 체크
	//아이디가 있을때만, 없을경우 다시 입력 처리
	
	var ckID = document.fr.id.value;
	//alert(document.getElementById("id").value);
	if(document.fr.id.value == ""){
		alert("id정보를 입력하시오");
		document.fr.id.focus();
		return;
	}
	//아이디 있을때 ->새창열기 처리
	window.open("joinIDCheck.jsp?userid="+ckID,"아이디중복확인","width=500,height=250,top=350,left=500");
	
}
</script>

<!-- id 중복체크 function() -->
        <button class="su"><span>Join </span></button>
         <button class="button"><span>Reset </span></button>
      </div>
      
    </div>
   </form>
  </div>




<jsp:include page="../include/bottom.jsp"/>









</body>



</html>