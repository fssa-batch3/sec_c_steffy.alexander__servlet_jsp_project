
console.log("In all orders page");
    let viewOrderDetails = document.querySelectorAll(".viewOrderDetails");

      let rightoutcontent = document.querySelectorAll(".orderDetails");
     
     let j=0;
     viewOrderDetails.forEach((e,i)=>{//i represents the clicked btn index
	 e.addEventListener('click', function () {
		rightoutcontent[j].style.display="none"; 
       rightoutcontent[i].style.display="block";
       rightoutcontent[i].style.marginTop =`${i*175}px`;
       j=i;
      })
})
  
  
      const editStatusBtn = document.getElementById('editStatusBtn');
      const statusOptions = document.getElementById('statusOptions');

// Add a click event listener to the "Edit Status" button
editStatusBtn.addEventListener('click', function () {
    // Toggle the visibility of the status options
    if (statusOptions.style.display === 'none' || statusOptions.style.display === '') {
        statusOptions.style.display = 'block';
    } else {
        statusOptions.style.display = 'none';
    }
});

    document.addEventListener("DOMContentLoaded", function () {
        const editStatusBtn = document.getElementById("editStatusBtn");
        const statusSelect = document.getElementById("statusSelect");

        editStatusBtn.addEventListener("click", function () {
            // Get the selected status
            const newStatus = statusSelect.value;

            // Perform an action based on the selected status (you may want to use AJAX to send this back to the server)
            if (newStatus === "shipped") {
                // Handle the status change to "Shipped" here
                // For example, you can update the UI to show the status as "Shipped"
                document.querySelector(".status").textContent = "Shipped";
            }
        });
    });


