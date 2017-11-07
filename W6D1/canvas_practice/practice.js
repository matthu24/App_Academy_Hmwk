document.addEventListener("DOMContentLoaded", function(){
  let canvas = document.getElementById('mycanvas');
  canvas.width = 500;
  canvas.height = 500;
  let ctx = canvas.getContext('2d');


  //draw a rectangle
  ctx.fillStyle = 'rgb(200,0,0)'; // sets the color to fill in the rectangle with
  ctx.fillRect(100, 10, 500, 500); //pos, pos,

  //draw a circle
  void ctx.beginPath();
  // void ctx.arc(100, 100, radius, startAngle, endAngle, anticlockwise);
  ctx.arc(150, 150, 100, 0, 2*Math.PI,true);
  ctx.lineWidth = 12;
  ctx.strokeStyle = 'blue';
  ctx.fillStyle = 'rgb(100,100,100)';
  ctx.stroke();
  ctx.fill();

  //draw another circle

  void ctx.beginPath();
  ctx.arc(300, 300, 100, 0, Math.PI,true);
  ctx.lineWidth = 8;
  ctx.strokeStyle = 'black';
  ctx.stroke();


  ctx.beginPath();
    ctx.moveTo(400, 500);
    ctx.lineTo(300, 300);
    ctx.lineTo(400, 400);

    ctx.fill();
});
