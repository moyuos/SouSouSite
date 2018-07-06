function wx(dom) {
	var src = dom.src;
	if (src.indexOf('image/yan.gif') != -1) {
		dom.src = 'image/gongzhonghao.jpg';
	} else {
		dom.src = 'image/yan.gif';
	}
}