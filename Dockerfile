pipeline { 
environment {
registry = "prashanthsukkal/seventeenthreetwentytwentyone"
registryCredential = 'prashanthsukkal'
dockerImage = ''
}
agent any
stages {
stage { 
steps {
git 'https://github.com/PrashanthSukkal/Docker-.git'
}
} 
stage('Building our image') {
steps {
script {
dockerImage = docker.build registry + ":$BUILD_NUMBER"
}
}
}
stage('Deploy our image') {
steps {
script { 
docker.withRegistry( '', registryCredential ) {
dockerImage.push()
}
}
}
}
stage('Cleaning up') {
steps {
sh "docker rmi $registry:$BUILD_NUMBER" 
}
}
}
}
