FROM ubuntu:20.04

# Create app directory
WORKDIR /app
ADD . /app

# Install Teseract
RUN apt-get update && apt-get install -y apt-utils && apt-get install -y software-properties-common && add-apt-repository -y ppa:alex-p/tesseract-ocr
RUN apt-get install -y tesseract-ocr
ADD https://github.com/tesseract-ocr/tessdata/raw/master/eng.traineddata /usr/share/tesseract-ocr/4.00/tessdata/
ADD https://github.com/adrianlazaro8/Tesseract_sevenSegmentsLetsGoDigital/raw/master/Trained%20data/lets.traineddata /usr/share/tesseract-ocr/4.00/tessdata/

# Install Node.js
RUN apt-get install --yes curl
RUN curl --silent --location https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install --yes nodejs

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
RUN npm install -g nodemon
RUN npm install --production

CMD ["npm", "start"]
#CMD ["tesseract", "image.jpg", "phototest", "-l eng", "--psm 1", "--oem 2", "txt", "pdf", "hocr"]