pipeline {
  agent {
    kubernetes {
      defaultContainer 'jenkins-slave'
      yamlFile 'jenkins-slave.yaml'
    }
  }
  environment {
    // MYSQL_USER     = credentials('MYSQL_USER')
    // MYSQL_PASSWORD = credentials('MYSQL_PASSWORD')
    MYSQL_USER     = 'admin'
    MYSQL_PASSWORD = 'password'
  }
  stages {
    stage ('Enviromnet') {
      steps {
        script {
          if (env.GIT_BRANCH == 'dev') {
            stage ('Stage: dev') {
                env.STAGE = 'dev'
                sh 'echo ${STAGE}'
            }
          } else if (env.GIT_BRANCH == 'prod') {
            stage ('Stage: prod') {
                env.STAGE = 'prod'
                sh 'echo ${STAGE}'
            } 
          } else {
            stage ('Stage: main') {
                env.STAGE = 'main'
                sh 'echo ${STAGE}'
            }
          }            
        }
      }
    }

    stage('Deployment') {
            parallel {

                stage('Docker login ') {
                    steps {
                        sh './login.sh'
                    }
                }
                stage('Deploy backend') {
                    steps {
                     // dir('backend') {
                        sh './back.sh'
                      //}
                    }
                }
                stage('Deploy frontend') {
                    steps {
                        //dir('frontend') {
                          sh './front.sh'
                        
                    }
                }
            }
        }
  }
}
