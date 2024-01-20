   let dropdownBtn = document.querySelectorAll(".dropDown");
    let orderContentDetails = document.querySelectorAll(".orderContentDetails");
for(let i=0;i<orderContentDetails.length;i++){
    dropdownBtn[i].addEventListener("click", (e) => {
      orderContentDetails[i].classList.toggle("view");
    })};