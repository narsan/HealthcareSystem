`timescale 1ns / 1ps

/*
**********************************************************
** Logic Design Final Project Fall, 2019 Semester
** Amirkabir University of Technology (Tehran Polytechnic)
** Department of Computer Engineering (CEIT-AUT)
** Logic Circuit Design Laboratory
** https://ceit.aut.ac.ir
**********************************************************
** Student ID: XXXXXXX
** Student ID: XXXXXXX
**********************************************************
** Module Name: GlycemicIndexCalculator
**********************************************************
** Additional Comments:
*/

 
module inverter(I,invert,O);
input [7:0]I;
input invert;
output [7:0]O;
xor
xo0(O[0],invert,I[0]),
xo1(O[1],invert,I[1]),
xo2(O[2],invert,I[2]),
xo3(O[3],invert,I[3]),
xo4(O[4],invert,I[4]),
xo5(O[5],invert,I[5]),
xo6(O[6],invert,I[6]),
xo7(O[7],invert,I[7]);

endmodule


module adder8(A,B,ci,S,co);
input [7:0]A; 
input [7:0]B;
input ci;
output [7:0]S;
output co;
wire w1,w2,w3,w4,w5,w6,w7;
Full_Adder
f1(A[0],B[0],ci,S[0],w1),
f2(A[1],B[1],w1,S[1],w2),
f3(A[2],B[2],w2,S[2],w3),
f4(A[3],B[3],w3,S[3],w4),
f5(A[4],B[4],w4,S[4],w5),
f6(A[5],B[5],w5,S[5],w6),
f7(A[6],B[6],w6,S[6],w7),
f8(A[7],B[7],w7,S[7],co);

endmodule


module adder2(A,B,ci,S,co);
input [1:0]A; 
input [1:0]B;
input ci;
output [1:0]S;
output co;
wire w1;
Full_Adder
f1(A[0],B[0],ci,S[0],w1),
f2(A[1],B[1],w1,S[1],co);

endmodule


module adder3(A,B,ci,S,co);
input [2:0]A; 
input [2:0]B;
input ci;
output [2:0]S;
output co;
wire w1,w2;
Full_Adder
f1(A[0],B[0],ci,S[0],w1),
f2(A[1],B[1],w1,S[1],w2),
f3(A[2],B[2],w2,S[2],co);

endmodule


module Abs(B,absB);
input [7:0]B;
output [7:0]absB;
wire cot;
wire [7:0]b1;
inverter inv(B,B[7],b1);
adder8 ad(8'b00000000,b1,B[7],absB,cot);
endmodule


module GlycemicIndexCalculator(
        bloodSensor,
        glycemicIndex,absBloodSensor);
input [7:0] bloodSensor;
output [3:0] glycemicIndex ;
output [7:0]absBloodSensor;
//wire [7:0]absBloodSensor;
wire [3:0]s;
wire [3:0]r;
wire w2,w3,w4,w5,w6,w7,w8,y1,y2,y3,y4,y5,y6;
Abs abs1(bloodSensor,absBloodSensor);
//Full_Adder
//f0(absBloodSensor[0],absBloodSensor[1],0,s[0],w1),
//f1(absBloodSensor[2],absBloodSensor[3],0,s[1],w2),
//f2(absBloodSensor[4],absBloodSensor[5],0,s[2],w3),
//f3(absBloodSensor[6],absBloodSensor[7],0,s[3],w4);
//assign y1 = {w1,s[0]},
	//	 y2 = {w2,s[1]},
		// y3 = {w3,s[2]},
		// y4 = {w4,s[3]};
//adder2 
  //     ad1(y1,y2,0,r[1:0],w5),
	//	 ad2(y3,y4,0,r[3:2],w6);
//assign   y5 = {w5,r[1:0]},
	//		y6 = {w6,r[3:2]};
//adder3 ad3(y5,y6,0,glycemicIndex[2:0],w7);

//assign glycemicIndex = {w7,glycemicIndex[2:0]};
assign glycemicIndex = bloodSensor[0] + bloodSensor[1] + bloodSensor[2] + bloodSensor[3] + bloodSensor[4] + bloodSensor[5] + bloodSensor[6] + bloodSensor[7];
endmodule
