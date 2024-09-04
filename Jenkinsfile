pipeline {
    agent any
    tools {nodejs "NODEJS"}
    stages {
        stage('Build Angular') {
            steps {
				sh 'cd Front_end'
                sh 'npm install'
            }
        }
		stage('Build Node'){
		steps {
			sh 'cd Back_end'
			sh 'npm install'
		 }
		}
		stage('Deliver Node') {
            steps {
                sh 'chmod -R +rwx ./Back_end/jenkins/scripts/deliver.sh'
                sh 'chmod -R +rwx ./Back_end/jenkins/scripts/kill.sh'
                sh './Back_end/jenkins/scripts/deliver.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './Back_end/jenkins/scripts/kill.sh'
            }
        }
        stage('Deliver') {
            steps {
                sh 'chmod -R +rwx ./Front_end/jenkins/scripts/deliver.sh'
                sh 'chmod -R +rwx ./Front_end/jenkins/scripts/kill.sh'
                sh './Front_end/jenkins/scripts/deliver.sh'
                input message: 'Finished using the Node site? (Click "Proceed" to continue)'
                sh './Front_end/jenkins/scripts/kill.sh'
            }
        }
		stage('Sonar coverage'){
		steps {
			sh 'npm run sonar'
		}
	  }
    }
}
