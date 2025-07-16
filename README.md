# ScoreBoard

The main objective of this code was to verify the functionality of a simple combinational logic circuit. This circuit, named inv, takes three inputs (X1, X2, X3) and produces one output (Y1) based on the boolean equation Y1 = (!X1 & X2 & !X3) || (!X1 & !X2 & !X3).

The goal was to test this circuit automatically by feeding it a large number of random input combinations and checking if its output is always correct. The testbench is designed to be self-checking, meaning it determines whether the test passed or failed on its own without needing a person to manually check the results. ✅

How Was the Environment Built? ⚙️
To achieve this, you followed these steps and created these key components:

Design Under Test (DUT): You implemented the inv module, which contains the actual logic being tested. This is the hardware you're verifying.

Interface (inv_if): You defined a standard interface to connect all the testbench components to the DUT. It carries the input signals (X1, X2, X3) and the output signal (Y1).

Transaction Class (transaction): You created a class to bundle the input and output signals into a single data packet. This makes it easy to pass all the relevant information between the testbench components.

Generator (generator): This component's job was to randomly generate new values for the inputs (X1, X2, X3). It creates a total of 100 random transactions to thoroughly test the circuit.

Driver (driver): The driver takes the random transactions from the generator and applies those input values to the DUT's input signals.

Monitor (monitor): This component passively watches the inputs and the output of the DUT. It captures the signals at every clock cycle and sends them to the scoreboard.

Scoreboard (scoreboard): This is the "brain" of the testbench. It contains its own local reference model (calc function) that implements the exact same boolean logic as the DUT. It takes the outputs observed by the monitor and compares them to what its own calc function computes. If they don't match, it reports an error. 🧪

Test and Testbench: Finally, the test class and testbench module orchestrate the whole process. They instantiate all the components, connect them, and run the simulation for a predetermined number of cycles, displaying the final results.
