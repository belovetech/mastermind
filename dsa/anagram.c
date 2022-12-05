/*
**
** QWASAR.IO -- is_anagram
**
** @param {char*} param_1
** @param {char*} param_2
**
** @return {int}
**
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *sort(char *str)
{
    int i, j;
    char temp;
    int len = strlen(str);

    for (i = 0; i < len - 1; i++) {
       for (j = i + 1; j < len; j++) {
           if (str[i] > str[j]) {
               temp = str[i];
               str[i] = str[j];
               str[j] = temp;
           }
       }
    }
    return str;
}

int is_anagram(char* param_1, char* param_2)
{
    char *sorted1 = sort(param_1);
    char *sorted2 = sort(param_1);

    if (strlen(param_1) != strlen(param_2)) return 0;
    
    for (int i = 0; i < strlen(param_1); i++) {
        if (sorted1[i] != sorted2[i]) {
            return 0;
        }
    }    
    return 1;
}

int main(int ac, char **av)
{
    int res;
    if (ac > 1) {
       res =  is_anagram(av[1], av[2]);
       printf("%d\n", res);
    }

    return (0);
}