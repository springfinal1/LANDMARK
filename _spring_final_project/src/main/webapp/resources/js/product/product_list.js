


let placeDiv  = document.querySelector('.placeDiv'); // 전체디브
let placeH2 = document.querySelectorAll('.place-h2'); //지역보기

let placeDrop = document.querySelectorAll('.place-drop-menu span');
let placeAll = document.getElementById('placeAll');



placeAll.addEventListener('click',()=>{



    if(!placeAll.classList.contains("exit")){
        placeAll.classList.add('exit');
    
        placeDiv.style.height = '100vh';
        placeDiv.style.transition = '0.7s';
        placeDiv.style.borderTop = "1px solid black";
        setTimeout(time, 200);
    }else if(placeAll.classList.contains("exit")){
        placeAll.classList.remove('exit');

        placeDiv.style.height = '0';
        placeDiv.style.transition = '0.7s';
        placeDiv.style.borderTop = "none";

        placeDrop.forEach(elem =>{
        elem.style.fontSize = "0";
        })
    }
})

function time(){
    placeDrop.forEach(elem =>{

        elem.style.fontSize = "18px";
    })
}
let heartBtn = document.querySelectorAll('.heart-btn');
let pkNo = "";

//console.log(e.dataset.heart);
// 아이디가 null x

heartBtn.forEach(e=>{
    e.addEventListener('click',()=>{
    pkNo = e.dataset.heart;
    if(idVal != ""){
        if(e.classList.contains('check-heart')){
            e.classList.remove('check-heart');
        }else{
            e.classList.add('check-heart');
            favoriteFromServer(idVal,pkNo).then(result=>{
                console.log("여기까진 실행됨");
                alert("추가성공");
            })
        }    
    }else{
        alert("로그인 후 관심상품 등록 가능합니다");
    }
    })
})


async function favoriteFromServer(idVal,pkNo){
    try {
        //const url = "/freetour/favorite"+idVal;
        const resp = await fetch("/product/favorite/"+idVal+"/"+pkNo);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}


function colorRed(){
    selectIdvalFromServer(idVal,pkNo).then(result=>{
        
    })
}
async function selectIdvalFromServer(idVal,pkNo){
    try {
        const resp = await fetch("/product/red/"+idVal+"/"+pkNo);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}