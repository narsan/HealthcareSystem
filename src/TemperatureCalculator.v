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
** Module Name: TemperatureCalculator
**********************************************************
** Additional Comments:
*/

//Full Adder Module:


module Full_Adder(input x,input y,input cin,output s, output cout);

wire c1,c2,c3;

xor(s,x,y,cin);

and(c1,x,y),

(c2,x,cin),

(c3,y,cin);

or(cout,c1,c2,c3);

endmodule

//Multiplier Module:
module m4bit(

input [3:0] Q,

input [3:0] M,

output [7:0] P

);

wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11;

wire d1,d2,d3,d4,d5,d6,d7;

wire e1,e2,e3;

wire f1,f2,f3,f4,f5,f6,f7;

wire g1,g2,g3,g4;

and(c1,M[3],Q[1]),

(c2,M[2],Q[2]),

(c3,M[1],Q[3]),

(c4,M[3],Q[0]),

(c5,M[2],Q[1]),

(c6,M[1],Q[2]),

(c7,M[2],Q[0]),

(c8,M[1],Q[1]),

(c9,M[0],Q[2]),

(c10,M[1],Q[0]),

(c11,M[0],Q[1]),

(P[0],M[0],Q[0]);

Full_Adder fa1(c1,c2,c3,d2,d1);

Full_Adder fa2(c4,c5,c6,d4,d3);

Full_Adder fa3(c7,c8,c9,d6,d5);

Full_Adder fa4(c10,c11,0,P[1],d7);

and(e1,M[2],Q[3]),

(e2,M[3],Q[2]),

(e3,M[0],Q[3]);

Full_Adder fa5(e1,e2,d1,f2,f1);

Full_Adder fa6(d2,d3,f5,f4,f3);

Full_Adder fa7(d4,e3,d5,f6,f5);

Full_Adder fa8(d6,d7,0,P[2],f7);

and(g1,M[3],Q[3]);

Full_Adder fa9(g1,f1,g2,P[6],P[7]);

Full_Adder fa10(f2,f3,g3,P[5],g2);

Full_Adder fa11(f4,0,g4,P[4],g3);

Full_Adder fa12(f6,f7,0,P[3],g4);

endmodule

module TemperatureCalculator(
        factoryBaseTemp,
        factoryTempCoef,
        tempSensorValue,
        temperature);
input [7:0] factoryBaseTemp;
input [3:0] factoryTempCoef;
input [3:0] tempSensorValue;
output [7:0] temperature;
wire [7:0]p;
wire [7:0]concat;
wire [6:0]w;
wire co;
assign concat={3'b000,p[7:3]};
m4bit mlt(tempSensorValue,factoryTempCoef,p);
Full_Adder fla0(factoryBaseTemp[0],concat[0],0,temperature[0],w[0]),
				fla1(factoryBaseTemp[1],concat[1],w[0],temperature[1],w[1]),
				fla2(factoryBaseTemp[2],concat[2],w[1],temperature[2],w[2]),
				fla3(factoryBaseTemp[3],concat[3],w[2],temperature[3],w[3]),
				fla4(factoryBaseTemp[4],concat[4],w[3],temperature[4],w[4]),
				fla5(factoryBaseTemp[5],concat[5],w[4],temperature[5],w[5]),
				fla6(factoryBaseTemp[6],concat[6],w[5],temperature[6],w[6]),
				fla7(factoryBaseTemp[7],concat[7],w[6],temperature[7],co);
endmodule
