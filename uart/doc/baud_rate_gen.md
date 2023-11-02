# Entity: baud_rate_gen 

- **File**: baud_rate_gen.v
## Diagram

![Diagram](baud_rate_gen.svg "Diagram")
## Generics

| Generic name | Type | Value                    | Description |
| ------------ | ---- | ------------------------ | ----------- |
| RX_ACC_MAX   |      | 50000000 / (115200 * 16) |             |
| TX_ACC_MAX   |      | 50000000 / 115200        |             |
| RX_ACC_WIDTH |      | $clog2(RX_ACC_MAX)       |             |
| TX_ACC_WIDTH |      | $clog2(TX_ACC_MAX)       |             |
## Ports

| Port name | Direction | Type | Description |
| --------- | --------- | ---- | ----------- |
| clk_50m   | input     | wire |             |
| rxclk_en  | output    | wire |             |
| txclk_en  | output    | wire |             |
## Signals

| Name   | Type                     | Description |
| ------ | ------------------------ | ----------- |
| rx_acc | reg [RX_ACC_WIDTH - 1:0] |             |
| tx_acc | reg [TX_ACC_WIDTH - 1:0] |             |
## Processes
- unnamed: ( @(posedge clk_50m) )
  - **Type:** always
- unnamed: ( @(posedge clk_50m) )
  - **Type:** always
