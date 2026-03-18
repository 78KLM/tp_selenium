# STAGE 1 : build
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /src

# Copier d'abord pom.xml seul pour profiter du cache Docker
COPY pom.xml .
# Pré-télécharger les dépendances
RUN mvn dependency:go-offline -B

# Copier le code source et compiler
COPY src ./src
# -DskipTests est requis car il n'y a pas de tests JUnit ici
RUN mvn package -DskipTests -B

# STAGE 2 : production
FROM tomcat:10.1-jre17-temurin-jammy

# Supprimer les webapps par défaut de Tomcat pour faire le ménage
RUN rm -rf /usr/local/tomcat/webapps/*

# Copier le WAR produit par le stage 1 en le renommant ROOT.war
COPY --from=build /src/target/boutique.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]