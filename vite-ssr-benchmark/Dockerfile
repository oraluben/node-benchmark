FROM anolis-registry.cn-zhangjiakou.cr.aliyuncs.com/openanolis/anolisos as wrk

RUN yum install -y git make gcc unzip tar
RUN git clone --depth=1 https://github.com/wg/wrk.git
WORKDIR /wrk
RUN make -j

FROM node:latest

COPY --from=wrk /wrk/wrk /usr/bin/

COPY --chown=node . /vite-ssr
WORKDIR /vite-ssr

RUN npm install && npm run build

ENV NODE_ENV=production
ENTRYPOINT node server/ >/dev/null & sleep 1 && wrk -d 30 -c 24 http://localhost:3000 | grep Requests/sec | awk '{print $2}'
