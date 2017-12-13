module day6part2;

import day6part1;


unittest
{
  auto banks = [0, 2, 7, 0];
  
  import std.conv : to;
  assert(banks.cyclesInRepetition == 4, "Expected 4, got " ~ banks.cyclesInRepetition.to!string);
}
ulong cyclesInRepetition(int[] banks)
{
  int[][] states = [banks];
  
  while (true)
  {
    auto nextState = states[$-1].nextState;
    
    import std.algorithm : countUntil;
    auto count = states.countUntil(nextState);
    if (count >= 0)
    {
      return states.length - count;
    }
    else
    {
      states ~= nextState;
    }
  }
}
