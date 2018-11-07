//
//  main.cpp
//  Assignment 2
//
//  Created by zane saul on 6/23/18.
//  Copyright © 2018 zane saul. All rights reserved.
//

#include <iostream>

int main() {
    
    int input;
    int temporary;
    int array[] = {1,2,3,4,5,6,7,8,9,10};
    
    std::cout << "Choose from the following \n 1.    Find the minimal value "
              << "stored in the array \n 2.    Find the maximal value stored"
              << "\n Please enter a valid choice : ";
    std::cin >> input;
    
    if( input != 1 && input != 2 ){
        while( input != 1 && input != 2 ){
            std::cout << "Enter the following 1 or 2 from the choices above."
                      << std:: endl;
        std::cin >> input;
        }
    }
    temporary = array[1];
    
    switch (input) {
        case 1:
            for( int i = 0; i < 10; i++ )
            {
                if( array[i] < temporary )
                {
                    temporary = array[i];
                }
            }
            std::cout << "Minimal value stored : " << temporary << std::endl;
            break;
            
        default:
            for( int i = 0; i < 10; i++ )
            {
                if( array[i] > temporary )
                {
                    temporary = array[i];
                }
                
            }
            std::cout << "Maximal value stored : " << temporary << std::endl;
            break;
    }
    return 0;
}
