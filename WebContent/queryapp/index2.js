let dialog, cer_id, cer_name, form_box_down, error_msg, queryTimes, infoImg, imgBox, bigImg, isLoading = false;

window.onload = function() {
	// 一些变量的赋值
	const btn_post = document.getElementById('button-post');
	const btn_clear = document.getElementById('button-clear');
	const dialog_cancel_btn = document.getElementById('dialog-cancel-btn');
	dialog = document.getElementsByClassName('dialog-mask')[0];
	form_box_down = document.getElementById('form-box-down');
	queryTimes = document.getElementById('query-times');
	cer_id = document.getElementById('cer-id');
	cer_name = document.getElementById('cer-name');
	error_msg = document.getElementById('error-msg');
	// 给消息弹窗中的关闭按钮添加关闭弹窗的事件
	dialog_cancel_btn.onclick = closeErrorMsg;
	infoImg = document.getElementById('info-img');
	// 给证书详情图片添加点击放大事件
	infoImg.onclick = showBigImg;
	bigImg = document.getElementById('big-img');
	imgBox = document.getElementsByClassName('dialog-mask')[2];
	// 给证书大图添加关闭事件
	imgBox.onclick = closeBigImg;
	// 给清空按钮添加事件
	btn_clear.onclick = clearInput;
	// iPhone微信内置浏览器中fetch请求好像有点问题，提示用户
	if (isWeixinBrowser()) {
		showErrorMsg('苹果手机请点击右上角选择在Safari中打开查询！');
	} else {
		// 给确定按钮添加点击事件
		btn_post.onclick = clickOk;
	}
};
/**
 * 检查是否是iPhone微信内置浏览器
 */
function isWeixinBrowser() {
	return /micromessenger/.test(navigator.userAgent.toLowerCase()) && /iphone/.test(navigator.userAgent.toLowerCase())
}

/**
 * 点击确认按钮触发的函数
 */
function clickOk() {
	if (isWeixinBrowser()) {
		showErrorMsg('苹果手机请点击右上角选择在Safari中打开查询！');
		return;
	}
	// 检查输入合法性
	const number = cer_id.value.trim();
	const name = cer_name.value.trim();
	if (number === '' && name === '') {
		showErrorMsg('请至少输入证书编号或学员姓名中的任意一项！');
		return;
	}
	getInfo({
		name,
		number
	});

}
/**
 * 显示预览大图
 */
function showBigImg() {
	imgBox.style.display = 'flex';
}
/**
 * 关闭预览大图
 */
function closeBigImg() {
	imgBox.style.display = 'none';
}

/**
 * 显示错误信息
 * @param {string} msg 错误的信息
 */
function showErrorMsg(msg) {
	if(isLoading){
		closeLoading(true);
	}
	dialog.style.display = 'flex';
	error_msg.innerText = msg;
}

/**
 * 关闭errorMsg弹窗
 */
function closeErrorMsg() {
	dialog.style.display = 'none';
}


function showLoading(msg) {
	const div = document.getElementById('loading');
	const loadingText = document.getElementById("loadingText");
	div.style.display = 'flex';
	loadingText.innerHTML = msg.toString();
	isLoading = true;
}

/**
 * 关闭加载动画
 */
function closeLoading(quick) {
	const div = document.getElementById('loading');
	isloading = false;
	// 如果有这个参数，则立即关闭加载动画，否则延迟300ms后关闭
	if(quick){
		div.style.display = 'none';
	}else{
		setTimeout(function() {
			div.style.display = 'none';
		}, 300);
	}
}

/**
 * 关闭下面的证书详情显示
 */
function closeInfo() {
	form_box_down.style.display = 'none';
}

/**
 * 显示证书详情
 * @param {Object} data 要显示的数据
 */
function showInfo(data) {
	drawCerImg(data).then(function(base64) {
		infoImg.src = base64;
		bigImg.src = base64;
		form_box_down.style.display = 'block';
		queryTimes.innerText = '此证书为真，该证书被查' + data.queryTimes + '次';
	})
}

/**
 * 请求接口获取证书信息
 */
function getInfo(params) {
	closeInfo();
	// 检查输入合法性
	const number = cer_id.value.trim();
	const name = cer_name.value.trim();
	if (number === '' && name === '') {
		showErrorMsg('请至少输入证书编号或学员姓名中的任意一项！');
		return;
	}
	let url = 'http://cert.fmrplus.com/frmCertificate/queryCer';
	if (params) {
		let paramsArray = [];
		//拼接参数
		Object.keys(params).forEach(key => paramsArray.push(key + '=' + params[key]))
		if (url.search(/\?/) === -1) {
			url += '?' + paramsArray.join('&')
		} else {
			url += '&' + paramsArray.join('&')
		}
	}
	// 显示加载动画
	showLoading('飞速处理中，请稍后...');
	fetch(url, {
		method: 'GET',
	}).then(function(response) {
		response.json().then(function(data) {
			// 显示加载中动画
			showLoading('证书较大，预计处理10秒钟，请稍后...');
			// 开始加载字体
			const myFont1 = new FontFace('TengXiang', 'url(./font/TengXiang.ttf)');
			myFont1.load().then(function(font) {
				document.fonts.add(font);
				const myFont2 = new FontFace('HanWang', 'url(./font/HanWangShinSuMedium.ttf)');
				myFont2.load().then(function(font) {
					document.fonts.add(font);
					// 结束字体加载，关闭加载中动画
					closeLoading();
					// 显示证书详情
					showInfo(data);
				})
			});
		}).catch(function(error) {
			showErrorMsg('查询不到结果，请检查输入的编号或者姓名！');
		});
	}).catch(function(error) {
		console.error(error);

	});
}

/**
 * 清空输入的值
 */
function clearInput() {
	cer_id.value = '';
	cer_name.value = '';
	closeInfo();
}

/**
 * 更具data数据绘制证书
 * @param {Object} data data
 */
function drawCerImg(data) {
	const date = new Date(data.endTime);
	const year = date.getFullYear();
	const month = date.getMonth() + 1;
	const day = date.getDate();
	return new Promise(function(resolve, reject) {
		const canvas = document.getElementById('cer-img');
		if (canvas.getContext) {
			const ctx = canvas.getContext('2d');
			let img = new Image();
			if (data.signTeacher === "20002") {
				img.src = './img/info2.jpg';
			} else {
				img.src = './img/info.jpg';
			}
			img.crossOrigin = "Anonymous";
			img.onload = function() {
				ctx.drawImage(img, 0, 0);
				ctx.font = '24px TengXiang';
				ctx.fillText(data.name, 400, 259);
				ctx.fillText(data.title.slice(0, 15), 378, 308);
				ctx.fillText(data.title.slice(15), 140, 342);
				ctx.font = '20px HanWang';
				ctx.fillText(year + '-' + month + '-' + day, 138, 516);
				ctx.fillText(data.number, 550, 570);
				const base64 = canvas.toDataURL();
				resolve(base64);
			}
		} else {
			reject();
		}
	})
}
