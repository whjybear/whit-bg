let dialog, cer_id, cer_name, form_box_down, error_msg, queryTimes,infoImg,imgBox,bigImg;
window.onload = function () {
    const btn_post = document.getElementById('button-post');
    const btn_clear = document.getElementById('button-clear');
    const dialog_cancel_btn = document.getElementById('dialog-cancel-btn');
    dialog = document.getElementsByClassName('dialog-mask')[0];
    form_box_down = document.getElementById('form-box-down');
    queryTimes = document.getElementById('query-times');
    cer_id = document.getElementById('cer-id');
    cer_name = document.getElementById('cer-name');
    error_msg = document.getElementById('error-msg');
    dialog_cancel_btn.onclick = closeErrorMsg;
	infoImg = document.getElementById('info-img');
	infoImg.onclick = showBigImg;
	bigImg = document.getElementById('big-img');
	imgBox = document.getElementsByClassName('dialog-mask')[1];
	imgBox.onclick = closeBigImg;
    btn_clear.onclick = clearInput;
    btn_post.onclick = clickOk;
//	if(isIphone()){
//		showErrorMsg('苹果手机请点击右上角选择在Safari中打开查询！');
//	}
};
function isIphone(){
	if(navigator.userAgent.indexOf("iPhone")!=-1){
		return true;
	}else{
		return false;
	}
}
/**
 * 点击确认按钮触发的函数
 */
function clickOk() {
//	if(isIphone()){
//		showErrorMsg('苹果手机请点击右上角选择在Safari中打开查询！');
//		return;
//	}
	// 检查输入合法性
	const number = cer_id.value.trim();
	const name = cer_name.value.trim();
	if (number === '' && name === '') {
	    showErrorMsg('请至少输入证书编号或学员姓名中的任意一项！');
		return;
	}
	getInfo({name,number});
    
}
function showBigImg(){
	imgBox.style.display = 'flex';
}

function closeBigImg(){
	imgBox.style.display='none';
}

/**
 * 显示错误信息
 * @param {string} msg 错误的信息
 */
function showErrorMsg(msg) {
    dialog.style.display = 'flex';
    error_msg.innerText = msg;
}

/**
 * 关闭下面的证书详情显示
 */
function closeInfo() {
    form_box_down.style.display = 'none';
}

function showInfo(data) {
    form_box_down.style.display = 'block';
    queryTimes.innerText = '此证书为真，该证书被查'+data.queryTimes+'次';
    drawCerImg(data).then(function (data) {
        infoImg.src = data;
		bigImg.src = data;
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
    fetch(url, {
        method: 'GET',
    }).then(function (response) {
			response.json().then(function(data){
				showInfo(data);
			}).catch(function(error){
				showErrorMsg('查询不到结果，请检查输入的编号或者姓名！');
			});
    }).catch(function (error) {
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
 * 关闭errorMsg弹窗
 */
function closeErrorMsg() {
    dialog.style.display = 'none';
}

/**
 * 更具接口信息绘制证书
 * @return {Promise} 返回promise对象
 */
function drawCerImg(data) {
	const date = new Date(data.endTime);
	const year = date.getFullYear();
	const month = date.getMonth()+1;
	const day = date.getDate();
    return new Promise(function (resolve, reject) {
        const canvas = document.getElementById('cer-img');
        if (canvas.getContext) {
            const ctx = canvas.getContext('2d');
            let img = new Image();
			if(data.signTeacher==="20002"){
				img.src = './img/info2.jpg';
			}else{
				img.src = './img/info.jpg';
			}
            img.crossOrigin = "Anonymous";
            img.onload = function() {
                ctx.drawImage(img, 0, 0);
                ctx.font = '24px serif';
                ctx.fillText(data.name, 400, 259);
                ctx.fillText(data.title.slice(0,15), 378, 308);
				ctx.fillText(data.title.slice(15), 140, 342);
                ctx.font = '20px serif';
                ctx.fillText(year+'-'+month+'-'+day, 138, 516);
				ctx.fillText(data.number,550,570);
                const base64 = canvas.toDataURL();
                resolve(base64);
            }
        } else {
            reject();
        }
    })
}
