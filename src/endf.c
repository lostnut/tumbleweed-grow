#include "endf.h"
#include "die.h"

void endf_read_line(FILE *fp, char *line)
{
        if (fp == NULL)
                DIE("null file pointer");
        if (line == NULL)
                DIE("null line pointer");
        if (fgets(line, 82, fp) == NULL)
                DIE("fgets failed");
}
