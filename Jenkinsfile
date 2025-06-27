pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1'
        S3_BUCKET = 'elasticbeanstalk-ap-south-1-435614293440'
        EB_APP = 'mynew'
        EB_ENV = 'Mynew-env'
        VERSION = "build-${BUILD_NUMBER}"
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                bat 'npm install'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing...'
                // Add test logic here
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying to Elastic Beanstalk...'

                // Zip the app
                bat 'powershell Compress-Archive -Path * -DestinationPath app.zip'

                // Upload to S3
                bat 'aws s3 cp app.zip s3://%S3_BUCKET%/%VERSION%.zip --region %AWS_REGION%'

                // Create new EB version
                bat """
                aws elasticbeanstalk create-application-version ^
                    --application-name %EB_APP% ^
                    --version-label %VERSION% ^
                    --source-bundle S3Bucket=%S3_BUCKET%,S3Key=%VERSION%.zip ^
                    --region %AWS_REGION%
                """

                // Deploy new version
                bat """
                aws elasticbeanstalk update-environment ^
                    --environment-name %EB_ENV% ^
                    --version-label %VERSION% ^
                    --region %AWS_REGION%
                """
            }
        }
    }
}
