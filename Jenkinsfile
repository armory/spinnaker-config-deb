
node {
    checkout scm

    stage("Build Config") {
      sh '''
      ./bin/build.sh
      '''
    }


    if (env.BRANCH_NAME == "master") {
      stage("Publish using curl") {
        sh '''#!/bin/bash +x
          . /mnt/secrets/bintray/bintray
          AWS_ACCESS_KEY=$(aws --profile dev configure get aws_access_key_id) \
          AWS_SECRET_KEY=$(aws --profile dev configure get aws_secret_access_key) \
          ./bin/push.sh
        '''
      }
    }

    // The debian filepath in Groovy is:
    // "build/distributions/spinnaker-config_0.${env.BUILD_NUMBER}.0-h${env.BUILD_NUMBER}.${env.BRANCH_NAME}_all.deb"

    archiveArtifacts artifacts: 'build/*, build/distributions/*.deb, build/distributions/*.rpm', fingerprint: true
}
