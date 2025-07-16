// TODO: fill monitor class

class monitor;

    // TODO: declare mailbox parameterized with 'transaction' type and 'mbx' name

    mailbox #(transaction) mbx;

    // TODO: declare 'data' field with 'transaction' type

    transaction data;

    // TODO: declare virtual interface 'vif' with type 'inv_if'
    
    virtual inv_if vif;

    // TODO: create virtual 'run()' task
    // Every posedge of 'vif.clk' task must call 'collect()'
    // Use 'forever' loop
    virtual task run();
        forever @(posedge vif.clk) begin
            collect();
        end
    endtask

    // This task will get transaction from the interface
    // and pass transaction on the mailbox

    virtual task automatic collect();
        data = new();
        data.X1  = vif.X1; 
		data.X2  = vif.X2;
		data.X3  = vif.X3;
        data.Y1 = vif.Y1;
        mbx.put(data);
    endtask

endclass