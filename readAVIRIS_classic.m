%% ----- READ IN AVIRIS DATA -----


%   2) dataType - 1= Byte: 8-bit unsigned integer (unit8); 2= Integer: 16-bit signed integer (int16);
%   3= Long: 32-bit signed integer (int32); 4=Floating-Point: 32-bit
%   single-precision (single); 5= Double-Precision: 64-bit double precision
%   floating point (double); 6= Complex: Read-Imaginary pair of signle-precision
%   floating-point (complex)

%   3) headerOffset - 

%   4) interLeave - 

%   5) byteOrder - Order of bytes in integer, long integer, 64-bit integer,
%   unsigned 64-bit integer, floating point, double precision and complex.
%   0 = 'native' (Host); 1 = 'ieee-be' (Netowrk

% By Andrew J. Buggee
%% --- READING IN ENVI FILES ---

folderName = ['/Users/andrewbuggee/Documents/CU-Boulder-ATOC/Hyperspectral-Cloud-Droplet-Retrieval-Research/AVIRIS/',...
            'AVIRIS_Classic_data/8_20_2018/f180820t01p00r09rdn_e/'];
fileName = 'f150131t01p00r09rdn_b_sc01_ort_img';

fileName2 = '/Users/andrewbuggee/Documents/CU-Boulder-ATOC/Hyperspectral-Cloud-Droplet-Retrieval-Research/AVIRIS/AVIRIS_Classic _data/8_20_2018/f180820t01p00r09rdn_e';


headerFileName = [folderName,fileName,'.hdr'];

headerFileName2 = [fileName2,fileName,'.hdr'];


% dataDim = [8730,983,224]; % lines, samples, bands. taken from _obs.hdr file
dataDim = [1994,1069,224]; % lines, samples, bands. taken from _ort_img.hdr file
dataType = 'int16'; % Taken from _obs.hdr file
headerOffset = 0; % header offset. Taken from _obs.hdr file
interLeave = 'bip'; % Taken from _obs.hdr file
byteOrder = 'ieee-be'; % Taken from _obs.hdr file

X = multibandread([folderName,fileName],dataDim,dataType,headerOffset,interLeave,byteOrder);

%%

% Read the AVIRIS image (specify your image file name here)
hCube = hypercube(headerFileName2);

% Compute RGB, CIR, and falsecolored image
rgbImg = colorize(hCube, 'method', 'rgb', 'ContrastStretching', true);
cirImg = colorize(hCube, 'method', 'cir', 'ContrastStretching', true);
fcImg = colorize(hCube, 'method', 'falsecolored', 'ContrastStretching', true);

% Visualize results
figure
tiledlayout(1, 3)
nexttile
imagesc(rgbImg)
axis image off
title('RGB image')

nexttile
imagesc(cirImg)
axis image off
title('CIR image')

nexttile
imagesc(fcImg)
axis image off
title('False-colored image')
