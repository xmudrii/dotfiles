# Path to your oh-my-zsh installation.
export ZSH=/home/marko/.oh-my-zsh
export LANG=en_US.UTF-8

# Set name of the theme to load. Optionally, if you set this to "random"
ZSH_THEME="gianu"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# Custom configuration
export GOROOT=/usr/local/go
export GOROOT_BOOTSTRAP=$GOROOT
export GOPATH=$HOME/Projects
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

source /usr/share/nvm/init-nvm.sh
export PATH=/home/marko/Projects/src/k8s.io/kubernetes/third_party/etcd:${PATH}

alias ls='ls --color -lh --group-directories-first'

alias start-wardle='sample-apiserver --secure-port 8443 --etcd-servers http://127.0.0.1:2379 --v=9 --client-ca-file ~/Projects/src/k8s.io/apiserver/ca.crt --kubeconfig ~/.kube/config --authentication-kubeconfig ~/.kube/config --authorization-kubeconfig ~/.kube/config'
alias wardle-apis='http --verify no https://localhost:6444/apis'
alias wardle-flunders='http --verify=no --cert client.crt --cert-key client.key https://localhost:8443/apis/wardle.k8s.io/v1alpha1/namespaces/default/flunders'
alias wardle-fludner-new="http --verify no -j --cert-key client.key --cert client.crt https://localhost:8443/apis/wardle.k8s.io/v1alpha1/namespaces/default/flunders < <(python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)' < staging/src/k8s.io/sample-apiserver/artifacts/flunders/01-flunder.yaml)"

alias etcdctl-all="ETCDCTL_API=3 etcdctl get / --prefix --keys-only"
