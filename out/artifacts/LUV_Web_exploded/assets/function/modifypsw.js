function check() {
  if (document.form1.oldpwd.value == "") {
    alert("请输入旧密码");
    document.form1.oldpwd.focus();
    return false;
  }
  if (document.form1.newpwd.value == "") {
    alert("请输入新密码");
    document.form1.newpwd.focus();
    return false;
  }
  if (document.form1.repwd.value == "") {
    alert("请确认密码");
    document.form1.repwd.focus();
    return false;
  }
  if (document.form1.repwd.value != document.form1.newpwd.value) {
    alert("两次输入的密码不相同，请确认密码");
    document.form1.repwd.focus();
    return false;
  }
}

function checkPasswords() {
  var pass1 = document.getElementById("newpwd");
  var pass2 = document.getElementById("repwd");

  if (pass2.value != pass1.value)
    pass2.setCustomValidity("两次输入的密码不匹配");
  else
    pass2.setCustomValidity("");
}