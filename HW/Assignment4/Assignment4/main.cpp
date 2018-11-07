//
//  main.cpp
//  Assignment4
//
//  Created by zane saul on 7/3/18.
//  Copyright © 2018 zane saul. All rights reserved.
//

#include <iostream>
int rmult( int a, int b ){
    if( b == 1 )
        return a;
    else
        return a + rmult( a, b - 1 );
    }
int main() {
    int value, value2, result;
    
    do{
        std::cout << "Using values between 1 and 255 please do the following: \n";
        std::cout << "Enter a value to be multiplied: ";
        std::cin >> value;
        std::cout << "\nEnter a value to multiply with: ";
        std::cin >> value2;
        std::cout << std::endl;
    }while( value < 1 || value2 < 1 || value > 255 || value2 > 255 );
    
    result = rmult( value, value2 );
    
    std::cout << "\nResult: " << result << std::endl;
    
    return 0;
}
