import {bjump, home, last, next, pre} from "../function/page.js";

document.getElementById('home').addEventListener('click', function () {
  home("search_card_info1.jsp?page=1")
});
document.getElementById('last').addEventListener('click', function () {
  last("search_card_info1.jsp?page=")
});
document.getElementById('pre').addEventListener('click', function () {
  pre("search_card_info1.jsp?page=")
});
document.getElementById('next').addEventListener('click', function () {
  next("search_card_info1.jsp?page=")
});
document.getElementById('jump').addEventListener('click', function () {
  bjump("search_card_info1.jsp?page=1", "search_card_info1.jsp?page=")
});
