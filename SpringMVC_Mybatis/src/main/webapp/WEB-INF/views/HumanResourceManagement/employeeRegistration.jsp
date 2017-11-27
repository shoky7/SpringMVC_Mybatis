<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<C:set var="myContext" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>인사관리시스템</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link href="<C:out value="${myContext}"/>/resources/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="<C:out value="${myContext}"/>/resources/assets/commons/css/navbar-top.css" rel="stylesheet">
		<link href="<C:out value="${myContext}"/>/resources/assets/fontawesome/css/font-awesome.min.css" rel="stylesheet">
		<script src="<C:out value="${myContext}"/>/resources/assets/jquery/jquery-3.2.1.min.js"></script>
		<script src="<C:out value="${myContext}"/>/resources/assets/jquery/jquery.form.js"></script>
		<script src="<C:out value="${myContext}"/>/resources/assets/vendor/popper.min.js"></script>
		<script src="<C:out value="${myContext}"/>/resources/assets/bootstrap/js/bootstrap.min.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<style>
			span{ color:red; }
			.humanImage{
				border: solid 1px #ced4da;
				width:327px;
				height:340px;
			}
			.humanImageSize{
				width:326px;
				height:339px;
			}
			#phone,#hp,#salary,#reg_no,#years,#sabun{
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

			

		function registration() {
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
			else if($('#pwd').val().trim()!=($('#pwd2').val().trim())){
				alert('패스워드와 패스워드확인이 일치하지 않습니다.');
			}
			else{
				$("#formReg").submit();
			}
		}
		
			$(document).ready(function() {
				document.getElementById('join_day').valueAsDate = new Date();
				document.getElementById('retire_day').valueAsDate = new Date();
				document.getElementById('mil_startdate').valueAsDate = new Date();
				document.getElementById('mil_enddate').valueAsDate = new Date();
				
				
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
				});
				
				// 영문입력 자동 하이픈
				$("#eng_name").keyup(function() {
					var textinput = $("#eng_name").val();
					textinput = textinput.replace(/[^a-z|A-Z]/g, '');
					var tmp = ""
					
					if(textinput.length < 20){
						$("#eng_name").val(textinput);
					}
				});
				
	
				
			// 이미지 업로드
				$('#imageUploadBtn').click(function(){
					var form = $('<form></form>');
					var formData = new FormData(form);
					
					formData.append('humanImageUpload', $('#humanImageUpload')[0].files[0]);
					if($('#humanImageUpload').val()) {
						$.ajax({
				            url: 			'/SpringMVC_Mybatis/fileProcessing/upload',
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
				                var imagePath = '<C:out value="${myContext}"/>' + resultObj.filePath;
				                console.log(imagePath);
				                $('#humanImage').attr('src', imagePath);
				            }
						});
					} else {
						alert('이미지 등록 해야함!');
					}
				});
			});
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
			<button type="button" class="btn btn-primary" onclick = "registration()">등록</button>
			<button type="button" class="btn btn-primary">전화면</button>
		</div>
		<form id ="formReg" action= "/SpringMVC_Mybatis/employee/registration"  method="post">
			<table class="table">
				<tbody>
					<tr>
						<td colspan="2" rowspan="6">
							<div class="humanImage">
								<img id="humanImage" class="humanImageSize" src="<C:out value="${myContext}"/>/resources/image/human.png">
							</div>
							<div class="btn-group" style="width:327px">
								<input type="file" name="humanImageUpload" id="humanImageUpload" class="form-control btn btn-info"/>
								<button type="button" id="imageUploadBtn" class="btn btn-primary"><i class="fa fa-camera" aria-hidden="true"></i> 등록</button>
							</div>
						</td>
						<td><span>*</span>사번</td>
							<td><input type="text" id="sabun" name="sabun" value="${sabun}" class="form-control" readonly="readonly"></td>
						<td><span>*</span>한글성명</td>
						<td><input type="text" id="name"name="name" class="form-control" maxlength="5"></td>
						<td>영문성명</td>
						<td><input type="text" name="eng_name" id="eng_name "class="form-control" maxlength="20"></td>
					</tr>
					<tr>
						<td><span>*</span>아이디</td>
						<td><input type="text" id="id" name="id" class="form-control" maxlength="6"></td>
						<td><span>*</span>패스워드</td>
						<td><input type="password" id="pwd" name="pwd" class="form-control" maxlength="6"></td>
						<td><span>*</span>패스워드확인</td>
						<td><input type="password" id="pwd2" name="pwd2" class="form-control" maxlength="6"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" id="phone" name="phone" class="form-control" maxlength="13"></td>
						<td><span>*</span>핸드폰번호</td>
						<td>
							<input type="text" name="hp" id="hp"class="form-control" maxlength="13">
						</td>
						<td>주민번호</td>
						<td><input type="text" name="reg_no" id="reg_no" class="form-control" maxlength="14"></td>
					</tr>
					<tr>
						<td>연령</td>
						<td><input type="text" name="years" id="years" class="form-control" maxlength="2"></td>
						<td><span>*</span>이메일</td>
						<td>
							<div class="input-group">
								<input type="text" id="email" name="email" class="form-control" maxlength="10">
								<select name="email" class="form-control">
								<C:forEach var="map" items="${email}">
									<option value="${map.get("EMAIL")}">${map.get("EMAIL")}</option>						
								</C:forEach>
								</select>
							</div>
						</td>
						<td>직종체크</td>
						<td>
							<div class="input-group">
								<select name="job_type" id="job_type" class="form-control">
								<option value=" "></option>						
								<C:forEach var="map" items="${job_type}">
									<option value="${map.get("SEQ")}">${map.get("JOB_TYPE")}</option>						
								</C:forEach>
								</select>
								<select name="sex" class="form-control">
								<option value=" ">(성별)</option>	
								<C:forEach var="map" items="${sex}" >
									<option value="${map.get("SEQ")}">${map.get("SEX")}</option>						
								</C:forEach>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td>주소</td>
						<td>
							<div class="input-group">
								<input type="text" name="zip" id="zip" class="form-control" maxlength="20">
								<button  type="button" onclick="openDaumPostcode()" class="btn btn-secondary">주소검색</button>
							</div>
						</td>
						<td colspan="2"><input type="text" name="addr1" id="addr1" class="form-control" maxlength="15"></td>
						<td colspan="2"><input type="text" name="addr2" id="addr2" class="form-control" maxlength="25"></td>
					</tr>
					<tr>
						<td>직위</td>
						<td>
							<select name="pos_gbn_code" class="form-control">
							<option value=" "></option>
							<C:forEach var="map" items="${pos_gbn_code}">
								<option value="${map.get("SEQ")}">${map.get("POS_GBN_CODE")}</option>						
							</C:forEach>
							</select>
						</td>
						<td>부서</td>
						<td>
							<select name="dept_code" class="form-control">
							<option value=" "></option>
							<C:forEach var="map" items="${dept_code}">
								<option value="${map.get("SEQ")}">${map.get("DEPT_CODE")}</option>						
							</C:forEach>
							</select>
						</td>
						<td>연봉(만원)</td>
						<td>
							<div class="input-group"><input type="text" id="salary" name="salary" 
							onkeyup="number_chk(this);" onkeypress="javascript:if((event.keyCode<48)||(event.keyCode>57))event.returnValue=false;"
							class="form-control"  maxlength="12" placeholder="(만원)">
							</div>
						</td>
					</tr>
					<tr>
						<td>입사구분</td>
						<td>
							<select name="join_gbn_code" class="form-control">
							<option value=" "></option>
							<C:forEach var="map" items="${join_gbn_code}">
								<option value="${map.get("SEQ")}">${map.get("JOIN_GBN_CODE")}</option>						
							</C:forEach>
							</select>
						</td>
						<td>등급</td>
						<td>
							<select name="gart_level" class="form-control">
							<option value=" "></option>
							<C:forEach var="map" items="${gart_level}">
								<option value="${map.get("SEQ")}">${map.get("GART_LEVEL")}</option>						
							</C:forEach>
							</select>
						</td>
						<td>투입여부</td>
						<td>
							<option value=" "></option>
							<select name="put_yn" class="form-control">
							<C:forEach var="map" items="${put_yn}">
								<option value="${map.get("SEQ")}">${map.get("PUT_YN")}</option>						
							</C:forEach>
							</select>
						</td>
						<td>군필여부</td>
						<td>
							<select  name="mil_yn" class="form-control">
							<option value=" "></option>
							<C:forEach var="map" items="${mil_yn}">
								<option value="${map.get("SEQ")}">${map.get("MIL_YN")}</option>						
							</C:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>군별</td>
						<td>
						
							<select name="mil_type" class="form-control">
							<option value=" ">(선택)</option>
							<C:forEach var="map" items="${mil_type}">
								<option value="${map.get("SEQ")}">${map.get("MIL_TYPE")}</option>							
							</C:forEach>
							</select>
						</td>
						<td>계급</td>
						<td>
							<select name="mil_level" class="form-control">
							<option value=" ">(선택)</option>
							<C:forEach var="map" items="${mil_level}">
								<option value="${map.get("SEQ")}">${map.get("MIL_LEVEL")}</option>						
							</C:forEach>
							</select>
						</td>
						<td>입영일자</td>
						<td><input type="date" id="mil_startdate" name="mil_startdate" class="form-control"></td>
						<td>전역일자</td>
						<td><input type="date" id="mil_enddate" name="mil_enddate" class="form-control"></td>
					</tr>
					<tr>
						<td>KOSA등록</td>
						<td>
							<select name="kosa_reg_yn" class="form-control">
							<option value=" "></option>
							<C:forEach var="map" items="${kosa_reg_yn}">
								<option value="${map.get("SEQ")}">${map.get("KOSA_REG_YN")}</option>						
							</C:forEach>
							</select>
						</td>
						<td>KOSA등급</td>
						<td>
							<select name="kosa_class_code" class="form-control">
							<option value=" ">(선택)</option>
							<C:forEach var="map" items="${kosa_class_code}">
								<option value="${map.get("SEQ")}">${map.get("KOSA_CLASS_CODE")}</option>						
							</C:forEach>
							</select>
						</td>
						<td>입사일자</td>
						<td><input type="date" id="join_day" name="join_day" class="form-control"></td>
						<td>퇴사일자</td>
						<td><input type="date" id="retire_day" name="retire_day" class="form-control"></td>
					</tr>
					<tr>
						<td>사업자번호</td>
						<td><input type="text" name="cmp_reg_no" class="form-control" maxlength="12"></td>
						<td>업체명</td>
						<td><input type="text" name="crm_name" class="form-control" maxlength="10"></td>
						<td>사업자등록증</td>
						<td><input type="text" name="cmp_reg_image" class="form-control"></td>
						<td>
							<button  type="button" class="btn btn-secondary">미리보기</button>
						</td>
						<td>
							<button  type="button" class="btn btn-info">등록</button>
						</td>
					</tr>
					<tr>
						<td rowspan="2">자기소개</td>
						<td colspan="3">
							<textarea name="self_intro" class="form-control" maxlength="30"></textarea>
						</td>
						<td>이력서</td>
						<td><input type="text" name="carrier" class="form-control" ></td>
						<td>
							<button  type="button" class="btn btn-secondary">미리보기</button>
						</td>
						<td>
							<button  type="button" class="btn btn-info">파일 업로드</button>
						</td>
					</tr>
					<tr>
						<td colspan="8"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>