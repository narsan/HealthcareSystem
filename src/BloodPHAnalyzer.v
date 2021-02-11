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
** Module Name:
**********************************************************
** Additional Comments:
*/

module BloodPHAnalyzer(
        bloodPH,
        abnormalityP,
        abnormalityQ);
input [3:0] bloodPH;
output abnormalityP;
output abnormalityQ;
assign abnormalityP = ~bloodPH[3] & bloodPH[2] & bloodPH[1] & bloodPH[0] | bloodPH[3] & ~bloodPH[2] & ~bloodPH[1] & ~bloodPH[0];
assign abnormalityQ = ~bloodPH[3] & bloodPH[2] & bloodPH[1] | bloodPH[3] & ~bloodPH[2] & ~bloodPH[1];
endmodule
