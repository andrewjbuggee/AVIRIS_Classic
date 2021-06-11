%% ----- READ IN AVIRIS DATA -----


%   2) dataType - 1= Byte: 8-bit unsigned integer; 2= Integer: 16-bit signed integer;
%   3= Long: 32-bit signed integer; 4=Floating-Point: 32-bit
%   single-precision; 5= Double-Precision: 64-bit double precision floating
%   point; 6= Complex: Read-Imaginary pair of signle-precision
%   floating-point

%   3) headerOffset - 

%   4) interLeave - 

%   5) byteOrder - Order of bytes in integer, long integer, 64-bit integer,
%   unsigned 64-bit integer, floating point, double precision and complex.
%   0 = 'native' (Host); 1 = 'ieee-be' (Netowrk

% By Andrew J. Buggee
%% --- READING IN ENVI FILES ---

folderName = '/Users/anbu8374/Documents/Hyperspectral Droplet Retrieval/AVIRIS Classic Data/1_31_2015/orthorectified radiance data/';
fileName = 'f150131t01p00r09rdn_b_sc01_ort_img';

dataDim = [8730,983,224]; % lines, samples, bands. taken from _obs.hdr file
dataType = 'single'; % Taken from _obs.hdr file
headerOffset = 0; % header offset. Taken from _obs.hdr file
interLeave = 'bil'; % Taken from _obs.hdr file
byteOrder = 'native'; % Taken from _obs.hdr file

X = multibandread([folderName,fileName],dataDim,dataType,headerOffset,interLeave,byteOrder);

