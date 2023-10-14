# Move to correct repo
cd practice1

# Install helm
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


# Helm chart repositories
helm repo list  => list all the upstream helm repositories added
helm repo add bitnami https://charts.bitnami.com/bitnami => add upstream repo to local helm charts
helm repo list
helm search repo bitnami   =>  list all the hel-charts available in repo "bitnami"
helm repo update => pull all the latest changes from bitnami repo

helm repo index practice1 => add index file containing packaged charts
helm repo remove bitnami 
helm repo list

# Helm Chart Plugins
helm plugin list => list all the installed plugins
# Install helm-diff plugin
helm plugin install https://github.com/databus23/helm-diff
helm list -a
tree practice1
cd practice1
helm install mystockmanager springboot => install release 1
helm list -a
cd springboot
vi values.yaml => change replica_count to 1 from 2
helm upgrade mystockmanager .  => to apply the changes and create another release
helm list -a => verify the revision number updated to 2 
helm diff revision mystockmanager 1 2  => find the difference between two plugins
helm plugin uninstall diff

# Helm Linting
helm lint springboot/ => will show errors before actual deployment 
helm list -a
minikube start => start local minikube cluster
minikube status => check if status is running or not
helm install mystockmanager springboot
kubectl get svc 
kubectl get svc mystockmanager-springboot
kubectl get svc -n default
minikube service --all => to get list of all running svc along with their ip's to access the application running
kubectl get events => will show last seen time, type(Normal, Warning), reason, object(node/minikube, pod/stockmanager-springboot) and message 
kubectl describe svc mystockmanager => get details of particular service
helm delete mystockmanager => delete release
helm list -a => list all releases of a particular namespace


