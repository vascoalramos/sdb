#!/bin/bash

apache-tomcat-9.0.39/bin/startup.sh && tail -f apache-tomcat-9.0.39/logs/catalina.out
