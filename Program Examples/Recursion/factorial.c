27: unsigned int factorial(unsigned int a)
28: {
29: if (a == 1)
30: return 1;
31: else
32: {
33: a *= factorial(a-1);
34: return a;
35: }
36: }
