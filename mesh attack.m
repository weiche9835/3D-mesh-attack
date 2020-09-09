% translation

poisition = 100
fv = stlread('Bunny.stl');
newcoordT = fv.Points + poisition;

% rotation(x)

degree = 30
newcoordRx = [fv.Points(:,1),fv.Points(:,2)*cosd(degree) - fv.Points(:,3)*sind(degree),fv.Points(:,2)*sind(degree) + fv.Points(:,3)*cosd(degree)]

% rotation(y)

degree = 30
newcoordRy = [fv.Points(:,1)*cosd(degree) + fv.Points(:,3)*sind(degree),fv.Points(:,2),fv.Points(:,3)*cosd(degree) - fv.Points(:,1)*sind(degree)]

% rotation(z)

degree = 30
newcoordRz = [fv.Points(:,1)*cosd(degree) - fv.Points(:,2)*sind(degree),fv.Points(:,1)*sind(degree)+fv.Points(:,2)*cosd(degree),fv.Points(:,3)]

% uniform scaling

scale = 2
newcoordUS = fv.Points *scale

% vertex reordering

randnum = randperm(size(fv.Points,1))

for i=1:size(fv.Points,1)
eval(sprintf('newcoordVR(%d,:) = fv.Points(%d,:)',i,randnum(i)))
end

% noise addition

noise = 30
mass = sum(fv.Points)/size(fv.Points,1);
randomnum = randi([-noise,noise],size(fv.Points,1),1)/10000;
newcoordNA = fv.Points + (randomnum *mass);
