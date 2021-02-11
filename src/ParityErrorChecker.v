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
** Module Name: ParityErrorChecker
**********************************************************
** Additional Comments:
*/

module ParityErrorChecker(
        data,
        error);
input [5:0] data;
output error;
xor check (error,data[0],data[1],data[2],data[3],data[4],data[5]);
endmodule

