#!/bin/bash
  
docker rmi shivbhole/node

cd /root/retech/

docker build -t node .

docker image tag node shivbhole/node

docker image push shivbhole/node

kub_pre=$(kubectl get all -o wide | grep 3000 | awk '{print $5}' | cut -d ":" -f 2 | cut -d "/" -f 1)

echo $kub_pre


kubectl delete -f /root/lb.yml


kubectl delete -f /root/deploy.yml

kubectl apply -f /root/deploy.yml

kubectl apply -f /root/lb.yml
