function registerform(){
   var register=document.querySelector(".modal");
   console.log(register);
}
//function ChangeProfile() {
//  var x = document.createElement("INPUT");
//  x.setAttribute("type", "text");
//  x.setAttribute("value", "Hello World!");
//  document.body.appendChild(x);
//}
  function ChangeProfile(divSelector,value) {
      if(divSelector=="mail"&&document.querySelector(".change--mail")==null){
  var para=document.getElementById(divSelector).innerHTML;
  var x = document.createElement("INPUT");
  x.setAttribute("type", "text");
  x.setAttribute("value", para);
  x.setAttribute("id","mail-new")
  x.setAttribute("value",value);
  x.setAttribute("class","form-item__shopname-output form-item__shopname-output--input-change change--mail");
  x.setAttribute("name","newmail");
  console.log(x);
  document.getElementById(divSelector).innerHTML='';
  document.getElementById(divSelector).appendChild(x);
      }
      if(divSelector=="phone"&&document.querySelector(".change--phone")==null){
  var para=document.getElementById(divSelector).innerHTML;
  var x = document.createElement("INPUT");
  x.setAttribute("type", "text");
  x.setAttribute("value", para);
   x.setAttribute("id","phone-new");
     x.setAttribute("value",value);
  x.setAttribute("class","form-item__shopname-output form-item__shopname-output--input-change change--phone");
  x.setAttribute("name","newphone");
  console.log(x);
  document.getElementById(divSelector).innerHTML='';
  document.getElementById(divSelector).appendChild(x);
      }
//      else{
//  var para=document.getElementById(divSelector).innerHTML;
//  var x = document.createElement("INPUT");
//  x.setAttribute("type", "text");
//  x.setAttribute("value", para);
//  x.setAttribute("class","form-item__shopname-output form-item__shopname-output--input-change ");
//  console.log(x);
//  document.getElementById(divSelector).innerHTML='';
//  document.getElementById(divSelector).appendChild(x);
//      }
//    alert("123");


  }

function doDelete(id){
     let text;
     let path;
  if (confirm("Bạn muốn xóa sản phẩm này?") == true) {
    text = "Sản phẩm đã được xóa";
    path='delete?id='+id;
    window.location.href=path;
  }
  }


    function ShipFunction() {
        var id = document.getElementById("mySelect").value;
        if(id==1){
       document.getElementById("sname").innerHTML = "Tên shipper:Bùi Xuân Huấn";
       document.getElementById("sphone").innerHTML = "Số điện thoại:07888899999";
        }
        else{
       document.getElementById("sname").innerHTML = "Tên Shipper:Dương Minh Tuyền";
       document.getElementById("sphone").innerHTML = "Số điện thoại:0924999888";
        }
    }
  
function ppd(){ 
    var password= $("#password").val();
	var confirm_password = $("#confirm").val();
	
	if(password != confirm_password) {
		$("#confirm").css({'border-color': "#c33"});
		$("#password").css({"background-color": "red"});
  }
}