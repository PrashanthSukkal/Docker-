pipeline { 
environment {
registry = "prashanthsukkal/seventeenthreetwentytwentyone"
registryCredential = 'Kavitha$ukkal66'
dockerImage = ''
}
agent any
stages {
stage ('Build') { 
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
docker.withRegistry( 'prashanthsukkal@gmail.com', Kavitha$ukkal66 ) {
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
