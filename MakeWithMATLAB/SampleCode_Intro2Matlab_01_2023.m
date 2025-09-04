%% See slide 18 of "Intro To MATLAB" workshop ppt for sources of following code.
%  Sean Scully

%{
% 2D graph of function
x=0:.1:4;
y=-2:.1:1;
[X,Y]=meshgrid(x,y);
Z=sin(X).*cos(Y);
contour(x,y,Z);
mesh(X,Y,Z); 
% 3D graph of function
%}

%{
% Vertical 3D spiral
t=0:.1:5*pi;
r=exp(t/10);
x=r.*cos(t);
y=r.*sin(t);
z=t;
plot3(x,y,z);
%}

%{
% 2D Mandelbrot set plot
[X,Y]=meshgrid(-2:.015:.5,-1.25:.015:1.25);
C=X+j*Y;
W=100*ones(size(C));
Z=zeros(size(C));
for n=1:50,
    Z=Z.*Z+C;
    h=find(abs(Z)<2);
    if ~isempty(h),
        W(h)=n*ones(size(h));
    else
        break
    end;
end;
clear C Z
pcolor(X,Y,W)
%}

% "ezmesh" for graphing 3D radiation intensity for 'U(theta)=cos(theta)^2'
fx = inline('cos(theta)^2*sin(theta)*cos(phi)');
fy = inline('cos(theta)^2*sin(theta)*sin(phi)');
fz = inline('cos(theta)^2*cos(theta)')
figure
ezmesh(fx,fy,fz,[0 2*pi 0 pi],100)
colormap([0 0 0])
axis equal
set(gca, 'xdir','reverse','ydir','reverse')