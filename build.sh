mkdir my-tengine
cd my-tengine
wget https://github.com/1582421598/tengine/archive/refs/tags/2.4.0.tar.gz -O tengine-2.4.0.tar.gz
wget https://github.com/aperezdc/ngx-fancyindex/releases/download/v0.5.2/ngx-fancyindex-0.5.2.tar.xz
wget https://github.com/FRiCKLE/ngx_cache_purge/archive/refs/tags/2.3.tar.gz
tar -axvf tengine-2.4.0.tar.gz
tar -axvf ngx-fancyindex-0.5.2.tar.xz
tar -axvf 2.3.tar.gz
sudo docker build -f ../Dockerfile -t my-tengine:latest .
sudo docker run -p 80:80 -p 443:443 --name Tengine -d my-tengine:latest