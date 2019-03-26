module ARM_SigleCycle_SoC_tb #(parameter BusWidth = 32)	();
	logic					s_CLK, s_RESET;
	logic[(BusWidth - 1):0]	s_Write_Data, s_Address;
	logic					s_Mem_Write;


	ARM_SingleCycle_SoC	DUT_ARM_SoC
		(s_CLK, s_RESET,
		s_Address, s_Write_Data,
		s_Mem_Write);

	initial
	begin
		s_CLK = 1'b0;	s_RESET = 1'b0;
		#6;	s_RESET <= 1'b1;	#22;
		s_RESET <= 1'b0;
	end
	
	always
	begin
		#5;	s_CLK <= ~s_CLK;
	end


	always	@(negedge s_CLK)
	begin
		if (s_Mem_Write)
		begin
			if ((s_Address === 100) & (s_Write_Data === 7))
			begin
				$display("Simulation succeeded! Hurrrrray! Your first processor is working!");
				$stop;
			end
			else
			begin
				$display("Simulation failed. :-((");
				$stop;
			end
		end
	end

endmodule
