FROM ubuntu:latest
LABEL description="Container include all services for working rest api"
RUN mkdir -p /home/$USER/www/logs /home/$USER/www/temp
WORKDIR /home/$USER/www
COPY . .
RUN apt-get update && apt-get install -y python3 python3-pip && apt-get install -y gunicorn
RUN pip install -r requirements.txt
