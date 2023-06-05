FROM rocker/tidyverse:4.0.3

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y tesseract-ocr tesseract-ocr-fra libmagick++-dev libpoppler-cpp-dev libtesseract-dev libleptonica-dev pip

ENV WKDIR /home/leo-ferre/
RUN mkdir -p $WKDIR
WORKDIR $WKDIR

COPY . .

RUN Rscript -e "install.packages('tesseract', repos = 'https://packagemanager.posit.co/cran/2020-12-28', dependencies = TRUE)"
RUN pip install -r requirements.txt

ENTRYPOINT "/bin/bash"

