
function submit(){
      
        const email= document.getElementById("email").value
        const password =  document.getElementById("password").value
        const data={
            email,
            password
        }
       
       const user=JSON.parse(localStorage.getItem("arr"))
let check;
        user.find(element=>{
                if(element.email==email && element.password==password){
                  
                        return check=1
  
                }
                
                   return check=0
                
        })
if(check==1){
    alert("Successfully logged in") 
    localStorage.setItem("profile",(email))
    window.location.href="profile.html"

}
else{
    alert("incorrect")
}
  
}
  
