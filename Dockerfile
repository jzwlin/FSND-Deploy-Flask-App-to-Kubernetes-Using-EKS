#Use the python:stretch image as a source image 
FROM python:stretch 

#Set up an app directory 
COPY . /app
WORKDIR /app 

#Install needed python requirements 
RUN pip install pyjwt
RUN pip install flask
RUN pip install gunicorn
RUN pip install pytest

#Define an entrypoint which will run the main app using the Gunicorn WSGI server
ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]
