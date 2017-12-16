module day7part2;
/+
import day7part1;


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

  import std.conv : to;
  assert(input.balanceDiff == -8, "Expected -8, got " ~ input.balanceDiff.to!string);
}
int balanceDiff(string input)
{
  auto matches = input.getMatches();
  
  import std.algorithm : each, filter, map;
  import std.conv : to;
  import std.typecons : tuple;
  auto children = matches.map!(match => tuple(tuple(match[1], match[2].to!int), match[3]))
                         .filter!(input => input[1].length > 0)
                         .each!(input => input[1] = input[1][4..$].split(", "));

  import std.stdio : writeln;
  writeln(children);
  
  return 0;
}

struct Node
{
  string name;
  int weight;
  Node[] children;
}
+/
