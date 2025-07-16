class driver;
    // Mailbox parameterized with 'transaction' type
    mailbox #(transaction) mbx;

    // 'conf' field with 'cfg' type
    cfg conf;

    // 'data' field with 'transaction' type
    transaction data;

    // Virtual interface with type 'inv_if'
    virtual inv_if vif;

    // Virtual 'run()' task
    virtual task run();
		vif.X1 <= 0; // Drop the input signal 
		vif.X2 <= 0; // Drop the input signal
		vif.X3 <= 0; // Drop the input signal
        forever begin
            //@(posedge vif.clk);
            repeat(conf.latency) @(posedge vif.clk);
            drive();
        end
    endtask

    // Task to get transaction from the mailbox and drive it on the interface
    virtual task automatic drive();
        mbx.get(data);
        vif.X1 <= data.X1; 
		vif.X2 <= data.X2;
		vif.X3 <= data.X3;
    endtask

endclass
