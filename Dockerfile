FROM nginx:alpine
COPY . /usr/share/nginx/html
EXPOSE 8080
# Cloud Run → port 8080; nginx:alpine uses conf.d and/or http.d.
CMD sh -c 'sed -i "s/listen[[:space:]]*80/listen 8080/g" /etc/nginx/conf.d/default.conf 2>/dev/null; sed -i "s/listen[[:space:]]*80/listen 8080/g" /etc/nginx/http.d/default.conf 2>/dev/null; exec nginx -g "daemon off;"'
