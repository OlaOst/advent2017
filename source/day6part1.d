module day6part1;

unittest
{
  auto banks = [0, 2, 7, 0];
  
  import std.conv : to;
  assert(banks.cyclesUntilRepetition == 5, "Expected 5, got " ~ banks.cyclesUntilRepetition.to!string);
}
int cyclesUntilRepetition(int[] banks)
{
  int cycles = 0;
  
  int[][] states = [banks];
  
  while (true)
  {
    auto nextState = states[$-1].nextState;
    cycles++;
    
    import std.algorithm : canFind;
    if (states.canFind(nextState))
    {
      break;
    }
    else
    {
      states ~= nextState;
    }
  }
  
  return cycles;
}

unittest
{
  assert([0, 2, 7, 0].nextState == [2, 4, 1, 2]);
  assert([2, 4, 1, 2].nextState == [3, 1, 2, 3]);
  assert([3, 1, 2, 3].nextState == [0, 2, 3, 4]);
  assert([0, 2, 3, 4].nextState == [1, 3, 4, 1]);
  assert([1, 3, 4, 1].nextState == [2, 4, 1, 2]);
}
int[] nextState(int[] banks)
{
  auto result = banks.dup;
  
  auto index = banks.maxIndex;
  auto value = banks[index];
  
  result[index] = 0;
  
  while (value > 0)
  {
    index = (index + 1) % banks.length;
    result[index]++;
    value--;
  }
  
  //import std.stdio : writeln;
  //writeln(banks, " -> ", result);
  
  return result;
}

ulong maxIndex(Type)(Type[] elements)
{
  assert(elements.length > 0);
  
  ulong maxIndex = 0;
  Type maxElement = elements[0];
  for (ulong index = 1; index < elements.length; index++)
  {
    if (elements[index] > maxElement)
    {
      maxIndex = index;
      maxElement = elements[index];
    }
  }
  
  return maxIndex;
}

Type maxElement(Type)(Type[] elements)
{
  assert(elements.length > 0);
  import std.algorithm : reduce;
  return reduce!((a, b) => a < b ? a : b)(elements[0], elements);
}
