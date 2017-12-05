import std.stdio : writeln;

void main()
{
	
}

unittest
{
  //for (int i = 1; i < 27; i++)
    //writeln("circle for ", i, ": ", steps(i));
  
  assert(steps(1) == 0);
  assert(steps(12) == 3);
}
int steps(int input)
{
  if (input <= 1)
    return 0;
    
  import std.math : sqrt;
  
  auto circle = (cast(int)sqrt(cast(float)input - 1) - 1) / 2 + 1;
  
  writeln("circle for ", input, ": ", circle);
  
  auto circleEnd = (circle*2+1)*(circle*2+1);
  
  writeln("circleEnd: ", circleEnd);
  
  auto sideLength = circle * 2;
  
  auto midpoints = [circleEnd - sideLength*1 + sideLength/2,
                    circleEnd - sideLength*2 + sideLength/2,
                    circleEnd - sideLength*3 + sideLength/2,
                    circleEnd - sideLength*4 + sideLength/2];
  
  midpoints.writeln;
  
  auto offset = sideLength * 4 - input;

  writeln("sidelength ", sideLength, ", offset ", offset);
  
  return circle;
}
