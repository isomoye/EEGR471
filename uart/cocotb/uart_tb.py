import logging
import random
import cocotb
from cocotbext.uart import UartSource, UartSink
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer


# Reset coroutine
async def reset_dut(reset_n, duration_ns):
    reset_n.value = 0
    await Timer(duration_ns, units="ns")
    reset_n.value = 1


@cocotb.test()
async def test_uartrx(dut):
    """ First simple test """

    clkedge = RisingEdge(dut.clk_50m)

    # Connect reset
    #reset_n = dut.reset_n_i
    div = 50000000/115200

    # Instantiate UART driver
    uart_driver = UartSource(dut.rx,115200,8,1)
    # Instantiate VAI receiver
    #vai_receiver = VaiReceiver(dut.clk_50m, dut.dout,None, None)
    uart_sink = UartSink(dut.rx,115200,8,1)

    # Drive input defaults (setimmediatevalue to avoid x asserts)
    dut.rx.setimmediatevalue(1)
    dut.rdy_clr.setimmediatevalue(0)

    clock = Clock(dut.clk_50m, 40, units="ns")  # Create a 10 ns period clock
    cocotb.start_soon(clock.start())  # Start the clock

    # Execution will block until reset_dut has completed
    #await reset_dut(reset_n, 100)
    #dut._log.info("Released reset")

    # Test 10 UART transmissions
    for i in range(10):
        await Timer(100, units="ns")
        val = hex(random.randint(0, 255))
        await uart_driver.write(b'val')
        rec = await uart_sink.read()
        await uart_sink.wait()
        #assert hex(rec[0]) == val, "UART received data was incorrect on the {}th cycle".format(i)