all: run

build:
	docker build -t ctrlx/t0rn4mr .

push:
	docker push ctrlx/t0rn4mr

run:
	-timeout 1200 2>/dev/null docker run -t ctrlx/t0rn4mr eschalot -vcnt1 -r "^(c[0o]n?[7t]r[0o][1l]x|0rbit|bellyfeel|fu?cktru?mp|d[1i]s[5s][i1y]d[e3]n[t7])" >> keys.$$(date +"%Y-%m-%d").txt
