%% ----- READ IN AVIRIS DATA -----


%   2) dataType - 1= Byte: 8-bit unsigned integer (unit8); 2= Integer: 16-bit signed integer (int16);
%   3= Long: 32-bit signed integer (int32); 4=Floating-Point: 32-bit
%   single-precision (single); 5= Double-Precision: 64-bit double precision
%   floating point (double); 6= Complex: Read-Imaginary pair of signle-precision
%   floating-point (complex)

%   3) headerOffset - The number of bytes that make up the header of a
%   given file. Often the header offset is 0, and the header information is
%   simply stored in a seperate file altogether. 

%   4) interLeave - This tells matlab how the band data is interleaved, or
%   stored, in the data cube. The options are 1) 'bsq' - or band
%   sequential, which is the simplest format. 2) 'bip' - or band
%   interleaved by pixel. 3) 'bil' - or band interleaved by line. 

%   5) byteOrder - Order of bytes in integer, long integer, 64-bit integer,
%   unsigned 64-bit integer, floating point, double precision and complex.
%   0 = 'native' (Host); 1 = 'ieee-be' (Netowrk)


% The ouput being extracted is calibrated radiance, which has units of
% micro-watts per centimeter squared per nanometer per steradian



% By Andrew J. Buggee
%% --- DEFINE FOLDER AND FILE NAMES ---

function [aviris] = readAVIRIS_classic(folderName,fileName)
        
% folderName = ['/Users/andrewbuggee/Documents/MATLAB/CU Boulder/Hyperspectral_Cloud_Retrievals/AVIRIS/AVIRIS-Classic-data/8_20_2018/orthorectified_radiance_data/'];

% fileName = 'f180820t01p00r09rdn_e';

%% --- READ THE HEADER FILE ---

radiance_hdr_file = [folderName,fileName,'_sc01_ort_img.hdr'];
radiance_file = [folderName,fileName,'_sc01_ort_img'];

gain_file = [folderName,fileName,'.gain'];

info = enviinfo(radiance_hdr_file);
aviris.gain = importdata(gain_file); % import gain values that convert int16 to radiance

dataDim = [info.Height,info.Width,info.Bands]; % lines, samples, bands. taken from _ort_img.hdr file
dataType = info.DataType; % Taken from _obs.hdr file
headerOffset = info.HeaderOffset; % header offset. Taken from _obs.hdr file
interLeave = info.Interleave; % Taken from _obs.hdr file
byteOrder = info.ByteOrder; % Taken from _obs.hdr file



aviris.radiance = multibandread(radiance_file,dataDim,dataType,headerOffset,interLeave,byteOrder); % mu-W/cm^2/nm/sr

% convert radiance from int16 to micro-watts/cm^2/nm/sr. Accroding to the
% readme file: "When each spectrum is divided by the factors in this file 
% the 16-bit integers are converted to radiance in units of
% (micro-watts/cm^2/nm/sr)"

gain_vals = reshape(aviris.gain(:,1),1,1,[]);
aviris.radiance = aviris.radiance./repmat(gain_vals,size(aviris.radiance,1),size(aviris.radiance,2),1);  % micro-watts/cm^2/nm/sr

aviris.wavelengths = info.Wavelength; % wavelength measured in nm



end

