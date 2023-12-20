const arcodians = document.querySelectorAll('.arcodian');

arcodians.forEach(function(arcodian) {
  arcodian.addEventListener('click', function() {
   
    if(arcodian.parentNode.classList.contains('on'))
      arcodian.parentNode.classList.remove('on');
    else
      arcodian.parentNode.classList.add('on');
  });
});