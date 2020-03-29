def UU_ID

node {
  UU_ID = sh(script: "date +%s",returnStdout: true).trim()
}

pipeline {
    agent none
    
    stages {
   
        
        stage('Deploy') { 
            agent {


                docker {
                    
                    image 'eshnil2000/dl-blockchain' 
                    args '-p 5000 --network nginx-proxy --expose 8888 -e VIRTUAL_HOST='+UU_ID+'.proxy.chainapp.live -e VIRTUAL_PORT=5000  '
                }
            }
            steps {
                sh 'echo "notebook started"'

            }
        }        
    }
}
