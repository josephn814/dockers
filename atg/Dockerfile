FROM josedeng/jdk:jdk-1.7.0_80

ADD wget.sh /tmp/wget.sh
ADD installer.properties /installer/installer.properties
ADD start.sh /start.sh

RUN dos2unix /tmp/wget.sh && \
    dos2unix /start.sh && \
    dos2unix /installer/installer.properties && \
    apt-get -q update && \
    apt-get -q -y install wget unzip && \
    source /tmp/wget.sh && \
    mv /tmp/V46005-01.zip /installer/Platform.zip && \
    mv /tmp/V45986-01.zip /installer/ACC.zip && \
    mv /tmp/V45987-01.zip /installer/AssistedSelling.zip && \
    mv /tmp/V46007-01.zip /installer/ReferenceStore.zip && \
    mv /tmp/V74842-01.zip /installer/CPQReferenceIntegration.zip && \
    mv /tmp/V77159-01.zip /installer/MarketingCloudReferenceIntegration.zip && \
    mv /tmp/V46993-01.zip /installer/RightNowReferenceIntegration.zip && \
    mv /tmp/V75744-01.zip /installer/SiebelReferenceIntegration.zip && \
    mv /tmp/V46994-01.zip /installer/SocialRelationshipManagementReferenceIntegration.zip && \
    chmod a+x /start.sh && \
    chmod 755 -R /installer && \
    mkdir -p /opt/ATG && \
    chown -R developer:developer $JAVA_HOME && \
    chown -R developer:developer /opt/ATG && \
    chown -R developer:developer /installer && \
    apt-get clean && \
    apt-get autoremove wget --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER developer
VOLUME ["$JAVA_HOME"]
VOLUME ["/opt/ATG"]

ENTRYPOINT ["/start.sh"]

