#include "die.h"

noreturn void die(const char *file, const char *function, const int line,
                  const char *format, ...)
{
        fprintf(stderr, "%s#%s:%d: ", file, function, line);
        va_list argp;
        va_start(argp, format);
        vfprintf(stderr, format, argp);
        va_end(argp);
        fprintf(stderr, "\n");
        exit(EXIT_FAILURE);
}
