/*****************************************************************************
                _   _____    __   
    ___   ___  / | |___ /   / /_  
   / __| / __| | |   |_ \  | '_ \ 
  | (__  \__ \ | |  ___) | | (_) |
   \___| |___/ |_| |____/   \___/ 
   
   The CS 136 tools library
   by Dave Tompkins [dtompkins@uwaterloo.ca]
   (with help from other CS 136 team members)
   
   Version: 0.3 -- early release for the Section 3 code examples
   
 ****************************************************************************/

#include <assert.h>
#include <limits.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

/****************************************************************************
  TRACING TOOLS
****************************************************************************/

// These tracing tools can be used to help debug your code.
// They will not interfere with Marmoset tests or any I/O testing.

// trace_off() Turns off all tracing messages
//   [by default they are turned on]
void trace_off(void);

// trace_msg(msg) Displays msg in the console

// trace_X(exp) displays a message in the console of the form:
//   exp => final value

//   X can be one of: int, bool, char, double, string, ptr

// example usage:
//   trace_msg("Hello, World!");
//   trace_int(1 + 1);

/****************************************************************************
  I/O TOOLS
 ****************************************************************************/

// the constant READ_FAIL is returned when:
// * the next input could not be successfully read, or
// * the end of input (e.g., EOF) is encountered
extern const int READ_FAIL;

// read_int() returns either the next int from input or READ_FAIL
// effects: reads from input
int read_int(void);

/****************************************************************************
  TRACING MACROS
****************************************************************************/

// The following is a collection of macros that should be ignored
// They are an unfortuante but necessary evil to implement our tracing tools
// Seriously: Go away... there's nothing to see here...

#define _FFL __FILE__, __func__, __LINE__
#define _CCP const char *
#define trace_msg(msg) _TRACE_MSG(#msg, "", _FFL);
#define trace_int(exp) _TRACE_INT(#exp, (exp), _FFL);
#define trace_bool(exp) _TRACE_STRING(#exp, (exp) ? "true" : "false", _FFL);
#define trace_char(exp) _TRACE_CHAR(#exp, (exp), _FFL);
#define trace_double(exp) _TRACE_DOUBLE(#exp, (exp), _FFL);
#define trace_string(exp) _TRACE_STRING(#exp, (exp), _FFL);
#define trace_ptr(exp) _TRACE_PTR(#exp, (void *) (exp), _FFL);
#define _DCLT(ctype, TYPE) void _TRACE_##TYPE(_CCP, ctype, _CCP, _CCP, int);
_DCLT(_CCP, MSG);
_DCLT(int, INT);
_DCLT(char, CHAR);
_DCLT(double, DOUBLE);
_DCLT(_CCP, STRING);
_DCLT(void *, PTR);

/*****************************************************************************/
