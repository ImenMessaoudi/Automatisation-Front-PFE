pipeline {
    agent any

    environment {
        GIT_REPO_URL = 'https://github.com/ImenMessaoudi/Automatisation-Front-PFE.git'
        ARTIFACTORY_URL = 'https://access.my-nx.com/artifactory'
        ARTIFACTORY_REPO = 'General/impress-artifacs/test'
        remote_name = 'PRIIPS-PACKAGE-TEST'
        remote_host = '10.53.103.217'
        remote_user = 'runner'
        remote_password = '[vUO84ni6xPkX_)o*:!=l7Y1QS0B3V'
        remote_allowAnyHosts = true
    }

    stages {
        stage('Checkout Code') {
            steps {
                script {
                    git branch: 'main', url: "${env.GIT_REPO_URL}"
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    sh "npm install"
                }
            }
        }

        stage('Build Project') {
            steps {
                script {
                    sh "rm -rf *.tar.gz"
                    sh "tar czf automationProject-${BUILD_NUMBER}.tar.gz node_modules cucumber.js package.json features"
                    archiveArtifacts artifacts: "automationProject-${BUILD_NUMBER}.tar.gz", allowEmptyArchive: true
                    echo "L'artefact a été généré à l'emplacement : ${WORKSPACE}/automationProject-${BUILD_NUMBER}.tar.gz"
                }
            }
        }

        stage('Retrieve and Display Artifact') {
            steps {
                script {
                    def artifactName = "automationProject-${BUILD_NUMBER}.tar.gz"
                    copyArtifacts projectName: "${env.JOB_NAME}", selector: specific("${env.BUILD_NUMBER}"), filter: artifactName
                    sh "tar -tzf ${artifactName}"
                }
            }
        }

        stage('Initialisation') {
            steps {
                script {
                    remote = [
                        name: env.remote_name,
                        host: env.remote_host,
                        user: env.remote_user,
                        password: env.remote_password,
                        allowAnyHosts: env.remote_allowAnyHosts
                    ]
                }
            }
        }

        stage('Test Connexion SSH') {
            steps {
                script {
                    echo "Connexion au serveur distant...."
                    sshCommand remote: remote, command: 'echo "Connexion SSH réussie"'
                }
            }
        }

        stage('Scripte SSH') {
            steps {
                script {
                    echo "Connexion au serveur distant et exécution du script..."
                    sshCommand remote: remote, command: '''
                        wget -O install.sh https://access.my-nx.com/artifactory/nx-delivery/dh/impress/dev/impress-PRIIPS/install-PRIIPS.sh
                        chmod +x ./install.sh
                        nohup ./install.sh bulkMode=true > ./install.log 2>&1 &
                    '''
                }
            }
        }

        stage('Deploy and Test on VM') {
            steps {
                script {
                    sh """
                    scp -o StrictHostKeyChecking=no automationProject-${BUILD_NUMBER}.tar.gz runner@${remote_host}:/home/runner/destination
                    """

                    sh """
                    sshpass -p '${remote_password}' ssh -o StrictHostKeyChecking=no runner@${remote_host} << 'EOF'
                    if ! command -v node &> /dev/null; then
                        sudo apt update
                        sudo apt install -y nodejs npm
                    fi

                    tar xzf /home/runner/destination/automationProject-${BUILD_NUMBER}.tar.gz -C /home/runner/destination
                    cd /home/runner/destination
                    npm install
                    npx cucumber-js
                    EOF
                    """
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
