# Besselphase

Matlab functions to compute the phase function for the Bessel functions and
their derivatives.

`phase  =  besselphase(nu,x)` computes 
$\theta_\nu(x) = arctan(Y_\nu(x)/J_\nu(x))$, where $J$ and $Y$ are the Bessel
functions of the first and second kind. The branch is determined by continuity
and $\theta_\nu(0) = -pi/2$

`phase  =  besselprimephase(nu,x)` computes 
$\phi_\nu(x) = arctan(Y'_\nu(x)/J_\nu(x))$ where $J'$ and $Y'$ are the 
derivatives with respect to the argument of the Bessel functions of the 
first and second kind. The branch is determined by continuity
and $\phi_\nu(0) = pi/2$
