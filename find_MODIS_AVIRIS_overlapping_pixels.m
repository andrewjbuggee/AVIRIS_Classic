function pixels2use = find_MODIS_AVIRIS_overlapping_pixels(modis, inputs, aviris)

% Load suitable pixels file
suitablePixels_fileName = [inputs.savedCalculations_folderName,'suitablePixels.mat'];

folderName2Save = inputs.savedCalculations_folderName; % where to save the indices
numPixels2Calculate = inputs.pixels.num_2calculate; % number of pixels to use in our calcualtions

load(suitablePixels_fileName,'pixels');


% for all calculations, we need the 1km resolution pixel locations. So that
% is what we will use. We only use the 500 meter resolution pixel locaiton
% to show which pixels in the EV data set we used.

numSuitablePixels = length(pixels.res1km.row);

% I want to find MODIS pixels that are within the AVIRIS scene.
% Lets start be defining the AVIRIS scene border

avirisLatBorder = [aviris.position(:,1,2),aviris.position(:,end,2)];
avirisLongBorder = [aviris.position(:,1,1),aviris.position(:,end,1)];

% Now lets step through each row of the MODIS latitude and longitude arrays
% and find where the MODIS values are within the aviris border

suitablePixel_linearIndexing = sub2ind(size(modis.EV1km.radiance(:,:,1)), pixels.res1km.row, pixels.res1km.col);

suitablePixel_Lat = modis.geo.lat(suitablePixel_linearIndexing);
suitablePixel_long = modis.geo.long(suitablePixel_linearIndexing);


% Lets step through each latitude and find where the data is bounded by
% AVIRIS data in longitude

for ii = 1:size(avirisLatBorder,1)
    
    % Just pick one side of the AVIRIS image for now
    
% Find the overlap! We read this from left to right. So each row tells us
% whether or not suitablePixel_Lat(i)>avirisLarBorder
index = (suitablePixel_long')<=avirisLongBorder(:,1) & (suitablePixel_long')>=avirisLongBorder(:,2);


end

