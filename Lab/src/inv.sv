module inv (
    input  logic clk,
    input  logic X1,	
	input logic X2,
	input logic X3,
    output logic Y1
);

    always_ff @( posedge clk ) begin
        //signal_out <= ~signal_in;
		Y1 = (!X1 & X2 & !X3) || (!X1 & !X2 & !X3)	;
    end

endmodule		  	 