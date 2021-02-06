		var latitude;	// GPS 위도 
		var longitude;	// GPS 경도
		var x;			// X 좌표 (기상청 기준)
		var y;			// Y 좌표 (기상청 기준)
		
		function getLocation() {
		
			if (navigator.geolocation) { // GPS를 지원하면
				navigator.geolocation.getCurrentPosition(function(p) {
					latitude = p.coords.latitude;
					longitude = p.coords.longitude;
					
					// 위도/경도 -> 기상청 좌표x / 좌표 y 변환
					var rs = dfs_xy_conv("toXY",latitude,longitude);
					x = rs['x'];
					y = rs['y'];
					
					console.log(rs);
					console.log('x좌표 : '+ x, 'y좌표 : '+ y, 'latitude : '+ latitude, 'longitude : '+ longitude);
					
			        
			     	// xy 좌표로 날씨 API 불러오기 => CORS 문제 발생
					//xml2json(x, y);
			     	
			     	// CORS 문제 해결 : 위치정보를 ajax로 서버에 전송
			    	// 위치정보를 자바스크립트 객체에 담는다.
			        var location =  { 
			    			x : x, 
			    			y : y, 
			    			lat : latitude, 
			    			lot : longitude
			    	};
			    	
			    	// ajax로 서버에 locData 전송
			        $.ajax({
			        	url: "http://localhost:8080/main/weatherbytime",
			        	type: "GET",
			        	data : location,
			        	async: false,
			        	success: function(data){
			        		alert("Location Send Success ! ");
							$('.weather').append(data);
							console.log(data);
			        	},
			        	error: function(){
			        		alert("Location Send Fail !");
			        	}
			        });
			    	
			  /*       $.ajax({
			        	url: "weatherNow",
			        	type: "POST",
			        	data : location,	
			        	 success: function(data){
			        		alert(location);
			        	},
			        	error: function(){
			        		alert("위치정보 전송 실패");
			        	}
			        }); 
			  */
	
				
			  	}, function(error) {
							console.error(error);
							alert('xy좌표 에러');
			  	}, {
			  		enableHighAccuracy	: false,
			  		maximumAge			: 0,
			  		timeout				: Infinity
			  	});
			} else {
			  alert('GPS를 지원하지 않습니다');
			}
		
		}
		
		
		
		// LCC DFS 좌표변환을 위한 기초 자료 
		
		var RE = 6371.00877; // 지구 반경(km)
		var GRID = 5.0; // 격자 간격(km)
		var SLAT1 = 30.0; // 투영 위도1(degree)
		var SLAT2 = 60.0; // 투영 위도2(degree)
		var OLON = 126.0; // 기준점 경도(degree)
		var OLAT = 38.0; // 기준점 위도(degree)
		var XO = 43; // 기준점 X좌표(GRID)
		var YO = 136; // 기1준점 Y좌표(GRID)
		var X;
		var Y;
		
		
		// LCC DFS 좌표변환 ( code : "toXY"(위경도->좌표, v1:위도, v2:경도), "toLL"(좌표->위경도,v1:x, v2:y) )
		
		function dfs_xy_conv(code, v1, v2) {
			
		    var DEGRAD = Math.PI / 180.0;
		    var RADDEG = 180.0 / Math.PI;
		
		    var re = RE / GRID;
		    var slat1 = SLAT1 * DEGRAD;
		    var slat2 = SLAT2 * DEGRAD;
		    var olon = OLON * DEGRAD;
		    var olat = OLAT * DEGRAD;
		
		    var sn = Math.tan(Math.PI * 0.25 + slat2 * 0.5) / Math.tan(Math.PI * 0.25 + slat1 * 0.5);
		    sn = Math.log(Math.cos(slat1) / Math.cos(slat2)) / Math.log(sn);
		    var sf = Math.tan(Math.PI * 0.25 + slat1 * 0.5);
		    sf = Math.pow(sf, sn) * Math.cos(slat1) / sn;
		    var ro = Math.tan(Math.PI * 0.25 + olat * 0.5);
		    ro = re * sf / Math.pow(ro, sn);
		    var rs = {};
		   
		    if (code == "toXY") {
		        rs['lat'] = v1;
		        rs['lng'] = v2;
		        var ra = Math.tan(Math.PI * 0.25 + (v1) * DEGRAD * 0.5);
		        ra = re * sf / Math.pow(ra, sn);
		        var theta = v2 * DEGRAD - olon;
		        if (theta > Math.PI) theta -= 2.0 * Math.PI;
		        if (theta < -Math.PI) theta += 2.0 * Math.PI;
		        theta *= sn;
		        rs['x'] = Math.floor(ra * Math.sin(theta) + XO + 0.5);
		        rs['y'] = Math.floor(ro - ra * Math.cos(theta) + YO + 0.5);
		    }
		    else {
		        rs['x'] = v1;
		        rs['y'] = v2;
		        var xn = v1 - XO;
		        var yn = ro - v2 + YO;
		        ra = Math.sqrt(xn * xn + yn * yn);
		        if (sn < 0.0) - ra;
		        var alat = Math.pow((re * sf / ra), (1.0 / sn));  
		        alat = 2.0 * Math.atan(alat) - Math.PI * 0.5;
		
		        if (Math.abs(xn) <= 0.0) {
		            theta = 0.0;
		        } 
		        else {
		            if (Math.abs(yn) <= 0.0) {
		                theta = Math.PI * 0.5;
		                if (xn < 0.0) - theta;
		            }
		            else theta = Math.atan2(xn, yn);
		        }
		        var alon = theta / sn + olon;
		        rs['lat'] = alat * RADDEG;
		        rs['lng'] = alon * RADDEG;
		    }
		   
		    return rs;
		}


