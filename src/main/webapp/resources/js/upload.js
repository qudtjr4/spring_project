/**
 * 
 */
function checkImageType(fileName) {
	var pattern = /jpg|png|gif|jpeg/i;
	return fileName.match(pattern);
}

function getFileInfo(fullName) {
	var fileName, imgsrc, getLink, fileLink;
	var imageName;
	
	// 이미지 파일인 경우
	if (checkImageType(fullName)) {
		imgsrc = '/displayFile?fileName=' + fullName;
		fileLink = fullName.substr(14); // /년/월/일/s_
		
		var front = fullName.substr(0, 12);
		var end = fullName.substr(14);
		getLink = '/displayFile?fileName=' + front + end;
	} 
	// 일반 파일인 경우
	else {
		imgsrc = "/resources/dist/img/file.png";
		fileLink = fullName.substr(12);
		getLink = '/displayFile?fileName=' + fullName;
		
	}
	
	fileName = fileLink.substr(fileLink.indexOf("_") + 1); 
	imageName = fullName.substr(0, 12) + fullName.substr(14);
	
	var data = {
			'fileName' : fileName,
			'imgsrc' : imgsrc,
			'getLink' : getLink,
			'imageName' : imageName,
			'fullName' : fullName
	};
	console.log(data);
	return data;
}