module day3part2;

unittest
{
  assert(3.check == 4);
  assert(12.check == 23);
}
int check(int target)
{
  import std.math : sqrt;
  
  auto circle = (cast(int)sqrt(cast(float)target - 1) - 1) / 2 + 1;
  int sideLength = circle * 2 + 1 + 4;
  
  int[][] grid;
  grid.length = sideLength;
  
  for (int y = 0; y < sideLength; y++)
  {
    grid[y].length = sideLength;
    for (int x = 0; x < sideLength; x++)
    {
      grid[y][x] = 0;
    }
  }
  grid[sideLength / 2][sideLength / 2] = 1;
  
  return check(grid, 0, 0, 1, 1, sideLength / 2, sideLength / 2, target);
}

int check(ref int[][] grid, 
          int iteration, 
          int direction, 
          int iterationsForDirection, 
          int iterationsBeforeDirectionChange, 
          int x, 
          int y, 
          int target)
{
  import std.algorithm : each;
  import std.stdio : writeln;
  writeln("grid filling ", x, "x", y, ", direction ", direction, ", iterations for direction: ", iterationsForDirection, ", iterations before direction change: ", iterationsBeforeDirectionChange);
  grid.each!writeln;
  
  if (grid[y][x] > target) 
  {
    return grid[y][x];
  }
  else
  {
    //auto newX = x +/- 1;
    //auto newY = y +/- 1;
    
    // 0,1,2,3,4,5,6,7,8,9
    // 1,1,2,2,3,3,4,4,5,5
    // e,n,w,w,s,s,e,e,e,n,n,n,w,w,w,w,s,s,s,s
    // 0,1,2,2,3,3,0,0,0,1,1,1,2,2,2,2,3,3,3,3
    
    if (iterationsBeforeDirectionChange <= 0)
    {
      direction = (direction + 1) % 4;
      iterationsForDirection++;
      iterationsBeforeDirectionChange = iterationsForDirection + 1;
    }
    
    auto newX = x;
    auto newY = y;
    
    if (direction == 0)
      newX++;
    if (direction == 1)
      newY--;
    if (direction == 2)
      newX--;
    if (direction == 3)
      newY++;
    
    grid[y][x] = grid[y-1][x-1] + 
                 grid[y-1][x  ] + 
                 grid[y-1][x+1] + 
                 grid[y  ][x-1] + 
                 grid[y  ][x  ] +
                 grid[y  ][x+1] +
                 grid[y+1][x-1] +
                 grid[y+1][x  ] +
                 grid[y+1][x+1];
      
    return check(grid, iteration+1, direction, iterationsForDirection, iterationsBeforeDirectionChange - 1, newX, newY, target);
  }
}
