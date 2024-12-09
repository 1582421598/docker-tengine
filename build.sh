BASE_DIR=$(realpath $(dirname "$0"))
mkdir "$BASE_DIR/my-tengine"
cd "$BASE_DIR/my-tengine"
wget https://github.com/1582421598/tengine/archive/refs/heads/master.zip -O tengine.zip
wget https://github.com/aperezdc/ngx-fancyindex/archive/refs/heads/master.zip -O ngx-fancyindex.zip
wget https://github.com/nginx-modules/ngx_cache_purge/archive/refs/heads/master.zip -O ngx_cache_purge.zip
unzip tengine.zip
unzip ngx-fancyindex.zip
unzip ngx_cache_purge.zip
sudo docker build -f ../Dockerfile -t my-tengine:latest .
sudo docker run -p 80:80 -p 443:443 --name tengine --volume "$BASE_DIR/my-tengine/nginx/conf:/app/docker/my-tengine/conf" --volume "$BASE_DIR/my-tengine/nginx/html:/app/docker/my-tengine/html" --volume "$BASE_DIR/my-tengine/nginx/logs:/app/docker/my-tengine/logs" --volume "$BASE_DIR/my-tengine/nginx/ssl:/app/docker/my-tengine/ssl" --volume "$BASE_DIR/my-tengine/nginx/shared:/app/docker/my-tengine/shared" --add-host=host.docker.internal:host-gateway -d my-tengine:latest