FROM python:3.9 AS build
WORKDIR /app
COPY requirements.txt .
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt
RUN echo "BUILD STAGE FINISHE - installed all the requirements"


FROM python:3.9
COPY --from=build /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
# we are copying the packages from the build stage to the final stage ^
ENV AWS_ACCESS_KEY_ID=AKIAXLEKZJVVSTPGSZ6O
ENV AWS_SECRET_ACCESS_KEY=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
ENV AWS_DEFAULT_REGION=us-east-1
WORKDIR /app
COPY --from=build /app/requirements.txt /app/requirements.txt
COPY source /app/source
EXPOSE 5001
CMD ["python", "source/app.py"]

# in this first build we are justing downloading the dependencies and installing them
# in the second build we are copying the dependencies from the first build to the second build
# if we want to test it localy, we can run those commands:
# docker build -t my-python-app .
# docker run -p 5001:5001 my-python-app