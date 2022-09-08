function isNull(src, dest, msg) {
	if(src.value=="" || src.value==null) {
		src.setAttribute("class", "error-zipcode");
		dest.innerHTML = msg;
		return true;
	} else {
		src.setAttribute("class", "");
		dest.innerHTML = "";
		return false;
	}
}

function isEqual(src1, src2, dest, msg) {
	if(src1.value == src2.value) {
		src2.setAttribute("class", "");
		dest.innerHTML = "";
		return true;
	} else {
		src2.setAttribute("class", "error-zipcode");
		dest.innerHTML = msg;
		return false;
	}
}