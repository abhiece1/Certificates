function [a0,an,bn]=mysquare()
    N=100;
    T=4;
    syms t n
    w0=2*pi/T;
    a0=1/T*(int(2,t,T,T));
    an=2/T*(int(2*cos(n*w0*t),t,0,T/2));
    bn=2/T*(int(2*sin(n*w0*t),t,0,T/2));
    
    yy=[a0,an,bn];   %List of fourier series coefficients
    disp('List of fourier series coefficients')
    disp(yy)
    
    %Gibbs phenomena is shown at max and min amplitude
    n1=1;
    n2=1;
    while n1<12  %PARTIAL SUM OF 1,2,3,4,5,6 COMPONENTS
        
        An=sum(subs(an*cos(n*w0*t),n,1:n1));
        Bn=sum(subs(bn*sin(n*w0*t),n,1:n1));
        ft=a0+An+Bn;
       
        %title("Square wave graph with partial sum of components and Gibbs Phenomena")
        caption = sprintf('( sum till n= %d )', n2);
        
        subplot(1,7,n2)
        n2=n2+1;
        
        if(n1<12)
            fplot(ft)
            xlabel(caption)
        end
        n1=n1+2;
    end
    n1=n1-1;
    subplot(1,7,n2)
    An1=sum(subs(an.*cos(n*w0*t),n,1:N));
    Bn1=sum(subs(bn.*sin(n*w0*t),n,1:N));
    
    ft1=a0+An1+Bn1;
    caption = sprintf('( FINAL PLOT)');
    
    fplot(ft1)
    xlabel(caption)
end
