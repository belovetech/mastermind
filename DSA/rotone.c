/*
**
** QWASAR.IO -- rotone
**
** @param {char*} param_1
**
** @return {char*}
**
*/
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

/**
 * rotone - Switch letter by the next one in alphabetical order
 *
 * @str: Words to transform
 *
 * Return: Transformed words
 */

char* rotone(char* str)
{
  	int len = strlen(str);
  	
  	char *res = malloc(sizeof(char) * len);
  
	for (int i = 0; str[i] != '\0'; i++) 
    {
  		if (str[i] >= 65 && str[i] <= 90) {
          	if (str[i] == 90)
              	res[i] = 65;
          	else
              	res[i] = str[i] + 1;
        }
      	else if (str[i] >= 97 && str[i] <=122) {
          	if (str[i] == 122)
              	res[i] = 97;
         	else
              	res[i] = str[i] + 1;
        }
      	else
        {
          	res[i] = str[i];
        }
    }
  return res;
}


#include <stdio.h>

int main(void)
{

    char *str = "AkjhZ zLKIJz , 23y ";
    char *res = rotone(str);

    printf("%s\n", str);
    printf("%s\n", res);

    return (0);
}
