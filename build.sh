mkdir my-tengine
cd my-tengine
wget https://github.com/1582421598/tengine/archive/refs/tags/2.3.3.tar.gz -O tengine-2.3.3.tar.gz
wget https://github.com/aperezdc/ngx-fancyindex/releases/download/v0.5.2/ngx-fancyindex-0.5.2.tar.xz
wget https://github.com/FRiCKLE/ngx_cache_purge/archive/refs/tags/2.3.tar.gz
wget https://github.com/hongzhidao/nginx-upload-module/archive/refs/heads/master.zip
tar -axvf tengine-2.3.3.tar.gz
tar -axvf ngx-fancyindex-0.5.2.tar.xz
tar -axvf 2.3.tar.gz
unzip master.zip
sudo docker build -t my-tengine:latest .
sudo docker run -p 80:80 -p 443:443 --name tengine -d my-tengine:latest