

let add=document.querySelectorAll(".add");

let minus=document.querySelectorAll(".minus");
let removeCart=document.querySelectorAll(".remove_cart");
console.log(add);


add.forEach((e)=>{
	
	e.addEventListener("click" , el=>{
		console.log(e.getAttribute("key"));
		let key=e.getAttribute("key");
	
	window.location.href="./Quantity?cartId="+key+"&process=increase"
	})
})


minus.forEach((e)=>{
	e.addEventListener("click" , el=>{
		console.log(e.getAttribute("key"));
	let key=e.getAttribute("key");
	let existingQuantity =e.getAttribute("quantity")
	if(existingQuantity==1){
		alert("Quantity cannot be less than zero! ")
	}
	else{
		window.location.href="./Quantity?cartId="+key+"&process=decrease"
	}
	
	
	});
});

removeCart.forEach((e)=>{
	e.addEventListener("click" , el=>{
		let key=e.getAttribute("key");
		window.location.href="./RemoveCart?cartId="+key;
		})
		})





