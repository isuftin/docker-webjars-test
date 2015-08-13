#!/bin/sh
/apache-tomcat-8.0.24/bin/catalina.sh start && tail -F /apache-tomcat-8.0.24/logs/catalina.out