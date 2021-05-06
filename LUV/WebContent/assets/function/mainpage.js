$(function () {

    setInterval(function () {
        function checkTime(i) {
            if (i < 10) {
                i = "0" + i;
            }
            return i;
        }

        function countDownDays(time) {
            var nowTime = +new Date();
            var inputTime = +new Date(time);
            var times = (inputTime - nowTime) / 1000; //换算成s
            var day = parseInt(times / 60 / 60 / 24);
            var d = checkTime(day);
            return d;
        }

        var x = countDownDays("2021-5-30  18:00:00");
        document.getElementById("days").innerHTML = x;

        function countDownHours(time) {
            var nowTime = +new Date();
            var inputTime = +new Date(time);
            var times = (inputTime - nowTime) / 1000; //换算成s
            var hour = parseInt(times / 60 / 60 % 24);
            var h = checkTime(hour);
            return h;
        }

        var y = countDownHours("2021-5-30  18:00:00");
        document.getElementById("hours").innerHTML = y;

        function countDownMin(time) {
            var nowTime = +new Date();
            var inputTime = +new Date(time);
            var times = (inputTime - nowTime) / 1000; //换算成s
            var min = parseInt(times / 60 % 60);
            var m = checkTime(min);
            return m;
        }

        var z = countDownMin("2021-5-30  18:00:00");
        document.getElementById("minutes").innerHTML = z;

        function countDownSec(time) {
            var nowTime = +new Date();
            var inputTime = +new Date(time);
            var times = (inputTime - nowTime) / 1000; //换算成s
            var sec = parseInt(times % 60);
            var s = checkTime(sec);
            return s;
        }
        var r = countDownSec("2021-5-30  18:00:00");
        document.getElementById("seconds").innerHTML = r;
    }, 1000);


    // 下拉菜单
    var gym = document.getElementById('GMS');
    var mD = document.getElementById('menuDown');
    gym.addEventListener('mousemove', function () {
        mD.style.display = 'block';
    });
    mD.addEventListener('mouseleave', function () {
        mD.style.display = 'none';
    });

    // 显示密码
    var eye = document.getElementById("eye");
    var pwd = document.getElementById("form-last-name");
    var flag = 0;
    eye.onclick = function () {
        if (flag == 0) {
            pwd.type = 'text';
            flag = 1;
            eye.className = 'fa fa-eye-slash'
        } else {
            pwd.type = 'password';
            flag = 0;
            eye.className = 'fa fa-eye'
        }
    };

    // 二维码展示
    $("#wechat").click(function () {
        $(".qrcode").fadeToggle(1000);
    });

    $("#qq").click(function () {
        $(".qrcode1").fadeToggle(1000);
    });


    $.backstretch("images/background.jpg");

    $('.registration-form input[type="text"], .registration-form textarea').on('focus', function () {
        $(this).removeClass('input-error');
    });

    $('.registration-form').on('submit', function (e) {

        $(this).find('input[type="text"], textarea').each(function () {
            if ($(this).val() == "") {
                e.preventDefault();
                $(this).addClass('input-error');
            } else {
                $(this).removeClass('input-error');
            }
        });
    });

});
