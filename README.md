----
####Terms of Use

Copyright (c) 2012 by DVMM Laboratory

Department of Electrical Engineering</br>
Columbia University</br>
Rm 1312 S.W. Mudd, 500 West 120th Street</br>
New York, NY 10027</br>
USA


If it is your intention to use this code for non-commercial purposes, such as in academic research, this code is free.

####Instruction

An example of semi-supervised graphical model and alternating inference algorithm on a small-scale dataset
Run test.m to go over the process. 
*************************************************************

The following packages are used for learning the tree model and graphical inference:
latentTree:
http://people.csail.mit.edu/myungjin/latentTree.html
UGM:
http://www.di.ens.fr/~mschmidt/Software/UGM.html
The code has been tested in Windows Server 2008 R2. It should be compatible also for Linux and Mac.
Compile (mex) the above packages before running the code. 

The source code for the above packages is included for the ease of the readers. All the terms and conditions of the original packages apply. If you want to get the either of the packages removed, please contact yuxinnan@ee.columbia.edu, and we will remove it immediately.

******************************************************
For structural learning as described in the paper, we recommend BMRM (http://users.cecs.anu.edu.au/~chteo/BMRM.html) for C/C++ users, and Andrea Vedaldi's Matlab wrapper (http://www.vlfeat.org/~vedaldi/code/svm-struct-matlab.html) with SVM struct (http://www.cs.cornell.edu/People/tj/svm_light/svm_struct.html) for Matlab users.


******************************************************
Please cite the following papers when using the data/code:
Felix X. Yu; Rongrong Ji; Ming-Hen Tsai; Guangnan Ye; Shih-Fu Chang.
Weak attributes for large-scale image retrieval, CVPR 2012

Please also consider to cite our technical report covering more experiments:
Felix X. Yu; Rongrong Ji; Ming-Hen Tsai; Guangnan Ye; Shih-Fu Chang.
Experiments of image retrieval using weak attributes, Technical Report # CUCS 005-12

*************************************************
Report bugs/questions to Felix X. Yu: yuxinnan@ee.columbia.edu