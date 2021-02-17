

		// 방명록주인 idx 얻는 함수 (추후 수정) **
		var gbOwnerIdx = getGbookOwnerIdx();

		function getGbookOwnerIdx() {
		
			// test
			return 20;
			
			//return memNo;
		}
		
		/* 회원 A 방명록의 리스트 출력 --------------------------------------- */
		
		function getGbookList() {
		
			disappearMainForm();
			
			showGbookList();
			
			$.ajax({
 				url: myHostUrl + '/guestbook/list/' + gbOwnerIdx,
 				type: 'GET',
 				data: gbOwnerIdx,
 				success:function(data){
 					
 					console.log(data);
 					
 					var listhtml = '<div class="gblist_title">';
 					listhtml += 		'<button type="button" onclick="backToPreview()" class="gb_back_btn"><img width="15" src="http://localhost:8080/main/image/back.png"></button>';
 					listhtml += 		'00님의 GuestBook(15)';
 					listhtml += 		'<button type="button" onclick="openModal()" class="reg_modal_open_btn"><img width="30" src="http://localhost:8080/main/image/icon/write.png"></button>';
 					listhtml += 	'</div>'; 		
 					listhtml += 	'<div class="gblist">';
 					listhtml += 		'<table class="gblist_table">';
 						
 					for(var i=0; i<data.length; i++) {

	 					listhtml += 				'<tr class="gblist_width">';
	 					listhtml += 					'<td rowspan="2" class="gblist_memImgR">';
	 					listhtml += 						'<img width="30" class="gblist_memImg" src="http://localhost:8080/main/image/blue.jpg">';
	 					listhtml += 					'</td>';
	 					listhtml += 					'<td class="gblist_info">'+data[i].writerName+'('+data[i].writerNo+')'+'-'+data[i].memberNo+'</td>';
	 					listhtml +=						'<td rowspan="3" class="gblist_uploadPhoto">';
	 					listhtml +=							'<img height="60" src="http://localhost:8080/main/image/ootdTest.jpg">';
	 					listhtml +=						'</td>';
	 					listhtml +=					'</tr>';
	 					listhtml +=					'<tr class="gblist_info">';
	 					listhtml +=						'<td class="font7">'+data[i].writerLoc+' · <fmt:formatDate value="'+data[i].regDate+'" pattern="yyyy.MM.dd." /></td>';
	 					listhtml +=					'</tr>';
	 					listhtml +=					'<tr class="gblist_con">';
	 					listhtml +=						'<td colspan="2" class="gblist_content">'+data[i].content+'</td>';
	 					listhtml +=					'</tr> ';
 					}
 					
 					listhtml +=			'</table>';
 					listhtml +=		'</div>';
 					
 					$('#gblistForm').html(listhtml);
	 			}, 
 				error: function(e) {
 					console.log("방명록 리스트 ajax 에러 : "+e);
 				}

 			})
	
		
		}
		
    	                           
		
		
		
        
        
        
        
        
        
        // 사진 첨부 함수
        function insertPhoto() {
        
        
        }
        
        
        // 프로필사진으로 이동 (추후 추가*)
        function backToPreview() {
        
        }
        
 
		
