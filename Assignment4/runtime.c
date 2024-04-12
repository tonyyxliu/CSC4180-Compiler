/**
 * C Definitions of Built-In Functions for Oat v.1 Languages
 * 
 * Materials from Princeton U COS320: Compiling Techniques HW4, Spring 2020
 * Link: https://www.cs.princeton.edu/courses/archive/spring20/cos320/hw/hw4.shtml
 * 
 * Codes retrieved from a student's open-source assignment project:
 * Link: https://github.com/sw9/oat-v1-compiler/blob/master/runtime.c
*/

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include <stdint.h>

/* Oat Internal Functions --------------------------------------------------- */

int32_t* oat_malloc(int32_t size) {
  return (int32_t*)calloc(size, sizeof(char));
}

int32_t* oat_alloc_array (int32_t size) {
  assert (size >= 0);
  int32_t *arr = (int32_t*)malloc(sizeof(int32_t) * (size+1));
  arr[0] = size;
  return arr;
}	

/* Oat Builtin Functions ---------------------------------------------------- */

int32_t* array_of_string (char *str) {
  int32_t len, i, *arr;

  assert (NULL != str);

  len = strlen(str);
  assert (len >= 0);

  arr = (int32_t*)malloc(sizeof(int32_t) * (len+1));
  arr[0] = len;
  for (i=0; i<len; i++) {
    arr[i+1]=(int32_t)str[i];
  }

  return arr; 
}

char* string_of_array (int32_t *arr) {
  int32_t len, i;
  char *str;

  assert (NULL != arr);

  len = arr[0];
  assert (len >= 0);

  str = malloc(sizeof(char) * (len+1));
  
  for (i=0; i<len; i++) {
    str[i] = (char)arr[i+1];
    assert (0 != str[i]);
  }
  str[len] = 0;

  return str;
}

int32_t length_of_string (char *str) {
  assert (NULL != str);
  return strlen(str);
}

char* string_of_int(int32_t i) {
  static char buf[128];
  static int len;
  len = sprintf(buf,"%ld",(long)i);
  char* str = (char*) malloc(sizeof(char) * (len + 1));
  memcpy(str, buf, len);
  str[len] = 0;
  return (char*)str;
}

char* string_cat(char* l, char* r) {
  size_t ll = strlen(l);
  size_t lr = strlen(r);
  char* new = (char*) malloc(sizeof(char) * (ll + lr + 1));
  memcpy(new, l, ll);
  memcpy(new + ll, r, lr);
  new[ll + lr] = 0;
  return new;
}

void print_string (char* str) {
  assert (NULL != str);
  printf ("%s", str);
}

void print_int (int32_t i) {
  printf ("%ld", (long)i);
}

void print_bool (int32_t i) {
  if (i == 0) {
    printf ("false");
  } else {
    printf ("true");
  }
}

// extern int32_t program(int32_t argc, int32_t* oargv);

// /* 
//  * Convert the argv array into an Oat array of 
//  * type string[]
//  * Invoke the Oat 'program' entry point after
//  * initializing the global variables.
//  * Prints the results of the Oat program call 
//  * to the terminal.
//  */
// int main(int argc, char* argv[]) {
//   int32_t *oargv, i, result;

//   oargv = oat_alloc_array(argc); 

//   /* Copy the string pointers to the correct places. */
//   for (i=0; i<argc; i++){
//     oargv[i+1] = (int32_t)argv[i];
//   }

//   /* Call the initialization code. */
//   result = program(argc, oargv);
//   return result;
// }