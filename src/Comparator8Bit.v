
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
** Module Name: Comparator8Bit
**********************************************************
** Additional Comments:
*/
module com3bit(
input [2:0]A,
input [2:0]B,
input L,
input E,
input G,
output LT,
output EQ,
output GTT );
wire notA[2:0],notB[2:0],eqbit[2:0],ltPart[2:0],gtPart[2:0],isEqual,notIsEqual,gtPreNEqRes,
ltPreNEqRes,gtNEqRes,ltNEqRes,gtEqRes,ltEqRes;
not
n0(notA[0],A[0]),
n1(notA[1],A[1]),
n2(notA[2],A[2]),
n3(notB[0],B[0]),
n4(notB[1],B[1]),
n5(notB[2],B[2]),
n6(notIsEqual,isEqual);
xnor
xn0(eqbit[0],A[0],B[0]),
xn1(eqbit[1],A[1],B[1]),
xn2(eqbit[2],A[2],B[2]);
or
or0(gtPreNEqRes,gtPart[0],gtPart[1],gtPart[2]),
or1(ltPreNEqRes,ltPart[0],ltPart[1],ltPart[2]),
or2(GTT,gtNEqRes,gtEqRes),
or3(LT,ltNEqRes,ltEqRes);
and
a0(ltPart[0],notA[0],B[0],eqbit[2],eqbit[1]),
a1(ltPart[1],notA[1],B[1],eqbit[2]),
a2(ltPart[2],notA[2],B[2]),
a3(gtPart[0],A[0],notB[0],eqbit[2],eqbit[1]),
a4(gtPart[1],A[1],notB[1],eqbit[2]),
a5(gtPart[2],A[2],notB[2]),
a6(isEqual,eqbit[0],eqbit[1],eqbit[2]),
a7(gtNEqRes,notIsEqual,gtPreNEqRes),
a8(ltNEqRes,notIsEqual,ltPreNEqRes),
a9(gtEqRes,isEqual,G),
a10(ltEqRes,isEqual,L),
a11(EQ,isEqual,E);


endmodule

module Comparator8Bit(
        inputP,
        inputQ,
        pLessThanQ,
        pEqualToQ,
        pGraterGreaterThanQ
        );
input [0:7] inputP;
input [0:7] inputQ;
output pLessThanQ;
output pEqualToQ;
output pGraterGreaterThanQ;
wire [0:5]w;
com3bit
c1({inputP[6:7],1'b0},{inputQ[6:7],1'b0},0,1,0,w[0],w[1],w[2]),
c2(inputP[3:5],inputQ[3:5],w[0],w[1],w[2],w[3],w[4],w[5]),
c3(inputP[0:2],inputQ[0:2],w[3],w[4],w[5],pLessThanQ,pEqualToQ,pGraterGreaterThanQ);


endmodule


