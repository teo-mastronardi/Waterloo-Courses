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


bool pay_duty1(int duration, int goods, bool alcohol, bool diplomat) {
  return true;
}


bool pay_duty2(int duration, int goods, bool alcohol, bool diplomat) {
  return true;
}


int my_pow(int n, int k) {
  return 1;
}


int count_digits(int n) {
  return 1;
}


bool is_prime_core(int k, int n) {
  return true;
}


bool is_prime(int n) {
  return true;
}


int fibonacci_countup(int f2, int f1, int k, int n) {
  return 1;
}


int fibonacci(int n) {
  return 1;
}


int median3(int a, int b, int c) {
  return b;
}


int main(void) {
  assert(pay_duty1(1, 1, false, false));
  assert(pay_duty2(1, 1, false, false) == 
         pay_duty1(1, 1, false, false));
  assert(my_pow(1, 1) == 1);  
  assert(count_digits(0) == 1);
  assert(is_prime(2));
  assert(fibonacci(1) == 1);
  assert(median3(1, 1, 1) == 1);
}
