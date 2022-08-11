// 이름이 있는 함수는 위치에 상관없이 선언해준다.
//ready전에 선언해야 된다.
function go(page){
	var limit = $('#viewcount').val();
	var data = "limit=" + limit + "&state=ajax&page=" + page;
	ajax(data);
}

function setPaging(href, digit){
	active="";
	gray="";
	if(href==""){ // href가 빈문자열인 경우
		if(isNaN(digit)){// 이전&nbsp; 또는 다음&nbsp;
			gray = " gray";
		}else{
			active = " active";
		}
	}
	var output = "<li class='page-item" + active +"'>";
	var anchor = "<a class='page-link" + gray + "'" + href + ">" + digit + "</a></li>";
	output += anchor;
	return output;
}

function ajax(sdata){
	console.log(sdata);
	
	$.ajax({
		type : "POST",
		data : sdata,
		url : "BoardList.bo",
		dataType : "json",
		cache : false,
		success : function(data){
			$("#viewcount").val(data.limit);
			$("table").find("font").text("글 개수 : " + data.listcount);
			
			if(data.listcount > 0){ // 총 갯수가 0보다 큰 경우
				$("tbody").remove();
				var num = data.listcount - (data.page - 1) * data.limit;
				console.log(num);
				var output = "<tbody>";
				$(data.boardlist).each(
					function(index, item){
						output += '<tr><td>' + (num--) + '</td>';
						blank_count = item.board_re_lev * 2 + 1;
						blank = '&nbsp;';
						for(var i = 0; i < blank_count; i++){
							blank += '&nbsp;&nbsp;';
						}
						img="";
						if(item.board_re_lev > 0){
							img="<img src='image/line.gif'>";
						}	
						
						var subject=item.board_subject;
						if(subject.length>=20){
							subject=subject.substr(0,20) + "..."; // 0부터 20개 부분 문자열 추출
						}
						
						output += "<td><div>" + blank + img
						output += '  <a href="BoardDetailAction.bo=?num=' + item.board_num + '">'
						output += subject.replace(/</g,'&lt;').replace(/>/g,'&gt;')
									+ '</a>[' + item.cnt + ']</div></td>'
						output += '<td><div>' + item.board_name+ '</div></td>'
						output += '<td><div>' + item.board_date+ '</div></td>'
						output += '<td><div>' + item.board_readcount
								+ '</div></td></tr>'
					})
					output += "</tbody>"
					$('table').append(output) // table 완성
					
					$(".pagination").empty(); // 페이징 처리 영역 내용 제거
					output = "";
					
					digit = '이전&nbsp;'
					href = "";
					if(data.page > 1){
						href = 'href=javascript:go(' + (data.page - 1) + ')';
					}
					output += setPaging(href, digit);
					
					for(var i = data.startpage; i <= data.endpage; i++){
						digit = i;
						href = "";
						if(i != data.page){
							href = 'href=javascript:go(' + i + ')';
						}
						output += setPaging(href, digit);
						console.log('에러');
					}
					
					digit = '&nbsp;다음&nbsp;';
					href = "";
					if(data.page < data.maxpage){
						href = 'href=javascript:go(' + (data.page + 1) + ')';
					}
					output += setPaging(href, digit);
					
					$('.pagination').append(output);
			} // if(data.listcount)>0 end
		}, // success end
		error : function(){
			console.log('에러');
		}
	})
}

$(function(){
	$("button").click(function(){
		location.href="BoardList.boo";
	})
	
	$('#viewcount').change(function(){
		go(1);// 보여줄 페이지를 1페이지로 설정합니다.
	}); // change end
	
})