# Strongly inspired by https://medium.com/@niklongstone/how-to-build-an-aws-lambda-function-with-python-3-7-the-right-way-21888e2edbe8
FROM amazonlinux:2018.03

ENV PYTHON_VERSION=3.8.2

RUN yum update -y \
 && yum -y install \
    gcc \
    libffi-devel \
    openssl-devel \
    tar \
    wget \
    zip \
    # bzip2-devel \
    # zlib-devel && \
 && yum clean all

WORKDIR opt

# Install Python
RUN wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz
RUN tar xzf Python-${PYTHON_VERSION}.tgz
RUN cd Python-${PYTHON_VERSION} ; ./configure --enable-optimizations ; make altinstall
RUN rm Python-${PYTHON_VERSION}.tgz \
 && rm -rf Python-${PYTHON_VERSION}
RUN python3.8 -V

# Install pip
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3.8 get-pip.py
RUN rm get-pip.py
RUN pip -V

# Install boto3
RUN python3.8 -m pip install boto3

# ADD package.sh /

# ENTRYPOINT ["/package.sh"]

CMD python -c "print('hello world')"