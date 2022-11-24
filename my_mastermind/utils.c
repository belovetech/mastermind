#include "mastermind.h"

char *generateCode(void) {
    char *code;
    char pieces[9] = "012345678";
    
    time_t t;
    srand((unsigned) time(&t));
    if ((code = malloc(sizeof(char) * SIZE + 1)) != NULL) {
        for (int i = 0; i < SIZE; i++) {
            code[i] = pieces[rand() % (7) + 1];
        }
    }
   return code;
}

int checkPieces(char *userCodes) {
    int flag, i;
    
    flag = 0;
    if (userCodes) {
        for (i = 0; i < SIZE; i++) {
            if (userCodes[i] >= 48 && userCodes[i] <= 56) {
                flag = 1;
            } else {
                flag = 0;
                break;
            }
        }
    }
    return flag;
}


int _putChar(char c) {
	return (write(1, &c, 1));
}

int _putInt(int n) {
	if (n < 0)
	{
		_putChar(0x2D);
		n = -n;
	}

	if (n > 9)
	{
		_putInt(n/10);
	}

	_putChar((n%10) + '0');
	_putChar('\n');

	return 0;
}

int intToStr( char *s, unsigned int n )
{
	unsigned int i = 1000000000;

	if( ((signed)n) < 0 ) {
			*s++ = '-';
			n = -n;
	}

	while( i > n ) i /= 10;

	do {
			*s++ = '0' + (n-n%i)/i%10;
	} while( i /= 10 );

	*s = 0;

	return n;
}