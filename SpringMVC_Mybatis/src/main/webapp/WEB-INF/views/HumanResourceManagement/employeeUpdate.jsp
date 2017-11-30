<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="myContext" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>인사관리시스템</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link href="<c:out value="${myContext}"/>/resources/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="<c:out value="${myContext}"/>/resources/assets/commons/css/navbar-top.css" rel="stylesheet">
		<link href="<c:out value="${myContext}"/>/resources/assets/fontawesome/css/font-awesome.min.css" rel="stylesheet">
		<script src="<c:out value="${myContext}"/>/resources/assets/jquery/jquery-3.2.1.min.js"></script>
		<script src="<c:out value="${myContext}"/>/resources/assets/modal/Example.Modal.js"></script>
		<script src="<c:out value="${myContext}"/>/resources/assets/jquery/jquery.form.js"></script>
		<script src="<c:out value="${myContext}"/>/resources/assets/vendor/popper.min.js"></script>
		<script src="<c:out value="${myContext}"/>/resources/assets/bootstrap/js/bootstrap.min.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<style>
		#cmp_reg_image_modal,#carrier_modal{display:none;background-color:#FFFFFF;position:absolute;top:10px;left:200px;padding:10px;border:2px solid #E2E2E2;z-Index:9999}
			span{ color:red; }
			#pwdcheak{
				color:blue;
			}
			.humanImage{
				border: solid 1px #ced4da;
				width:327px;
				height:340px;
			}
			.humanImageSize{
				width:326px;
				height:339px;
			}
			#phone,#hp,#salary,#reg_no,#years,#sabun,#cmp_reg_no{
				text-align:right;
			}
		</style>
		<script>

		
		 	//연봉 콤마 나타내는 함수
			function number_chk(obj){
				var val = obj.value.replace(/,/g, "");
				var val2 = val.substr(0, 1);
				var val3 = val.length;
				if(val2 == 0){
				val = val.substr(1, val3);
				}
				obj.value = num_format(val);
				}
				function num_format(n){
				var reg = /(^[+-]?\d+)(\d{3})/;   // 정규식
				n = String(n);    //숫자 -> 문자변환
				while(reg.test(n)){
					n = n.replace(reg, "$1" + "," + "$2");
				}
				return n;
			} 
	
			function employeeUpdate() {
		        var mJuminNumber = $("#reg_no").val();
		        mJuminNumber = mJuminNumber.replace("-","");
		        
				if($('#name').val().trim()==""){
					alert('한글성명을 입력하세요.');
					$('#name').focus();
				}
				else if($('#id').val().trim()==""){
					alert('아이디를을 입력하세요.');
					$('#id').focus();
				}
				else if($('#pwd').val().trim()==""){
					alert('패스워드를 입력하세요.');
					$('#pwd').focus();
				}
				else if($('#pwd2').val().trim()==""){
					alert('패스워드확인을 입력하세요.');
					$('#pwd2').focus();
				}
				else if($('#hp').val().trim()==""){
					alert('핸드폰번호를 입력하세요.');
					$('#hp').focus();
				}
				else if($('#email').val().trim()==""){
					alert('이메일을 입력하세요.');
					$('#email').focus();
				}
				else if($('#email2').val().trim()==""){
					alert('이메일을 입력하세요.');
					$('#email').focus();
				}
				else if($('#pwd').val().trim()!=($('#pwd2').val().trim())){
					alert('패스워드와 패스워드확인이 일치하지 않습니다.');
				}
				else if(mJuminNumber.length == 0){
					$('#formReg').submit();
				}
		        //주민번호가 1개라도 입력됬을시 주민번호 조회.
		        else if(0 < mJuminNumber.length && mJuminNumber.length < 13){
		            alert("주민등록번호 13자리를 입력해주세요.");
		            $('#reg_no').focus();
		        }else if(mJuminNumber.length == 13){
		        //올바른 주민등록번호가 입력되는지 검사
			     	var total = 0;
			        var cnt = 2;
			        for (var i = 0; i < mJuminNumber.length - 1; i++) {
			            if (cnt > 9) {
			                cnt = 2;
			            }
			            total += parseInt(mJuminNumber.charAt(i)) * cnt;
			            cnt++;
			        }
			        var check = (11 - (total % 11)) % 10;
			        if(parseInt(check) != parseInt(mJuminNumber.charAt(12))){
				            alert("잘못된 주민등록번호 입니다.");
				            $('#reg_no').focus();
				    }else{
						$('#formReg').submit();
					}
				}
			}
			$(document).ready(function() {
				// 등록했던 정보 selectbox 불러오기. 
				$("#job_type").val('${employeeVO.job_type}').prop("selected", true);
				$("#sex").val('${employeeVO.sex}').prop("selected", true);
				$("#pos_gbn_code").val('${employeeVO.sex}').prop("selected", true);
				$("#dept_code").val('${employeeVO.dept_code}').prop("selected", true);
				$("#gart_level").val('${employeeVO.gart_level}').prop("selected", true);
				$("#put_yn").val('${employeeVO.put_yn}').prop("selected", true);
				$("#mil_yn").val('${employeeVO.mil_yn}').prop("selected", true);
				$("#mil_type").val('${employeeVO.mil_type}').prop("selected", true);
				$("#mil_level").val('${employeeVO.mil_level}').prop("selected", true);
				$("#kosa_reg_yn").val('${employeeVO.kosa_reg_yn}').prop("selected", true);
				$("#kosa_class_code").val('${employeeVO.kosa_class_code}').prop("selected", true);
				$("#join_gbn_code").val('${employeeVO.join_gbn_code}').prop("selected", true);
				
				// 등록된 이메일 불러오기.
				var emailArray = '${employeeVO.email}'.split('@');
				$('#email').val(emailArray[0]);
				$('#email2').val(emailArray[1]);
				$("#email_select").val(emailArray[1]).prop("selected", true);
				
				//등록된 연봉 불러올때 , 넣기.
					var textinput = $("#salary").val();
					var tmp = ""
					if (textinput.length > 3) {
						tmp += textinput.substr(0, 1);
						tmp += ',';
						tmp += textinput.substr(1);
						$("#salary").val(tmp);
					} 
				
				// 미필시 테이블 없애기
				if($('#mil_yn').val()==2){
					$('#mil').hide();
				}
			    $('#mil_yn').change(function(){
					if($('#mil_yn').val()=='1'){
						$('#mil').show();
					}else if($('#mil_yn').val()=="2"){
						$('#mil').hide();
					}
			    });		
					
				// 모달창 인스턴트 생성
				var mycmp_reg_image_modal = new Example.Modal({
				    id: "cmp_reg_image_modal" // 모달창 아이디 지정
				});
				var mycarrier_modal = new Example.Modal({
				    id: "carrier_modal" // 모달창 아이디 지정
				});
				// 이미지 업로드
					$('#imageUploadBtn').click(function(){
							var form = $('<form></form>');
							var formData = new FormData(form);
							formData.append('imageUpload', $('#imageUpload')[0].files[0]);
							if($('#imageUpload').val()) {
								$.ajax({
						            url: 			'/SpringMVC_Mybatis/fileProcessing/imageUpload',
						            type: 			'POST',
						            enctype:		'multipart/form-data',
						            processData: 	false,  // file전송시 필수
			    	    	        contentType: 	false,  // file전송시 필수
						            data: 			formData,
						            error: function(req){
										alert(req);
						            },
						            success: function(result){
						            	// JSON Text를 JSON Object로 변환
						            	var resultObj = JSON.parse(result);
						                var imagePath = '<c:out value="${myContext}"/>' + resultObj.filePath;
						                $('#humanImage').attr('src', imagePath);
						                console.log(imagePath);
						            }
								});
							} else {
								alert('이미지 등록 해야함!');
							}		
						});
				
				// 이력서 업로드
				$('#carrierUploadBtn').click(function(){
					var form = $('<form></form>');
					var formData = new FormData(form);
					formData.append('carrierUpload', $('#carrierUpload')[0].files[0]);
					if($('#carrierUpload').val()) {
						$.ajax({
				            url: 			'/SpringMVC_Mybatis/fileProcessing/carrierUpload',
				            type: 			'POST',
				            enctype:		'multipart/form-data',
				            processData: 	false,  // file전송시 필수
	    	    	        contentType: 	false,  // file전송시 필수
				            data: 			formData,
				            error: function(req){
								alert(req);
				            },
				            success: function(result){
				            	// JSON Text를 JSON Object로 변환
				            	var resultObj = JSON.parse(result);
				                var imagePath = '<c:out value="${myContext}"/>' + resultObj.filePath;
				                var textPath = imagePath.replace("/SpringMVC_Mybatis/resources/uploadFiles/","");
				                $('#carrier').val(textPath);
				                $('#carrier_modal_view').attr('src', imagePath);
				                console.log(imagePath);
				            }
						});
					} else {
						alert('이미지 등록 해야함!');
					}		
				});	
				
				// 이력서 업로드 미리보기
				$('#carrierUploadView').click(function() {
					if($('#carrier').val()==""){
						alert("파일을 등록하세요.");
					}else{
					    mycarrier_modal.show(); // 모달창 보여주기
					}
				});
				
				// 사업자등록증 업로드
				$('#cmp_reg_imageUploadBtn').click(function(){
					var form = $('<form></form>');
					var formData = new FormData(form);
					formData.append('cmp_reg_imageUpload', $('#cmp_reg_imageUpload')[0].files[0]);
					if($('#cmp_reg_imageUpload').val()) {
						$.ajax({
				            url: 			'/SpringMVC_Mybatis/fileProcessing/cmp_reg_imageUpload',
				            type: 			'POST',
				            enctype:		'multipart/form-data',
				            processData: 	false,  // file전송시 필수
	    	    	        contentType: 	false,  // file전송시 필수
				            data: 			formData,
				            error: function(req){
								alert(req);
				            },
				            success: function(result){
				            	// JSON Text를 JSON Object로 변환
				            	var resultObj = JSON.parse(result);
				                var imagePath = '<c:out value="${myContext}"/>' + resultObj.filePath;
				                var textPath = imagePath.replace("/SpringMVC_Mybatis/resources/uploadFiles/","");
				                $('#cmp_reg_image').val(textPath);
				                $('#cmp_reg_image_view').attr('src', imagePath);
				                console.log(imagePath);
				            }
						});
					} else {
						alert('이미지 등록 해야함!');
					}		
				});	
				// 이력서 업로드 미리보기
				$('#cmp_reg_imageUploadView').click(function() {
					if($('#cmp_reg_image').val()==""){
						alert("파일을 등록하세요.");
					}else{
				   		mycmp_reg_image_modal.show(); // 모달창 보여주기
					}
				});
				
				//이메일 직접입력을 위해 selectBox change사용하기.
				    $('#email_select').change( function(){
    					if($('#email_select').val()=="직접입력"){
    						$('#email2').val("");
    						$('#email2').attr("readonly",false);
    					}else{
					    	$('#email2').val($('#email_select').val());
    						$('#email2').attr("readonly",true);
    					}
				    });
				
				// 패스워드 체크
				$('#pwd').keyup(function() {
					if($('#pwd').val()=="" && $('#pwd2').val()==""){
						$('#pwdcheak').text("패스워드를 입력해주세요");	
						$('#pwdcheak').css('color','red');
					}else if($('#pwd').val().trim()==$('#pwd2').val().trim()){
						$('#pwdcheak').text("패스워드가 일치합니다.");	
						$('#pwdcheak').css('color','blue');
					}else{
						$('#pwdcheak').text("패스워드가 일치하지 않습니다.");	
						$('#pwdcheak').css('color','red');
					}
				});
				$('#pwd2').keyup(function() {
					if($('#pwd2').val()=="" && $('#pwd').val()==""){
						$('#pwdcheak').text("패스워드를 입력해주세요");	
						$('#pwdcheak').css('color','red');
					}else if($('#pwd').val().trim()==$('#pwd2').val().trim()){
						$('#pwdcheak').text("패스워드가 일치합니다.");
						$('#pwdcheak').css('color','blue');
					}else{
						$('#pwdcheak').text("패스워드가 일치하지 않습니다.");	
						$('#pwdcheak').css('color','red');
					}
				});
				
				//hp 자동 하이픈
				$("#hp").keyup(function() {
					var textinput = $("#hp").val();
					textinput = textinput.replace(/[^0-9]/g, '');
					var tmp = ""
					if(textinput.length < 4){
						$("#hp").val(textinput);
					} else if (textinput.length < 7) {
						tmp += textinput.substr(0, 3);
						tmp += '-';
						tmp += textinput.substr(3);
						$("#hp").val(tmp);
					} else if (11 > textinput.length) {
						tmp += textinput.substr(0, 3);
						tmp += '-';
						tmp += textinput.substr(3, 3);
						tmp += '-';
						tmp += textinput.substr(6);
						$("#hp").val(tmp);
					}else{
						tmp += textinput.substr(0, 3);
						tmp += '-';
						tmp += textinput.substr(3, 4);
						tmp += '-';
						tmp += textinput.substr(7);
						$("#hp").val(tmp);
					}
				});	
				
				$("#phone").keyup(function() {
					var textinput = $("#phone").val();
					textinput = textinput.replace(/[^0-9]/g, '');
					var tmp = ""
					
					if(textinput.length < 4){
						$("#phone").val(textinput);
					} else if (textinput.length < 7) {
						tmp += textinput.substr(0, 3);
						tmp += '-';
						tmp += textinput.substr(3);
						$("#phone").val(tmp);
					} else if (11 > textinput.length) {
						tmp += textinput.substr(0, 3);
						tmp += '-';
						tmp += textinput.substr(3, 3);
						tmp += '-';
						tmp += textinput.substr(6);
						$("#phone").val(tmp);
					}
					else{
						tmp += textinput.substr(0, 3);
						tmp += '-';
						tmp += textinput.substr(3, 4);
						tmp += '-';
						tmp += textinput.substr(7);
						$("#phone").val(tmp);
					}
				});	
				
				// 사업자번호 자동 하이픈(-) 넣기
				$("#cmp_reg_no").keyup(function() {
					var textinput = $("#cmp_reg_no").val();
					textinput = textinput.replace(/[^0-9]/g, '');
					var tmp = ""
					
					if(textinput.length < 4){
						$("#cmp_reg_no").val(textinput);
					}else{
						tmp += textinput.substr(0, 3);
						tmp += '-';
						tmp += textinput.substr(3,2);
						tmp += '-';
						tmp += textinput.substr(5,5);
						$("#cmp_reg_no").val(tmp);
					}
				});
					
				
				// 주민번호 자동 하이픈
				$("#reg_no").keyup(function() {
					var textinput = $("#reg_no").val();
					textinput = textinput.replace(/[^0-9]/g, '');
					var tmp = ""
					
					if(textinput.length < 6){
						$("#reg_no").val(textinput);
					} else if (textinput.length < 13) {
						tmp += textinput.substr(0, 6);
						tmp += '-';
						tmp += textinput.substr(6);
						$("#reg_no").val(tmp);
					}
					// 주민번호 입력시 성별, 나이 값 구하기
					var ssn = $('#reg_no').val().replace("-","");
					if(ssn.length == 13 ){
						var nByear, nTyear;
						var today;
						var nSex;
						var nAge;
						today = new Date();
						nTyear = today.getFullYear();
						if (parseInt(ssn.substr(6,1), 10) < 3){
							nByear = 1900 + parseInt(ssn.substr(0,2), 10);
						}else{
							nByear = 2000 + parseInt(ssn.substr(0,2), 10);
						}
						nAge = nTyear - nByear+1;
						nSex = parseInt(ssn.substr(6,1), 10);
						if(nSex % 2 == 1){
							nSex = "m";
						}
						else{
							nSex ="w";
						}
						if(nSex=="m"){
							$("#sex").val("1").prop("selected", true);
						}else if(nSex=="w"){
							$("#sex").val("2").prop("selected", true);
						}
						$("#years").val(nAge);
					}
				});
				// 영문성명입력
				$("#eng_name").keyup(function() {
					var textinput = $("#eng_name").val();
					textinput = textinput.replace(/[^a-z|A-Z| ]/g, '');
					$("#eng_name").val(textinput);
				});

				
				//한글성명입력
				
				$("#name").keyup(function() {
					var textinput = $("#name").val();
					textinput = textinput.replace(/[^가-힣|ㄱ-ㅎ| ]/g, '');
					$("#name").val(textinput);
				});
				
				$("#id").keyup(function() {
					var textinput = $("#id").val();
					textinput = textinput.replace(/[^a-z|A-Z|0-9]/g, '');
					$("#id").val(textinput);
				});
			}); //ready
			// 주소검색
			function openDaumPostcode() {
			    var width = 500; //팝업창이 실행될때 위치지정
			    var height = 600; //팝업창이 실행될때 위치지정
			    new daum.Postcode({
			        width : width, //팝업창이 실행될때 위치지정
			        height : height, //팝업창이 실행될때 위치지정
			        oncomplete: function(data) {
			             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			 
			            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
			            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
			 
			            // 법정동명이 있을 경우 추가한다.
			            if(data.bname !== ''){
			                extraRoadAddr += data.bname;
			            }
			            // 건물명이 있을 경우 추가한다.
			            if(data.buildingName !== ''){
			                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			            }
			            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			            if(extraRoadAddr !== ''){
			                extraRoadAddr = ' (' + extraRoadAddr + ')';
			            }
			            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			            if(fullRoadAddr !== ''){
			                fullRoadAddr += extraRoadAddr;
			            }
			             
			            // 우편번호와 주소 정보를 해당 필드에 넣는다.
			            
			            $('#zip').val(data.postcode1 + data.postcode2);
			            $('#addr1').val(fullRoadAddr + data.jibunAddress);
			            $('#addr2').focus();
			        }
			    }).open({
			    });
			}
		</script>
	</head>
	<body>
	    <nav class="navbar navbar-expand-md navbar-light bg-light mb-4">
	      <a class="navbar-brand" href="/SpringMVC_Mybatis/index">IT & Biz</a>
	      <div class="collapse navbar-collapse" id="navbarCollapse">
	        <ul class="navbar-nav mr-auto">
	        </ul>
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link" href="/SpringMVC_Mybatis/employee/registration">입력하기</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/SpringMVC_Mybatis/employee/search">조회하기</a>
	      </li>
	    </ul>
	      </div>
	    </nav>
    
		<h3>&nbsp &nbsp직원상세정보</h3>
	
		<div align="right">
			<button type="button" class="btn btn-primary" onclick = "employeeUpdate()">수정</button>
			<button type="button" class="btn btn-primary" onclick = "location.href ='/SpringMVC_Mybatis/employee/registration'">초기화</button>
			<button type="button" class="btn btn-primary" onclick = "location.href ='/SpringMVC_Mybatis/index'">메인화면</button>
		</div>
		<form id ="formReg" action= "/SpringMVC_Mybatis/employee/employeeUpdate" method="post">
			<table class="table">
				<tbody>
					<tr>
						<td colspan="2" rowspan="6">
							<div class="humanImage">
								<img id="humanImage" class="humanImageSize" src="<c:out value="${myContext}"/>/resources/image/human.png">
							</div>
							<div class="btn-group" style="width:327px">
								<input type="file" name="imageUpload" id="imageUpload" class="form-control btn btn-info"/>
								<button type="button" id="imageUploadBtn" class="btn btn-primary"><i class="fa fa-camera" aria-hidden="true"></i> 등록</button>
							</div>
						</td>
						<td><span>*</span>사번</td>
							<td><input type="text" id="sabun" name="sabun" value="${employeeVO.sabun}" class="form-control" readonly="readonly"></td>
						<td><span>*</span>한글성명</td>
						<td><input type="text" style="ime-mode:active;" id="name"name="name" value="${employeeVO.name}" class="form-control" maxlength="5"></td>
						<td>영문성명</td>
						<td><input type="text" name="eng_name" id="eng_name" value="${employeeVO.eng_name}"  class="form-control" maxlength="20" style="ime-mode:inactive"></td>
					</tr>
					<tr>
						<td><span>*</span>아이디</td>
						<td><input type="text" id="id" name="id" value="${employeeVO.id}" class="form-control" maxlength="6"></td>
						<td><span>*</span>패스워드</td>
						<td>
							<input type="password" id="pwd" name="pwd" value="${employeeVO.pwd}" class="form-control" maxlength="6">
							<div id="pwdcheak">패스워드가 일치합니다.</div>
						</td>
						<td><span>*</span>패스워드확인</td>
						<td><input type="password" id="pwd2" name="pwd2" value="${employeeVO.pwd}" class="form-control" maxlength="6"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" id="phone" name="phone" value="${employeeVO.phone}" class="form-control" maxlength="13"></td>
						<td><span>*</span>핸드폰 번호</td>
						<td>
							<input type="text" name="hp" id="hp"class="form-control" value="${employeeVO.hp}" maxlength="13">
						</td>
						<td>주민번호</td>
						<td><input type="text" name="reg_no" id="reg_no" value="${employeeVO.reg_no}" class="form-control" maxlength="14"></td>
					</tr>
					<tr>
						<td>연령</td>
						<td><input type="text" name="years" id="years" value="${employeeVO.years}" class="form-control" maxlength="2"></td>
						<td><span>*</span>이메일</td>
						<td>
							<div class="input-group">
								<input type="text" id="email" name="email" value="${employeeVO.email}" class="form-control" maxlength="10">@
								<input type="text" id="email2" name="email2" readonly="readonly" class="form-control" maxlength="10">
								<select class="form-control" id="email_select">
								<c:forEach var="map" items="${email}">
									<option value="${map.get("NAME")}">${map.get("NAME")}</option>						
								</c:forEach>
								</select>
							</div>
						</td>
						<td>직종체크</td>
						<td>
							<div class="input-group">
								<select name="job_type" id="job_type" class="form-control">
								<option value=" "></option>						
								<c:forEach var="map" items="${job_type}">
									<option value="${map.get("CODE")}">${map.get("NAME")}</option>						
								</c:forEach>
								</select>
								<select name="sex" id="sex" class="form-control">
								<option value=" ">(성별)</option>	
								<c:forEach var="map" items="${sex}" >
									<option value="${map.get("CODE")}">${map.get("NAME")}</option>						
								</c:forEach>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td>주소</td>
						<td>
							<div class="input-group">
								<input type="text" name="zip" id="zip" value="${employeeVO.zip}" class="form-control" maxlength="20">
								<button  type="button" onclick="openDaumPostcode()" class="btn btn-secondary">주소검색</button>
							</div>
						</td>
						<td colspan="2"><input type="text" name="addr1" id="addr1" value="${employeeVO.addr1}" class="form-control" maxlength="15"></td>
						<td colspan="2"><input type="text" name="addr2" id="addr2" value="${employeeVO.addr2}"class="form-control" maxlength="25"></td>
					</tr>
					<tr>
						<td>직위</td>
						<td>
							<select name="pos_gbn_code" id="pos_gbn_code" class="form-control">
							<option value=" "></option>
							<c:forEach var="map" items="${pos_gbn_code}">
								<option value="${map.get("CODE")}">${map.get("NAME")}</option>						
							</c:forEach>
							</select>
						</td>
						<td>부서</td>
						<td>
							<select name="dept_code" id="dept_code" class="form-control">
							<option value=" "></option>
							<c:forEach var="map" items="${dept_code}">
								<option value="${map.get("CODE")}">${map.get("NAME")}</option>						
							</c:forEach>
							</select>
						</td>
						<td>연봉(만원)</td>
						<td>
							<div class="input-group"><input type="text" id="salary" name="salary" 
							onkeyup="number_chk(this);" onkeypress="javascript:if((event.keyCode<48)||(event.keyCode>57))event.returnValue=false;"
							class="form-control" value="${employeeVO.salary}"  maxlength="6" placeholder="(만원)">
							</div>
						</td>
					</tr>
					<tr>
						<td>입사구분</td>
						<td>
							<select name="join_gbn_code" id="join_gbn_code" class="form-control">
							<option value=" "></option>
							<c:forEach var="map" items="${join_gbn_code}">
								<option value="${map.get("CODE")}">${map.get("NAME")}</option>						
							</c:forEach>
							</select>
						</td>
						<td>등급</td>
						<td>
							<select name="gart_level" id="gart_level" class="form-control">
							<option value=" "></option>
							<c:forEach var="map" items="${gart_level}">
								<option value="${map.get("CODE")}">${map.get("NAME")}</option>						
							</c:forEach>
							</select>
						</td>
						<td>투입여부</td>
						<td>
							<select name="put_yn" id="put_yn" class="form-control">
								<option value=" "></option>
								<c:forEach var="map" items="${put_yn}">
									<option value="${map.get("CODE")}">${map.get("NAME")}</option>						
								</c:forEach>
							</select>
						</td>
						<td>군필여부</td>
						<td>
							<select  name="mil_yn" id="mil_yn" class="form-control">
							<option value=" "></option>
							<c:forEach var="map" items="${mil_yn}">
								<option value="${map.get("CODE")}">${map.get("NAME")}</option>						
							</c:forEach>
							</select>
						</td>
					</tr>
					<tr id="mil">
						<td>군별</td>
						<td>
							<select name="mil_type" id="mil_type" class="form-control">
							<option value=" ">(선택)</option>
							<c:forEach var="map" items="${mil_type}">
								<option value="${map.get("CODE")}">${map.get("NAME")}</option>							
							</c:forEach>
							</select>
						</td>
						<td>계급</td>
						<td>
							<select name="mil_level" id="mil_level" class="form-control">
							<option value=" ">(선택)</option>
							<c:forEach var="map" items="${mil_level}">
								<option value="${map.get("CODE")}">${map.get("NAME")}</option>						
							</c:forEach>
							</select>
						</td>
						<td>입영일자</td>
						<td><input type="date" id="mil_startdate" name="mil_startdate" value="${employeeVO.mil_startdate}" class="form-control"></td>
						<td>전역일자</td>
						<td><input type="date" id="mil_enddate" name="mil_enddate" value="${employeeVO.mil_enddate}" class="form-control"></td>
					</tr>
					<tr>
						<td>KOSA등록</td>
						<td>
							<select name="kosa_reg_yn" id="kosa_reg_yn" class="form-control">
							<option value=" "></option>
							<c:forEach var="map" items="${kosa_reg_yn}">
								<option value="${map.get("CODE")}">${map.get("NAME")}</option>						
							</c:forEach>
							</select>
						</td>
						<td>KOSA등급</td>
						<td>
							<select name="kosa_class_code" id="kosa_class_code" class="form-control">
							<option value=" ">(선택)</option>
							<c:forEach var="map" items="${kosa_class_code}">
								<option value="${map.get("CODE")}">${map.get("NAME")}</option>						
							</c:forEach>
							</select>
						</td>
						<td>입사일자</td>
						<td><input type="date" id="join_day" name="join_day" value="${employeeVO.join_day}" class="form-control"></td>
						<td>퇴사일자</td>
						<td><input type="date" id="retire_day" name="retire_day" value="${employeeVO.retire_day}" class="form-control"></td>
					</tr>
					<tr>
						<td>사업자번호</td>
						<td><input type="text" name="cmp_reg_no" id="cmp_reg_no" class="form-control" value="${employeeVO.cmp_reg_no}" maxlength="12"></td>
						<td>업체명</td>
						<td><input type="text" name="crm_name" class="form-control" value="${employeeVO.crm_name}" maxlength="10"></td>
						<td>사업자<br/>등록증</td>
						<td><input type="text" name="cmp_reg_image" id="cmp_reg_image" value="${employeeVO.cmp_reg_image}" class="form-control" readonly="readonly"></td>
						<td>
							<button  type="button" id="cmp_reg_imageUploadView" class="btn btn-secondary">미리보기</button>
						</td>
						<td>
							<div class="btn-group" style="width:327px">
								<input type="file" name="cmp_reg_imageUpload" id="cmp_reg_imageUpload" class="form-control btn btn-info"/>
								<button type="button" id="cmp_reg_imageUploadBtn" class="btn btn-primary">등록</button>
							</div>
						</td>
					</tr>
					<tr>
						<td rowspan="2">자기소개</td>
						<td colspan="3">
							<textarea name="self_intro" class="form-control" maxlength="30">${employeeVO.self_intro}</textarea>
						</td>
						<td>이력서</td>
						<td><input type="text" name="carrier" id="carrier" class="form-control" value="${employeeVO.carrier}" readonly="readonly"></td>
						<td>
							<button  type="button" id="carrierUploadView" class="btn btn-secondary">미리보기</button>

						</td>
						<td>
							<div class="btn-group" style="width:327px">
								<input type="file" name="carrierUpload" id="carrierUpload" class="form-control btn btn-info"/>
								<button type="button" id="carrierUploadBtn" class="btn btn-primary"><i class="fa fa-camera" aria-hidden="true"></i> 등록</button>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="8"></td>
					</tr>
				</tbody>
			</table>
		</form>
				<!-- 미리보기 팝업창 form안에 있을 경우 submit 발생하기 때문에 form 밖에서 제어 -->
		<div id="cmp_reg_image_modal">
			<img id="cmp_reg_image_view" src="<c:out value="${myContext}"/>/resources/image/human.png">
			<div style="text-align:right;">
				<button class="js_close">닫기</button>
			</div>
		</div>
		<div id="carrier_modal">
			<img id="carrier_modal_view" src="<c:out value="${myContext}"/>/resources/image/human.png">
			<div style="text-align:right;">
				<button class="js_close">닫기</button>
			</div>
		</div>
	</body>

</html>