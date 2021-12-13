# galp-challenge

Desafio técnico proposto para o processo de seleção da Galp :portugal:

## Descrição

> O exercício é o seguinte:
>
> - Cria um ficheiro Dockerfile com uma página web estática, que deverá exibir uma mensagem com texto(e.g. "Hello World").
> - Criar um Deployment Kubernetes usando a imagem resultante do Dockerfile produzido anteriormente.
> - Criar um Service e um Ingress Kubernetes que irá disponibilizar esse Deployment num "Path" definido.
>
> Pode ser feito para executar localmente e projeto deve ser versionado num repositório Git.

## Executando o projeto

Ao gerar a imagem do contêiner como descrito no `Dockerfile` e com os manifestos do Kubernetes aplicados no cluster,
pode-se acessar o sítio estático na seguinte URL:

```http://<cluster-address>/challenge```

Devido ao fato do projeto ter sido realizado em uma máquina Windows com o auxílio do Docker Desktop para
deployment de um cluster Kubernetes single-node, serão necessárias algumas adaptações para executá-lo
satisfatoriamente num ambiente semelhante.

### NGINX Ingress Controller

Podes instalar o Ingress Controller com o comando a seguir:

```kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.1.0/deploy/static/provider/cloud/deploy.yaml```

### Port-forwarding

Em um ambiente de nuvem, não é necessário fazer o direcionamento de portas para acessar o Ingress. Entretanto,
durante o desenvolvimento na máquina local isto foi necessário para se chegar ao resultado esperado: acessar o
Deployment através da rota correta.

Podes fazer o direcionamento de portas com o comando a seguir:

```kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80```
