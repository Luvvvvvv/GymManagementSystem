window.onload = function () {

  var mainPage = document.getElementById('body_logo')
  mainPage.onclick = function () {
    location.reload();
  }

  var music = document.getElementById('music');
  var audio = document.getElementById('audio');
  audio.volume = 0.5
  music.onclick = function () {
    if (audio.paused) {
      audio.play();
      music.setAttribute('src', 'http://localhost:8080/LUV_Web_exploded//images/audio/unmuted.png')
    } else {
      audio.pause();
      music.setAttribute('src', 'http://localhost:8080/LUV_Web_exploded//images/audio/muted.jpg')
    }
  }

  var flag = 0;
  var nextMusic = document.getElementById('next_music')
  nextMusic.onclick = function () {
    if (flag == 0) {
      audio.setAttribute('src', 'http://localhost:8080/LUV_Web_exploded//audio/Victory.mp3')
      nextMusic.setAttribute('src', 'http://localhost:8080/LUV_Web_exploded//images/audio/next1.jpg')
      flag++;
    } else if (flag == 1) {
      audio.setAttribute('src', 'http://localhost:8080/LUV_Web_exploded//audio/EnergyDrink.mp3')
      nextMusic.setAttribute('src', 'http://localhost:8080/LUV_Web_exploded//images/audio/next2.jpg')
      flag++;
    } else if (flag == 2) {
      audio.setAttribute('src', 'http://localhost:8080/LUV_Web_exploded//audio/LateAutumn.mp3')
      nextMusic.setAttribute('src', 'http://localhost:8080/LUV_Web_exploded//images/audio/next3.jpg')
      flag++;
    } else if (flag == 3) {
      audio.setAttribute('src', 'http://localhost:8080/LUV_Web_exploded//audio/Frontier.mp3')
      nextMusic.setAttribute('src', 'http://localhost:8080/LUV_Web_exploded//images/audio/next4.jpg')
      flag++;
    } else if (flag == 4) {
      audio.setAttribute('src', 'http://localhost:8080/LUV_Web_exploded//audio/Visions.mp3')
      nextMusic.setAttribute('src', 'http://localhost:8080/LUV_Web_exploded//images/audio/nextMusic.jpg')
      flag = 0;
    }
  }


  var volumePlus = document.getElementById('plus')
  volumePlus.onclick = function () {
    audio.volume = 1;
  }


  var volumeSubtract = document.getElementById('subtract');
  volumeSubtract.onclick = function () {
    audio.volume = 0.3
  }
}

