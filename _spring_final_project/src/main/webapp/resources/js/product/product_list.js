

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