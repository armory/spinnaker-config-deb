
node {
    checkout scm

    stage("Build Config") {
      sh '''
      ./bin/build.sh
      '''
    }


    if (env.BRANCH_NAME == "master") {
      stage("Publish using curl") {
        sh '''
        ./bin/push.sh
        '''
      }
    }

    // you can find the through Jenkins using:
    // "build/distributions/spinnaker-config_0.${env.BUILD_NUMBER}.0-h${env.BUILD_NUMBER}.${env.BRANCH_NAME}_all.deb"

    archiveArtifacts artifacts: 'build/*, build/distributions/*.deb, build/distributions/*.rpm', fingerprint: true
}
