FROM openjdk:8-jdk-alpine

WORKDIR /app

COPY Hello.class /app

CMD ["java", "Hello"]
