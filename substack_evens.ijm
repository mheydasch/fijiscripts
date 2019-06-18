function slice(folder, output, filename) {
//run("Brightness/Contrast...");
//takes all images in a folder and
//makes a substack of all even slices and gives them the prefix "actin_"
//deletes all these stacks from the original image and saves the original with the prefix "nucleus_"
open(folder + filename);
run("Make Substack...", "delete slices=2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64");
id1=getTitle();
filenumber= getList("image.titles");
for (f = 0; f < filenumber.length; f++){
	fn=f+1;
	selectWindow(filenumber[f]);
	if (f==1){
		prefix="actin_";
	}
	else if(f==0){
		prefix="nucleus_";
	}
	saveAs("tif", output + prefix + filename);
	close;
	//selectWindow("Substack (2,4,6,8,10, ... 64)");
	//saveAs("tif", output + "actin" + filename);
	//selectWindow(filename);
	//saveAs("tif", output + "nucleus" + filename);
}

}
folder = "/Volumes/imaging.data/Max/REF52/beta_pix/pix_2/test/";
output = folder;
setBatchMode(true);
list = getFileList(folder)
for (i = 0; i <list.length; i++){ 
		slice(folder, output, list[i]);
		}

setBatchMode(false);




