#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

mvn clean install -DskipTests
cd target
mkdir bug-report
cd bug-report
cp ../*.jar .
java -Djarmode=layertools -jar *.jar  extract
cp -r dependencies/* .
cp -r spring-boot-loader/* .
#cp -r snapshot-dependencies/* .
cp -r application/* .


rm -rf dependencies spring-boot-loader/ snapshot-dependencies/ application *.jar
java org.springframework.boot.loader.JarLauncher

