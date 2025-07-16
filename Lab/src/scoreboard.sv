class scoreboard;

    // TODO: declare mailbox parameterized with 'transaction' type and 'mbx' name
	mailbox #(transaction) mbx;	

    // TODO: declare 'conf' field with 'cfg' type
 	cfg conf;

    // TODO: declare two fields with 'transaction' type and names
    //       'data_in' and 'data_out'
    transaction data_in, data_out;

    // TODO: Declare fields with type 'bit' and name 'done'
    // This field will indicate the end of the comparison
    bit done;

    
    // This task will compare transactions 'conf.amount'
    // times and set done bit after that

    virtual task run();
        repeat(conf.amount) begin
            compare();
        end
        done = 1;
    endtask

    // Get and compare, if neccessary
    // Note how we handle one cycle design delay via
    // setting 'data_in' after first compare attempt

    virtual task compare();
        mbx.get(data_out);
        if(data_in != null) compare_trans();
        data_in = data_out;
    endtask

    // Compare transactions and print result

    virtual function void compare_trans();
        if( data_out != null ) begin
            if( calc(data_in.X1, data_in.X2, data_in.X3) != data_out.Y1 ) begin
                $display("ERROR:	X1: %1b X2: %1b X3: %1b    Real: %1b != Expected: %1b, Time: %1t",
                    data_in.X1, data_in.X2, data_in.X3, data_out.Y1, calc(data_in.X1, data_in.X2, data_in.X3), $time());
            end
            else begin
                $display("GOOD: 	X1: %1b X2: %1b X3: %1b    Real: %1b == Expected: %1b, Time: %1t",
                     data_in.X1, data_in.X2, data_in.X3, data_out.Y1, calc(data_in.X1, data_in.X2, data_in.X3), $time());
            end
        end
    endfunction

    // TODO: create virtual function with name 'calc',
    //       which returns inversion of bit

    // Template: virtual function bit calc(bit a);
    virtual function bit calc(bit X1, bit X2, bit X3); 
		bit Y1 = (!X1 & X2 & !X3) || (!X1 & !X2 & !X3);
        return Y1;
    endfunction

endclass