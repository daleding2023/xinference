FROM onlyoffice/documentserver:latest
RUN apt update && apt install -y fonts-wqy-zenhei fonts-wqy-microhei
RUN /usr/bin/documentserver-generate-allfonts.sh
