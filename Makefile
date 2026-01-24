



main:
	mvn jetty:run

build:
	mvn clean package

clean:
	mvn clean
	rm -rf target
	rm -rf cinema_db.*

re: clean build