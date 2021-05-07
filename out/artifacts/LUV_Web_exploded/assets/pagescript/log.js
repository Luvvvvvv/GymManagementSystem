import {bjump, home, last, next, pre} from "../function/page.js";

document.getElementById('home').addEventListener('click', function () {
  home("log.jsp?page=1")
});
document.getElementById('last').addEventListener('click', function () {
  last("log.jsp?page=")
});
document.getElementById('pre').addEventListener('click', function () {
  pre("log.jsp?page=")
});
document.getElementById('next').addEventListener('click', function () {
  next("log.jsp?page=")
});
document.getElementById('jump').addEventListener('click', function () {
  bjump("log.jsp?page=1", "log.jsp?page=")
});
