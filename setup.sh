#!/usr/bin/env bash

docker build . -t galp-challenge:0.0.3

kubectl apply -f ./k8s/deployment.yaml

kubectl apply -f ./k8s/service.yaml

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.1.0/deploy/static/provider/cloud/deploy.yaml

kubectl apply -f ./k8s/ingress.yaml

kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80
