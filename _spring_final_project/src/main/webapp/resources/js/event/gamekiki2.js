let appidVal, secretkeyVal, mgIdVal,tokenVal;

switch (evType) {
    case 'rouletteEv':
        appidVal = 'app_gOzCRz9a00000';
        secretkeyVal = 'c337b56d0b3abd3a5011966bacb65db44727f641b6e3394a4f50e2b9b6c020e4';
        mgIdVal = 'MGMAI_i7A2Z6s2';
        break;
    case 'AttendanceEv':
        appidVal = 'app_ANI1V6bB00000';
        secretkeyVal = '94b0f7da9ab656399c8f3f690e875d6c7cef704f6fe30f90d836aeed11138c45';
        mgIdVal = 'MGMAI_i7j2g5r4';
        break;
    case 'prboxEv':
        appidVal = 'app_xPZzomXv00000';
        secretkeyVal = '63fdbc11e5fb4a128b2eb477e1baea9754585af9fad3538b08eb52285dad7841';
        mgIdVal = 'MGMAI_n7D2b6v9';
        break;
}
const userId = `${uid}`;

function sendTokenRequest(appidVal, userId, secretkeyVal) {
    const loginAPIUrl = "http://api.gamekiki.com/login";

    const data = new URLSearchParams();
    data.append('appId', appidVal);
    data.append('userId', userId);
    data.append('secretKey', secretkeyVal);

    fetch(loginAPIUrl, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: data,
    })
        .then(response => response.json())
        .then(jsonData => {
            if (jsonData.message === "succeed to login.") {
                // 토큰 값
                const token = jsonData.token;
                tokenVal=jsonData.token;
                console.log(token);
            } else {
                // 로그인 실패 처리
                const msg = "login validation fail";
                alert(msg);
            }
        })
        .catch(error => {
            const msg = "can't call login API: " + error.message;
            console.error(msg);
        });
}
console.log('토큰:'+tokenVal);
sendTokenRequest(appidVal, userId, secretkeyVal);


gamekiki.openBannerGame({
    mgId : mgIdVal,
    callback : function(res){
       if(res.status == "error"){
          console.log("error", res.errorCode);
       }
       if(res.status == "played"){
          console.log("played", res.errorCode);
       }
       console.log(res);
    }
 });


 $.ajax({
    method: "GET",
    url: "http://api.gamekiki.com/api/v1/kiki/rewardList",
    data: { appId: appidVal,token:tokenVal,userId:userId}
})
    .done(function (msg) {
        console.log(msg);
    });