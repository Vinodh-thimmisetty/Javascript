$(document).ready(function(){
  console.log("Hello");
});

function areaOfTriangle(){
  var base = document.getElementById('base').value;
  var height = document.getElementById('height').value;
  var output = document.getElementById('output');
  if (isNaN(base) || isNaN(height)) {
    output.textContent = "Not a Valid Numbers";
  }else {
        var areaOutput = 0.5*base*height;
      console.log("Area of Triangle is ",areaOutput);
    output.textContent = "Area = "+areaOutput;
  }

}

var areaofRectangle = function(){
  var len = parseFloat(document.getElementById('len').value);
  var brd = parseFloat(document.getElementById('brd').value);

  var output = document.getElementById('output');
if (isNaN(len) || isNan(brd)) {
  console.log('Invalid Length and Breadth');
output = "Invalid Numbers"
}else {
     var areaOutput = len*brd;
output = "Area is "+ areaOutput;
}
}
