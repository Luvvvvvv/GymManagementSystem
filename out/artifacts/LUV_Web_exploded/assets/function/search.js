function check() {
  if (document.form1.word.value == "") {
    alert("������ؼ��֣�");
    document.form1.word.focus();
    return false;
  }
}