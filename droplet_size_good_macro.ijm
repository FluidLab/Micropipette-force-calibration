// Set the ImageJ scale for XIMEA MQ013RG-ON camera on stereomicroscope (4.8 um/pixel) 
//----- Magnification ----- Distance (known=1 unit=um) -----
//----- 0.75x ----- 0.15625 -----
//----- 1x ----- 0.208333333 -----
//----- 2x ----- 0.416666667 -----
//----- 3x ----- 0.625 -----
run("Set Scale...", "distance=0.208333333 known=1 unit=um");
run("Gaussian Blur...", "sigma=5 stack");
setAutoThreshold("Default");
//run("Threshold...");
setOption("BlackBackground", false);
run("Convert to Mask", "method=Default background=Light calculate");

run("Fill Holes", "stack");
run("Set Measurements...", "area mean standard min centroid fit center stack display redirect=None decimal=10");



run("Analyze Particles...", "size=0-Infinity display clear add stack");
saveAs("Results", "Z:/Jared/Projects/Micropipette force calibration/calibration_drop_size_um_scaled.csv");
