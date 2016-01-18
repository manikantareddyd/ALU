
module alu4(input[3:0] A, input[3:0] B, input[3:0] opcode ,output [3:0] Y,
   output [3:0] flags ) ;
   reg [3:0]Y;
   reg [3:0]flags;
   reg [3:0] tempA;
   reg [3:0] tempB;
   always @(A or B or opcode)
     begin
        tempA = ~A;
        tempB = ~B;
        flags[3]=0;
      case(opcode) //cf
        0 : Y = A ;
        1 : {flags[3], Y} = A + 1;
        2 : {flags[3],Y} = tempA + B;
        3 : {flags[3], Y} = A + B +1 ;
        4 : {flags[3], Y} = A & tempB;
        5 : {flags[3], Y} = A | B;
        6 : Y = A ^ B;
        7 : {flags[3], Y} = A << 1;
        8 : Y = ~A ;
        9 : Y = A >> 1;
        10 : {flags[3],Y} = A - B;
        11 : {flags[3], Y} = A - B - 1;
        12 : Y = ~(A & B);
        13 : Y = ~(A | B);
        14 : Y = ~(A ^ B);
        default: Y=4'bxxxx;
		endcase
	end
		always @(Y)
			begin
					flags[2] = (Y == 0000) ? 1 : 0; //zf
          			flags[1] = (^Y == 1) ? 0 : 1; //pf
           			//flags[0] = (((opcode==11)&&({flags[3],Y==5'b11111}))||(((opcode==10)||(opcode==9))&&(flags[3]==1))) ? 1 : 0 ; //sf
 					if(((opcode==9)||(opcode==10))&&(flags[3]==1))
    				  flags[0]=1;
				    else if((opcode==11)&&({flags[3],Y}==5'b11111))
				      flags[0]=1;
				    else
				      flags[0]=0;
 			end
endmodule
