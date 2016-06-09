function [phase, modulus2] =  besselprimephase(nu,X)
    % BESSELPRIMEPHASE Phase function for the Bessel function derivatives
    %
    %   phase  =  BESSELPRIMEPHASE(nu,x) is the equal to 
    %       arctan(Y'(nu,x)/J'(nu,x)) where J and Y are the Bessel
    %       functions of the first and second kind. The branch is 
    %       determined by continuity and besselprimephase(0) = pi/2
    %
    %   [phase, modulus2]  =  BESSELPRIMEPHASE(x) 
    %       where modulus2 = Y'(x)^2+J'(x)^2
    
    if any(imag(X)) || any(imag(nu))
        error('besselphase: only real arguments supported')
    end
    if numel(nu) > 1
        error('besselphase: only scalar order values are supported.')
    end
    if nu < 0 || any(X<0)
        error('besselphase: only positive arguments and order are supported.')
    end
    

    dJ = 0.5*(besselj(nu-1,X)-besselj(nu+1,X));
    dY = 0.5*(bessely(nu-1,X)-bessely(nu+1,X));
    mods = @(x,y) x - round(x./y).*y;

    % Fix matlab bug which results in incorrect overflow 
    % and problems with our evaluation
    dY(isnan(dY) || isinf(dY)) = Inf;

    phase = atan2(dY,dJ);
    for i=1:numel(X)
        x = X(i);
        if x > nu
            approx = sqrt(x^2 - nu^2)-nu*asec(x/nu) + pi/4;
            phase(i) = approx + mods(phase(i)-approx,2*pi);
        end
    end
    if nargout > 1
        modulus2 = (dJ.^2+dY.^2); 
    end
end
