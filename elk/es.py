from elasticsearch import Elasticsearch
from datetime import datetime

# Password for the 'elastic' user generated by Elasticsearch
ELASTIC_PASSWORD = "elastic1234"

# Found in the 'Manage Deployment' page
CLOUD_ID = "devo-logs:dXMtZWFzdC0yLmF3cy5lbGFzdGljLWNsb3VkLmNvbTo0NDMkNDU4OWY0ODVlMDM1NDkzMTg3NmJiYzZmMTg3MDdiMTYkY2I3OThmZDA0NTYzNDQyMTk1NTU0NmEzMzdlMzc0Njc="

# Create the client instance
client = Elasticsearch(
    cloud_id=CLOUD_ID,
    basic_auth=("elastic", ELASTIC_PASSWORD)
)

# Successful response!
client.info()
# {'name': 'instance-0000000000', 'cluster_name': ...}
#print(client.info())

doc = {
    'author': 'author_name',
    'text': 'Interensting content...',
    'timestamp': datetime.now(),
}
# for i in range(1,10):
#   resp = client.index(index="test-index", id=i, document=doc)
#   print(resp['result'])

#resp = client.search(index="test-index", query={"match_all": {}})
resp = client.search(index="test-index", query={"term": {"author": {"value": "ravi"}}})
print(resp)