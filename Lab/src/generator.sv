// TODO: fill generator class

class generator;

    // TODO: declare mailbox parameterized with 'transaction' type and 'mbx' name
    mailbox #(transaction) mbx;

    // TODO: declare 'conf' field with 'cfg' type
    cfg conf;


    // TODO: declare 'data' field with 'transaction' type
    transaction data;

    // TODO: create virtual 'run()' task
    // Task must call 'gen()' 'conf.amount' times
    // Use 'repeat'
    virtual task run();
        repeat(conf.amount) begin
            gen();	   
			//$display("genera    T: %1t", $time());
        end
    endtask

    // This task will generate random input signal
    // and pass transaction to the mailbox

    virtual task gen();
        data = new();
        data.X1 = $urandom_range(1);	 
		data.X2 = $urandom_range(1);
		data.X3 = $urandom_range(1);
        mbx.put(data);
    endtask

endclass