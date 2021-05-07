import {bjump, home, last, next, pre} from "../function/page.js";

document.getElementById('home').addEventListener('click', function () {
  home("manage_notice.jsp?page=1")
});
document.getElementById('last').addEventListener('click', function () {
  last("manage_notice.jsp?page=")
});
document.getElementById('pre').addEventListener('click', function () {
  pre("manage_notice.jsp?page=")
});
document.getElementById('next').addEventListener('click', function () {
  next("manage_notice.jsp?page=")
});
document.getElementById('jump').addEventListener('click', function () {
  bjump("manage_notice.jsp?page=1", "manage_notice.jsp?page=")
});
