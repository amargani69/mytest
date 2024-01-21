FROM ubuntu

WORKDIR /app

COPY requirements.txt /app
COPY finalproject /app

RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip install -r requirements.txt && \
    chmod -R 777 /app && \
    chmod -R 777 /app/finalproject && \
    cd myproject

EXPOSE 8000

ENTRYPOINT ["python3"]
CMD ["app.py", "runserver", "0.0.0.0:8000"]
