/**
 * 
 */
 

console.log("js" + pkNoVal);


let checkbox = document.querySelectorAll(".all-check");
let icon = document.getElementById("icon-check");
let select = document.querySelectorAll(".select-check");

let peplecount = document.getElementById("peple-input"); // 인원수
let reservationPrice = document.getElementById("reservation-price"); // 변동수
let packagePrice = document.getElementById("package-price"); // 패키지 가격

let userCount=0;

console.log("aa" + reservationPrice.value);




icon.addEventListener('click',()=>{
    if(icon.classList.contains('checked')){
        for(let i=0; i<checkbox.length; i++){
            checkbox[i].classList.remove('checked');
        }
    }else{
        for(let i=0; i<checkbox.length; i++){
            checkbox[i].classList.add('checked');
        }
    }
})

for(let i=0; i<select.length; i++){
    select[i].addEventListener('click', ()=>{
        if(select[i].classList.contains('checked')){
            select[i].classList.remove('checked');
        }else{
            select[i].classList.add('checked');
        }
    })
}


document.getElementById('reservation-btn').addEventListener('click', () => {
    let aBtn = document.getElementById('reservation-btn-a');

    let checkBtn1 = document.getElementById('check-btn1');
    let checkBtn2 = document.getElementById('check-btn2');
    let checkBtn3 = document.getElementById('check-btn3');
    let checkBtn4 = document.getElementById('check-btn4');
    let checkBtn5 = document.getElementById('check-btn5');

    aaa = parseInt(pkNoVal);

    if (!checkBtn1.classList.contains('checked') || !checkBtn2.classList.contains('checked')
        || !checkBtn3.classList.contains('checked') || !checkBtn4.classList.contains('checked') || !checkBtn5.classList.contains('checked')) {
        alert("약관을 동의해주세요");
    } else {
        // 여기에서 이동할 URL을 지정하세요.
        aBtn.href = `/peyment/detail?pkNo=${pkNoVal}&userCount=${userCount}`;

        // 예시로 "/"로 지정되어 있습니다. 실제로 이동할 URL을 지정해주세요.
        aBtn.click();  // 버튼 클릭을 프로그래밍적으로 시뮬레이션
    }
});


document.addEventListener('click', (e) => {
      let pepleValue = parseInt(peplecount.value);
      let packageValue = parseInt(packagePrice.value);

    // 값이 NaN이거나 음수인 경우 기본값 설정
    if (isNaN(pepleValue) || pepleValue < 0) {
        pepleValue = 0;
    }

    if (isNaN(packageValue) || packageValue < 0) {
        packageValue = 0;
    }

    if (e.target.id == "minus-btn") {
        // 음수가 되지 않도록 체크
        if (pepleValue > 0) {
            pepleValue -= 1;
            peplecount.value = pepleValue;
        }
    } else if (e.target.id == "plus-btn") {
        pepleValue += 1;
        peplecount.value = pepleValue;
    }

    // 최종 합계 계산
    let totalPrice = pepleValue * packageValue;

    // 결과를 출력
    reservationPrice.value = totalPrice;
     userCount = pepleValue;
    
    console.log("ssss" + userCount);

    // 콘솔에 로그 찍어보기
    console.log("pepleValue:", userCount);
    console.log("packageValue:", packageValue);
    console.log("totalPrice:", totalPrice);

});

