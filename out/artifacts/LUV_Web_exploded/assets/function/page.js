function home(url) {
  var page = parseInt(form.page.value);
  if (page <= 1) {
    alert("已至首页!");
  } else {
    form.action = url;
    form.submit();
  }
}

function last(url) {
  var page = parseInt(form.page.value);
  var pageCount = parseInt(form.pageCount.value);
  if (page == pageCount) {
    alert("已至尾页!");
  } else {
    form.action = url + form.pageCount.value;
    form.submit();
  }
}

function pre(url) {
  var page = parseInt(form.page.value);
  if (page <= 1) {
    alert("已至第一页!");
  } else {
    form.action = url + (page - 1);
    form.submit();
  }
}

function next(url) {
  var page = parseInt(form.page.value);
  var pageCount = parseInt(form.pageCount.value);
  if (page >= pageCount) {
    alert("已至最后一页!");
  } else {
    form.action = url + (page + 1);
    form.submit();
  }
}

function bjump(url1,url2) {
  var pageCount = parseInt(form.pageCount.value);
  if (fIsNumber(form.busjump.value, "1234567890") != 1) {
    alert("请输入数字!");
    form.busjump.select();
    form.busjump.focus();
    return false;
  }
  if (form.busjump.value > pageCount) {
    if (pageCount == 0) {
      form.action = url1;
      form.submit();
    } else {
      form.action = url2 + pageCount;
      form.submit();
    }
  } else if (form.busjump.value <= pageCount) {
    var page = parseInt(form.busjump.value);
    if (page == 0) {
      page = 1;
      form.action = url2 + page;
      form.submit();
    } else {
      form.action = url2 + page;
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

export {home,last,pre,next,bjump};