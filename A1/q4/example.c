#include "cs136.h"

// Examples of printing numeric sequences

// Note the subtle differences between 
// print_descending and print_ascending_core:
// They both recursively "count down" from n...1,
// but the order of the recursion and the printf are switched:
//    printf()                      recurse()
//    recurse()         VS.         printf()

// Also note that we could have used a "count up" pattern instead


// print_descending(n) prints the numbers n...1 formatted as:
//   "n n-1 ... 3 2 1.\n"
// effects: produces output

void print_descending(int n) {
  if (n == 1) {
    printf("1.\n");
  } else {
    printf("%d ", n);
    print_descending(n - 1);
  }
}


// print_ascending_core(n) prints the numbers 1...n formatted as:
//   "1 2 3 ... n-1 n"
// effects: produces output

void print_ascending_core(int n) {
  if (n == 1) {
    printf("1");
  } else {
    print_ascending_core(n-1);
    printf(" %d", n);
  }
}


// print_ascending(n) is a wrapper for print_acending_core
///  that just adds the ".\n"
// effects: produces output

void print_ascending(int n) {
  print_ascending_core(n);
  printf(".\n");
}
 

int main(void) {
  print_descending(10);
  print_ascending(10);
}
