-----------------------------------------------------------------------------
------------------- How to Read AVIRIS Data files ---------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
------------------------- By Andrew J. Buggee -------------------------------
-----------------------------------------------------------------------------


Intro:
------
	AVIRIS classic stores data files in the ENVI binary image format. Each image is a binary image cube with a detached ASCII header. There are 3 levels of data. Level 0: raw data, Level 1: calibrated radiances, Level 2: atmospherically corrected surface radiances. The level 1 calibrated data us usually orthorectified, meaning the data is mapped to an (x,y) coordinate system. This mapping is stored in the geometry file .IGM


AVIRIS Data Products:
---------------------
	Level 0 (raw data):
	-------------------


	Level 1 (calibrated radiance): 
	------------------------------


	Level 2 (reflectance):
	----------------------