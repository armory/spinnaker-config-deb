
node {
    checkout scm

    stage("Build Config") {
      sh '''
      ./build.sh
      '''
    }

    stage("Push Packages") {
        sh '''
          echo "pushing artifact to repository"
        '''
    }

    archiveArtifacts artifacts: 'build/*, build/distributions/*.deb, build/distributions/*.rpm', fingerprint: true
}
