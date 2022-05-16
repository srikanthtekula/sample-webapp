node{
  stage('Checkout') {
      checkout scm
	  echo " scm check out successful "
  }
  stage('Build Image'){
      sh 'docker build -t srikanthtekula/apache-tomcat-8.3.3:v1 .' 
      echo " docker web application image build of tomcat-8.3.3 successful "
  }

/*
 stage('tag Image'){
      sh 'docker tag apache-tomcat-8.1.6:v1 srikanthtekula/apache-tomcat-8.3.2:v1'
	  echo "docker tag successful  "
  } 
*/

stage('login to the dockerhub'){
withCredentials([usernamePassword(credentialsId: 'docker-credentials', passwordVariable: 'pword', usernameVariable: 'uname')]) {
   sh "docker login -u srikanthtekula -p $pword"
   echo "docker login successful  $uname :::::: $pword "
}
}
 
 stage('Push the image to docker hub registry'){
	      sh 'docker push srikanthtekula/apache-tomcat-8.3.3:v1'
	  }  

	
stage('creating container for apache-tomcat-8') { 
	      sh 'docker-compose up -d'
	  }    

stage('copying the sample webapplication war') {
// 'docker cp ./target/sample-webapp.war tomcatServer:/usr/local/tomcat/webapps'
sh 'docker cp /home/srikanth/MyEcosmob-Data/POC-Assigment/sample.war tomcatServer:/usr/local/tomcat/webapps'
echo "sample web application deployed successfully "
}
		
  stage('check the created container'){
      sh 'docker ps'
      echo " docker ps "
  }
}
