`include "cpu.v"

module top(
	input CLK,
	input PIN_24,
	output PIN_6,
	output PIN_7,
  output PIN_8,
	output PIN_9,
  output PIN_10,
	output PIN_11,
  output PIN_12,
	output PIN_13);

reg[7:0] out;
reg[23:0] clk;
always @(posedge CLK)
	clk <= clk + 1;

cpu cpu0(
	.clk(clk[15]),
	.reset(PIN_24),
	.out(out));

always @(posedge clk[15]) begin
	{PIN_13, PIN_12, PIN_11, PIN_10, PIN_9, PIN_8, PIN_7, PIN_6} = out;
end

endmodule
