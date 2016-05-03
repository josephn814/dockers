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
    mv /tmp/V78217-01.zip /installer/Platform.zip && \
    mv /tmp/V78201-01.zip /installer/ACC.zip && \
    mv /tmp/V78203-01.zip /installer/AssistedSelling.zip && \
    mv /tmp/V78224-01.zip /installer/ReferenceStore.zip && \
    mv /tmp/V100746-01.zip /installer/StoreAccelerator.zip && \
    mv /tmp/V100779-01.zip /installer/CPQReferenceIntegration.zip && \
    mv /tmp/V100780-01.zip /installer/MarketingCloudReferenceIntegration.zip && \
    mv /tmp/V100781-01.zip /installer/RightNowReferenceIntegration.zip && \
    mv /tmp/V100782-01.zip /installer/SiebelReferenceIntegration.zip && \
    mv /tmp/V100783-01.zip /installer/SocialRelationshipManagementReferenceIntegration.zip && \
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

