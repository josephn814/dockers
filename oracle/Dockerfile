FROM oraclelinux:7.2

ADD wget.sh /tmp/wget.sh
ADD db_install.rsp /tmp/db_install.rsp
ADD dbca.rsp /home/oracle/dbca.rsp
ADD General_Purpose.dbc /home/oracle/General_Purpose.dbc
ADD start.sh /start.sh

# Install Tools
RUN yum install -y wget unzip && \
    yum install -y oracle-rdbms-server-12cR1-preinstall && \
    yum clean all && \
    chmod a+x /start.sh && \
    cd /tmp && \
    /bin/bash -c "source /tmp/wget.sh" && \
    sed -i 's/\(.*memlock\)/#\1/g' /etc/security/limits.d/oracle-rdbms-server-12cR1-preinstall.conf && \
    mkdir -p /opt/oracle && \
    chown -R oracle:oinstall /opt/oracle && \
    chmod -R 755 /opt/oracle && \
    su oracle -c "cd /tmp; unzip -q V46095-01_1of2.zip && unzip -q V46095-01_2of2.zip" && \
    su oracle -c "cd /tmp/database; ./runInstaller -silent -waitforcompletion -ignoreSysPrereqs -ignorePrereq -responseFile /tmp/db_install.rsp" && \
    /opt/oracle/oraInventory/orainstRoot.sh && \
    /opt/oracle/product/12.1.0/dbhome_1/root.sh && \
    yum remove -y wget unzip && \
    rm -rf /tmp/*

EXPOSE 1521
USER oracle
VOLUME ["/opt/oracle/data"]

ENTRYPOINT ["/start.sh"]
