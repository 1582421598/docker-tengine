mkdir my-tengine
cd my-tengine
wget https://github.com/1582421598/tengine/archive/refs/heads/master.zip -O tengine.zip
wget https://github.com/aperezdc/ngx-fancyindex/archive/refs/heads/master.zip -O ngx-fancyindex.zip
wget https://github.com/FRiCKLE/ngx_cache_purge/archive/refs/tags/2.3.tar.gz
unzip tengine.zip
unzip ngx-fancyindex.zip
tar -axvf 2.3.tar.gz
sudo docker build -f ../Dockerfile -t my-tengine:latest .
sudo docker run -p 80:80 -p 443:443 --name Tengine -d my-tengine:latest