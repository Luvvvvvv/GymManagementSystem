var dayArr = [];
var dayBelowThreeMonthArr = [];
var dayoneYear = [];
var dayTwoYear = [];
var dayAboveTwoYearArr = [];
$(function () {
  $('#card tr').each(function () {
    var endTime = $(this).children('td').eq(0).text();
    var applyTime = $(this).children('td').eq(1).text();
    var endTimes = Date.parse(endTime);
    var applyTimes = Date.parse(applyTime);
    var leftTimes = endTimes - applyTimes;
    var leftDays = parseInt(leftTimes / 1000 / 60 / 60 / 24);
    dayArr.push(leftDays);
  });

  for (var i = 0; i < dayArr.length; i++) {
    if (dayArr[i] >= 0 && dayArr[i] <= 90) {
      dayBelowThreeMonthArr.push(dayArr[i]);
    }
  }
  for (var i = 0; i < dayArr.length; i++) {
    if (dayArr[i] > 90 && dayArr[i] <= 365) {
      dayoneYear.push(dayArr[i]);
    }
  }
  for (var i = 0; i < dayArr.length; i++) {
    if (dayArr[i] > 365 && dayArr[i] <= 730) {
      dayTwoYear.push(dayArr[i]);
    }
  }
  for (var i = 0; i < dayArr.length; i++) {
    if (dayArr[i] >= 730) {
      dayAboveTwoYearArr.push(dayArr[i]);
    }
  }

  // 饼状图
  var chartDom = document.getElementById('pieChart');
  var myChart = echarts.init(chartDom);
  var option;

  option = {
    tooltip: {
      trigger: 'item'
    },
    legend: {
      top: '5%',
      left: 'center'
    },
    series: [{
      name: '健身卡办卡时长',
      type: 'pie',
      radius: ['40%', '70%'],
      avoidLabelOverlap: false,
      itemStyle: {
        borderRadius: 10,
        borderColor: '#fff',
        borderWidth: 2
      },
      label: {
        show: false,
        position: 'center'
      },
      emphasis: {
        label: {
          show: true,
          fontSize: '40',
          fontWeight: 'bold'
        }
      },
      labelLine: {
        show: false
      },
      data: [
        {
          value: dayBelowThreeMonthArr.length,
          name: '3个月以下'
        },
        {
          value: dayoneYear.length,
          name: '3个月~1年'
        },
        {
          value: dayTwoYear.length,
          name: '1年~2年'
        },
        {
          value: dayAboveTwoYearArr.length,
          name: '2年以上'
        },
      ]
    }]
  };
  myChart.setOption(option);
});