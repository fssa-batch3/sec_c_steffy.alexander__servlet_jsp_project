      const add_blog = document.getElementById("add_blog");
   const blog_content = document.getElementsByClassName("blog_content");
      const additional_data =
        document.getElementsByClassName("additional_points");  
add_blog.addEventListener("click", (e) => {
        e.preventDefault();
       
          const center = document.querySelector(".center");
          center.style.filter = "blur(4.3px)";
          blog_content[0].style.display = "block";
          // window.location.href="/pages/blog.html"
      
      });
      
       add.addEventListener("click", (e) => {
        e.preventDefault();
        additional_data[0].style.display = "block";
        add.style.display = "none";
      });