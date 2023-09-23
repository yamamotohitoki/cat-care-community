document.addEventListener('turbolinks:load',
  function() {
    let nav = document.querySelector("#navArea")
    let nav2 = document.querySelector("#navArea2")
    let btn = document.querySelector(".toggle-btn")
    let mask = document.querySelector("#mask")
    btn.onclick = () => {
      nav.classList.toggle("open");
       nav2.classList.toggle("open");
    }
     mask.onclick = () => {
        nav.classList.toggle("open");
          nav2.classList.toggle("open");
      };
  }
);
