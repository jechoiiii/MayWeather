

		// 방명록주인 idx 얻는 함수 (추후 수정) **
		var gbOwnerIdx = getGbookOwnerIdx();

		function getGbookOwnerIdx() {
		
			// test
			return 20;
			
			//return memNo;
		}
		
		/* 회원 A 방명록의 리스트 출력 --------------------------------------- */
		$('#gbookBtn').click(function() {
			
 			$.ajax({
 				url: myHostUrl + '/main/guestbook/list/' + gbOwnerIdx,
 				type: 'GET',
 				data: gbOwnerIdx,
 				success:function(data){
 					
 					console.log(data);
 					
 					$(".mainForm").remove();
 					
 					var listhtml = '<div class="listTitle">';
 					listhtml += 		'<button type="button" onclick="backBtn" class="gb_back"><img width="15" src="http://localhost:8080/main/image/back.png"></button>';
 					listhtml += 		'00님의 GuestBook(15)';
 					listhtml += 		'<button type="button" onclick="openModal()" class="reg_modal_open_btn"><img width="30" src="http://localhost:8080/main/image/icon/write.png"></button>';
 					listhtml += 	'</div>'; 		
 					listhtml += 	'<div class="list">';
 					listhtml += 		'<table class="listTable">';
 						
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
 					

 					$('#gblistForm').html(listhtml);
 					
	 			}, 
 				error: function(e) {
 					console.log("방명록 리스트 ajax 에러 : "+e);
 				}
 				
 			})
			
			
		});                                        
		
		
		
        /* 방명록 등록 (모달 창) ----------------------------------------------- */
		const modal = document.querySelector('.regModal_wrapper');
		
        function setModal() {
            
        	var reghtml = '<table class="regModal_table">';
			reghtml +=					'<tr class="">';
			reghtml +=						'<td class="tableExp1">잘 보셨나요?</td>';
			reghtml +=						'<td table="tableImg" rowspan="2" colspan="2"><img width="60" src="http://localhost:8080/main/image/guestbook.png"></td>';
			reghtml +=					'</tr>';
			reghtml +=					'<tr><td class="tableExp2">00님에게 인사를 남겨보세요:)</td></tr>';
			reghtml +=					'<tr class="insertArea">';
			reghtml +=						'<td class="tableInsert" colspan="2">';
			reghtml +=							'<input type="text" name="gb_content" class="input_text" value="00님의 스타일은 어떤가요?<br> 하고 싶은 말을 여기에 적어보세요." onfocus="clearInput()" onblur="putDefaultVal()"></td>';
			reghtml +=						'<td class="tableInsertPhoto"><button id="photo_submit_btn" onclick="regGuestbook()"><img width="20" src="http://localhost:8080/main/image/camera.png"></button></td>';
			reghtml +=					'</tr>';
			reghtml +=				'</table>';
            
            $('.regModal_body').html(reghtml);
            
        }
        
        setModal();
        
        // 모달 창 열기
        function openModal() {
        	modal.style.display = 'flex';
        }
        
        // 모달 창 닫기 
        function closeModal() {
        	modal.style.display = 'none';
        }
        
        // 입력폼 focus 시 내용 제거 
        function clearInput() {
        	$('.input_text').val('');
        }
        
        // 입력폭 focus 안할시 디폴트값 입력 
        function putDefaultVal() {
        	$('.input_text').val('00님의 스타일은 어떤가요?<br> 하고 싶은 말을 여기에 적어보세요.');
        }
        
        // 방명록 등록 함수
        function regGuestbook() {
        	
        }
        
 
		
