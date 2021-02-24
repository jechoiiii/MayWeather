
		
		/* test용 방명록 버튼 출력 ----------------------------------------- */
		function getMoveToGb() {
		
			hideMainForm();
			showMoveToGb();
			
			var html = '<button class="gb_btn1" value="10">10</button>';
			html +=	'<button class="gb_btn2" value="20">20</button>';
			html +=	'<button class="gb_btn3" value="30">30</button>';
			html +=	'<button class="gb_btn4" value="40">40</button>';
			html +=	'<button class="gb_btn5" value="50">50</button>';
			html +=	'<button class="gb_btn6" value="60">60</button>';
			html +=	'<button class="gb_btn7" value="70">70</button>';
			html +=	'<button class="gb_btn8" value="80">80</button>';
			    
        	$('#moveToGb').html(html);
        	
        	getOwnerIdx();
		
		}
		

		
		function getOwnerIdx() {
			
			$('.gb_btn1').on('click', function(){
					gbOwnerIdx = $('.gb_btn1').val();
					getGbookList();
			})
			$('.gb_btn2').on('click', function(){
					gbOwnerIdx = $('.gb_btn2').val();
					getGbookList();
			})
			$('.gb_btn3').on('click', function(){
					gbOwnerIdx = $('.gb_btn3').val();
					getGbookList();
			})
			$('.gb_btn4').on('click', function(){
					gbOwnerIdx = $('.gb_btn4').val();
					getGbookList();
			})
			$('.gb_btn5').on('click', function(){
					gbOwnerIdx = $('.gb_btn5').val();
					getGbookList();
			})
			$('.gb_btn6').on('click', function(){
					gbOwnerIdx = $('.gb_btn6').val();
					getGbookList();
			})
			$('.gb_btn7').on('click', function(){
					gbOwnerIdx = $('.gb_btn7').val();
					getGbookList();
			})
			$('.gb_btn8').on('click', function(){
					gbOwnerIdx = $('.gb_btn8').val();
					getGbookList();
			})
		
		}
		
		    
		
		
		/* 회원 A 방명록의 리스트 출력 --------------------------------------- */
		
		function getGbookList() {
		
			console.log('방명록주인:'+gbOwnerIdx);
			//hideMainForm();
			
			hideMoveToGb();
			showGbookList();
			
			
			$.ajax({
 				url: myHostUrl + '/guestbook/list/' + gbOwnerIdx + '/' + page,
 				type: 'GET',
 				success:function(data){
 				
 					// 비밀글 수
 					var secretNum = 0;
 					
 					// 방명록 목록
 					var listhtml = '<div class="gblist_title">';
 					listhtml += 		'<button type="button" onclick="backToPreview()" class="gb_back_btn"><img width="15" src="http://localhost:8080/main/image/back.png"></button>';
 					listhtml += 		'<span>'+ gbOwnerIdx +'님의 GuestBook('+ data.totalGuestbookCount +')</span>';
 					listhtml += 		'<button type="button" onclick="openRegModal()" class="reg_modal_open_btn"><img width="30" src="http://localhost:8080/main/image/icon/write2.png"></button>';
 					listhtml += 	'</div>';	
 					listhtml += 	'<div class="gblist">';
 					listhtml += 		'<table class="gblist_table">';
 					
 					for(var i=0; i<data.guestbookList.length; i++) {
	 							
	 					// 방명록 주인이거나 작성자인 경우에만, 비밀글 열람			
	 					if(memIdx == gbOwnerIdx || memIdx == data.guestbookList[i].writerNo){
	 						
	 						
	 						// 비밀글은 css 처리
	 						if(data.guestbookList[i].secret == 'Y') {
	 							listhtml +=				'<tbody id="'+data.guestbookList[i].gbookNo+'" class="secretGb">'
	 						} else {
	 							listhtml +=				'<tbody id="'+data.guestbookList[i].gbookNo+'">'
	 						}
	 						
	 						
		 					listhtml += 				'<tr class="gblist_width">';
		 					listhtml += 					'<td rowspan="2" class="gblist_memImgR">';
		 					listhtml += 						'<img width="30" class="gblist_memImg" src="http://localhost:8080/main/image/blue.jpg">';
		 					listhtml += 					'</td>';
		 					listhtml += 					'<td class="gblist_name">'+ data.guestbookList[i].writerName +'('+ data.guestbookList[i].writerNo +')'+ data.guestbookList[i].secret +'</td>';
		 					listhtml +=						'<td class="gblist_btns">';
		 					
		 					
                        
                        
                    		listhtml +=						'<div class="gbDropdown">';
                    		listhtml += 						'<label for="gbDropBtn"><img height="15" src="http://localhost:8080/main/image/icon/usefulbutton.png"></label>';
                    		listhtml +=								'<button id="gbDropBtn" style="display:none;" onclick="dropMenu()"></button>';
                    		listhtml += 						'<div id="gbDropContent" class="gbDropdownContent">';
                    		
                    		
		 					// 방명록 주인 -> 삭제 버튼만 보이게
		 					if(memIdx == gbOwnerIdx){
		 						listhtml += 							'<li class="dropdown"  id="gbdelete" onclick="openDeleteModal('+data.guestbookList[i].gbookNo +')">삭제</li>';
		 					
		 					// 방명록 작성자 -> 수정/삭제 버튼 모두 보이게 
		 					} else {
		 						listhtml += 							'<li class="dropdown" id="gbupdate" onclick="openUpdateModal('+data.guestbookList[i].gbookNo + ')">수정</li>';
		 						listhtml += 							'<li class="dropdown"  id="gbdelete" onclick="openDeleteModal('+data.guestbookList[i].gbookNo +')">삭제</li>';
		 					
		 					}
		 		
		 					listhtml += 						'</div>';
		 					listhtml += 					'</div>';
		 					listhtml +=						'<input type="hidden" name="gbookNo" id="'+ data.guestbookList[i].gbookNo +'" value="'+ data.guestbookList[i].gbookNo +'"></td>';
		 					listhtml +=					'</tr>';
		 					
		 					
		 					
	
							// 첨부 사진 없는 경우, 이미지 출력 X
		 					if(data.guestbookList[i].contentPhoto != null) {
		 						listhtml +=					'<tr class="gblist_info">';
								listhtml +=						'<td class="font7">'+ data.guestbookList[i].writerLoc +' · <fmt:formatDate value="'+ data.guestbookList[i].regDate +'" pattern="yyyy.MM.dd."/></td>';			
								listhtml +=						'<td rowspan="2" class="gblist_uploadPhoto">';
								listhtml +=							'<div><img src="' + myHostUrl + uploadFileUrl + data.guestbookList[i].contentPhoto +'"></div>';
								listhtml +=						'</td>';
								listhtml +=					'</tr>';
								listhtml +=					'<tr class="gblist_con">';
								listhtml +=						'<td colspan="2" class="gblist_content">'+ data.guestbookList[i].content.replace(/(?:\r\n|\r|\n)/g,'<br/>')+'</td>';
								listhtml +=							'<input type="hidden" name="secret" id="secret" value="'+ data.guestbookList[i].secret +'">';
								listhtml +=					'</tr> ';	
								listhtml +=				'</tbody>';
							} else {
								listhtml +=					'<tr class="gblist_info">';
								listhtml +=						'<td class="font7">'+ data.guestbookList[i].writerLoc +' · <fmt:formatDate value="'+ data.guestbookList[i].regDate +'" pattern="yyyy.MM.dd."/></td>';			
								listhtml +=					'</tr>';
								listhtml +=					'<tr class="gblist_con">';
								listhtml +=						'<td colspan="3" class="gblist_content">'+ data.guestbookList[i].content.replace(/(?:\r\n|\r|\n)/g,'<br/>') +'</td>';
								listhtml +=							'<input type="hidden" name="secret" id="secret" value="'+ data.guestbookList[i].secret +'">';
								listhtml +=					'</tr> ';
								listhtml +=				'</tbody>';
							}
		 				
		 				
	 					} else {
							
							// 공개글만 출력 & 수정/삭제 버튼 숨기기
							if(data.guestbookList[i].secret != 'Y'){
							
								listhtml +=				'<tbody id="'+data.guestbookList[i].gbookNo+'">'
			 					listhtml += 				'<tr class="gblist_width">';
			 					listhtml += 					'<td rowspan="2" class="gblist_memImgR">';
			 					listhtml += 						'<img width="30" class="gblist_memImg" src="http://localhost:8080/main/image/blue.jpg">';
			 					listhtml += 					'</td>';
			 					listhtml += 					'<td class="gblist_name">'+ data.guestbookList[i].writerName +'('+ data.guestbookList[i].writerNo +')'+ data.guestbookList[i].secret +'</td>';
			 					listhtml +=						'<td class="gblist_btns">';	 					
			 					listhtml +=						'<input type="hidden" name="gbookNo" id="'+ data.guestbookList[i].gbookNo +'" value="'+ data.guestbookList[i].gbookNo +'">';
			 					listhtml +=					'</tr>';
			 					
		
								// 첨부 사진 없는 경우, 이미지 출력 X
			 					if(data.guestbookList[i].contentPhoto != null) {
			 						listhtml +=					'<tr class="gblist_info">';
									listhtml +=						'<td class="font7">'+ data.guestbookList[i].writerLoc +' · <fmt:formatDate value="'+ data.guestbookList[i].regDate +'" pattern="yyyy.MM.dd."/></td>';			
									listhtml +=						'<td rowspan="2" class="gblist_uploadPhoto">';
									listhtml +=							'<div><img src="' + myHostUrl + uploadFileUrl + data.guestbookList[i].contentPhoto +'"></div>';
									listhtml +=						'</td>';
									listhtml +=					'</tr>';
									listhtml +=					'<tr class="gblist_con">';
									listhtml +=						'<td colspan="2" class="gblist_content">'+ data.guestbookList[i].content.replace(/(?:\r\n|\r|\n)/g,'<br/>') +'</td>';
									listhtml +=							'<input type="hidden" name="secret" id="secret" value="'+ data.guestbookList[i].secret +'">';
									listhtml +=					'</tr> ';	
									listhtml +=				'</tbody>';
			 					
								} else {
									listhtml +=					'<tr class="gblist_info">';
									listhtml +=						'<td colspan="2" class="font7">'+ data.guestbookList[i].writerLoc +' · <fmt:formatDate value="'+ data.guestbookList[i].regDate +'" pattern="yyyy.MM.dd."/></td>';			
									listhtml +=					'</tr>';
									listhtml +=					'<tr class="gblist_con">';
									listhtml +=						'<td colspan="3" class="gblist_content">'+ data.guestbookList[i].content.replace(/(?:\r\n|\r|\n)/g,'<br/>') +'</td>';
									listhtml +=							'<input type="hidden" name="secret" id="secret" value="'+ data.guestbookList[i].secret +'">';
									listhtml +=					'</tr> ';
									listhtml +=				'</tbody>';
								}
	 					
							} else {
							
								// 비밀글 수 +1
	 							secretNum += 1;
							}
	 					
	 					}			
	 					
	 					
	 										
	 				
 					}
 					
 					listhtml +=			'</table>';
 					listhtml +=		'</div>';
 					
 					// 데이터가 없으면 
 					if(data.guestbookList.length == 0) {
 						$('.gblist').css('min-height','500px');
 						listhtml +=	'<div>'+gbOwnerIdx+'님에게 첫 방명록을 남겨보세요!</div>';
 					}
 					
 					
 					
 					
 					$('#gblistForm').html(listhtml);
 					
 					
 					function dropMenu() {
				        $('.gbDropdownContent').css('display','');
				        
				    }
				    
				    window.onclick = function(event){
				        if(!event.target.matches('gbDropBtn')) {
				            var dropdowns = document.getElementsByClassName('gbDropdownContent');
				            for (var i=0; i< dropdowns.length; i++){
				                var openDropdown = dropdowns[i];
				                if(openDropdown.classList.contains('show')){
				                    openDropdown.classList.remove('show');
				                }
				            }
				        }
				    }
 					
 					
 					
 					
	 			}, 
 				error: function(e) {
 					console.log("방명록 리스트 ajax 에러 : "+e);
 				}

 			})
	
	
		
		}

		
        
        
        // 프로필사진으로 이동 (추후 추가*)
        function backToPreview() {
        
        }
        
 
		
