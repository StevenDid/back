FROM maven:3.9-eclipse-temurin-21 as builder

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

FROM eclipse-temurin:21-jre

WORKDIR /app

COPY --from=builder /app/target/michelin-back-0.0.1-SNAPSHOT.jar michelin-back.jar

CMD ["java", "-jar", "michelin-back.jar"]