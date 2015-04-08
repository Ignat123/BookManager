var speed = [10, 0];
var snake = [[0, 0, 0, 0]]; //Current X, current Y, last X, last Y
var fruitPosition = [100, 0];

function draw(){
  move();
  resetPosition();
  for (var i = 0; i < snake.length; i++) {
    $("#snake" + i).css({'margin-left': snake[i][0] + 'px'});
    $("#snake" + i).css({'margin-top': snake[i][1] + 'px'});
  }
  checkIsAlife();
}

function checkIsAlife(){
  var head = snake[0];
  for (var i = 1; i < snake.length; i++){
    if (head[0] == snake[i][0] && head[1] == snake[i][1])
      alert('Хватит жрать свой хвост!');
  }
}

function updatePosition(){
  snake[0][2] = snake[0][0];
  snake[0][3] = snake[0][1];
  snake[0][0] += speed[0];
  snake[0][1] += speed[1];
}

function updateElement(i){
  snake[i][2] = snake[i][0];
  snake[i][3] = snake[i][1];
  snake[i][0] = snake[i - 1][2];
  snake[i][1] = snake[i - 1][3];
}

function move(){
  if (snake[0][0] == fruitPosition[0] && snake[0][1] == fruitPosition[1]){
    fruit_collision();
  }
  updatePosition();
  for (var i = 1; i < snake.length; i++){
    updateElement(i);
  }
}

function fruit_collision(){
  fruitPosition[0] = getRandomInt(0, 99) * 10;
  fruitPosition[1] = getRandomInt(0, 99) * 10;
  $("#fruit").css({'margin-left': fruitPosition[0] + 'px'});
  $("#fruit").css({'margin-top': fruitPosition[1] + 'px'});
  $("#field").append("<div id='snake" + snake.length + "'style='position: absolute; width: 10px; height: 10px; background-color: black;'></div>");
  var tail = snake[snake.length - 1];
  snake.push([tail[0], tail[1], tail[0],tail[1]]);
}

function getRandomInt(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

function resetPosition(){
  if (snake[0][0] >= 1000)
      snake[0][0] = 0;
  if (snake[0][0] < 0)
      snake[0][0] = 990;
  if (snake[0][1] >= 1000)
      snake[0][1] = 0;
  if (snake[0][1] < 0)
      snake[0][1] = 990;
}

function checkKey(e) {
  e = e || window.event;
  if (e.keyCode == '38' && speed[1] != 10) {
      speed[0] = 0;
      speed[1] = -10;
  }
  else if (e.keyCode == '40' && speed[1] != -10) {
      speed[0] = 0;
      speed[1] = 10;
  }
  else if (e.keyCode == '37' && speed[0] != 10) {
      speed[0] = -10;
      speed[1] = 0;
  }
  else if (e.keyCode == '39' && speed[0] != -10) {
      speed[0] = 10;
      speed[1] = 0;
  }
}

function play(){
  document.onkeydown = checkKey;
  $("#fruit").css({'margin-left': fruitPosition[0] + 'px'});
  $("#fruit").css({'margin-top': fruitPosition[1] + 'px'});
  setInterval(draw, 100);
}