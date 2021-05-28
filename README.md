# pascal-microservice

Inspiration for this project [here](https://medium.com/@marcusfernstrm/create-rest-apis-with-freepascal-441e4aa447b7).

## Building docker image
To build the docker image, first clone the repository and then execute the following command:

```
docker build -t <imagename:tag> .
```

## Running the container
To run the built image in a container locally, execute the following command:

```
docker run -p 9080:9080 <imagename:tag>
```
Once the container is running, navigate to ```http://localhost:9080/time``` or ```http://localhost:9080/greeting/<name>```
