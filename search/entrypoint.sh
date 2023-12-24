#!/bin/bash


# Check if data has already been initialized
if [ ! -f /app/initialized.txt ]; then
    # Wait for Elasticsearch to be ready
    until $(curl --output /dev/null --silent --head --fail http://elasticsearch:9200); do
        echo "Waiting for Elasticsearch to start..."
        sleep 5
    done

    # Send data to Elasticsearch
    curl -XPUT "elasticsearch:9200/items" -H "kbn-xsrf: reporting" -H "Content-Type: application/json" -d'
    {
      "mappings": {
        "properties": {
          "name": {
            "type": "text",
            "analyzer": "standard"
          },
          "linktoimg": {
            "type": "text",
            "index": false
          }
        }
      }
    }'
    curl -s -H "Content-Type: application/json" -X POST "elasticsearch:9200/items/_bulk" --data-binary "@docsx.json"

    # Mark initialization as complete
    touch /app/initialized.txt
fi

# Exit the script
exit 0