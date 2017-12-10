module day4part1;

unittest
{
  assert("aa bb cc dd ee\n".isValid);
  assert("aa bb cc dd aa\r".isValid == false);
  assert("aa bb cc dd aaa\r\n".isValid);
  
  assert(["aa bb cc dd ee",
          "aa bb cc dd aa",
          "aa bb cc dd aaa\n "].countValids == 2);
}
bool isValid(string input)
{
  import std.string : split, strip;
  auto parts = input.strip.split(" ");
  
  import std.algorithm : all, filter, group, sort;
  return sort(parts).filter!(part => part.strip.length > 0).group.all!(partGroup => partGroup[1] == 1);
}

ulong countValids(string[] lines)
{
  import std.algorithm : count, filter;
  import std.string : strip;
  return lines.filter!(line => line.strip.length > 0).count!(line => line.isValid);
}
