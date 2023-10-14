# Move to correct repo
cd practice1

# Install helm using script
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

helm create springboot => creates the entire structure
sudo apt install tree
tree springboot => to see the structure visually on terminal

helm template springboot  => show the code yaml files with values replaced from Values.yaml

helm lint springboot  => will show the issues if there is any

minikube start => start the kubernetes cluster 

# helm installl <release_name> <chart_name>
helm install myfirstspringboot springboot
helm list -a
kubectl get all

# Now, let's upgrade version to 0.1.1 and replica_count to 2
vi springboot/Chart.yaml
vi springboot/values.yaml

helm upgrade myfirstspringboot springboot
helm list -a => will show the revision as 2
kubectl get all

# Get back to a previous release
helm rollback myfirstspringboot 1
kubectl get all

helm delete myfirstspringboot
helm list -a
