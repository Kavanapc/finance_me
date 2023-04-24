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
  stage('docker image'){
   steps{
     sh'docker build -t kavanapc/finance_me:latest .'
        }
     }
  stage('docker login'){
    steps{
       withCredentials([usernamePassword(credentialsId: 'dockerlogin', passwordVariable: 'passwd', usernameVariable: 'dockerhub')]) {
        sh "docker login -u ${env.dockerhub} -p ${env.passwd}"
                                      }
                   }
      }
  stage('docker push'){
   steps{
    sh 'docker push kavanapc/finance_me:latest'
        }
    }
 stage('create infra with terraform'){
  steps{
    sh 'sudo chmod 600 kavanapc2023.ppk'
    sh 'terraform init'
    sh 'terraform validate'
    sh 'terraform apply --auto-approve'
    }
 } 
}
} 
