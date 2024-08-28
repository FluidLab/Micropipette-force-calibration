//// NOTE: this script asssumes that you are working with a time series (with frames) rather than a Z-stack (with slices). 
//// To change a z-stack to time series in ImageJ, click Image->Properties... and change Slices to 1, and Frames to whatever number of frames you have

// Set the ImageJ scale for XIMEA MQ013RG-ON camera on stereomicroscope (4.8 um/pixel) under 1x magnification
run("Set Scale...", "distance=0.208333333 known=1 unit=um");

setAutoThreshold("Default");
setOption("BlackBackground", false);
run("Convert to Mask", "method=Default background=Light calculate");

// Set measurements
run("Set Measurements...", "center frame stack limit display redirect=None decimal=9");

// Get dimensions and print them
getDimensions(width, height, channels, slices, frames);
print("Image dimensions:");
print("Width: " + width);
print("Height: " + height);
print("Channels: " + channels);
print("Slices: " + slices);
print("Frames: " + frames);

// Clear results before measuring
run("Clear Results");

// Measure each frame
for (i = 1; i <= frames; i++) {
    setSlice(i);
    run("Measure");
    print("Measured frame: " + i);
}

print("Measurements completed");
print("Total results: " + nResults);