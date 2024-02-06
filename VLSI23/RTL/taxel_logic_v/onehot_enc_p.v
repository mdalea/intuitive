//Verilog HDL for "spike_enc", "onehot_enc" "functional"


module onehot_enc_p (
	input [4:0] mux_config,
	output wire [25:0] n_mux_ctrl
	);

	reg [25:0] mux_ctrl;

	//assign n_mux_ctrl_21 = ~mux_ctrl[21]; // generate complementary mux[11] signal to control PMOS gate for test source current
	assign n_mux_ctrl = ~mux_ctrl;

	always@(*) begin
		case(mux_config)
			5'd0: begin    // local taxel POSFET -> local taxel
				mux_ctrl = 26'h0000001;
			end
			5'd1: begin   // local taxel POSFET -> hem #1
				mux_ctrl = 26'h0000002;
			end
			5'd2: begin    // local taxel POSFET -> hem #2
				mux_ctrl = 26'h0000004;
			end
			5'd3: begin    // local taxel POSFET -> hem #3
				mux_ctrl = 26'h0000008;
			end
			5'd4: begin    // local taxel POSFET -> hem #4
				mux_ctrl = 26'h0000010;
			end
			5'd5: begin    // local taxel POSFET -> hem #5
				mux_ctrl = 26'h0000020;
			end
			5'd6: begin    // local taxel POSFET -> hem #6
				mux_ctrl = 26'h0000040;
			end
			5'd7: begin    // local taxel POSFET -> hem #7
				mux_ctrl = 26'h0000080;
			end
			5'd8: begin    // local taxel POSFET -> hem #8
				mux_ctrl = 26'h0000100;
			end
			5'd9: begin    // local taxel POSFET -> hem #9
				mux_ctrl = 26'h0000200;
			end
			5'd10: begin    // local taxel POSFET -> hem #10
				mux_ctrl = 26'h0000400;
			end
			5'd11: begin    // local taxel POSFET -> hem #11
				mux_ctrl = 26'h0000800;
			end
			5'd12: begin    // local taxel POSFET -> hem #12
				mux_ctrl = 26'h0001000;
			end
			5'd13: begin    // local taxel POSFET -> hem #13
				mux_ctrl = 26'h0002000;
			end
			5'd14: begin    // local taxel POSFET -> hem #14
				mux_ctrl = 26'h0004000;
			end
			5'd15: begin    // local taxel POSFET -> hem #15
				mux_ctrl = 26'h0008000;
			end
			5'd16: begin    // local taxel POSFET -> hem #16
				mux_ctrl = 26'h0010000;
			end
			5'd17: begin    // local taxel POSFET -> hem #17
				mux_ctrl = 26'h0020000;
			end
			5'd18: begin    // local taxel POSFET -> hem #18
				mux_ctrl = 26'h0040000;
			end
			5'd19: begin    // local taxel POSFET -> hem #19
				mux_ctrl = 26'h0080000;
			end
			5'd20: begin    // local taxel POSFET -> hem #20
				mux_ctrl = 26'h0100000;
			end
			5'd21: begin    // local taxel POSFET -> hem #21
				mux_ctrl = 26'h0200000;
			end
			5'd22: begin    // local taxel POSFET -> hem #22
				mux_ctrl = 26'h0400000;
			end
			5'd23: begin    // local taxel POSFET -> hem #23
				mux_ctrl = 26'h0800000;
			end
			5'd24: begin    // local taxel POSFET -> hem #24
				mux_ctrl = 26'h1000000;
			end

			//5'd21: begin   // test input + local POSFET -> local taxel
			5'd30: begin
				mux_ctrl = 26'h2000001;
			end
			//5'd22: begin    // test input -> local taxel
			5'd31: begin
				mux_ctrl = 26'h2000000;
			end
			default: begin
				mux_ctrl = 26'h0000000;
			end
		endcase
	end

endmodule
