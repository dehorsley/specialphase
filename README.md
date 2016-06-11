# Special Phase Functions

These Matlab functions to compute the phase function for the Bessel and Airy
functions and their derivatives.

`phase  =  besselphase(nu,x)` computes 
θ<sub>ν</sub>(x) = arctan(Y<sub>ν</sub>(x)/J<sub>ν</sub>(x))
where J<sub>ν</sub> and Y<sub>ν</sub> are the Bessel functions of the first and
second kind. The branch is determined by continuity and θ<sub>ν</sub>(0) = -π/2

`phase  =  besselprimephase(nu,x)` computes 
φ<sub>ν</sub>(x) = arctan(Y'<sub>ν</sub>(x)/J'<sub>ν</sub>(x)) where
J'<sub>ν</sub> and Y'<sub>ν</sub> are the derivatives with respect to the
argument of the Bessel functions of the first and second kind. The branch is
determined by continuity and φ<sub>ν</sub>(0)  = π/2

`phase  =  airyphase(x)` computes θ(x) = arctan(A(x)/B(x)) where A and
B are the Airy functions of the first and second kind. The branch is determined
by continuity and θ(0) = π/6

`phase  =  airyprimephase(x)` computes φ(x) = arctan(A'(x)/B'(x)) where A' and
B' are the derivatives of the Airy functions of the first and second kind. The
branch is determined by continuity and φ(0) = -π/6
