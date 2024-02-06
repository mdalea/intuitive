//Verilog HDL for "spike_enc", "taxel_logic" "functional"
// taxel logic of imode/ON channel not included since it has a different supply

module taxel_logic_lcadc_norlatch ( 
	input spkgatex,
	input spkgatey,
        input rst,
	input spk_in_on,
	input spk_in_off,
	input spk_in_imode,
	input acky,
	input ackx_pulse,
	//output wire q_latch_on,
	output wire q_latch_off,

	input vmode,
	output muxout_on


);

	wire spkgate;
	wire muxout_on;
	wire muxout_off;

	assign spkgate = spkgatex & spkgatey;
	assign muxout_on = vmode ? spk_in_on : spk_in_imode;
	assign muxout_off = vmode ? spk_in_off : 1'b0; 

	wire set_off, reset;

	//assign set_on = ~spkgate & ~rst & muxout_on & ~acky;  // only assert latch if not in reset mode, so oscillation does not happen
	assign set_off = ~spkgate & ~rst & muxout_off & ~acky;  // only assert latch if not in reset mode, so oscillation does not happen
	assign reset = rst | (acky & ackx_pulse);

	//sr_latch_v u0 (.set(set_on), .reset(reset), .q(q_latch_on));
	sr_latch_nor_taxel_logic_lcadc u0 (.set(set_off), .reset(reset), .q(q_latch_off));

endmodule
