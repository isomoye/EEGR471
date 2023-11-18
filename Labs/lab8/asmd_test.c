#include "../defs.h"
// #include "stdlib.h"
// #include "stdio.h"
#include <string.h>
#include <stdlib.h>

// LOGIC ANALYZER OUTPUTS
#define IN_CLK 0
#define IN_RESET 1
#define IN_START 2
#define IN_WORD0 3
#define IN_WORD1 7

// LOGIC ANALYZER INPUTS
#define OUT_READY 16
#define OUT_PRODUCT 17

#define WORDS_MASK 0x7F8

// --------------------------------------------------------
// Firmware routines
// --------------------------------------------------------
void delay(const int d)
{

    /* Configure timer for a single-shot countdown */
    reg_timer0_config = 0;
    reg_timer0_data = d;
    reg_timer0_config = 1;

    // Loop, waiting for value to reach zero
    reg_timer0_update = 1; // latch current value
    while (reg_timer0_value > 0)
    {
        reg_timer0_update = 1;
    }
}

void set_registers()
{

    reg_mprj_io_37 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_36 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_35 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_34 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_33 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_32 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_31 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_30 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_29 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_28 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_27 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_26 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_25 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_24 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_23 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_22 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_21 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_20 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_19 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_18 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_17 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_16 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_15 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_14 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_13 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_12 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_11 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_10 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_9 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_8 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_7 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_6 = GPIO_MODE_MGMT_STD_OUTPUT;
    //    reg_mprj_io_6  = 0x1fff;
    reg_mprj_io_5 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;

    /* Lowest 5 GPIOs need to be set this way in order to	*/
    /* access the housekeeping SPI at run-time.  Do not change	*/
    /* them unless absolutely necessary.			*/

    reg_mprj_io_4 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_3 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_2 = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
    reg_mprj_io_1 = GPIO_MODE_MGMT_STD_OUTPUT;
}


int multiply(int a, int b)
{
    int c = 0;
    bool negative = false;
    if (a < 0)
    {
        negative = !negative;
        a = -a;
    }
    if (b < 0)
    {
        negative = !negative;
        b = -b;
    }

    while (b)
    {
        if (b & 0x01)
        {
            c += a;
        }
        a <<= 1;
        b >>= 1;
    }
    if (negative)
    {
        c = -c;
    }
    return c;
}

// Function to set the kth bit of n
int setBit(uint32_t n, int k)
{
    return (n | (1 << (k)));
}

// Function to clear the kth bit of n
int clearBit(uint32_t n, int k)
{
    return (n & (~(1 << (k))));
}

// Function to toggle the kth bit of n
int toggleBit(uint32_t n, int k)
{
    return (n ^ (1 << (k)));
}

void putcchar(char c)
{
    if (c == '\n')
        putcchar('\r');
    while (reg_uart_txfull == 1)
        ;
    reg_uart_data = c;
}

void clock(int n)
{
    for (int i = 0; i < n; i++)
    {
        reg_mprj_xfer = 0x16;
        reg_mprj_xfer = 0x06;
    }
}

void print(const char *p)
{
    while (*p)
        putcchar(*(p++));
}


void main()
{
    int i, j, k;

    uint32_t data_in;
    uint32_t data_out;
    uint32_t temp_data;

    uint8_t word0_value;
    uint8_t word1_value;
    uint32_t model_product;
    char text[] = "Data: X ";
    char str[100];

    int value;
    int count;

    reg_gpio_mode1 = 1;
    reg_gpio_mode0 = 0;
    reg_gpio_ien = 1;
    reg_gpio_oe = 1;

    set_registers();

    // Initiate the serial transfer
    reg_mprj_xfer = 1;
    while (reg_mprj_xfer == 1)
        ;

    // Configure All LA probes as inputs to the cpu
    reg_la0_oenb = reg_la0_iena = 0x00000000; // [31:0]
    reg_la1_oenb = reg_la1_iena = 0x00000000; // [63:32]
    reg_la2_oenb = reg_la2_iena = 0x00000000; // [95:64]
    reg_la3_oenb = reg_la3_iena = 0x00000000; // [127:96]

    // enable uart
    reg_uart_enable = 1;
    // set registers [63:32] for inputs & outputs
    reg_la1_oenb = reg_la1_iena = 0x7FF; //bits 0 to 11 are outputs from cpu.. all others inputs

    print("welcome\n");

    // loop so we can see the uart data
    while (1)
    {
        count = 0;
        // start with all zeros. clk and reset included
        reg_la1_data = 0x00000000;
        // toggle the clock ten times
        for (count = 0; count > 10; count++)
        {
            reg_la1_data |= 1 << IN_CLK;
            reg_la1_data &= (~(1 << IN_CLK));
        }
        // set reset bit
        reg_la1_data |= 1 << IN_RESET;
        // toggle the clock for about 10 clock cycles with reset asserted
        for (count = 0; count > 10; count++)
        {
            reg_la1_data |= 1 << IN_CLK;
            reg_la1_data &= (~(1 << IN_CLK));
        }
        // check that product is equal to all zeros
        if (((reg_la1_data_in >> OUT_PRODUCT) & 0x00FF) != 0x0000)
        {
            print("product not reset\n");
            text[6] = (((reg_la1_data_in >> OUT_PRODUCT) & 0x000F)) + '0';
            print(text);
            print("\n");
        }
        // clear reset bit
        reg_la1_data &= (~(1 << IN_RESET));
        reg_la1_data |= 1 << IN_CLK;
        reg_la1_data &= (~(1 << IN_CLK));
        print("after reset\n");

        // set words
        //TODO: set words to something other than zero.. but keep in mind that
        //we can only print one char right now... so product of the two must be 
        //less than 16
        word0_value = 0x0;
        word1_value = 0x0;

        //set the words into the multiplier
        reg_la1_data |= ((word1_value & 0x0F) << IN_WORD1);
        reg_la1_data |= ((word0_value & 0x0F) << IN_WORD0);
        reg_la1_data |= 1 << IN_CLK;
        reg_la1_data &= (~(1 << IN_CLK));

        // calculate model product
        model_product = multiply(word0_value,word1_value); 

        // set start
        //TODO: set the start bit using the IN_START define
        //hint: see how reset was done on line 217 for an example

        reg_la1_data |= 1 << IN_CLK;
        reg_la1_data &= (~(1 << IN_CLK));
        // make sure ready is asserted
        while ((reg_la1_data_in >> OUT_READY) & 0x01)
        {
            print("ASMD not ready!\n");
            text[6] = (((reg_la1_data_in >> OUT_READY) & 0x0001)) + '0';
            print(text);
            print("\n");
            reg_la1_data |= 1 << IN_CLK;
            reg_la1_data &= (~(1 << IN_CLK));
        }
        
        //deassert start
        //TODO: set start to zero. see how reset was done on line 233 for an example
        
        reg_la1_data |= 1 << IN_CLK;
        reg_la1_data &= (~(1 << IN_CLK));

        data_out = 0;
        // wait for ready
        while (!((reg_la1_data_in >> OUT_READY) & 0x01))
        {
            print("calculating\n");
            //  run leds
            reg_gpio_out = 1; // OFF
            reg_mprj_datal = 0x00000000;
            reg_mprj_datah = 0x00000000;
            delay(8000000);
            reg_gpio_out = 0; // ON
            reg_mprj_datah = 0x0000003f;
            reg_mprj_datal = 0xffffffff;
            delay(8000000);
            reg_la1_data |= 1 << IN_CLK;
            reg_la1_data &= (~(1 << IN_CLK));
        }

        //grab the product out of the multplier
        data_out = (reg_la1_data_in >> OUT_PRODUCT) & 0xFF;


        //TODO: check that model product is not equal to data_out
        if ("TODO: CHECK ME!!")
        {
            print("model product not equal to product\n");
            print("content of model_product is: \n");
            text[6] = data_out + '0';
            print(text);
            print("\n");
            text[6] = model_product + '0';
            print(text);
            print("\n");
        }
        else{
            print("multiplier correct!!!\n");
            print("content of model_product is: \n");
            text[6] = data_out + '0';
            print(text);
            print("\n");
            text[6] = model_product + '0';
            print(text);
            print("\n");
        }

        print("ASMD test Complete\n");
    }
}