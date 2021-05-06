function home() {
  var page = parseInt(form.page.value);
  if (page <= 1) {
    alert("已至首页");
  } else {
    form.action = "manage_member1.jsp?page=1";
    form.submit();
  }
}

function last() {
  var page = parseInt(form.page.value);
  var pageCount = parseInt(form.pageCount.value);
  if (page == pageCount) {
    alert("已至尾页");
  } else {
    form.action = "manage_member1.jsp?page=" + form.pageCount.value;
    form.submit();
  }
}

function pre() {
  var page = parseInt(form.page.value);
  if (page <= 1) {
    alert("已至第一页");
  } else {
    form.action = "manage_member1.jsp?page=" + (page - 1);
    form.submit();
  }
}

function next() {
  var page = parseInt(form.page.value);
  var pageCount = parseInt(form.pageCount.value);
  if (page >= pageCount) {
    alert("已至最后一页");
  } else {
    form.action = "manage_member1.jsp?page=" + (page + 1);
    form.submit();
  }
}

function bjump() {
  var pageCount = parseInt(form.pageCount.value);
  if (fIsNumber(form.busjump.value, "1234567890") != 1) {
    alert("跳转文本框中只能输入数字!");
    form.busjump.select();
    form.busjump.focus();
    return false;
  }
  if (form.busjump.value > pageCount) {
    if (pageCount == 0) {
      form.action = "manage_member1.jsp?page=1";
      form.submit();
    } else {
      form.action = "manage_member1.jsp?page=" + pageCount;
      form.submit();
    }
  } else if (form.busjump.value <= pageCount) {
    var page = parseInt(form.busjump.value);
    if (page == 0) {
      page = 1;
      form.action = "manage_member1.jsp?page=" + page;
      form.submit();
    } else {
      form.action = "manage_member1.jsp?page=" + page;
      form.submit();
    }
  }
}

function fIsNumber(sV, sR) {
  var sTmp;
  if (sV.length == 0) {
    return (false);
  }
  for (var i = 0; i < sV.length; i++) {
    sTmp = sV.substring(i, i + 1);
    if (sR.indexOf(sTmp, 0) == -1) {
      return (false);
    }
  }
  return (true);
}

function del() {
  pageform.submit();
}

window.onload = function () {
  document.getElementById('home').addEventListener('click', home);
  document.getElementById('pre').addEventListener('click', pre);
  document.getElementById('next').addEventListener('click', next);
  document.getElementById('last').addEventListener('click', last);
  document.getElementById('jump').addEventListener('click', bjump);
};