import {bjump, home, last, next, pre} from "../function/page.js";

document.getElementById('home').addEventListener('click', function () {
  home("manage_member1.jsp?page=1")
});
document.getElementById('last').addEventListener('click', function () {
  last("manage_member1.jsp?page=")
});
document.getElementById('pre').addEventListener('click', function () {
  pre("manage_member1.jsp?page=")
});
document.getElementById('next').addEventListener('click', function () {
  next("manage_member1.jsp?page=")
});
document.getElementById('jump').addEventListener('click', function () {
  bjump("manage_member1.jsp?page=1", "manage_member1.jsp?page=")
});
