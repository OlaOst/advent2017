module day3part2;

unittest
{
  assert(3.check == 4);
  assert(12.check == 23);
  assert(748.check == 806);
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
  
  return check(grid, 0, sideLength / 2 + 1, sideLength / 2, target);
}

int check(ref int[][] grid, 
          //int iteration, 
          int direction, 
          //int iterationsForDirection, 
          //int iterationsBeforeDirectionChange, 
          int x, 
          int y, 
          int target)
{
  import std.conv : to;
  assert(grid[y][x] == 0, "Tried to fill out already filled grid cell at " ~ x.to!string ~ "x" ~ y.to!string);
  
  /*import std.algorithm : each;
  import std.stdio : writeln;
  writeln("grid filling ", x, "x", y, ", direction ", direction);
  grid.each!writeln;*/
  
  grid[y][x] = grid[y-1][x-1] + 
               grid[y-1][x  ] + 
               grid[y-1][x+1] + 
               grid[y  ][x-1] + 
               grid[y  ][x  ] +
               grid[y  ][x+1] +
               grid[y+1][x-1] +
               grid[y+1][x  ] +
               grid[y+1][x+1];
    
  if (grid[y][x] > target)
  {
    //import std.stdio : writeln;
    //writeln("grid at ", x, "x", y, " is ", grid[y][x], ", target is ", target);
    return grid[y][x];
  }
  else
  {
    auto newDirection = (direction+1) % 4;
  
    auto newX = x;
    auto newY = y;

    if (newDirection == 0)
      newX++;
    if (newDirection == 1)
      newY--;
    if (newDirection == 2)
      newX--;
    if (newDirection == 3)
      newY++;

    if (grid[newY][newX] == 0)
    {
      return check(grid, newDirection, newX, newY, target);
    }
    else
    {
      newX = x;
      newY = y;

      if (direction == 0)
        newX++;
      if (direction == 1)
        newY--;
      if (direction == 2)
        newX--;
      if (direction == 3)
        newY++;
        
      return check(grid, direction, newX, newY, target);
    }
  }
}
