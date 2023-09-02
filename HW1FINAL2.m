clear all, close all
n=200; %use 200 to finely sample matrix (200 samples over 10cm = 0.05 cm)
I = zeros(n, n, n); %create cube with finely sampled 3D matrix

%define units 
x=1:1:n;
y=1:1:n; 
z=1:1:n;

%defines as cm (shift and scale)
x=x/20; % changing scale from 0-200 to 0-10 (divide by 10)
x=x-5; % shifts x range by -5 (range shifts from (0 to 10) to (-5 to 5)) bring 0 to center of cube
y=y/20; %can also use 'y=x;' to make same as x above
y=y-5;
z=z/20; %can also use 'z=x;' to make same as x above
z=z-5;

%shows vector in this plane to see if grid is right (value range)
figure, plot(z), title('z vector'), snapnow
figure, plot(y), title('y vector'), snapnow
figure, plot(x), title('x vector'), snapnow

[X,Y,Z] = meshgrid(x,y,z); %combines x, y, z, vectors to make matrix???;

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


%I = some change to I based on distance to make a sphere
%(have I and have distance)
%If radius of 5cm sphere, want to mask out values ___ above or below? 5
%Mask function: 

I(distance<2.5)=1; %fills ones for all values with a distance of less than 2.5 in 3D volume(sphere distance of 5)
%Jonathan wll give us figure, im(___) tool to view all slices at same time
%take all distances below 2.5 (radius) in I, assigning them to ones

figure
imagesc(squeeze(I(:,:,100))), title('z = 100 (center)');%take slice 50 because sampled 100x100x100 (50 should be middle)
snapnow

%%
%sample 10 slices, 0.05cm apart (equal to 0.5mm)
%tried method of concatenation without sucess, other failed methods attempted
%below
A=I(:,:,100);
B=I(:,:,100);
C4=[A,B];
C5=[A;B];
figure
imagesc(squeeze(C4))
snapnow
figure
imagesc(squeeze(C5))
snapnow
D1=horzcat(A,B);
figure
imagesc(D1)
snapnow

publish(HW1FINALPart2.mlx,'pdf')


%C = cat(3,A,B)
%szC = size(C);
%figure
%imagesc(squeeze(szC))
%%
%Don't believe indexing is correct here
%M1 = x(10,10)
%M2 = y(10,10)
%A2 = {M1,M2};

%Cvert = cat(1,A2{:})
%figure
%imagesc(Cvert)

%%
%y1=int8(y)
%x1=int8(x)
%C6=[y1,x1]

%slab_b=distance(1,95:105,1);
%slab_a=distance(95:105,1,1);

%D1=horzcat(C6)
%figure
%imagesc(D1)

%A2=I(x)
%B2=I(y)
%C=[A2,B2]
%D2=horzcat(A2,B2)

%I_xy=I(:,:,95:105);
%I_yz=I(:,95:105,:),[1 3 2];
%figure
%imagesc(I_xy)
%D4=horzcat(I_xy,I_yz)
%imagesc(D4)
%figure
%Im = squeeze(imfilter(I, fspecial('average',[10 10]),'replicate'));
%figure
%Im = squeeze(imfilter(I, fspecial('average',[200 200]),'replicate'));

%M2 = y(0,0)
%A2 = {M1,M2};

%Cvert = cat(1,A2{:})
%figure
%imagesc(Cvert)


%A1=x(10:20)
%B1=y(10:20)
%C1 = cat(3,A1,B1)
%szC1 = size (C1)
%figure
%imagesc(squeeze(szC1))

%%
%y1=int8(y)
%x1=int8(x)
%C6=[y1,x1]

%slab_b=distance(1,95:105,1);
%slab_a=distance(95:105,1,1);

%D1=horzcat(C6)
%figure
%imagesc(D1)

%A2=I(x)
%B2=I(y)
%C=[A2,B2]
%D2=horzcat(A2,B2)

%I_xy=I(:,:,95:105);
%I_yz=I(:,95:105,:),[1 3 2];
%figure
%imagesc(I_xy)
%D4=horzcat(I_xy,I_yz)
%imagesc(D4)
%figure
%Im = squeeze(imfilter(I, fspecial('average',[10 10]),'replicate'));
%figure
%Im = squeeze(imfilter(I, fspecial('average',[200 200]),'replicate'));