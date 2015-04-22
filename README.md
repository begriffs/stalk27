### Capture Full Log of Route 27 at Powell

Deploys an EC2 box that  checks each minute the position, speed,
orientation and predicted arrival of route 27. This bus has messed
with me one too many times and now it's time to get even.

1. Sign up for Amazon Web Services free tier [here](http://aws.amazon.com/free/).
    It is **extremely important** to ensure the region in your
    Amazon Web Console is set to "N. California" as the defaults 
    are all configured to use this region in future steps. If you decide
    to use a different region you will need to specify the region in future
    steps when noted.

2. Create Amazon IAM credentials for deployment.
    Assuming you are signed into the AWS console, visit the [user
    admin](https://console.aws.amazon.com/iam/home#users) page. Create
    a new user and note their security credentials (ID and secret key).
    Then attach a user policy of "Power User" to the newly created user.

3. [Create EC2 keypair](https://console.aws.amazon.com/ec2/v2/home?region=us-west-1#KeyPairs:sort=keyName).

4. Clone this repo including its chef recipe submodules.
    ```bash
    git clone --recursive https://github.com/begriffs/microservice-template.git
    ```

5. Install <a href="https://www.packer.io/" target="_blank">Packer</a>.
    On a Mac you can use homebrew:
    ```bash
    brew tap homebrew/binary
    brew install packer
    ```
6. Build the AMI
    ```bash
    packer build -var 'aws_access_key=xxx' -var 'aws_secret_key=xxx' stalker.json
    ```

7. Launch the AMI from the Amazon Web Console. Then go watch the
   files accumulate on your S3 bucket.
