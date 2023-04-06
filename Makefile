NODE_BASE ?= node:16

node:
	echo "FROM $(NODE_BASE)" | docker build --tag node:latest -

vite-ssr-image: node
	docker build --tag vite-ssr vite-ssr-benchmark

vite-ssr-bench: vite-ssr-image
	docker run -ti --rm vite-ssr
