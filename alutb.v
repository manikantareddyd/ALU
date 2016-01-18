
module alu_tb;

   reg[3:0] A;
   reg[3:0] B;
   wire [3:0] Y;
   reg [3:0] opcode;
   wire [3:0] flags;


integer  i;
   integer j;
   integer k;


alu4 my_alu( A, B , opcode, Y, flags);

initial
begin
   #1 $monitor("A = %b", A, " B = %b", B, "  |  opcode = %b", opcode, "  |  Y =%b", Y ," | flags = %b", flags );
   $dumpfile("test.vcd");
   $dumpvars(0,alu_tb);
   A = 0110;
   B = 1110;

           for( j =0 ; j<= 14; j = j + 1)
             begin
                opcode = j ;#5;
             end
   A = 1111;
   B = 1001;
   for( j = 0 ; j<= 14 ; j=j+1)
     begin
        opcode = j;
 #5;
        end

      $display("--------------------------------------------");



end
endmodule
