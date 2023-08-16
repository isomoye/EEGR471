# -*- coding: utf-8 -*-
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer
from cocotb.regression import TestFactory

@cocotb.test()
async def run_test(dut):
  PERIOD = 10
  cocotb.fork(Clock(dut.clk_i, PERIOD, 'ns').start(start_high=False))

  dut.rst_i = 0
  dut.ena_i = 0
  dut.data_i = 0
  dut.data_o = 0

  await Timer(20*PERIOD, units='ns')

  dut.rst_i = 1
  dut.ena_i = 1
  dut.data_i = 1
  dut.data_o = 1

  await Timer(20*PERIOD, units='ns')

# Register the test.
factory = TestFactory(run_test)
factory.generate_tests()
    