const toggleVibration = () => {
  if (document.querySelector("#toggle-scan")) {
    const x = document.querySelector(".vibrating-zone");
    const btn = document.querySelector("#toggle-scan");
    console.log(x)
    btn.addEventListener("click", (event) => {
      if (x.style.display === "block") {
        x.style.display = "none";
      } else {
        x.style.display = "block";
      }

    });
  }
};

export { toggleVibration }
