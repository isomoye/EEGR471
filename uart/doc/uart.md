# Entity: uart 

- **File**: uart.v
## Diagram

![Diagram](uart.svg "Diagram")
## Ports

| Port name | Direction | Type       | Description |
| --------- | --------- | ---------- | ----------- |
| din       | input     | wire [7:0] |             |
| wr_en     | input     | wire       |             |
| clk_50m   | input     | wire       |             |
| tx        | output    | wire       |             |
| tx_busy   | output    | wire       |             |
| rx        | input     | wire       |             |
| rdy       | output    | wire       |             |
| rdy_clr   | input     | wire       |             |
| dout      | output    | wire [7:0] |             |
## Signals

| Name     | Type | Description |
| -------- | ---- | ----------- |
| rxclk_en | wire |             |
| txclk_en | wire |             |
## Instantiations

- uart_baud: baud_rate_gen
- uart_tx: transmitter
- uart_rx: receiver
