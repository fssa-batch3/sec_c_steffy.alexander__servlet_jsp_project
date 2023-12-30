
console.log("test")

      const totalCount = document.querySelectorAll(".quantity");
      const add_quantity = document.querySelectorAll(".add");
      const minus_quantity = document.querySelectorAll(".minus");
      const remove_cart = document.querySelectorAll(".remove_cart")
      const plant_price = document.querySelectorAll(".price")
      const subtotal = document.querySelectorAll(".sub_total")
      const shipping = document.querySelectorAll(".shipping")
      const sub_total_value = document.querySelector(".subtotal_value")
      const shipping_value = document.querySelectorAll(".shipping_value")
      const total_value = document.querySelector(".total_value")


      //  adding quantity to the product------

      add_quantity.forEach((e, index) => {
        e.addEventListener("click", element => {
			console.log("clicked")
          let count = Number(totalCount[index].innerHTML)
          count += 1
          const total_price = Number(cart_data[index].plant_price) * count
          plant_price[index].innerHTML = total_price
          totalCount[index].innerHTML = count
          cart_data[index].plantquantity = count
          cart_data[index].plant_total_price = Number(cart_data[index].plant_price) * count

    
          //saveinlocal()
          //summary()
          //summaryView()

        })
      })

      //  minusing quantity to the product------
      
      minus_quantity.forEach((e, index) => {
        e.addEventListener("click", element => {
          let count = Number(totalCount[index].innerHTML)
          if (count > 1) {
            count -= 1
            const total_price = Number(cart_data[index].plant_price) * count
            plant_price[index].innerHTML = total_price
            totalCount[index].innerHTML = count
            cart_data[index].plantquantity = count
            cart_data[index].plant_total_price = Number(cart_data[index].plant_price) * count
            // localStorage.setItem("cart",JSON.stringify(cart_data))
            // location.reload()
            saveinlocal()
            summaryView()
            summary()

          }
          else {
            alert("Wrong")
          }
        })
      })

      //  removing quantity to the product------

      remove_cart.forEach((e, index) => {
        e.addEventListener("click", element => {
          cart_data.splice(index, 1)
          // localStorage.setItem("cart",JSON.stringify(cart_data))
          // location.reload()
          saveinlocal()
          location.reload()

        })
      })
   
    




    


