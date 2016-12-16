function y2016_level12()
global d N w
N = 60;
P = zeros(N);

x = 0:N-1;
y = (0:N-1).';

Q = repmat(x.^2 + 3*x, N, 1) + 2.*repmat(x, N, 1).*repmat(y,1,N) + repmat(y + y.^2,1,N) + 1362;

c = sum(dec2bin(Q)=='1',2);
w = reshape(round(c/2) == c./2,N,N);
w = 1*w;
w(31+1,39+1)=5;


d = 0*w + Inf;
d(2,2) = 0;
d(w==0) = NaN;


x = 3;
y = 2;

new_step(x,y,0,1);

d(d==Inf)=NaN;

disp(['max dist = ' num2str(max(d(:)))]);
disp(['number of locations = ' num2str(2+sum(sum(~isnan(d))))]);




function new_step(x,y,d_prev,step)
global d N w
if d(x,y) > d_prev + 1
    d(x,y) = d_prev + 1;
    
    w(x,y) = 5;
    
    image(40*w./2)
    drawnow;
    
    % new step
    if step+1 <= 50
        if and(x+1 > 0, x+1 <= N)
            if ~isnan(d(x+1,y))
                new_step(x+1,y,d(x,y),step+1);
            end
        end
        if and(x-1 > 0, x-1 <= N)
            if ~isnan(d(x-1,y))
                new_step(x-1,y,d(x,y),step+1);
            end
        end
        if and(y+1 > 0, y+1 <= N)
            if ~isnan(d(x,y+1))
                new_step(x,y+1,d(x,y),step+1);
            end
        end
        if and(y-1 > 0, y-1 <= N)
            if ~isnan(d(x,y-1))
                new_step(x,y-1,d(x,y),step+1);
            end
        end
    end
end





