FROM ubuntu:20.04

# Install Teseract
RUN apt-get update && apt-get install -y apt-utils && apt-get install -y software-properties-common && add-apt-repository -y ppa:alex-p/tesseract-ocr
RUN apt-get update && apt-get install -y tesseract-ocr
ADD https://github.com/tesseract-ocr/tessdata/raw/master/eng.traineddata /usr/share/tesseract-ocr/4.00/tessdata/
ADD https://github.com/adrianlazaro8/Tesseract_sevenSegmentsLetsGoDigital/raw/master/Trained%20data/lets.traineddata /usr/share/tesseract-ocr/4.00/tessdata/

# Install Node.js
RUN apt-get install --yes curl
RUN curl --silent --location https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install --yes nodejs

RUN npm install -g nodemon

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN cd /app
RUN npm install




CMD ["npm", "start"]
#CMD ["tesseract", "image.jpg", "phototest", "-l eng", "--psm 1", "--oem 2", "txt", "pdf", "hocr"]