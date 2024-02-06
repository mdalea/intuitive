//Verilog HDL for "spike_enc", "taxel_logic" "functional"


module taxel_logic_norlatch ( 
	input spkgatex,
	input spkgatey,
        input rst,
	input spk_in,
	input acky,
	input ackx_pulse,
	output wire q_latch 
);
	wire spkgate;
	wire set, reset;

	assign spkgate = spkgatex & spkgatey;
	//assign set = spk_in & ~acky;
	assign set = ~spkgate & ~rst & spk_in & ~acky;  // only assert latch if not in reset mode, so oscillation does not happen
	assign reset = rst | (acky & ackx_pulse);

	sr_latch_nor_taxel_logic u0 (.set(set), .reset(reset), .q(q_latch));

/*
	always@(*) begin
		if (acky == 1'b0 && spk_in == 1'b1) begin  // once row is selected, further spiking from same row is prohibited
			q_latch = 1'b1;
		end else if (acky == 1'b1 && ackx_del == 1'b1) begin
			q_latch = 1'b0;			
		end else begin
			q_latch = q_latch;
		end
	end
*/
endmodule
