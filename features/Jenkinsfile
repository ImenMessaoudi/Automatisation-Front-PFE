pipeline {
    agent any

    environment {
        GIT_REPO_URL = 'https://github.com/ImenMessaoudi/Automatisation-Front-PFE.git'
        ARTIFACTORY_URL = 'https://access.my-nx.com/artifactory'
        ARTIFACTORY_REPO = 'General/impress-artifacs/test'
    }

    stages {
        stage('Checkout Code') {
            steps {
                script {
                    // Cloner le repository Git
                    git branch: 'main', url: "${env.GIT_REPO_URL}"
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    // Installer les dépendances Node.js avec npm
                    sh "npm install"
                }
            }
        }

        stage('Build Project') {
            steps {
                script {
                    // Nettoyer et construire l'artefact
                    sh "rm -rf *.tar.gz"
                    sh "tar czf automationProject-${BUILD_NUMBER}.tar.gz node_modules cucumber.js package.json features"

                    // Archiver l'artefact généré
                    archiveArtifacts artifacts: "automationProject-${BUILD_NUMBER}.tar.gz", allowEmptyArchive: true
                    
                    // Afficher l'emplacement de l'artefact
                    echo "L'artefact a été généré à l'emplacement : ${WORKSPACE}/automationProject-${BUILD_NUMBER}.tar.gz"
                }
            }
        }

        stage('Retrieve and Display Artifact') {
            steps {
                script {
                    // Définir le nom de l'artefact
                    def artifactName = "automationProject-${BUILD_NUMBER}.tar.gz"

                    // Copier l'artefact archivé vers l'espace de travail actuel
                    copyArtifacts projectName: "${env.JOB_NAME}", selector: specific("${env.BUILD_NUMBER}"), filter: artifactName

                    // Afficher le contenu de l'artefact (par exemple, lister les fichiers dans le tar.gz)
                    sh "tar -tzf ${artifactName}"
                }
            }
        }
        stage('Deploy and Test on VM') {
    steps {
        script {
            // Transférer l'artefact sur la VM
            sh """
            scp -o StrictHostKeyChecking=no automationProject-${BUILD_NUMBER}.tar.gz runner@10.53.103.217:/home/runner/destination
            """

            // Se connecter à la VM et exécuter les commandes
            sh """
            sshpass -p '[vUO84ni6xPkX_)o*:!=l7Y1QS0B3V' ssh -o StrictHostKeyChecking=no runner@10.53.103.217 << 'EOF'
            # Installer Node.js si non existant
            if ! command -v node &> /dev/null; then
                sudo apt update
                sudo apt install -y nodejs npm
            fi

            # Décompresser l'artefact
            tar xzf /home/runner/destination/automationProject-${BUILD_NUMBER}.tar.gz -C /home/runner/destination

            # Accéder au répertoire décompressé
            cd /home/runner/destination

            # Installer les dépendances
            npm install

            # Exécuter les tests
            npx cucumber-js
            EOF
            """
        }
    }
}


       
    }

    post {
        always {
            cleanWs() // Nettoyer l'espace de travail à la fin de chaque build
        }
    }
}