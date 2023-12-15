

let tabs = document.querySelectorAll('ul.tabs li');

tabs.forEach(function (tab) { //모든 탭 li에 이벤트 추가
  tab.addEventListener('click', function () {
    let tab_id = tab.getAttribute('data-tab'); //현재 탭 아이디

    tabs.forEach(function (e) {           //모든 li의 클래스에서 current 삭제
      e.classList.remove('current');
    });

    let tabContents = document.querySelectorAll('.tab-content');    //모든 탭div의 클래스에서 current 삭제
    tabContents.forEach(function (content) {
      content.classList.remove('current');
    });

    let subContents = document.querySelectorAll('.tab-content .sub');    //모든 탭div의 서브div 클래스에서 current 삭제
    subContents.forEach(function (content) {
      content.classList.remove('current');
    });



    tab.classList.add('current');     //누른 탭 li에 current 추가
    document.getElementById(tab_id).classList.add('current'); //누른 탭 li의 div에 current 추가

    let a = '#' + tab_id + ' .sub';                       //누른 탭 li의 div의 서브div에 current 추가
    let CurrentsubContents = document.querySelectorAll(a);
    CurrentsubContents.forEach(function (content) {
      content.classList.add('current');
    });


  });
});


let events=document.querySelectorAll('#tab-1 .sub div');
let is=document.querySelectorAll('#tab-1 .sub div i');

events.forEach(function(event){
  event.addEventListener('click',function(){
    let event_id=event.getAttribute('data-event'); //이벤트 data-set 가져오기
    
    let evSelec=document.getElementById('evSelec'); //select에 값 넣어주기
    evSelec.value=event_id;

    events.forEach(function(event){
      event.style.borderColor='#999999';
    })

    is.forEach(function(i){
      i.style.color='#999999';
    })
    
    
    let div=document.querySelector('.'+event_id);
    let i=document.querySelector('.'+event_id+' i');
    console.log(div);
    div.style.borderColor='#9c27b0';
    i.style.color='#9c27b0';

    
  })

})

