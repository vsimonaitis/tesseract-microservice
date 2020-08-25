FROM jitesoft/tesseract-ocr:alpine
# Overriding default tesseract image entrypoint
ENTRYPOINT [""]

# Create app directory
WORKDIR /app
ADD . /app

# Install Node.js
USER root
RUN apk add --update nodejs npm nodejs-npm

# Install Teseract fonts
ADD https://github.com/tesseract-ocr/tessdata/raw/master/eng.traineddata /usr/local/share/tessdata/
ADD https://github.com/adrianlazaro8/Tesseract_sevenSegmentsLetsGoDigital/raw/master/Trained%20data/lets.traineddata /usr/local/share/tessdata/

# Install app dependencies
RUN npm install -g nodemon
RUN npm install --production

CMD ["npm", "start"]
#CMD ["tesseract", "image.jpg", "phototest", "-l eng", "--psm 1", "--oem 2", "txt", "pdf", "hocr"]