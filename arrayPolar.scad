//arrayPolar
//arrayPolar( count, arc, radius, rotation, tilt)

module arrayPolar(count = 1, arc = 360, radius = 1,rotation = 0, tilt = 0 ){
  for (i = [0 : count - 1]){
    angle = arc / count * i;
    echo("angle =" , angle);
    rotate([0,0,rotation])
    translate(radius * [sin(angle),-cos(angle),0])
    rotate(tilt * [-cos(angle) ,-sin(angle), 0])
    rotate([0,0,angle-90])
    children();
  } 
}
