#include <stdio.h>


int fib(int n) 
{
  int first = 0, second = 1;

  int tmp;
  while (n--)
    {
      tmp = first+second;
      first = second;
      second = tmp;
    }
  return first;
}


