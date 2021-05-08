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
      console.log((i + 1) + '�Ž���,' + 'ʣ��' + time[i] + '��');
      document.getElementById('willBeOutdate').innerHTML += (i + 1) + '�Ž���&nbsp;&nbsp;-----------------&nbsp;&nbsp;' + 'ʣ��' + time[i] + '��<br>';
    } else if (time[i] <= 0) {
      var tr1 = document.getElementsByTagName('tr')[i + 1];
      console.log(tr1);
      tr1.id = 'tr4'
      console.log((i + 1) + '�Ž���,' + 'ʣ��' + time[i] + '��');
      document.getElementById('willBeOutdate').innerHTML += (i + 1) + '�Ž���&nbsp;&nbsp;-----------------&nbsp;&nbsp;' + '&nbsp;�ѹ���<br>';
    }

  }


  // date&time
  function dateFormat(fmt, date) {
    let ret;
    const opt = {
      "Y+": date.getFullYear().toString(),        // ��
      "m+": (date.getMonth() + 1).toString(),     // ��
      "d+": date.getDate().toString(),            // ��
      "H+": date.getHours().toString(),           // ʱ
      "M+": date.getMinutes().toString(),         // ��
      "S+": date.getSeconds().toString()          // ��
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
    var nowYear = dateFormat('YYYY��', date);
    var nowDate = dateFormat('mm��dd��', date);
    var nowTime = dateFormat('HH:MM:SS', date);
    var yearNow = document.getElementById('yearNow');
    var dateNow = document.getElementById('dateNow');
    var timeNow = document.getElementById('timeNow');
    yearNow.innerHTML = nowYear;
    dateNow.innerHTML = nowDate;
    timeNow.innerHTML = nowTime;
  }, 1000);

});