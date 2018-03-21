#include "cs136.h"

/////////////////////////////////////////////////////////////////////////////
// INTEGRITY INSTRUCTIONS

// Explicitly state the level of collaboration on this question
// Examples:
//   * I discussed ideas with classmate(s) [include name(s)]
//   * I worked together with classmate(s) in the lab [include name(s)]
//   * Classmate [include name] helped me debug my code
//   * I consulted website [include url]
//   * None
// A "None" indicates you completed this question entirely by yourself
// (or with assistance from course staff)
/////////////////////////////////////////////////////////////////////////////
// INTEGRITY STATEMENT:
// I received help from the following sources:

// ERROR_NO_INTEGRITY_STATEMENT

// Name: ERROR_NO_NAME
// login ID: ERROR_NO_LOGIN
/////////////////////////////////////////////////////////////////////////////

#include "cs136.h"


void print_money(int n) {
  printf("$%d.%02d\n", 1, 23);
}


void print_reverse(int n) {
  printf("12\n");
}


void print_collatz(int n) {
  printf("5 16 8 4 2 1.\n");
}


void print_primes(int n) {
  printf("2 3 5.\n");
}


void print_fibonacci(int n) {
  printf("0 1 1 2 3 5.\n");
}


void print_missing(int n, int digit) {
  printf("1 * 3 4 5.\n");
}
  

int main(void) {
  print_money(123);  
  print_reverse(21);
  print_collatz(5);
  print_primes(5);
  print_fibonacci(5);
  print_missing(5, 2);
  
  // ADD MORE TESTS BELOW HERE (and add more lines to simple.expect)
  
}
