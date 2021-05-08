$(function () {
  var nowTime = new Date();
  var nowTimes = nowTime.getTime().valueOf()
  var timeArr = [];
  $('#card tr').each(function () {
    var endTime = $(this).children('td').eq(3).text();
    var endTimes = Date.parse(endTime);
    var timeLeft = endTimes - nowTimes;
    var timeLeftday = parseInt(timeLeft / 1000 / 60 / 60 / 24);
    timeArr.push(timeLeftday);
  });
  var arrLength = timeArr.length - 1;
  var time = timeArr.slice(1, arrLength);

  for (var i = 0; i < time.length; i++) {
    if (time[i] < 7 && time[i] > 0) {
      var tr = document.getElementsByTagName('tr')[i + 1];
      console.log(tr);
      tr.id = 'tr3'
      console.log((i + 1) + '号健身卡,' + '剩余' + time[i] + '天');
      document.getElementById('willBeOutdate').innerHTML += (i + 1) + '号健身卡&nbsp;&nbsp;-----------------&nbsp;&nbsp;' + '剩余' + time[i] + '天<br>';
    } else if (time[i] <= 0) {
      var tr1 = document.getElementsByTagName('tr')[i + 1];
      console.log(tr1);
      tr1.id = 'tr4'
      console.log((i + 1) + '号健身卡,' + '剩余' + time[i] + '天');
      document.getElementById('willBeOutdate').innerHTML += (i + 1) + '号健身卡&nbsp;&nbsp;-----------------&nbsp;&nbsp;' + '&nbsp;已过期<br>';
    }

  }


  // date&time
  function dateFormat(fmt, date) {
    let ret;
    const opt = {
      "Y+": date.getFullYear().toString(),        // 年
      "m+": (date.getMonth() + 1).toString(),     // 月
      "d+": date.getDate().toString(),            // 日
      "H+": date.getHours().toString(),           // 时
      "M+": date.getMinutes().toString(),         // 分
      "S+": date.getSeconds().toString()          // 秒
    };
    for (let k in opt) {
      ret = new RegExp("(" + k + ")").exec(fmt);
      if (ret) {
        fmt = fmt.replace(ret[1], (ret[1].length == 1) ? (opt[k]) : (opt[k].padStart(ret[1].length, "0")))
      }
      ;
    }
    ;
    return fmt;
  }

  setInterval(function () {
    var date = new Date();
    var nowYear = dateFormat('YYYY年', date);
    var nowDate = dateFormat('mm月dd日', date);
    var nowTime = dateFormat('HH:MM:SS', date);
    var yearNow = document.getElementById('yearNow');
    var dateNow = document.getElementById('dateNow');
    var timeNow = document.getElementById('timeNow');
    yearNow.innerHTML = nowYear;
    dateNow.innerHTML = nowDate;
    timeNow.innerHTML = nowTime;
  }, 1000);

});