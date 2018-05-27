alias ..="cd .."
alias ...="cd ../.."
alias -- -="cd -"
alias c="cd $GOPATH/src/github.com/xmudrii"
alias cdo="cd $GOPATH/src/github.com/digitalocean"
alias ck="cd $GOPATH/src/github.com/kubicorn/kubicorn"

alias l="ls -lF -h --group-directories-first --color=auto"
alias la="ls -laF -h --color=auto"
alias ls="ls -l -h --group-directories-first --color=auto"
alias grep='grep --color=auto'

alias k='kubectl'
complete -o default -F __start_kubectl k

alias d='doctl'
alias ktx='kubectx'
alias kns='kubens'

alias start-wardle='sample-apiserver --secure-port 8443 --etcd-servers http://127.0.0.1:2379 --v=9 --client-ca-file ~/Projects/src/k8s.io/apiserver/ca.crt --kubeconfig ~/.kube/config --authentication-kubeconfig ~/.kube/config --authorization-kubeconfig ~/.kube/config'
alias wardle-apis='http --verify no https://localhost:6444/apis'
alias wardle-flunders='http --verify=no --cert client.crt --cert-key client.key https://localhost:8443/apis/wardle.k8s.io/v1alpha1/namespaces/default/flunders'
alias wardle-fludner-new="http --verify no -j --cert-key client.key --cert client.crt https://localhost:8443/apis/wardle.k8s.io/v1alpha1/namespaces/default/flunders < <(python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)' < staging/src/k8s.io/sample-apiserver/artifacts/flunders/01-flunder.yaml)"
alias etcdctl-all="ETCDCTL_API=3 etcdctl get / --prefix --keys-only"
