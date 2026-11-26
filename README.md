# SoftUni Programming Fundamentals with C++

Solutions for the SoftUni Programming Fundamentals with C++ course: basic syntax, functions, arrays, strings and streams,
vectors, lists and iterators. One `ExNNN` folder per problem.

## Lectures

| #   | Lecture | Exercises |
| --- | ------- | --------- |
| 001 | Basic Syntax | [Student Information](001-Basic-Syntax/Ex001) · [Passed or Failed](001-Basic-Syntax/Ex002) · [Month Printer](001-Basic-Syntax/Ex003) · [Foreign Languages](001-Basic-Syntax/Ex004) · [Divisible by 3](001-Basic-Syntax/Ex005) · [Sum of Odd Numbers](001-Basic-Syntax/Ex006) · [Multiplication Table](001-Basic-Syntax/Ex007) · [Even Number](001-Basic-Syntax/Ex008) |
| 002 | Exercise: Basic Syntax | [Sort Two Numbers](002-Exercise-Basic-Syntax/Ex001) · [Sign of Product](002-Exercise-Basic-Syntax/Ex002) · [Quadratic Equation](002-Exercise-Basic-Syntax/Ex003) · [Numbers 1 to N](002-Exercise-Basic-Syntax/Ex004) · [Min and Max](002-Exercise-Basic-Syntax/Ex005) · [Greatest Common Divisor](002-Exercise-Basic-Syntax/Ex006) · [Sum of Interval](002-Exercise-Basic-Syntax/Ex007) · [Strong Number](002-Exercise-Basic-Syntax/Ex008) |
| 003 | Functions | [Sign of Integer](003-Functions/Ex001) · [Grades](003-Functions/Ex002) · [Smallest of Three](003-Functions/Ex003) · [Printing Triangle](003-Functions/Ex004) · [Rectangle Area](003-Functions/Ex005) · [Math Power](003-Functions/Ex006) |
| 004 | Exercise: Functions | [Closest Point to Center](004-Exercise-Functions/Ex001) · [Calculator](004-Exercise-Functions/Ex002) · [Factorial](004-Exercise-Functions/Ex003) · [Number to Words](004-Exercise-Functions/Ex004) · [Multiply Evens by Odds](004-Exercise-Functions/Ex005) · [Vowels Count](004-Exercise-Functions/Ex006) · [Password Validator](004-Exercise-Functions/Ex007) · [Orders](004-Exercise-Functions/Ex008) · [Greater of Two Values](004-Exercise-Functions/Ex009) |
| 005 | Arrays | [Day of Week](005-Arrays/Ex001) · [Reverse Array](005-Arrays/Ex002) · [Sum Even Numbers](005-Arrays/Ex003) · [Reverse Array of Strings](005-Arrays/Ex004) · [Even and Odd Subtraction](005-Arrays/Ex005) · [Equal Arrays](005-Arrays/Ex006) |
| 006 | Exercise: Arrays | [Zig-Zag Arrays](006-Exercise-Arrays/Ex001) · [Longest Sequence](006-Exercise-Arrays/Ex002) · [Numbers Above Average](006-Exercise-Arrays/Ex003) · [Most Frequent Number](006-Exercise-Arrays/Ex004) · [Pairwise Products](006-Exercise-Arrays/Ex005) · [Min Differences](006-Exercise-Arrays/Ex006) · [Array Rotation](006-Exercise-Arrays/Ex007) · [Top Integers](006-Exercise-Arrays/Ex008) · [Magic Sum](006-Exercise-Arrays/Ex009) |
| 007 | Strings and Streams | [Reverse Strings](007-Strings-and-Streams/Ex001) · [Repeat Strings](007-Strings-and-Streams/Ex002) · [Substring Removal](007-Strings-and-Streams/Ex003) · [Digits, Letters and Other](007-Strings-and-Streams/Ex004) |
| 008 | Exercise: Strings and Streams | [Valid Usernames](008-Exercise-Strings-and-Streams/Ex001) · [Caesar Cipher](008-Exercise-Strings-and-Streams/Ex002) · [Replace Repeating Chars](008-Exercise-Strings-and-Streams/Ex003) · [Character Multiplier](008-Exercise-Strings-and-Streams/Ex004) · [Correct Brackets](008-Exercise-Strings-and-Streams/Ex005) · [Title Case](008-Exercise-Strings-and-Streams/Ex006) · [Replace All](008-Exercise-Strings-and-Streams/Ex007) · [Sum Numbers in Text](008-Exercise-Strings-and-Streams/Ex008) |
| 009 | Vectors Lists and Iterators | [Remove Negatives and Reverse](009-Vectors-Lists-and-Iterators/Ex001) · [Sorted Product List](009-Vectors-Lists-and-Iterators/Ex002) · [Gauss Trick](009-Vectors-Lists-and-Iterators/Ex003) · [Merging Lists](009-Vectors-Lists-and-Iterators/Ex004) · [List Manipulation](009-Vectors-Lists-and-Iterators/Ex005) |
| 010 | Vectors Lists and Iterators | [Merge Train Tracks](010-Vectors-Lists-and-Iterators/Ex001) · [Balanced Brackets](010-Vectors-Lists-and-Iterators/Ex002) · [Equipment Lifetime](010-Vectors-Lists-and-Iterators/Ex003) · [Best Bus for the Train](010-Vectors-Lists-and-Iterators/Ex004) |

## Run

Needs CMake and a C++17 compiler. Every lecture folder is a CMake project; each exercise has `tests/*.in` / `*.out`
pairs that CTest feeds through the program.

```bash
cmake -S 006-Exercise-Arrays -B build/006-Exercise-Arrays
cmake --build build/006-Exercise-Arrays
ctest --test-dir build/006-Exercise-Arrays --output-on-failure
```

## License

[MIT](LICENSE)
