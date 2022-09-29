FROM python:3

# git auth is provided by mounting a git credentials file
# to /root/.git-credentials
RUN git config --global user.name "docs deployer" && \
    git config --global user.email "null@null.com" && \
    git config --global credential.helper 'store --file=/root/.git-credentials'

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

ENTRYPOINT ["mkdocs"]
CMD ["serve"]