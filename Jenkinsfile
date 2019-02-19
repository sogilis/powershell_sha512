#!/usr/bin/env groovy

node('windows_docker') {
  stage 'Checkout'
    checkout scm

  stage 'Docker build'
    bat 'docker build -t powershell_sha512:latest -m 2GB .'

  if (env.ENVIRONMENT == 'staging' || env.ENVIRONMENT == 'production') {
    stage 'Docker push'
      withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: env.ENVIRONMENT]]) {
        powershell 'Invoke-Expression -Command (Get-ECRLoginCommand -Region eu-central-1).Command'
        bat 'docker tag powershell_sha512:latest ' + env.AWS_ACCOUNT_ID + '.dkr.ecr.eu-central-1.amazonaws.com/powershell_sha512:latest'
        bat 'docker push ' + env.AWS_ACCOUNT_ID + '.dkr.ecr.eu-central-1.amazonaws.com/powershell_sha512:latest'
      }
    }
}
