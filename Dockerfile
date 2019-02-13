FROM python:2.7
MAINTAINER Vijay Jadhav "vijay.jadhav@gmail.com"
COPY HelloWorld.py .
WORKDIR .
ENTRYPOINT ["python"]
CMD ["HelloWorld.py"]
