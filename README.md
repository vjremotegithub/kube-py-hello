ubuntu@srv001:~/HellWorld$ kubectl cluster-info
Kubernetes master is running at https://srv001:6443
KubeDNS is running at https://srv001:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
ubuntu@srv001:~/HellWorld$


ubuntu@srv001:~/HellWorld$ ls
dockerfile  HelloWorld.py
ubuntu@srv001:~/HellWorld$


ubuntu@srv001:~/HellWorld$sudo docker build -t helloworld:latest .

ubuntu@srv001:~/HellWorld$sudo docker login --username=dockercloud2017

ubuntu@srv001:~/HellWorld$sudo docker push dockercloud2017/helloworld:latest

ubuntu@srv001:~/HellWorld$kubectl run helloworld --image=dockercloud2017/helloworld





ubuntu@srv001:~/HellWorld$ sudo docker images
REPOSITORY                           TAG                 IMAGE ID            CREATED              SIZE
helloworld                           latest              be75f60dafbd        About a minute ago   912MB
python                               2.7                 0313c3892dbc        18 hours ago         912MB
weaveworks/weave-npc                 2.5.1               789b7f496034        3 weeks ago          49.6MB
weaveworks/weave-kube                2.5.1               1f394ae9e226        3 weeks ago          148MB
k8s.gcr.io/kube-proxy                v1.13.2             01cfa56edcfc        4 weeks ago          80.3MB
k8s.gcr.io/kube-controller-manager   v1.13.2             b9027a78d94c        4 weeks ago          146MB
k8s.gcr.io/kube-apiserver            v1.13.2             177db4b8e93a        4 weeks ago          181MB
k8s.gcr.io/kube-scheduler            v1.13.2             3193be46e0b3        4 weeks ago          79.6MB
k8s.gcr.io/coredns                   1.2.6               f59dcacceff4        3 months ago         40MB
k8s.gcr.io/etcd                      3.2.24              3cab8e1b9802        4 months ago         220MB
k8s.gcr.io/pause                     3.1                 da86e6ba6ca1        13 months ago        742kB
ubuntu@srv001:~/HellWorld$ sudo docker run helloworld
Hello World
ubuntu@srv001:~/HellWorld$


ubuntu@srv001:~/HellWorld$ kubectl get pods
NAME                                       READY   STATUS      RESTARTS   AGE
coredns-86c58d9df4-85sk9                   1/1     Running     10         14d
coredns-86c58d9df4-nf24l                   1/1     Running     10         14d
etcd-opscycans1srv001                      1/1     Running     10         14d
helloworld-54f97c8757-4cr4h                0/1     Completed   2          31s
kube-apiserver-opscycans1srv001            1/1     Running     10         14d
kube-controller-manager-opscycans1srv001   1/1     Running     10         14d
kube-proxy-hcxmh                           1/1     Running     10         14d
kube-proxy-jm4x6                           1/1     Running     10         14d
kube-proxy-wqcwg                           1/1     Running     10         14d
kube-scheduler-opscycans1srv001            1/1     Running     10         14d
kubernetes-dashboard-57df4db6b-bjvwn       1/1     Running     9          13d
tiller-deploy-69ffbf64bc-xw64h             1/1     Running     7          8d
weave-net-j4tmr                            2/2     Running     30         14d
weave-net-jtwkl                            2/2     Running     27         14d
weave-net-zqbws                            2/2     Running     30         14d
ubuntu@srv001:~/HellWorld$ k logs helloworld-54f97c8757-4cr4h
Hello World
ubuntu@srv001:~/HellWorld$ k logs helloworld-54f97c8757-4cr4h
Hello World
ubuntu@srv001:~/HellWorld$
