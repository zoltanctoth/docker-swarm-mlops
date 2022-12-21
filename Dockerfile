FROM python:3.10-alpine

WORKDIR /exampleapp

RUN apk add bash
COPY ./requirements.txt /exampleapp/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /exampleapp/requirements.txt
COPY ./api.py /exampleapp/

EXPOSE 80
ENV FAST_ID=11
COPY start.sh /
RUN chmod +x /start.sh
CMD ["/start.sh"]


