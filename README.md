# Get Up and Running With Watson Machine Learning Community Edition (WMLCE)
## This repository will show you how to setup a WMLCE environment running on the AC922 in IBM Cloud.

### What is Watson Machie Learning Community Edition?
[WMLCE](https://www.ibm.com/support/knowledgecenter/en/SS5SF7) is a tightly integrated, tested, and supported bundle of open source Python frameworks/libraries for tackling machine & deep learning problems. The software distributions are pre-compiled and include everything you need to build and manage a distributed environment, including the deep learning frameworks and any supporting software components that they require to run. 

It includes the popular deep learning packages (TensorFlow, PyTorch), optimised model distribution libraries (Horovod), and GPU-accelerated machine learning libraries (XGBoost, RAPIDS). Furthermore, there are powerful IBM technologies included too:
- Large Model Support: Integrated with both TensorFlow and PyTorch, this feature allows the successful training of deep learning models that would otherwise exhaust GPU memory and abort with "out-of-memory" errors. LMS manages this oversubscription of GPU memory by temporarily swapping tensors to host memory when they are not needed. This is included as part of the installed TensorFlow and PyTorch versions- usage patterns can be found [here](https://www.ibm.com/support/knowledgecenter/en/SS5SF7_1.7.0/navigation/wmlce_getstarted_tflms.html)
- [SnapML](https://ibmsoe.github.io/snap-ml-doc/index.html): This library aims to remove training time as a bottleneck for machine learning applications. Snap ML supports a large number of classical machine learning models and scales gracefully to data sets with billions of examples and/or features. It offers distributed training, GPU acceleration and supports sparse data structures.

WMLCE runs on both POWER and x86 CPU architectures, however expect to see the best performance when running on POWER chips. This repo deploys onto the POWER architecture, specifically an AC922- the GPU accelerated server which powers the world's first and second largest supercomputers [Summit](https://www.top500.org/system/179397) and [Sierra](https://www.top500.org/system/179398).

### What is IBM Virtual Private Cloud?
IBM Cloud Virtual Private Cloud (VPC) is your own protected space in the IBM Cloud. Use VPCs to isolate and provision network segments on the IBM Cloud where you can deploy and manage compute, storage and networking cloud resources. Connect VPCs to your on-premises resources to expand available capacity during peak usage times. 

In this instance, we'll be using VPC for it's access to powerful AC922 compute instances. Through Terraform we will automatically provision the infrastructure, and then install WMLCE on top of that. The result will be a development environment using a Jupyter Lab front end, serving a WMLCE conda environment. 

The VPC environment is incredibly flexible, and can be scaled out or up- feel free to clone and customise the code to suit your needs. 

### Where next?
* To create your VPC cluster click here.
* To spin up a new WMLCE environment and add new persistent storage to it, within an existing VPC cluster, click here. 
* To spin up a new WMLCE environment, attach existing persistent storage to it, within an existing VPC cluster, click here.
