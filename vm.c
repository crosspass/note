#include <stdio.h>

enum METHOD {
  PUTS = 0
};

typedef struct {
  enum METHOD name;
  char ** args;
} RB_FUNCTION;

typedef struct {
  char *name;
  RB_FUNCTION * rb_functions[10];
} RB_CLASS;

void rb_puts(char * message) {
  printf("%s\n", message);
}

typedef int LEN;

int main() {
  LEN len = 10;
  RB_CLASS A;
  A.name= "A";
  char * args[] = { "abc" };
  RB_FUNCTION f = { 0, args };
  A.rb_functions[0] = &f;
  printf("%d\n", A.rb_functions[0]->name);
  switch(A.rb_functions[0]->name) {
    case PUTS:
      rb_puts(args[0]);
  }
}
