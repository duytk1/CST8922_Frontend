# Use a lightweight Nginx image
FROM nginx:alpine
 
# Remove default site config
RUN rm /etc/nginx/conf.d/default.conf
 
# Add your custom config
COPY default.conf /etc/nginx/conf.d/default.conf
 
# Add your frontend files
COPY . /usr/share/nginx/html
 
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]