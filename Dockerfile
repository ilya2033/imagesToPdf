FROM ubuntu:22.04
RUN mkdir /files
WORKDIR /files
RUN apt-get update && apt-get install unar wget imagemagick -y 
RUN wget https://tinyurl.com/custom-imagemagick-policy -O ./custom-policy.xml
RUN cp -f ./custom-policy.xml /etc/ImageMagick-6/policy.xml
RUN sed -i '/disable ghostscript format types/,+6d' /etc/ImageMagick-6/policy.xml
