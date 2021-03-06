module day5part2;


unittest
{
  auto input = [0, 3, 0, 1, -3];
  import std.conv : to;
  assert(input.dup.stepsToExit == 10, "Expected 10, got " ~ input.dup.stepsToExit.to!string);
}
int stepsToExit(int[] offsets)
{
  int index = 0;
  int steps = 0;
  
  while (index >= 0 && index < offsets.length)
  {
    //import std.stdio : writeln;
    //writeln("step ", steps, ", index ", index, ", offsets ", offsets);
    
    auto newIndex = index + offsets[index];
    
    if (offsets[index] >= 3)
      offsets[index]--;
    else
      offsets[index]++;
      
    index = newIndex;
    steps++;
  }
  
  return steps;
}
