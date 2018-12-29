#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdnoreturn.h>

noreturn void die(const char *file, const char *function, const int line,
                  const char *format, ...);

#define DIE(...) die(__FILE__, __func__, __LINE__, __VA_ARGS__)
