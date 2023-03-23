#node镜像版本
FROM node:18-alpine

#在image中创建文件夹
RUN mkdir -p /home/app

#将该文件夹作为工作目录
WORKDIR /home/app

# 将node工程下所有文件拷贝到Image下的文件夹中
COPY . /home/app

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
RUN yarn install

EXPOSE 8000

ENV NODE_ENV=production

#执行npm start命令，启动Node工程
CMD yarn start:server