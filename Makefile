.PHONY: compile
compile: # Compile java
	mvn clean compile -f coffee-machine/pom.xml

.PHONY: native
native: graal-base # Compile java
	mvn clean package -Pnative -Dquarkus.native.container-build=true -Dquarkus.native.builder-image=graal-base -f coffee-machine/pom.xml

.PHONY: test
test: # Test java
	mvn verify -f coffee-machine/pom.xml

.PHONY: docker
docker: # Build docker image
	docker build -t coffee-machine -f ./coffee-machine/Dockerfile ./coffee-machine/

.PHONY: graal-base
graal-base: # Build graalvm base image for native image compilation
	docker build -t graal-base -f hack/graal-base.Dockerfile .

.PHONY: dev
dev: # Start quarkus in dev mode
	mvn quarkus:dev -f ./coffee-machine/pom.xml