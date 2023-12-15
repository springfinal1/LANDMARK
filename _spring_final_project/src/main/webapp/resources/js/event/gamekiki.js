console.log(evType);

kshopMds.loginPage = "/user/login";

// 사용자 미로그인 시 로그인 redirect 페이지 (필수)
//  let user_session_cookie = '<%=(String)session.getAttribute("uid")%>';
// var user_session_cookie = document.cookie.match(/userLoginSession=([^;]+)/);
 let user_session_cookie=`${uid}`;


let appidVal, secretkeyVal, mgIdVal;

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

// 사용자의 로그인 쿠키값 없다면 "N"
let autoLogin = (user_session_cookie) ? "Y" : "N";



window.addEventListener("DOMContentLoaded", function () {
    if (user_session_cookie) {
        // 자동 로그인
        kshopMds.init({
            appId: appidVal, // appId (필수)	
            autoLogin: autoLogin // 키키위젯 로그인 쿠키 삭제여부 (옵션)
        });
    }
}, false);

$.ajax({
    method: "POST",
    url: "http://api.gamekiki.com/login",
    data: { appId: appidVal, secretKey: secretkeyVal, userId: user_session_cookie }
})
    .done(function (msg) {
        console.log(msg);
        kshopMds.saveUserInfo({
            appId: appidVal,
            userId:user_session_cookie,
            token: `${msg.token}`
        })
    });

var userId, appId, token;

if (connMd.isUser()) {
    userId = connMd.getUserId();
}

if (connMd.isAppId()) {
    appId = connMd.getAppId();
}

if (connMd.isToken()) {
    token = connMd.getToken();
}

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
    method: "POST",
    url: "http://api.gamekiki.com/api/v1/kiki/mg/pickrwd",
    data: { appId: appidVal,token:token,mgId:mgIdVal,userId:user_session_cookie}
})
    .done(function (msg) {
        console.log(msg);
    });
 
//  $.ajax({
//     method: "GET",
//     url: "http://api.gamekiki.com/api/v1/kiki/rewardList",
//     data: { appId: appidVal, token: token, userId: user_session_cookie }
// })
//     .done(function (msg) {
//         console.log(msg);
//     });



// // $.ajax({
// //     method: "POST",
// //     url: "http://api.gamekiki.com/api/v1/kiki/mg/pickrwd",
// //     data: { appId: appidVal, token: connMd.getToken(), mgId: mgIdVal, userId: user_session_cookie }
// // })
// //     .done(function (msg) {
// //         console.log(msg);
// //     })
// //     .fail(function(msg){
// //         console.log(msg);
// //     });





// // $.ajax({
// //     method: "POST",
// //     url: "http://api.gamekiki.com/api/v1/kiki/feed",
// //     data: { appId: appidVal}
// // })
// //     .done(function (msg) {
// //         console.log(msg);
// //     });


// let logout=document.getElementById('logout');

// logout.addEventListener('click',()=>{
//     kshopMds.logout();
// })