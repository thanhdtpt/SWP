const checkboxall = document.getElementById('all-checkbox')
const checkbox = document.getElementsByClassName("toggle1");
checkboxall.addEventListener("click",handlerCheckbox);
function handlerCheckbox() { 
    for(let i = 0; i < checkbox.length; i++) {
        if(checkboxall.checked === true){
            checkbox[i].setAttribute("checked", true);
        }
       
            
      }
    }