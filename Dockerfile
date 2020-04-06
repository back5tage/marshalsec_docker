FROM maven:3.6.3-jdk-8

ARG EXPNAME=ExportObject
ARG PORT=1389
ARG MSSWAY=ldap
ARG JAVAVER=1.6
ENV EXPNAME=$EXPNAME
ENV PORT=$PORT
COPY exp/* /exp/
COPY scripts/* /exp/
COPY settings.xml $MAVEN_HOME/conf/
RUN cd / && git clone https://github.com/mbechler/marshalsec.git
WORKDIR /marshalsec
RUN mvn clean package -DskipTests 
RUN cp ./target/marshalsec-*-SNAPSHOT-all.jar /exp/ && cd /exp/ && javac $EXPNAME.java -target $JAVAVER -source $JAVAVER && case $MSSWAY in "ldap") cp run_marshalsec_ldap.sh run_marshalsec.sh;; "rmi") cp run_marshalsec_rmi.sh run_marshalsec.sh;; esac && chmod +x run_marshalsec.sh

CMD ["/exp/run_marshalsec.sh"]
