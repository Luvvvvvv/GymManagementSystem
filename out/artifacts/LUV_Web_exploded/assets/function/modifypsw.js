function check() {
  if (document.form1.oldpwd.value == "") {
    alert("�����������");
    document.form1.oldpwd.focus();
    return false;
  }
  if (document.form1.newpwd.value == "") {
    alert("������������");
    document.form1.newpwd.focus();
    return false;
  }
  if (document.form1.repwd.value == "") {
    alert("��ȷ������");
    document.form1.repwd.focus();
    return false;
  }
  if (document.form1.repwd.value != document.form1.newpwd.value) {
    alert("������������벻��ͬ����ȷ������");
    document.form1.repwd.focus();
    return false;
  }
}

function checkPasswords() {
  var pass1 = document.getElementById("newpwd");
  var pass2 = document.getElementById("repwd");

  if (pass2.value != pass1.value)
    pass2.setCustomValidity("������������벻ƥ��");
  else
    pass2.setCustomValidity("");
}