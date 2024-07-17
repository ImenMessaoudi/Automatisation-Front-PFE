pipeline {
    agent any

    environment {
        GIT_REPO_URL = 'https://github.com/ImenMessaoudi/Automatisation-Front-PFE.git'
        ARTIFACTORY_URL = 'https://access.my-nx.com/artifactory'
        ARTIFACTORY_REPO = 'General/impress-artifacs/test'
        remote_name = 'clone-of-REFPROD-PRIIPS-TEST'
        remote_host = '10.53.201.78'
        remote_user = 'runner'
        remote_key_path = '/path/to/private/key' // Update this path to your private SSH key
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
                        key: env.remote_key_path,
                        allowAnyHosts: true
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
                    scp -i ${env.remote_key_path} -o StrictHostKeyChecking=no automationProject-${BUILD_NUMBER}.tar.gz runner@${remote_host}:/home/runner/destination
                    """

                    sh """
                    ssh -i ${env.remote_key_path} -o StrictHostKeyChecking=no runner@${remote_host} << 'EOF'
                    if ! command -v node &> /dev/null; then
                        sudo apt update
                        sudo apt install -y nodejs npm
                    fi

                    tar xzf /home/runner/destination/automationProject-${BUILD_NUMBER}.tar.gz -C /home/runner/destination
                    cd /home/runner/destination
                    npm install
                    npx cucumber-js -t @IMPRESS-15442
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
