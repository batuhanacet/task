
FROM node:22-alpine AS base
WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .

EXPOSE 8080

CMD ["node", "server.js"]


FROM base AS test
RUN npm install --only=dev
CMD ["node", "server.js"]


FROM base AS production
RUN npm prune --production
CMD ["node", "server.js"]
