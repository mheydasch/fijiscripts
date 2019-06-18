function slice(folder, output, filename) {
//run("Brightness/Contrast...");
//takes all images in a folder and
//unstacks them"
open(folder + filename);
run("Stack to Images");
id1=getTitle();
filenumber= getList("image.titles");
fn=0;
for (f = 0; f < filenumber.length; f++){
	fn=fn+1;
	selectWindow(filenumber[f]);
	prefix="t" + fn + "_";
	saveAs("tif", output + prefix + filename);
	close;
	}
}


folder = "/Volumes/imaging.data/Max/REF52/beta_pix/pix_2/test/";
output = folder + "unstacked/";
setBatchMode(true);
list = getFileList(folder)
for (i = 0; i <list.length; i++){
	if(endsWith(list[i],".tif")&&indexOf(list[i],"nucleus")>=0){ 
		slice(folder, output, list[i]);
		}
}
setBatchMode(false);



