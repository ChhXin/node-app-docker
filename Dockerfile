# 设置基础镜像为node12
FROM node:12 

# 在镜像中创建一个文件夹存放应用程序代码，这将是你的应用程序工作目录：
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source 在 Docker 镜像中使用 COPY 命令绑定你的应用程序
COPY . .

# 你的应用程序绑定的端口为 8080，所以你可以使用 EXPOSE 命令使它与 docker 的镜像做映射：
EXPOSE 8080

CMD [ "node", "server.js" ]


# docker build -t <your username>/node-web-app .

# docker run -p 49160:8080 -d <your username>/node-web-app
