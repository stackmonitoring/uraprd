#!/bin/bash
for i in $(docker images |awk '{print $1 ":" $2}'|sed '1d'|grep 'aec.cti');
do nome_novo=$(echo $i|cut -d':' -f1|sed 's|aec.cti|registry.aec.com.br/cti/|g'); tag=$(echo $i|cut -d':' -f2); docker tag $i $nome_novo:$tag; docker push $nome_novo:$tag; done


