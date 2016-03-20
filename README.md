# MyHomeServer
This project is a trial on database web application.
# Installation
The key component need to be installed on server
* Java JDK
* Mysql
* Apache-Tomcat
* JDBC driver

## Apache-Tomcat Intallation and Configuration
The file apache-tomcat-8.0.32.tar.gz is the core file of Tomcat. You could also download from website for latest version.
###1.Unzip the file to location where you want to install
```
$ tar xvzf apache-tomcat-8.0.32.tar.gz
```
For my case, I move the whole folder to /usr/local/

###2.Set up Environment Variable
The Environment Variables are stored in /etc/profile
```
$ sudo gedit /etc/profile
```
Add following lines at the end of file. Make sure you also set up Java Home path
```
JAVA_HOME=${your prefered location for java}/jdk1.8.0_73
JRE_HOME=$JAVA_HOME/jre
TOMCAT_HOME=${your prefered location for tomcat}
CATALINA_HOME=TOMCAT_HOME
CLASSPATH = $JAVA_HOME/lib:$CATALINA_HOME/lib
PATH=%PATH:$JRE_HOME/bin:$TOMCAT_HOME/bin
export PATH CLASSPATH JAVA_HOME JRE_HOME TOMCAT_HOME CATALINA_HOME
```
Enable the new variables
```
$ source /etc/profile
```
You can check whether Environment variable is enable by echo $var

###3.Set up server configuration
The directory structure of Apache-Tomcat is like


Apache-Tomcat-8.0.32 -----  bin     // Excutable file including startup, shutdown

                      |---  lib     // Inportant library, JDBC.jar will be put here
                      
                      |---  conf    // configuration file of server
                      
                      |---   webapps //  web component
                      
                              |--- ROOT  // homepage
                              
For defualt setting, run Tomcat server will be
```
$ sudo $TOMCAT_HOME/bin/startup.sh
```
You could check localhost:8080. If you could see tomcat default homepage, it means you run server sucessfully.You can also change port to *:80 if you want to post your webpage online.The configuration file is $TOMCAT_HOME/conf/server.xml
The default setting is
```
 <Connector connectionTimeout="20000" port="8080" protocol="HTTP/1.1" redirectPort="8443"/>
```
Change to
```
 <Connector connectionTimeout="20000" port="80" protocol="HTTP/1.1" redirectPort="8443"/>
```
Make sure you are not running Apache2 on the same port. You could stop service Apache2 or change setting in the file /etc/Apache2/ports.conf

###4.Replace your own homepage

You could replace webpage files under $TOMCAT_HOME/webapps/ROOT. I add my web by copying *.war file to folder /webapps from JavaEE project.
