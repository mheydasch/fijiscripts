function brightness(folder, output, filename) {
//run("Brightness/Contrast...");
open(folder + filename);
run("Subtract Background...", "rolling=50 stack");
run("Enhance Contrast", "saturated=0.35");
run("Apply LUT", "stack");
run("Gaussian Blur...", "sigma=3.5 stack");
saveAs("Tif", output + filename);
}
folder = "/home/mheydasch/myimaging/N1E115/SiRNA/SiRNA_24/40x_timelapse/";
output = folder + "adjusted/";
setBatchMode(true);
list = getFileList(folder)
for (i = 0; i <list.length; i++){ 
if(endsWith(list[i],".tif")&&indexOf(list[i],"mCherry")>=1){ 
		brightness(folder, output, list[i]);
}
}
setBatchMode(false);




