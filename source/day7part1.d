module day7part1;


unittest
{
  string input = `pbga (66)
xhth (57)
ebii (61)
havc (66)
ktlj (57)
fwft (72) -> ktlj, cntj, xhth
qoyq (66)
padx (45) -> pbga, havc, qoyq
tknk (41) -> ugml, padx, fwft
jptl (61)
ugml (68) -> gyxo, ebii, jptl
gyxo (61)
cntj (57)`;

  assert(input.bottomProgram == "tknk", "Expected 'tknk', got " ~ "'" ~ input.bottomProgram ~ "'");
}
string bottomProgram(string input)
{
  import std.algorithm : filter, map;
  import std.regex : matchFirst, regex;
  import std.string : split;
  
  
  auto matcher = regex(r"([a-z]*) \(([0-9]*)\)(.*)?");
  
  auto matches = input.split("\n")
                      .map!(line => line.matchFirst(matcher))
                      .filter!(match => !match.empty);
       
  auto names = matches.map!(match => match[1]);
  
  auto children = matches.map!(match => match[3])
                         .filter!(input => input.length > 0)
                         .map!(input => input[4..$].split(", "));
               
  import std.algorithm : setDifference, sort;
  import std.array : array;
  import std.range : join;
  
  auto diff = sort(names.array).setDifference(sort(children.join.array));
  
  return diff.front;
}
