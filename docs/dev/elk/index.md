# Elasticsearch / Logstash / Kibana

## Présentation
Description de stack ELK
Déploiement et savoir faire

Mise en place de réccupération des métrics ?
	-> Audite

## Prerequis :
 - Centos 7
 - 4G RAM
 - 2 CPU

 https://www.elastic.co/guide/en/cloud-enterprise/2.1/ece-prereqs.html

 https://grokdebug.herokuapp.com/

---

> /usr/share/elasticsearch/bin/elasticsearch-setup-passwords interactive

> curl -X PUT "localhost:9200/elk-001?pretty"

## SSH Port Forward list :
> ssh -L 127.0.0.1:8080:local_ip:80 user@ip # centreon
> ssh -L 127.0.0.1:5601:local_ip:5601 user@ip # kibana
> ssh -L 127.0.0.1:9200:local_ip:9200 user@ip # elasticsearch
