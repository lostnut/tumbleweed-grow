#include "test.h"

void assert_str_equals(char *expected, char *actual)
{
        if (strcmp(expected, actual)) {
        } else {
                DIE("different string");
        }
}

int main(void)
{
        endf_test();
        printf("tests passed\n");
        return 0;
}
