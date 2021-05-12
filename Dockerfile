FROM node:alpine as builder
USER node
WORKDIR /usr/app
COPY package.json ./
RUN yarn
COPY ./ ./
RUN yarn build

FROM nginx
COPY --from=builder /usr/app/build /usr/share/nginx/html
