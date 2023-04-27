FROM openjdk
COPY target/*.jar bankingapp.jar
ENTRYPOINT ["java","-jar","bankingapp.jar"]
