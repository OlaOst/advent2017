import std.algorithm : filter, map;
import std.array : array;
import std.conv : to;
import std.file : readText;
import std.stdio : writeln;
import std.string : split, strip;


void main()
{  
  //import day3part1;
  //368078.steps.writeln;
  //import day3part2;
  //368078.check.writeln;
  
  //import day4part1;
  //"day4.txt".readText.split("\n").countValids.writeln;
  //import day4part2;
  //"day4.txt".readText.split("\n").countNoAnagrams.writeln;
  
  auto input = "day5.txt".readText
                         .split("\n")
                         .filter!(line => line.strip.length > 0)
                         .map!(line => line.to!int)
                         .array;
  
  //import day5part1;          
  //input.stepsToExit.writeln;
  import day5part2;
  input.stepsToExit.writeln;
}

