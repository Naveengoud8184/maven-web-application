def registry = 'https://trial9ilfd6.jfrog.io/'
def imageName = 'trial9ilfd6.jfrog.io/project-docker-local/sampleproject'
def version   = '0.0.1'

pipeline {
    agent {
        node {
            label 'maven'
        }
    }
    environment {
        PATH = "/opt/apache-maven-3.9.9/bin:$PATH"
    }

    stages {
        stage('build') {
            steps {
                echo "---------build started------"
                sh 'mvn clean package -Dmaven.test.skip=true'
                echo "---------build completed------"
            }
        }

        stage('test') {
            steps {
                echo "---------unit test started-----"
                sh 'mvn surefire-report:report'
                echo "--------unit test completed----"
            }
        }

        stage('SonarQube analysis') {
            environment {
                scannerHome = tool 'SonarQube'
            }
            steps {
                withSonarQubeEnv('sonarqube-server') {
                    sh "${scannerHome}/bin/sonar-scanner"
                }
            }
        }

        stage("Jar Publish") {
            steps {
                script {
                    echo '<--------------- Jar Publish Started --------------->'
                    def server = Artifactory.newServer(
                        url: registry + "/artifactory",
                        credentialsId: "jfrog-token"
                    )
                    def properties = "buildid=${env.BUILD_ID},commitid=${GIT_COMMIT}"
                    def uploadSpec = """{
                        "files": [
                            {
                                "pattern": "jarstaging/(*)",
                                "target": "libs-release-local/{1}",
                                "flat": "false",
                                "props" : "${properties}",
                                "exclusions": [ "*.sha1", "*.md5" ]
                            }
                        ]
                    }"""
                    def buildInfo = server.upload(uploadSpec)
                    buildInfo.env.collect()
                    server.publishBuildInfo(buildInfo)
                    echo '<--------------- Jar Publish Ended --------------->'
                }
            }
        } 
    
    stage(" Docker Build ") {
      steps {
        script {
           echo '<--------------- Docker Build Started --------------->'
           app = docker.build(imageName+":"+version)
           echo '<--------------- Docker Build Ends --------------->'
        }
      }
    }

            stage (" Docker Publish "){
        steps {
            script {
               echo '<--------------- Docker Publish Started --------------->'  
                docker.withRegistry(registry, 'jfrog-token'){
                    app.push()
                }    
               echo '<--------------- Docker Publish Ended --------------->'  
            }
        }
    } 
    }
}
