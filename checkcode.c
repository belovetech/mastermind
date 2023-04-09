#include "mastermind.h"

int checkCode(char *userCode, char *secretCode) {
    int i, placed, misplaced, flag, res;
    
    placed = misplaced = flag = 0;
    
    for (i = 0; i < SIZE; i++) {
       if (userCode[i] == secretCode[i]) {
           placed++;
       } else {
            
            if ((res = atoi(userCode)) == 0 && !checkPieces(userCode)) {
                printf("Wrong input!\n");
                _putChar('>');
                flag = 100;
                break;
            } else {
                for (int j = 0; j != SIZE; j++) {
                    if (userCode[i] == secretCode[j]) {
                        misplaced++;
                    }
                }
            } 
       }
    }
    
    if (placed == SIZE) {
        printf("Congratz! You did it!\n");
        flag = 1;
    } else {
       if (flag != 100) {
        printf("Well placed pieces: %d\n", placed);
        printf("Misplaced pieces: %d\n---\n", misplaced);
       }
        
    }
    return flag;
}