document.addEventListener("DOMContentLoaded", function () {
    // payMentCancel 클래스를 가진 모든 요소를 찾아 payMentCancelButtons에 할당합니다.
    const payMentCancelButtons = document.querySelectorAll('.payMentCancel');
  
    // payMentCancelButtons에 대한 forEach 루프를 사용하여 각각에 이벤트 리스너를 추가합니다.
    payMentCancelButtons.forEach(function(button) {
        button.addEventListener("click", function () {
            console.log(orderNum);
  
            const userConfirmed = confirm("주문을 취소하시겠습니까?\n취소하면 되돌릴 수 없습니다.!");
  
            if (userConfirmed) {
                alert("주문을 취소하였습니다!");
                const xhttp = new XMLHttpRequest();
  
                xhttp.open("POST", "/peyment/orderCancle");
  
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  
            xhttp.send("orderNum=" + orderNum);
  
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        let result1 = xhttp.responseText.trim();
                        console.log(result1);
  
                        if (result1 == 1) {
                            location.replace('/peyment/OrderList?pageNo=1');
                        } else {
                            location.replace('/peyment/OrderList?pageNo=1');
                        }
                    }
                }
            } else {
                alert("보류하였습니다!");
            }
        });
    });
  });
  
  
  function cancelPay(){
          
          
          const xhttp = new XMLHttpRequest;
  
          xhttp.open("POST","../admin/orderCancle")
  
          
          xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  
  
          xhttp.send("orderNum="+orderNum);
  
          xhttp.onreadystatechange=function(){
              if(this.readyState==4 && this.status==200){
                 let result1 = xhttp.responseText.trim();
                 console.log(result1);
                     if(result1==1){
                         console.log("삭제성공")
                 
                     } else{
                         console.log("삭제실패");
                     }
              } 
          }
   }