![Summit image](https://github.com/FarrandTom/vpc-cloud-wmlce/blob/master/readme-images/summit.png)
# Build Your Own Mini-Summit Supercomputer!
## This repository will show you how to setup a Watson ML Community Edition environment running on the [AC922](https://www.ibm.com/uk-en/marketplace/power-systems-ac922?cm_mmc=Search_Google-_-Systems_Systems+-+Power-_-WW_IUK-_-ac922_e&cm_mmca1=000038PQ&cm_mmca2=10009402&cm_mmca7=1006613&cm_mmca8=aud-837641639994:kwd-390487818696&cm_mmca9=Cj0KCQjw3qzzBRDnARIsAECmryqQvgJ-sOed6oFZPP__o0cdMu3iU7aPdgsBbXgETNIQrPAAOoNa6nwaAvchEALw_wcB&cm_mmca10=376016768572&cm_mmca11=e&gclid=Cj0KCQjw3qzzBRDnARIsAECmryqQvgJ-sOed6oFZPP__o0cdMu3iU7aPdgsBbXgETNIQrPAAOoNa6nwaAvchEALw_wcB&gclsrc=aw.ds) in IBM Cloud.

### What is Summit?
[Summit](https://www.top500.org/system/179397) is currently the world's fastest supercomputer and is powered by the AC922 GPU-accelerated server. Summit has been used since it's creation to push boundaries of scientific discovery, and has recently been making headlines for it's use in the battle against COVID-19 ([1](https://www.nextgov.com/emerging-tech/2020/03/researchers-oak-ridge-national-lab-tap-supercomputing-help-combat-coronavirus/163708/), [2](https://www.extremetech.com/computing/307381-the-fastest-supercomputer-on-earth-is-being-deployed-against-coronavirus), [3](https://hexus.net/tech/news/systems/140552-ibm-summit-tasked-finding-covid-19-drug-treatments/)). 

This repository automates the process of setting up your very own mini-Summit supercomputer on the IBM Cloud. By following this repository you will have your own private cloud with the Watson Machine Learning Community Edition software stack for machine & deep learning running on an IBM POWER AC922- all identical to that run on Summit itself!

### What is Watson Machine Learning Community Edition?
[WMLCE](https://www.ibm.com/support/knowledgecenter/en/SS5SF7) is a tightly integrated, tested, and supported bundle of open source Python frameworks/libraries for tackling machine & deep learning problems. The software distributions are pre-compiled and include everything you need to build and manage a distributed environment, including the deep learning frameworks and any supporting software components that they require to run. 

It includes the popular deep learning packages (TensorFlow, PyTorch), optimised model distribution libraries (Horovod), and GPU-accelerated machine learning libraries (XGBoost, RAPIDS). Furthermore, there are powerful IBM technologies included too:
- Large Model Support: Integrated with both TensorFlow and PyTorch, this feature allows the successful training of deep learning models that would otherwise exhaust GPU memory and abort with "out-of-memory" errors. LMS manages this oversubscription of GPU memory by temporarily swapping tensors to host memory when they are not needed. This is included as part of the installed TensorFlow and PyTorch versions- usage patterns can be found [here](https://www.ibm.com/support/knowledgecenter/en/SS5SF7_1.7.0/navigation/wmlce_getstarted_tflms.html)
- [SnapML](https://ibmsoe.github.io/snap-ml-doc/index.html): This library aims to remove training time as a bottleneck for machine learning applications. Snap ML supports a large number of classical machine learning models and scales gracefully to data sets with billions of examples and/or features. It offers distributed training, GPU acceleration and supports sparse data structures.

WMLCE runs on both POWER and x86 CPU architectures, however expect to see the best performance when running on POWER chips. 

### What is IBM Virtual Private Cloud?
[IBM Cloud Virtual Private Cloud (VPC)](https://www.ibm.com/cloud/vpc) is your own protected space in the IBM Cloud. Use VPCs to isolate and provision network segments on the IBM Cloud where you can deploy and manage compute, storage and networking cloud resources. Connect VPCs to your on-premises resources to expand available capacity during peak usage times. 

In this instance, we'll be using VPC for it's access to powerful AC922 compute instances. Through Terraform we will automatically provision the infrastructure, and then install WMLCE on top of that. The result will be a development environment using a Jupyter Lab front end, serving a WMLCE conda environment. 

The VPC environment is incredibly flexible, and can be scaled out or up- feel free to clone and customise the code to suit your needs. 

### Where next?
* **Start from Scratch**: To create your **new VPC cluster** click [here](https://github.com/FarrandTom/vpc-cloud-wmlce/tree/master/new_vpc_cluster).
* **Add New Users**: To spin up a new WMLCE environment and add **new storage** to it, within an existing VPC cluster, click [here](https://github.com/FarrandTom/vpc-cloud-wmlce/tree/master/new_storage). 
* **Continue a Project**: To spin up a new WMLCE environment, attach **existing storage** to it, within an existing VPC cluster, click [here](https://github.com/FarrandTom/vpc-cloud-wmlce/tree/master/existing_storage).

### To Do:
* Figure out SSL. Currently connection is not secured over HTTPS. Therefore you are exposed to person-in-the-middle style attacks, and should not upload confidential data. In a future release I will fix this.
* Better way to keep the latest NVIDIA drivers, alongside the latest WMLCE version.
* Provide ability for multi-tenancy through the use of JupyterHub
* Ensure good user experience
* Back up and archiving through linkage to a COS bucket.
* Automated test suite for the environment- simply Jupyter NB which can be dropped in to test all of the major packages are functioning correctly.
* Automate grabbing of ID values by entering the names of the components. This could be done through a python script I'm sure.
