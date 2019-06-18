function brightness(folder, output, filename) {
//run("Brightness/Contrast...");
open(folder + filename);
run("Subtract Background...", "rolling=50");
run("Enhance Contrast", "saturated=0.35");
run("Apply LUT");
run("Duplicate...", " ");
run("Images to Stack", "name=Stack title=[] use");
saveAs("Tif", output + filename);
}
folder = "/Users/max/Desktop/Office/Phd/Data/N1E_115/SiRNA/SiRNA_12/6hours/20180719_160659_929/";
output = folder + "/duplicated/";
setBatchMode(true);
list = getFileList(folder)
for (i = 0; i <list.length; i++) 
		brightness(folder, output, list[i]);

setBatchMode(false);




