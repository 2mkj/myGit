$(document).ready(function() {
	var is_idcheck_click = false; // id �ߺ��˻� �ߴ��� ����
	var idcheck_value=''; 		  // id �ߺ��˻�� ��
	
	$('#myform').submit(function() {
		// id ���� ��ȿ�� �˻�
		if ($.trim($('#id').val()) == "") {
			alert("ID�� �Է� �ϼ���");
			$('#id').focus();
			return false;
		}
		
	if(!$("#id").prop('readOnly')){ //ȸ������ ���� ���� ���� ������ ���ÿ� ����� js�Դϴ�.
									//ȸ������ �������� ����� ����� �Դϴ�.
									//���� ���� �������� ���̵� �������� �ʱ� ������ �ʿ���� �κ��Դϴ�.
		console.log($("#id").prop('readOnly'))
		var submit_id_value=$.trim($("#id").val())
		if(!submit_id_value!=idcheck_value){ //submit ��� ���̵𰪰� ���̵� �ߺ��˻翡 ���� ���̵� ���մϴ�.
		alert("ID �ߺ��˻� �ϼ���");
		return false;
		}		
		
		//���̵� �ߺ� �˻縦 ������ ������� ���̵��� ��쿡�� submit�� ���â�� ��Ÿ���ϴ�.
		var result=$("#result").val();
		if(result==='-1'){//result�� -1�̸� ���̵� �����ϴ� ��� �Դϴ�.
			alert("��� ������ ���̵�� �ٽ� �Է��ϼ���");
			$("#id").val('').focus();
			$("#opener_message").text('');
			return false;
		}
	}
		
		// ��й�ȣ ���� ��ȿ�� �˻�
		if ($.trim($('#pass').val()) == "") {
			alert("��й�ȣ�� �Է� �ϼ���");
			$('#pass').focus();
			return false;
		}
		// �ֹι�ȣ ���ڸ� ���� ��ȿ�� �˻�
		if ($.trim($('#jumin1').val()) == "") {
			alert("�ֹι�ȣ ���ڸ��� �Է��ϼ���");
			$('#jumin1').focus();
			return false;
		}
		// �ֹι�ȣ ���ڸ� 6�ڸ� ��ȿ�� �˻�
		if ($.trim($('#jumin1').val()).length != 6) {
			alert("�ֹι�ȣ ���ڸ� 6�ڸ��� �Է��ϼ���");
			$('#jumin1').val("").focus();
			return false;
		}
		
		// �ֹι�ȣ ���ڸ� ���� ��ȿ�� �˻�
		if ($.trim($('#jumin2').val()) == "") {
			alert("�ֹι�ȣ ���ڸ��� �Է��ϼ���");
			$('#jumin2').focus();
			return false;
		}
		// �ֹι�ȣ ���ڸ� 7�ڸ� ��ȿ�� �˻�
		if ($.trim($('#jumin2').val()).length != 7) {
			alert("�ֹι�ȣ ���ڸ� 7�ڸ��� �Է��ϼ���");
			$('#jumin2').val("").focus();
			return false;
		}

		//email ���� ��ȿ�� �˻�
		if ($.trim($($("#email")).val()) == "") {
			alert("E-mail ���̵� �Է��ϼ���");
			$("#email").focus();
			return false;
		}

		//domain ���� ��ȿ�� �˻�
		if ($("#domain").val() == "") {
			alert("E-mail �������� �Է��ϼ���");
			$("#domain").focus();
			return false;
		}
		
/*		//���� ��ư ���� ��ȿ�� �˻�
		var cnt = $('input:radio:checked').length;
		if(cnt = 0){
			alert("��, �� �߿��� 1���� �����ϼ���");
			return false;
		}*/
		
		//��̸� 2�� �̻� üũ�ϵ��� �ϴ� ��ȿ�� �˻�
		var cnt = $('input:checkbox:checked').length;
		
		if(cnt < 2){
			alert("2���̻� ��̸� �����ϼ���")
			return false;
		}

		// �����ȣ ���� ��ȿ�� �˻�
		if ($.trim($('#post1').val()) == "") {
			alert("�����ȣ�� �Է��ϼ���");
			$('#post1').focus();
			return false;
		}
		
		if ($.trim($('#post1').val()).length != 5) {
			alert("�����ȣ�� �ټ��ڸ� �Դϴ�.");
			$('#post1').focus();
			return false;
		}
		
		if (!$.isNumeric($('#post1').val())) {
			alert("�����ȣ�� ���ڸ� �Է� ���� �մϴ�.");
			$('#post1').val("").focus();
			return false;
		}

		//�ּ� ���� ��ȿ�� �˻�
		if ($.trim($('#address').val()) == "") {
			alert("�ּҸ� �Է��ϼ���");
			$('#address').focus();
			return false;
		}

		//�ڱ�Ұ� ���� ��ȿ�� �˻�
		if ($.trim($('#intro').val()) == "") {
			alert("�ڱ� �Ұ��� �Է��ϼ���");
			$('#intro').focus();
			return false;
		}
		
	}); //sumbit() end

	// ID �ߺ� �˻� �κ�
	$('#idcheck').click(function() {
		var input_id=$.trim($('#id').val());
		if (input_id == "") {	// ID�� �Է����� �ʾ��� ���
			alert("ID�� �Է� �ϼ���");
			$('#id').focus();
			return false;
		} else {
			pattern = /^[A-Z][a-zA-Z_0-9]{3,}$/;
			if(pattern.test(input_id)){
			 var ref = "idcheck?id="+$("#id").val();
			 window.open(ref, "idcheck", "width=300, height=200");
			}else{
			 alert("ù���ڴ� �빮���̰� �ι�°���� ��ҹ���, ����, _�� �� 4�� �̻��̾�� �մϴ�.");
			 $('#id').val('').focus();
			}
		}
	});//$('#idcheck').click
	
	
	$('#postcode').click(function() {  
		Postcode();		
	 })
		
		
		
function Postcode() {
        new daum.Postcode({
            oncomplete: function(data) {
            	console.log(data.zonecode)
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.
 
                // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
                var extraRoadAddr = ''; // ���θ� ������ �ּ� ����
 
                // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // ���θ�, ���� ������ �ּҰ� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // ���θ�, ���� �ּ��� ������ ���� �ش� ������ �ּҸ� �߰��Ѵ�.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                
                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById("post1").value=data.zonecode;
                document.getElementById("address").value=fullRoadAddr;
            }
        }).open();
    }//function Postcode()

	// ������ ���� �κ�
	$("#sel").change(function(){
	if($("#sel").val() == ""){ // �����Է� ������ ���
	   $("#domain").val("").focus();
	   $("#domain").prop("readOnly", false);
	}else{// ������ ������ ���
	   $("#domain").val($("#sel").val());
	   $("#domain").prop("readOnly",true);
	}
	});
 
	
	$("#jumin1").keyup(function() {
		
		if ($.trim($("#jumin1").val()).length == 6) {
			pattern = /^[0-9]{2}(0[1-9]|1[012])(0[1-9]|1[0-9]|2[0-9]|3[01])$/;
			if (pattern.test($("#jumin1").val())) {
				$("#jumin2").focus();
			} else {
				alert("���� �Ǵ� ���Ŀ� �°� �Է��ϼ���[yymmdd]");
				$("#jumin1").val('').focus();
			}
		}
	});


	$("#jumin2").keyup (function(){
	  if($.trim($("#jumin2").val()).length==7) {
		pattern=/^[1234][0-9]{6}$/;
		if(pattern.test($("#jumin2").val())){
			
			$("input[type=radio]").prop("disabled",false);
			
			var c= $("#jumin2").val().substring(0,1);
 			var index = (c-1)%2; // c=1,30 index=0
								  //c=2,40 index=1
								  
			$("input[type=radio]").eq(index).prop("checked", true);
			$("input[type=radio]").not(":checked").prop("disabled", true);
		}else{
			alert("���Ŀ� �°� �Է��ϼ��� [1234][0-9]{6}");
			$("#jumin2").val('').focus();
		}
	  }
	});
});