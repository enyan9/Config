# https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/cdi-support.html#running-a-workload-with-cdi

container command='bash':
	podman run --rm -it \
		--device nvidia.com/gpu=all --security-opt=label=disable \
		-u root --userns=host --ipc=host \
		ubuntu \
		{{command}}