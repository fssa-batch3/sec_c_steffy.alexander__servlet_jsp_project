  

      const card = document.querySelector(".click");
      const upipay = document.querySelector(".upipay");
      const paylater = document.querySelector(".paylater");
      const cash_delivery = document.querySelector(".cash_delivery");

      console.log(card);
      const card_details = document.querySelector(".card_details");
      console.log(card_details);

   //   card.addEventListener("click", (e) => {
     //   card_details.classList.toggle("view");
//        icons.classList.remove("view");
  //      order_btn.classList.remove("view");
    //  });

     const icons = document.querySelector(".upi_trans");
  //    upipay.addEventListener("click", (e) => {
    //    icons.classList.toggle("view");
      //  card_details.classList.remove("view");
 //       order_btn.classList.remove("view");
   //   });

      const order_btn = document.querySelector(".cash_delivery");

      paylater.addEventListener("click", (e) => {
        order_btn.classList.toggle("view");
        card_details.classList.remove("view");
        icons.classList.remove("view");
      });

      
      