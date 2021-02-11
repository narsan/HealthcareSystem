`timescale 1ns / 1ps
`default_nettype none

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
** Module Name: BloodTypeClassification
**********************************************************
** Additional Comments:
*/

module BloodTypeClassification(
        bloodType,
        bloodClass);
input [2:0] bloodType;
output bloodClass;
wire en;
wire [1:0] s;
wire [3:0] i;
assign en = bloodType[1],
		 s[0]= bloodType[0],
		 s[1]= bloodType[2],
		 i[0]= 1,
		 i[1]=1,
		 i[2]=0,
		 i[3]=1;
 assign
 bloodClass = ~en & i[0]&(~s[0] & ~s[1])|
					~en & i[1]&(s[0] & ~s[1])|
					~en & i[2]&(~s[0] & s[1])|
					~en & i[3]&(s[0] & s[1]);
endmodule
