let letters = document.querySelectorAll(".letter");
let up = document.querySelector(".fa-arrow-up");
let del = document.querySelector(".fa-delete-left");
let tab = document.querySelector(".tab");
let input = document.querySelector(".input");
window.onload = function () {
  input.focus();
};
up.addEventListener("click", function () {
  up.classList.toggle("blue");
  letters.forEach(function (e) {
    e.classList.toggle("upper");
  });
});

letters.forEach(function (e) {
  e.onclick = function () {
    e.classList.add("anim");
    setTimeout(function () {
      e.classList.remove("anim");
    },170);
    if (e.classList.contains("upper")) {
      let tex = e.innerHTML.toUpperCase();
      let back = input.value;
      let word = back + tex;
      input.value = word;
    } else {
      let tex = e.innerHTML;
      let back = input.value;
      let word = back + tex;
      input.value = word;
    }
  };
});
del.onclick = function () {
  del.classList.add("animTwo");
  setTimeout(function () {
    del.classList.remove("animTwo");
  },170);
  let x = input.value;
  let d = x.split("");
  d.pop();
  console.log(d);
  input.value = d.join("");
};

tab.onclick = function () {
  tab.classList.add("animThree");
  setTimeout(function () {
    tab.classList.remove("animThree");
  },170);
  let tex = " ";
  let back = input.value;
  let word = back + tex;
  input.value = word;
};
setInterval(function () {
  input.focus();
}, 0);
