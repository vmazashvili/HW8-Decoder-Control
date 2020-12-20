module tb;

	// Inputs
	reg [31:0] instr;
	reg [3:0] flag;

	// Outputs
	wire [1:0] op;
	wire [3:0] cmd;
	wire [23:0] imm_instr;
	wire [3:0] src_addr;
	wire [3:0] dest_reg;
	wire [11:0] imm_instr_mem;
	wire jmp_en;
	wire jmp_reg_en;
	wire flag_en;
	wire data_w_en;
	wire data_mem;
	wire data_mem_en;

	// Instantiate the Unit Under Test (UUT)
	decoder_control uut (
		.instr(instr), 
		.flag(flag), 
		.op(op), 
		.cmd(cmd), 
		.imm_instr(imm_instr), 
		.src_addr(src_addr), 
		.dest_reg(dest_reg), 
		.imm_instr_mem(imm_instr_mem), 
		.jmp_en(jmp_en), 
		.jmp_reg_en(jmp_reg_en), 
		.flag_en(flag_en), 
		.data_w_en(data_w_en), 
		.data_mem(data_mem), 
		.data_mem_en(data_mem_en)
	);

	initial begin
		// Initialize Inputs
		instr = 0;
		flag = 0;

		// Wait 100 ns for global reset to finish
		#100;
       
		// Add stimulus here
		instr = 32'b1100010001111101110010111000111;
		#200
		instr = 32'b1100111110111000011111100011111;
		#200
		instr = 32'b0001011110110110011000111111111;
		#200
		instr = 32'b1101111010101001101011111000001;
	end
      
endmodule

