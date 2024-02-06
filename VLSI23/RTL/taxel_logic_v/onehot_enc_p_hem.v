//Verilog HDL for "spike_enc", "onehot_enc" "functional"


module onehot_enc_p_hem (
	input [1:0] mux_config,
	output wire [1:0] n_mux_ctrl

	);

	reg [1:0] mux_ctrl;
	assign n_mux_ctrl = ~mux_ctrl;

	always@(*) begin
		case(mux_config)
			2'd0: begin    // local taxel POSFET -> hem
				mux_ctrl = 2'h1;
			end
			2'd1: begin   // connected POSFETs -> hem
				mux_ctrl = 2'h2;
			end
			2'd2: begin   // connected POSFETs + local taxel POSFET -> hem
				mux_ctrl = 2'h3;
			end
			default: begin
				mux_ctrl = 2'h0;
			end
		endcase
	end

endmodule
