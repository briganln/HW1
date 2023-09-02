%Homework 01 Part 1
%assignment worked on collaboratively for part 1, Independantly for part 2
clear all, close all
n=100; %Instead of n=10, use 100 to finely sample matrix
I = zeros(n, n, n); %create cube with finely sampled 3D matrix

%define units 
x=1:1:n;
y=1:1:n; 
z=1:1:n;

%defines as cm (as shift and scale)
x=x/10; % changing scale from 0-100 to 0-10 (divide by 10)
x=x-5; % shifts x range by -5 (range shifts from (0 to 10) to (-5 to 5)) bring 0 to center of cube
y=y/10; %can also use 'y=x;' to make same as x above
y=y-5;
z=z/10; %can also use 'z=x;' to make same as x above
z=z-5;

%shows vector in this plane to see if grid is right (value range)
figure, plot(z), title('z vector'), snapnow
figure, plot(y), title('y vector'), snapnow
figure, plot(x), title('x vector'), snapnow

[X,Y,Z] = meshgrid(x,y,z); %combines x, y, z, vectors to make matrix/cube

%%
%Create a sphere 5cm centered inside cube
%sphere filled with ones

distance = sqrt(X.^2 + Y.^2 + Z.^2); %equation for distance(uses pathagorean theorem in 3 dimensions)creates distance variable, places sphere at specified distance within X, Y, Z)?
%if many matrices/vectors need '.' after variable
%eventually can use fire, 'figure, im(distance)', 'figure, im(X)' etc...
slice_x=distance(3,:,:); %slice for x=3
%need squeeze to get rid of '1' dimension (i.e. 1x100x100)
figure
imagesc(squeeze(slice_x)), title('x = 3');
snapnow
slice_y=distance(:,3,:);
figure
imagesc(squeeze(slice_y)), title('y = 3');
snapnow
figure
slice_z=distance(:,:,8);
imagesc(squeeze(slice_z)), title('z = 8');
snapnow

%%

%I = some change to I based on distance to make a sphere
%(have I and have distance)
%If radius of 5cm sphere, want to mask out values ___ above or below? 5
%Mask function: 

I(distance<2.5)=1; %fills ones for all values with a distance of less than 2.5 in 3D volume(sphere distance of 5)
%Jonathan wll give us figure, im(___) tool to view all slices at same time
%take all distances below 2.5 (radius) in I, assigning them to ones
figure % z = center slice
imagesc(squeeze(I(:,:,50))), title('z = 50 (center)');%take slice 50 because sampled 100x100x100 (50 should be middle)
snapnow
figure % z = +2.4cm
imagesc(squeeze(I(:,:,74))), title('z = 74 (+2.4cm)');%74 equal to +2.4cm if 50 equal to center or (Z=0)
snapnow
%check diameter
%distance in cm (5cm)
%radius of 2.5cm (half distance)


%integrate: add up slices to get one slice?
%resolution


%%