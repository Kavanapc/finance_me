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
  stage('Test report'){
    steps{
     publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '/var/lib/jenkins/workspace/FinanceMe/target/surefire-reports', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true])
         }
      } 
}
} 
