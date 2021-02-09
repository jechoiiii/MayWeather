<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>엑셀 JSON 객체로 변환</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.2/xlsx.full.min.js"></script>
</head>
<body>

 	<div class="conatiner mt-5">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-3">
                <input class="form-control" type="file" onchange = "readExcel()"  >
            </div>
            <div class="col-md-2">
                <button class="btn btn-primary" id="button">Convert</button>
            </div>
	<div class="col-md-12">
    <pre id="jsondata"></pre>
	</div>

</body>

<script>
	
	let locData;
	let rows;
	
	function readExcel() {
	    let input = event.target;
	    let reader = new FileReader();
	    reader.onload = function () {
	        let locData = reader.result;
	        let workBook = XLSX.read(locData, { type: 'binary' });
	        workBook.SheetNames.forEach(function (sheetName) {
	            console.log('SheetName: ' + sheetName);
	            let rows = XLSX.utils.sheet_to_json(workBook.Sheets[sheetName]);
	            console.log(JSON.stringify(rows));
	        })
	    };
	    reader.readAsBinaryString(input.files[0]);
	    
	}
	

</script>

</html>