ubuntu@OPSCYCANS1SRV001:~/HellWorld/http_helloworld$ ls -lrt
total 12
-rw-rw-r-- 1 ubuntu ubuntu 186 Feb 14 11:44 index.py
-rw-rw-r-- 1 ubuntu ubuntu 117 Feb 14 11:44 Dockerfile
-rw-rw-r-- 1 ubuntu ubuntu   6 Feb 14 11:46 requirements.txt
ubuntu@OPSCYCANS1SRV001:~/HellWorld/http_helloworld$


# Build Image
===============
ubuntu@OPSCYCANS1SRV001:~/HellWorld/http_helloworld$sudo docker build -t http_helloworld .

# Tag Image
===============

sudo docker tag http_helloworld:latest dockercloud2017/http_helloworld:latest

# Push Image to my docker repo
===============

sudo docker push dockercloud2017/http_helloworld:latest

# Deploy to kube with two replicas
=============

kubectl run http-helloworld --image=dockercloud2017/http_helloworld --replicas=2

# Expose the http-helloworld via svc
=============


kubectl expose deployment http-helloworld  --type=NodePort --name=http-helloworld-service --port=5000



# Test
=========

ubuntu@OPSCYCANS1SRV001:~/HellWorld/http_helloworld$ k get deploy
NAME                   READY   UP-TO-DATE   AVAILABLE   AGE
coredns                2/2     2            2           15d
helloworld             0/1     1            0           20h
http-helloworld        2/2     2            2           13m
kubernetes-dashboard   1/1     1            1           14d
tiller-deploy          1/1     1            1           9d
ubuntu@OPSCYCANS1SRV001:~/HellWorld/http_helloworld$ k get svc
NAME                      TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
http-helloworld-service   NodePort    10.109.42.111   <none>        5000:30838/TCP   9m33s
kube-dns                  ClusterIP   10.96.0.10      <none>        53/UDP,53/TCP    15d
kubernetes-dashboard      NodePort    10.101.118.41   <none>        443:30209/TCP    14d
tiller-deploy             ClusterIP   10.96.247.68    <none>        44134/TCP        9d


ubuntu@OPSCYCANS1SRV001:~/HellWorld/http_helloworld$ k get pods
NAME                                       READY   STATUS             RESTARTS   AGE
coredns-86c58d9df4-85sk9                   1/1     Running            11         15d
coredns-86c58d9df4-nf24l                   1/1     Running            11         15d
etcd-opscycans1srv001                      1/1     Running            11         15d
helloworld-54f97c8757-4cr4h                0/1     CrashLoopBackOff   99         20h
http-helloworld-dcd75b546-dfcbv            1/1     Running            0          18m
http-helloworld-dcd75b546-tkjv8            1/1     Running            0          18m
kube-apiserver-opscycans1srv001            1/1     Running            11         15d
kube-controller-manager-opscycans1srv001   1/1     Running            11         15d
kube-proxy-hcxmh                           1/1     Running            11         15d
kube-proxy-jm4x6                           1/1     Running            11         15d
kube-proxy-wqcwg                           1/1     Running            11         15d
kube-scheduler-opscycans1srv001            1/1     Running            11         15d
kubernetes-dashboard-57df4db6b-bjvwn       1/1     Running            10         14d
tiller-deploy-69ffbf64bc-xw64h             1/1     Running            8          9d
weave-net-j4tmr                            2/2     Running            33         15d
weave-net-jtwkl                            2/2     Running            30         15d
weave-net-zqbws                            2/2     Running            33         15d
ubuntu@OPSCYCANS1SRV001:~/HellWorld/http_helloworld$



# kubectl describe pod <pod_name> to get IP > k describe pod http-helloworld-dcd75b546-dfcbv
=============================================

ubuntu@OPSCYCANS1SRV001:~/HellWorld/http_helloworld$ k get nodes
NAME               STATUS                     ROLES    AGE   VERSION
opscycans1srv001   Ready,SchedulingDisabled   master   15d   v1.13.2
opscycans2srv001   Ready                      <none>   15d   v1.13.2
opscycans3srv001   Ready,SchedulingDisabled   <none>   15d   v1.13.2
ubuntu@OPSCYCANS1SRV001:~/HellWorld/http_helloworld$


ubuntu@OPSCYCANS1SRV001:~/HellWorld/http_helloworld$ wget http://10.200.0.183:30838/
--2019-02-14 12:05:40--  http://10.200.0.183:30838/
Connecting to 10.200.0.183:30838... connected.
HTTP request sent, awaiting response... 200 OK
Length: 12 [text/html]
Saving to: ‘index.html’

index.html                                        100%[==========================================================================================================>]      12  --.-KB/s    in 0s

2019-02-14 12:05:40 (2.42 MB/s) - ‘index.html’ saved [12/12]

ubuntu@OPSCYCANS1SRV001:~/HellWorld/http_helloworld$

