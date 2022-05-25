%% Read AVHRR Cloud Properties Data


% By Andrew John Buggee
%%

% Determine which computer you're using
computer_name = whatComputer;

% Find the folder where the mie calculations are stored
% find the folder where the water cloud files are stored.
if strcmp(computer_name,'anbu8374')==true
    
    folderName = '/Users/anbu8374/Documents/MATLAB/HyperSpectral_Cloud_Retrieval/AVIRIS_Classic/AVHRR_Data/';
    fileName = 'patmosx_v05r03_NOAA-19_des_d20150205_c20170603.nc';
    
elseif strcmp(computer_name,'andrewbuggee')==true
    
    mie_calc_folder_path = '/Users/andrewbuggee/Documents/CU-Boulder-ATOC/Hyperspectral-Cloud-Droplet-Retrieval/LibRadTran/libRadtran-2.0.4/Mie_Calculations/';
    water_cloud_folder_path = '/Users/andrewbuggee/Documents/CU-Boulder-ATOC/Hyperspectral-Cloud-Droplet-Retrieval/LibRadTran/libRadtran-2.0.4/data/wc/';
    
end

