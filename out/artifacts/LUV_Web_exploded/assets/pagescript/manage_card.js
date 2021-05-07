import {bjump, home, last, next, pre} from "../function/page.js";

document.getElementById('home').addEventListener('click', function () {
  home("manage_card.jsp?page=1")
});
document.getElementById('last').addEventListener('click', function () {
  last("manage_card.jsp?page=")
});
document.getElementById('pre').addEventListener('click', function () {
  pre("manage_card.jsp?page=")
});
document.getElementById('next').addEventListener('click', function () {
  next("manage_card.jsp?page=")
});
document.getElementById('jump').addEventListener('click', function () {
  bjump("manage_card.jsp?page=1", "manage_card.jsp?page=")
});
