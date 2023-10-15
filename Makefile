install:
	# Installing dependencies - this should be run from inside a virtualenv
	pip install --upgrade pip &&\
		pip install -r requirements.txt
	# Installing hadolint
	wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
    chmod +x /bin/hadolint
    
install_kubernetes_tools:
	# eksctl CLI
	curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_linux_amd64.tar.gz" | tar xz -C /tmp
	mv /tmp/eksctl /.eksctl
	chmod +x /.eksctl
	
	# kubectl CLI
	curl -LO -k "https://dl.k8s.io/release/v1.23.6/bin/linux/amd64/kubectl"
	install -o root -g root -m 0755 kubectl /.kubectl
	chmod +x /.kubectl

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203,W1202 app.py

all: install lint test