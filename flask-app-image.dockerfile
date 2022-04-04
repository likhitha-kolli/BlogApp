# use the `mongo` image
# copy the app directory and any files needed for your implementation from your local to the container
# equip it with all the packages and installs needed to run the flask app (packages are defined in app/requirements.txt. `pip install -r app/requirements.txt`)
# expose the port flask app will run on
FROM mongo
COPY ./app /app

RUN apt-get update \
    && apt-get install -y python3.8 python3-pip \
    && python3.8 -m pip install --upgrade pip \
    && pip install -r app/requirements.txt

EXPOSE 5000
ENTRYPOINT [ "python3.8","/app/app.py"]
