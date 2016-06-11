function [phase, modulus2] =  airyphase(X)
    % AIRYPHASE Phase function for the Airy function
    %
    %   phase  =  AIRYPHASE(x) is the equal to arctan(Ai(x)/Bi(x)),
    %       where Ai and Bi are the Airy functions. The branch is 
    %       determined by continuity and airyphase(0) = pi/6
    %
    %   [phase, modulus2]  =  AIRYPHASE(x) 
    %       where modulus2 = Ai(x)^2+Bi(x)^2
    
    if any(imag(X)) 
        error('airyphase: only real arguments supported')
    end
    A = airy(0,X);
    B = airy(2,X);
    phase = atan2(A, B);
    for i = 1:numel(X)
        x = X(i);
        if x < 0
            approx = 2/3*(-x).^(3/2);
            phase(i) = approx + mods(phase(i)-approx, 2*pi);
        end
    end
    if nargout > 1
        modulus2 = (A.^2 + B.^2);
    end
end
