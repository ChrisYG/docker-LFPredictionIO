FROM ubuntu
MAINTAINER Chris Gao <chris.gao@laserfiche.com>

ENV PIO_HOME /LF_PredictionIO/PredictionIO-0.10.0-incubating
ENV PATH=${PIO_HOME}/bin:$PATH
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PIO_ROOT /LF_PredictionIO

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl openjdk-8-jdk libgfortran3 python-pip git curl sudo vim lsof \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

#RUN pip install predictionio
	
RUN git clone https://github.com/michaelzzh/LF_PredictionIO.git && \
	cd LF_PredictionIO && \
	./make-distribution.sh && \
	tar zxvf PredictionIO-0.10.0-incubating.tar.gz

RUN mkdir ${PIO_HOME}/vendors

RUN curl -O http://d3kbcqa49mib13.cloudfront.net/spark-1.5.1-bin-hadoop2.6.tgz \
	&& tar zxvfC spark-1.5.1-bin-hadoop2.6.tgz ${PIO_HOME}/vendors

	
#ElasticSearch
#RUN wget -O - https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.4.tar.gz | tar zx
#RUN mv /elasticsearch* /elasticsearch

#HBase
#RUN wget -O - http://archive.apache.org/dist/hbase/hbase-1.0.0/hbase-1.0.0-bin.tar.gz  | tar zx
#RUN mv /hbase* /hbase
#RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /hbase/conf/hbase-env.sh 

#Python SDK
#RUN apt-get install -y python-pip
#RUN pip install pytz
#RUN pip install predictionio

#For Spark MLlib
#RUN apt-get install -y libgfortran3 libatlas3-base libopenblas-base	