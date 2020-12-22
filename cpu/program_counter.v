module ProgramCounter (
  input   wire          clk,
  input   wire          reset,
  input         [31:0]  dataIn,
  output  wire  [31:0]  dataOut,
  input                 writeEnable,    // 1 => WRITE, 0 => READ
  input                 countEnable     // 1 => COUNT UP, 0 => STOPPED
);

reg [31:0] programCounter;

always @(posedge clk)
begin
  if (reset)
  begin
    programCounter <= 0;
  end
  else if (writeEnable) programCounter <= dataIn;
  else if (countEnable) programCounter <= programCounter + 4;
end

assign dataOut = programCounter;

endmodule
