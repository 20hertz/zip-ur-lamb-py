#!/bin/bash
mkdir temp
python3.7 -m pip install opencv-python -t temp
rm -f /package/opencv-python.zip

cd temp
zip -r /package/opencv-python.zip *