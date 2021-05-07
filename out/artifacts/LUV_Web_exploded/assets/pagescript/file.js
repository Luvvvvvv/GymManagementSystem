import {bjump, home, last, next, pre} from "../function/page.js";

document.getElementById('home').addEventListener('click', function () {
  home("file.jsp?page=1")
});
document.getElementById('last').addEventListener('click', function () {
  last("file.jsp?page=")
});
document.getElementById('pre').addEventListener('click', function () {
  pre("file.jsp?page=")
});
document.getElementById('next').addEventListener('click', function () {
  next("file.jsp?page=")
});
document.getElementById('jump').addEventListener('click', function () {
  bjump("file.jsp?page=1", "file.jsp?page=")
});
