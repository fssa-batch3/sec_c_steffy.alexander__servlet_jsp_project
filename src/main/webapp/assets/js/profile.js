
   
    document.getElementById("edit").addEventListener("click",e=>{
        e.preventDefault();
        document.getElementById("fname").removeAttribute("disabled","");
        document.getElementById("lname").removeAttribute("disabled","");
        document.getElementById("number").removeAttribute("disabled","");
        document.getElementById("address").removeAttribute("disabled","");
        document.getElementById("gender").removeAttribute("disabled","");
    })

    
