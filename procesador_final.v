module procesador_final (
    input clk,
    input rst,
    output [7:0] data_out,
    output [3:0] pc_out
);
    reg [3:0] pc = 0;
    wire [17:0] instr;
    wire [127:0] result;
    wire zero;

    // Instancias
    rom_inst u_rom(pc, instr);
    datapath u_dp(clk, rst, instr, result, zero);
    
    // Lógica del PC
    always @(posedge clk) begin
        if (rst) pc <= 0;
        else pc <= (instr[17] && zero) ? 0 : pc + 1;
    end
    
    // Asignación directa a pines físicos
    assign data_out = result[7:0]; 
    assign pc_out = pc;
endmodule

// Módulos auxiliares (ALU, ROM y Datapath van aquí abajo)
module alu_core (input [127:0] A, B, input [2:0] op, output reg [127:0] result, output zero);
    always @(*) begin
        case (op)
            3'b000: result = A + B;
            3'b001: result = A - B;
            3'b011: result = A & B;
            3'b100: result = A | B;
            3'b101: result = A << B[5:0];
            default: result = A;
        endcase
    end
    assign zero = (result == 128'b0);
endmodule

module rom_inst (input [3:0] pc, output reg [17:0] instr);
    always @(*) begin
        case (pc)
            4'd0: instr = 18'b0_011_011_001_010_1_0000;
            4'd1: instr = 18'b0_100_100_001_010_1_0000;
            4'd2: instr = 18'b0_001_101_001_001_1_0000;
            4'd3: instr = 18'b1_000_000_000_000_0_0000;
            default: instr = 18'b0;
        endcase
    end
endmodule

module datapath (input clk, rst, input [17:0] instr, output [127:0] alu_out, output zero);
    reg [127:0] regs [7:0];
    initial begin regs[1]=100; regs[2]=40; end
    alu_core u_alu(regs[instr[10:8]], regs[instr[7:5]], instr[16:14], alu_out, zero);
    always @(posedge clk) if (instr[4]) regs[instr[13:11]] <= alu_out;
endmodule
