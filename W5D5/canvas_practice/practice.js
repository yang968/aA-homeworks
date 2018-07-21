document.addEventListener("DOMContentLoaded", function(){
  let canvas = document.getElementById('mycanvas');
  let ctx = canvas.getContext('2d');

  // Draw a Rectangle
  ctx.fillStyle = "red";
  ctx.fillRect(0, 0, 300, 150);

  // Draw a Circle
  ctx.beginPath();
  ctx.arc(400, 80, 75, 0, Math.PI * 2);
  ctx.strokeStyle = 'black';
  ctx.lineWidth = 3;
  ctx.stroke();
  ctx.fillStyle = 'yellow';
  ctx.fill();

  ctx.beginPath();
  ctx.arc(75, 75, 50, 0, Math.PI * 2);
  ctx.moveTo(110, 75);
  ctx.arc(75, 75, 35, 0, Math.PI, false);
  ctx.moveTo(65, 65);
  ctx.arc(60, 65, 5, 0, 360);
  ctx.moveTo(95, 65);
  ctx.arc(90, 65, 5, 0, 360);
  ctx.fillStyle = 'green';
  ctx.fill();
  ctx.stroke();

});
