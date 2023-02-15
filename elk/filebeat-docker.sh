docker run -d \
  --name=filebeat \
  --user=root \
  --volume="$(pwd)/filebeat.docker.yml:/usr/share/filebeat/filebeat.yml:ro" \
  --volume="/var/lib/docker/containers:/var/lib/docker/containers:ro" \
  --volume="/var/run/docker.sock:/var/run/docker.sock:ro" \
  docker.elastic.co/beats/filebeat:8.6.1 filebeat -e --strict.perms=false \
  -E cloud.id="devo-logs:dXMtZWFzdC0yLmF3cy5lbGFzdGljLWNsb3VkLmNvbTo0NDMkNDU4OWY0ODVlMDM1NDkzMTg3NmJiYzZmMTg3MDdiMTYkY2I3OThmZDA0NTYzNDQyMTk1NTU0NmEzMzdlMzc0Njc=" \
  -E cloud.auth=elastic:elastic1234

docker run -d \
  --name=filebeat \
  --user=root \
  docker.elastic.co/beats/filebeat:8.6.1 filebeat -e --strict.perms=false \
  -E cloud.id="devo-logs:dXMtZWFzdC0yLmF3cy5lbGFzdGljLWNsb3VkLmNvbTo0NDMkNDU4OWY0ODVlMDM1NDkzMTg3NmJiYzZmMTg3MDdiMTYkY2I3OThmZDA0NTYzNDQyMTk1NTU0NmEzMzdlMzc0Njc=" \
  -E cloud.auth=elastic:elastic1234