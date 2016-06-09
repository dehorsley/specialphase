function [phase, modulus2] = besselphase(nu, X)
    % BESSELPHASE Phase function for the Bessel function derivatives
    %
    %   phase  =  BESSELPHASE(nu,x) is the equal to 
    %       arctan(Y(nu,x)/J(nu,x)) where J and Y are the Bessel
    %       functions of the first and second kind. The branch is 
    %       determined by continuity and besselphase(0) = -pi/2
    %
    %   [phase, modulus2]  =  BESSELPHASE(x) 
    %       where modulus2 = Y(x)^2+J(x)^2
    
    if any(imag(X)) || any(imag(nu))
        error('besselphase: only real arguments supported')
    end
    if numel(nu) > 1
        error('besselphase: only scalar order values are supported.')
    end
    if nu < 0 || any(X<0)
        error('besselphase: only positive arguments and order are supported.')
    end
    
    J = besselj(nu,X);
    Y = bessely(nu,X);
    mods = @(x,y) x - round(x./y).*y;

    % Fix matlab bug which results in incorrect overflow  near 0
    Y(isinf(Y)) = -Inf;

    phase = atan2(Y, J);

    for i=1:numel(X)
        x = X(i);
        if x > nu
            approx = sqrt(x^2 - nu^2)-nu*asec(x/nu) - pi/4;
            phase(i) = approx + mods(phase(i)-approx,2*pi);
        end
    end

    if nargout > 1
        modulus2 = (J.^2+Y.^2); 
    end
end

