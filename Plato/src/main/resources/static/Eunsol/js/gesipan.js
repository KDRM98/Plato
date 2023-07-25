let at1 = document.querySelector(".at1")
let gesipan1 = document.querySelector(".gesipan1")
let at2 = document.querySelector(".at2")
let gesipan2 = document.querySelector(".gesipan2")


at1.addEventListener("click",function(){
	
	gesipan1.style.display ="block"
	gesipan2.style.display ="none"
	at1.style.borderBottom = "2px solid #FF5733"
	at2.style.borderBottom = "none"
	
});

at2.addEventListener("click",function(){
	
	gesipan1.style.display ="none"
	gesipan2.style.display ="block"
	at1.style.borderBottom = "none"
	at2.style.borderBottom = "2px solid #FF5733"
	
});

let md = document.querySelector(".md")
md.addEventListener("click",function(){
	 window.location.href = "/profile";
	});
	
let tab_write = document.querySelector(".tab_write")
tab_write.addEventListener("click",function(){
	 window.location.href = "/addrecipe";
	});
	
	
	
	
let tab_del = document.querySelector(".tab_del")





let all_chk = document.querySelector(".all_chk");
let checkboxes = document.getElementsByClassName("chk");

all_chk.addEventListener("click", function() {
  for (var i = 0; i < checkboxes.length; i++) {
    checkboxes[i].checked = all_chk.checked;
  }
});

for (var i = 0; i < checkboxes.length; i++) {
  checkboxes[i].addEventListener("change", function() {
    if (!this.checked) {
      all_chk.checked = false;
    }
  });
}
