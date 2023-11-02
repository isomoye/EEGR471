#include <stdlib.h>
#include "V.h"
#include "verilated.h"

int main(int argc, char **argv, char** env) {
// Initialize Verilators variables
Verilated::commandArgs(argc, argv);

// Create an instance of our module under test
V *tb = new V;

// Tick the clock until we are done//  while(!Verilated::gotFinish()) {
//    tb-> clk_i = 1;
//    tb-> rst_i = 1;
//    tb-> ena_i = 1;
//    tb-> data_i = 1;
//    printf(" Output data_o: %d \n",tb-> data_o);
//    tb->eval();
//  } exit(EXIT_SUCCESS);

  tb-> clk_i = 1;
  tb-> rst_i = 1;
  tb-> ena_i = 1;
  tb-> data_i = 1;
    tb->eval();
  printf(" Output data_o: %d \n",tb-> data_o);
  exit(EXIT_SUCCESS);
}