<h1 align = "center">4x4 Multiplier</h1>
<p></p>

<h3> 4x4 Multiplier</h3>
<p>
The target FPGA has a built-in multiplier which can be synthesized automatically by using the multiplication operator. 
For example, <code>Y &lt;= A * B;</code> where both <code>A</code> and <code>B</code> are 4 bits, and <code>Y</code> is 8 bits.
</p>

<h4>3.1 Multiplier Submission</h4>
<ol>
  <li>
    <strong>SystemVerilog RTL</strong> using a single concurrent code for the 4x4 multiplier block shown in Figure 1.
    <ul>
      <li>
        Use the <code>even_detector.sv</code> example as a template to develop a 4x4 multiplier RTL using a single concurrent 
        statement as shown above and save it in a file named <code>mult4x4.sv</code>. Include this file in your submission.
      </li>
    </ul>
  </li>
  <li>
    <strong>SystemVerilog testbench</strong> to verify the functionality of the 4x4 multiplier.
    <ul>
      <li>
        Use the <code>even_detector_tb.sv</code> as a template to develop a self-checking testbench (TB) that verifies the 
        different RTL blocks. The testbench should include two nested for loops to cover all possible 256 combinations 
        of both <code>A</code> and <code>B</code> inputs.
      </li>
      <li>
        Name the testbench <code>mult4x4_tb.sv</code>. Include this file in your submission.
      </li>
      <li>Run the simulation long enough to cover all possible input combinations.</li>
      <li>
        Add the inputs and output of the 4x4 multiplier and verify the functionality through visual inspection of the waveform. 
        Submit a screen capture of the waveform.
      </li>
    </ul>
  </li>
</ol>

<h3>Binary to BCD Conversion</h3>
<p>
Another part of this HW is the binary to BCD conversion. This will be implemented using the shift-add-3 algorithm.
</p>

<h4>4.1 Shift and Add-3 Algorithm</h4>
<ol>
  <li>Shift the binary number left one bit.</li>
  <li>If 8 shifts have taken place, the BCD number is in the Hundreds, Tens, and Units column.</li>
  <li>If the binary value in any of the BCD columns is 5 or greater, add 3 to that value in that BCD column.</li>
  <li>Go to step 1.</li>
</ol>

<p><strong>Example 1:</strong> Convert hex <code>E</code> to BCD</p>

<h4>4.2 BCD Encoder Submission</h4>
<ol>
  <li>
    <strong>SystemVerilog RTL implementation</strong> of the <code>add3</code> block shown in Figure 4. 
    Use the <code>mux2.sv</code> example in the notes as a template to design this block and name it <code>add3.sv</code>.
  </li>
  <li>
    <strong>SystemVerilog structural implementation</strong> of the 8-bit binary to BCD conversion shown in Figure 5 
    and name this file <code>bcd8.sv</code>.
  </li>
  <li>
    <strong>SystemVerilog testbench</strong> to verify the functionality of the <code>bcd8.sv</code>:
    <ul>
      <li>
        Use the <code>even_detector_tb.sv</code> as a template to develop a self-checking testbench (TB) that verifies <code>bcd8.sv</code>. 
        The testbench should include one <code>for</code> loop that covers all possible 256 combinations of the binary inputs.
      </li>
      <li>Name the testbench <code>bcd8_tb.sv</code>. Include this file in your submission.</li>
      <li>Run the simulation long enough to cover all possible input combinations.</li>
      <li>
        Add the inputs and output waveform of <code>bcd8_tb.sv</code> to verify the functionality through visual inspection of the waveform. 
        Submit a screen capture of the waveform.
      </li>
    </ul>
  </li>
</ol>

<h3>5 Seven-segment Decoder (SSD)</h3>
<p>
The DE0-CV board has six 7-segment displays. These displays are paired to display numbers in various sizes. Figure 6 shows the 
connection of seven segments (common anode) to pins on Cyclone V FPGA. The segment can be turned on or off by applying a low 
logic level or high logic level from the FPGA, respectively.
</p>
<p>
Develop the truth table for converting BCD to the 7-segment display decoder. For example:
</p>
<ul>
  <li><code>BCD = 0000</code> will correspond to <code>SSD = 1000000</code>.</li>
  <li><code>BCD = 0001</code> will correspond to <code>SSD = 1111001</code>.</li>
</ul>



