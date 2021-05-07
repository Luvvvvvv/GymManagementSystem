function check() {
  if (document.form1.word.value == "") {
    alert("ÇëÊäÈë¹Ø¼ü×Ö£¡");
    document.form1.word.focus();
    return false;
  }
}