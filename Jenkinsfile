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
                    args '-p 8888 --network nginx-proxy --expose 8888 -e VIRTUAL_HOST='+UU_ID+'.proxy.chainapp.live -e VIRTUAL_PORT=8888  '
                }
            }
            steps {
                sh 'echo "notebook started"'
                sh 'jupyter notebook --allow-root'
                //sh 'jupyter notebook'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'

            }
        }        
    }
}
