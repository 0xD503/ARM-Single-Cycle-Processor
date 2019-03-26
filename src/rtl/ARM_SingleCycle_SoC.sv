module ARM_SingleCycle_SoC
	#(parameter	BusWidth	= 32)
	(input logic					i_CLK, i_RESET,
	output logic[(BusWidth - 1):0]	o_Address,
	output logic[(BusWidth - 1):0]	o_Write_Data,
	output logic					o_Mem_Write);

	//	Memory Control
	logic[(BusWidth - 1):0]			s_PC, s_Instr;//, s_Address;
	//logic							s_Mem_Write;
	//	Memory Process
	logic[(BusWidth - 1):0]			/*s_Write_Data, */s_Read_Data;


	//	Instantiation CPU and Memories
	//	CPU
	ARM_SingleCycle_CPU		CPU
		(i_CLK, i_RESET,
		s_Instr,
		s_PC,
		o_Address,
		o_Mem_Write,

		o_Write_Data, s_Read_Data);

		//	Instruction Memory
	ARM_InstructionMemory	InstructionMemory
		(s_PC,
		s_Instr);

	//	RAM
	ARM_DataMemory			RAM
		(i_CLK,
		
		o_Mem_Write,
		
		o_Address,
		o_Write_Data, s_Read_Data);

endmodule
