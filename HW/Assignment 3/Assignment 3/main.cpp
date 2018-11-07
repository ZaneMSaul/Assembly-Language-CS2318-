/*
 Write a pseudo C program (based on chapter 2 in the book) and a C or C++
 program then use these programs to develop a MIPS main program and a MIPS
 assembly function.
 The interaction between the main program and the function is solely through
 the stack.
 The function stores $ra immediately after being called and restores $ra before
 returning to main.
 The main program reserves a static C like array (index starts from 0) of 10
 elements and initializes it. The maximum should be in locations 4 and 5
 (same number) and the minimum in location 7. Locations 0, 1, 8, and 9 should
 contain the same value. Furthermore, the main program stores the base address
 of the array in $t0 and the array size in $s0 and has to use these registers
 after calling the function (you do not have to code the register usage).
 The function receives the starting address of an array of 32-bit integers and
 the number of elements in the array from the main program, finds the maximum
 integer, the minimum integer within the array, and the average value of the
 elements in the array and returns the maximum, minimum, average, and the
 locations of the minimum and maximum values in the array to the main program.
 Further assume that the function uses $t0 as a pointer to array elements.
 Additionally, the function stores the index used to “navigate” through the
 array in $s0. Hence, both $t0 and $s0 are changed by the function.
 After calling the function, and receiving the results, the main program prints
 these results to the screen and stops.
 Your deliverables should be the C / Pseudo C programs as well as the assembly
 code of the MIPS program/function and a screen shot of your run. Use Google to
 find out how to print a screenshot from your system.
 */

#include <iostream>
#include <stack>

void function( int, int * );

std::stack <int> stck;

int main() {
    int arr[] = {1,1,2,3,9,9,6,0,1,1,7};
    int *ptr = arr;
    const int size = 10;
    
    function( size, ptr );
    
    std::cout << "Average: " << stck.top () << std::endl;
    stck.pop ();
    std::cout << "Min Index: " << stck.top () << std::endl;
    stck.pop ();
    std::cout << "Min: " << stck.top () << std::endl;
    stck.pop ();
    std::cout << "Max Index: : " << stck.top () << std::endl;
    stck.pop ();
    std::cout << "Max: " << stck.top () << std::endl;
    stck.pop ();
    std::cout << "Max Index: : " << stck.top () << std::endl;
    stck.pop ();
    std::cout << "Max: " << stck.top () << std::endl;
    stck.pop ();
}
void function( int a, int ptr[] ){
    int temporary = ptr[0],
        temporary2 = ptr[0],
        min,
        max,
        avrg,
        tot = 0;
    
    for( int i = 0; i < a; ++i ){
        tot += ptr[i];
        if( ptr[i] > temporary ){
            temporary = ptr[i];
        } else if (ptr[i] < temporary2){
            temporary2 = ptr[i];
        }}
    
    max = temporary;
    min = temporary2;
    
    for( int i = 0; i < a; i++ ){
        if( ptr[i] == max ){
            stck.push (ptr[i]);
            stck.push (i);
        }
    }
    
    for( int i = 0; i < a; i++ ){
            if( ptr[i] == min ){
                stck.push (ptr[i]);
                stck.push (i);
        }}

    avrg = tot / a;
    stck.push (avrg);
}
