node{
  stage('Checkout') {
      checkout scm
	  echo " scm check out successful "
  }
  stage('Build Image'){
      sh 'docker build -t srikanthtekula/apache-tomcat-8.1.5:v1 .' 
	  echo "copying the web application war file to docker container"
	 # 'docker run -d -p 9090:9090 --name=tomcat-8.1.5-container apache-tomcat-8.1.5:v1'
	 # 'docker cp /home/srikanth/MyEcosmob-Data/POC-Assigment/sample.war tomcat-8-container:/usr/local/tomcat/webapps'   
	  echo " docker web application build of tomcat-8 successful "
  }

/*
 stage('tag Image'){
      sh 'docker tag apache-tomcat-8.1.5:v1 srikanthtekula/apache-tomcat-8.1.5:v1'
	  echo "docker tag successful "
  } 
*/

stage('login to the dockerhub'){
withCredentials([usernamePassword(credentialsId: 'docker-credentials', passwordVariable: 'pword', usernameVariable: 'uname')]) {
   sh "docker login -u srikanthtekula -p $pword"
   echo "docker login successful  $uname :::::: $pword "
}
}
 
 stage('Push the image to locally created registry'){
	      sh 'docker push srikanthtekula/apache-tomcat-8.1.5:v1'
	  }  
 
 stage('creating container for apache-tomcat-8') { 
	      sh 'docker-compose up -d'
	  }  
	  
  stage('check the created container'){
      sh 'docker ps'
	  echo " docker ps "
  }
}
