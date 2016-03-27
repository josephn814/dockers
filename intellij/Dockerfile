FROM josedeng/jdk:jdk-1.8.0_74

# Install the libraries needed to run a JVM in GUI mode 
RUN apt-get update && \
    apt-get install -y libxi6 libxrender1 libxtst6 libxext6 libfreetype6 git subversion mercurial && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

# Add the user and group so you don't see those annoying messages when shelled inside the container 
RUN groupadd --gid 1000 developer && \
    useradd --gid 1000 --uid 1000 --create-home --shell /bin/bash developer

VOLUME ["/home/developer"]

ENV HOME=/home/developer IDEA_JDK=$JAVA_HOME

RUN wget -q https://download.jetbrains.com/idea/ideaIU-2016.1.tar.gz -O /tmp/ide.tar.gz && \
    mkdir -p /opt/ide && \
    tar zxvf /tmp/ide.tar.gz --strip-components=1 -C /opt/ide && \
    rm /tmp/ide.tar.gz

USER developer

ADD start /opt/ide/start
RUN chown developer:developer /opt/ide/start && \
    chmod a+x /opt/ide/start

ENTRYPOINT ["/bin/bash"]
