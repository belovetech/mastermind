#include "mastermind.h"

int main(int ac, char**av)
{
    char *secretCode, buf[100];
    int attempt, round, nread, i, res;
    
    attempt = 3, round = i = res = 0;
    secretCode = NULL;

    if (ac < 2)
        secretCode = generateCode();
    else
        secretCode = av[2];
        
    if (checkPieces(secretCode)) {
            
        printf("Will you find the secret code?\n");
        printf("Please enter a valid guess\n---\n");
        while (attempt) {
            
            if (res != 100) {
                printf("Round %d\n", round);
                _putChar('>');
                round++;
                attempt--;
            }
                       
            if ( (nread = read(0, &buf, sizeof(buf))) > 1) {
                res = checkCode(buf, secretCode);
                if (res == 1) return 0;
            } else return 0;       
         
        }
        free(secretCode);
        printf("Game Over. Try again!\n"); 
    }
    return (0);
}