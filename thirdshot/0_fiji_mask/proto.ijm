rename("stack");
setSlice(4);
run("Duplicate...", "title=NIR channels=1");
selectWindow("stack");
setSlice(3);
run("Duplicate...", "title=BLUE channels=1");
selectWindow("stack");
close();
imageCalculator("Subtract create 32-bit", "NIR","BLUE");
rename("dividend");
imageCalculator("Add create 32-bit", "NIR","BLUE");
rename("divisor");
run("Macro...", "code=v=pow(v,0.18)");
imageCalculator("Divide create 32-bit", "dividend","divisor");
rename("index");
selectWindow("dividend");
close();
selectWindow("divisor");
close();
selectWindow("NIR");
close();
selectWindow("BLUE");
close();
run("Multiply...", "value=1000");
run("Invert");
run("Brightness/Contrast...");
run("Enhance Contrast", "saturated=0.35");
run("Enhance Contrast", "saturated=0.35");
run("Enhance Contrast", "saturated=0.35");
run("Enhance Contrast", "saturated=0.35");
run("8-bit");
setMinAndMax(0, 160);
run("Apply LUT");
run("Auto Local Threshold", "method=Sauvola radius=15 parameter_1=0.2 parameter_2=0 white");
run("Watershed");
