      const form = document.querySelector("form");
      form.addEventListener("submit", (event) => {
        event.preventDefault();
        submit();

       alert("Form has been submitted");
      });

      
        if (
          fname != "" &&
          lname != "" &&
          email != "" &&
          password != "" &&
          confirmpass != ""
        ) {
         

          const user_data = {
            fname,
            lastname: lname,
            email,
            password,
            confirmpass,
          };
          let check = true;
          if (records != null) {
            for (let i = 0; i < records.length; i++) {
              if (records[i].email == email) {
               check = false;
               break;
              }
            }
          }


          if (check) {
            if (password === confirmpass) {
              arr.push(user_data);
              user_backup.push(user_data);
              localStorage.setItem("user_backup", JSON.stringify(user_backup));

              localStorage.setItem("arr", JSON.stringify(arr));
              alert("Successfully logged in");
              window.location.href = "./login.jsp";
            } else {
              alert("password mismatch");
            }
          } else {
            alert("Already have an account");
          }
        } else {
          alert("fill this data");
        }
      
      
  