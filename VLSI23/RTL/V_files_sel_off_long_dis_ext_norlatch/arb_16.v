//Verilog HDL for "spike_enc", "arb_10" "functional"


module arb_16 ( 

	input [15:0] lni,		// requests from default taxel
	output wire [15:0] n_lno,  // acks for default taxel
	output wire ro,
	input n_ri


);

wire [7:0] ro_0; // all requests from 1st tier of arbiters
wire [3:0] ro_1; // all requests from 2nd tier of arbiters
wire [1:0] ro_2; // all requests from 2nd tier of arbiters 

wire [7:0] n_ri_0; // all acks for 1st tier of arbiters
wire [3:0] n_ri_1; // all acks for 2nd tier of arbiters
wire [1:0] n_ri_2; // all acks for 2nd tier of arbiters 

// lni[0] & lni[15] are hems	
arb_2 r0_0 ( .l1i( lni[0] ), .l2i( lni[1] ), .n_l1o( n_lno[0] ), .n_l2o( n_lno[1] ), .ro( ro_0[0] ), .n_ri( n_ri_0[0] ));
arb_2 r0_1 ( .l1i( lni[2] ), .l2i( lni[3] ), .n_l1o( n_lno[2] ), .n_l2o( n_lno[3] ), .ro( ro_0[1] ), .n_ri( n_ri_0[1] ));
arb_2 r0_2 ( .l1i( lni[4] ), .l2i( lni[5] ), .n_l1o( n_lno[4] ), .n_l2o( n_lno[5] ), .ro( ro_0[2] ),  .n_ri( n_ri_0[2] ));
arb_2 r0_3 ( .l1i( lni[6] ), .l2i( lni[7] ), .n_l1o( n_lno[6] ), .n_l2o( n_lno[7] ), .ro( ro_0[3] ),  .n_ri( n_ri_0[3] ));
arb_2 r0_4 ( .l1i( lni[8] ), .l2i( lni[9] ), .n_l1o( n_lno[8] ), .n_l2o( n_lno[9] ), .ro( ro_0[4] ), .n_ri( n_ri_0[4] ));
arb_2 r0_5 ( .l1i( lni[10] ), .l2i( lni[11] ), .n_l1o( n_lno[10] ), .n_l2o( n_lno[11] ), .ro( ro_0[5] ), .n_ri( n_ri_0[5] ));
arb_2 r0_6 ( .l1i( lni[12] ), .l2i( lni[13] ), .n_l1o( n_lno[12] ), .n_l2o( n_lno[13] ), .ro( ro_0[6] ),  .n_ri( n_ri_0[6] ));
arb_2 r0_7 ( .l1i( lni[14] ), .l2i( lni[15] ), .n_l1o( n_lno[14] ), .n_l2o( n_lno[15] ), .ro( ro_0[7] ),  .n_ri( n_ri_0[7] ));

arb_2 r1_0 ( .l1i( ro_0[0] ), .l2i( ro_0[1] ), .n_l1o( n_ri_0[0] ), .n_l2o( n_ri_0[1] ), .ro( ro_1[0] ), .n_ri( n_ri_1[0] ));
arb_2 r1_1 ( .l1i( ro_0[2] ), .l2i( ro_0[3] ), .n_l1o( n_ri_0[2] ), .n_l2o( n_ri_0[3] ), .ro( ro_1[1] ), .n_ri( n_ri_1[1] ));
arb_2 r1_2 ( .l1i( ro_0[4] ), .l2i( ro_0[5] ), .n_l1o( n_ri_0[4] ), .n_l2o( n_ri_0[5] ), .ro( ro_1[2] ), .n_ri( n_ri_1[2] ));
arb_2 r1_3 ( .l1i( ro_0[6] ), .l2i( ro_0[7] ), .n_l1o( n_ri_0[6] ), .n_l2o( n_ri_0[7] ), .ro( ro_1[3] ), .n_ri( n_ri_1[3] ));


arb_2 r2_0 ( .l1i( ro_1[0] ), .l2i( ro_1[1] ), .n_l1o( n_ri_1[0]), .n_l2o( n_ri_1[1] ), .ro( ro_2[0] ), .n_ri( n_ri_2[0] ));
arb_2 r2_1 ( .l1i( ro_1[2] ), .l2i( ro_1[3] ), .n_l1o( n_ri_1[2] ), .n_l2o( n_ri_1[3] ), .ro( ro_2[1] ), .n_ri( n_ri_2[1] ));

arb_2 r3_0 ( .l1i( ro_2[0] ), .l2i( ro_2[1] ), .n_l1o( n_ri_2[0] ), .n_l2o( n_ri_2[1] ), .ro( ro ), .n_ri(n_ri) );  // tie REQ back to neg-asserted ACK

endmodule
