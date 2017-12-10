import std.file : readText;
import std.stdio : writeln;
import std.string : split;


void main()
{  
  //import day3part1;
	//368078.steps.writeln;
  //import day3part2;
  //368078.check.writeln;
  
  import day4part1;
  "day4.txt".readText.split("\n").countValids.writeln;
  import day4part2;
  "day4.txt".readText.split("\n").countNoAnagrams.writeln;
}

