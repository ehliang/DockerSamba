FROM ubuntu:latest


ENV SMB_USER user
ENV SMB_PASS pass 
ENV SMB_GROUP smbshare

RUN apt-get update \ 
	&& apt-get --yes --no-install-recommends install \
	samba 

COPY entrypoint.sh /entrypoint.sh
COPY smb.conf /etc/samba/smb.conf

RUN chmod +x entrypoint.sh 

CMD ["/entrypoint.sh"] 
