import std.stdio : writeln;

void main()
{
	368078.steps.writeln;
}

unittest
{
  assert(steps(1) == 0);
  assert(steps(12) == 3);
  assert(steps(23) == 2);
  assert(steps(1024) == 31);
}
int steps(int input)
{
  if (input <= 1)
    return 0;
    
  import std.math : sqrt;
  
  auto circle = (cast(int)sqrt(cast(float)input - 1) - 1) / 2 + 1;
  
  auto circleEnd = (circle*2+1)*(circle*2+1);
  
  auto sideLength = circle * 2;
  
  auto midpoints = [circleEnd - sideLength*1 + sideLength/2,
                    circleEnd - sideLength*2 + sideLength/2,
                    circleEnd - sideLength*3 + sideLength/2,
                    circleEnd - sideLength*4 + sideLength/2];
    
  import std.algorithm : map;
  import std.math : abs;
  auto offsets = midpoints.map!(midpoint => abs(midpoint - input));

  import std.array : array;
  auto stepsToMidpoint = offsets.array.minElement;

  return circle + stepsToMidpoint;
}

Type minElement(Type)(Type[] elements)
{
  import std.algorithm : reduce;
  return reduce!((left, right) => left < right ? left : right)(elements);
}
