# 20.04 version of ubuntu as base image
FROM    ubuntu:20.04

# Install the following packages
RUN     apt-get update && apt-get install software-properties-common -y &&\
        add-apt-repository ppa:deadsnakes/ppa && apt-get update &&\
        apt-get install python3.8 -y && apt install python3-pip -y &&\
        pip3 install --upgrade pip && pip3 install jupyter &&\
        mkdir /usr/local/notebooks && apt install tesseract-ocr &&\
	pip install -r https://raw.githubusercontent.com/ultralytics/yolov5/master/requirements.txt
        
# Install any Python modules required in the notebook
RUN pip3 install numpy && pip3 install ipython &&\
    pip3 install opencv-python && pip3 install sewar &&\
    pip3 install matplotlib && pip3 install torch &&\
    pip3 install torchvision && pip3 install keras &&\
    pip3 install scikit-learn && pip3 install matplotlib &&\
    pip3 install tensorflow && pip3 install pytesseract &&\
    pip3 install tensorflow-hub

# Add configuration file
ADD     config.py /root/.jupyter/jupyter_notebook_config.py

# Add ipynb files
ADD     Files /usr/local/notebooks/