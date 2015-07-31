FROM ubuntu:14.04

MAINTAINER Paul Nechifor

RUN apt-get update && \
    apt-get install -y subversion && \
    svnadmin create /svn && \
    chmod -R 777 /svn && \
    echo '[general]\npasword-db = passwd\nanon-access = write'> /svn/conf/svnserve.conf && \
    echo 'svn=svn' > /svn/conf/passwd && \
    mv /svn /svn2 && \
    apt-get clean && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 3690

CMD [ ! -e /svn/db ] && cp -r /svn2/* /svn/; svnserve -dr /svn; while pidof svnserve >/dev/null; do sleep 1; done
