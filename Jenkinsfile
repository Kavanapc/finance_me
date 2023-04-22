pipeline{
agent any
tools{
maven'MAVEN_HOME'
    }
stages{
 stage('checkout siurce code'){
   steps{
      git 'https://github.com/Kavanapc/finance_me.git'
      }
   } 
  stage('package the application'){
     steps{
       sh'mvn clean package'
          }
      }  
