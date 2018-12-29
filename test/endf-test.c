#include <unistd.h>
#include "../src/endf.h"
#include "test.h"

static void endf_read_line_test(void)
{
        FILE *fp = fopen("test/resources/file.endf", "r");
        char line[256];
        endf_read_line(fp, line);
        assert_str_equals("endf file with 80 characters width                  "
                          "                           0",
                          line);
}

void endf_test(void)
{
        endf_read_line_test();
}

