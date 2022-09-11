FROM maven:3.8.6-openjdk-11
ENV GOLDEN_DB_URL=localhost
ENV GOLDEN_DB_PORT=3306
ENV GOLDEN_DB_NAME=tawazun
ENV GOLDEN_DB_USERNAME=root
ENV GOLDEN_DB_PASSWORD=1234
WORKDIR /app
ADD pom.xml .
RUN ["/usr/local/bin/mvn-entrypoint.sh","mvn","verify","clean","--fail-never"]
COPY . .
RUN mvn package
EXPOSE 8080
ENTRYPOINT ["java","-jar","target/tawazun.war"]