docker-compose down -v --remove-orphans
docker system prune -a --volumes
docker-compose up -d


docker exec -it datareplication-postgres-1 psql -U dbz -d example -c "
CREATE TABLE if not exists table_name (

);



curl -X POST server-link:8083/connectors \
  -H "Content-Type: application/json" \
  -d @postgres-connector-config.json

curl -X POST server-link:8083/connectors \
  -H "Content-Type: application/json" \
  -d @sink-config.json


Monitoring the connectors

curl server-link:8083/connectors/persons-jdbc-sink/status | jq
curl server-link:8083/connectors/postgres-connector/status | jq


docker exec -it datareplication-kafka-1 kafka-console-consumer \
  --bootstrap-server kafka:9092 \
  --topic dbz.public.persons \
  --from-beginning \
  --property print.key=true \
  --property key.separator=" | "
