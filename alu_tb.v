`include "alu.v"

module alu_tb;
reg[3:0] A;
reg[3:0] B;
reg [2:0] ALU_Sel;
wire [3:0] Result;
wire Carry;

alu dut(.A(A),.B(B),.ALU_Sel(ALU_Sel),.Result(Result),.Carry(Carry));
initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0,alu_tb);

    A = 4'b0101; B = 4'b0011;

    ALU_Sel = 3'b000;
    #4 ALU_Sel = 3'b001;
    #4 ALU_Sel = 3'b010;
    #4 ALU_Sel = 3'b011;
    #4 ALU_Sel = 3'b100;
    #4 ALU_Sel = 3'b101;
    #50 $finish;
end

always@(*)
    $monitor("TIME=%0t I/P:A=%b,B=%b,ALU_Sel=%b O/P:RESULT=%b,CARRY=%b",$time,A,B,ALU_Sel,Result,Carry);

endmodule

