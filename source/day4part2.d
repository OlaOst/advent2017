module day4part2;

unittest
{
  assert("abcde fghij".noAnagrams);
  assert("abcde xyz ecdab".noAnagrams == false);
  assert("a ab abc abd abf abj".noAnagrams);
  assert("iiii oiii ooii oooi oooo".noAnagrams);
  assert("oiii ioii iioi iiio".noAnagrams == false);
}
bool noAnagrams(string input)
{
  import std.algorithm : map, sort;
  import std.array : array;
  import std.string : split, strip;
  
  auto parts = input.strip.split(" ").map!(part => part.dup.sort).array;
  
  import std.algorithm : all, filter, group, sort;
  return sort(parts).filter!(part => part.strip.length > 0).group.all!(partGroup => partGroup[1] == 1);
}

ulong countNoAnagrams(string[] lines)
{
  import std.algorithm : count, filter;
  import std.string : strip;
  return lines.filter!(line => line.strip.length > 0).count!(line => line.noAnagrams);
}
