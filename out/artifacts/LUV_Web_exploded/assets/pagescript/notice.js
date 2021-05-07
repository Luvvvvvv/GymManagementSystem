import {bjump, home, last, next, pre} from "../function/page.js";

document.getElementById('home').addEventListener('click', function () {
  home("notice.jsp?page=1")
});
document.getElementById('last').addEventListener('click', function () {
  last("notice.jsp?page=")
});
document.getElementById('pre').addEventListener('click', function () {
  pre("notice.jsp?page=")
});
document.getElementById('next').addEventListener('click', function () {
  next("notice.jsp?page=")
});
document.getElementById('jump').addEventListener('click', function () {
  bjump("notice.jsp?page=1", "notice.jsp?page=")
});
