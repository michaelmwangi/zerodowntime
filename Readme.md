
The ansible folder contains simple example playbooks that can be used to set up a deployment pipeline. The setup consists of a loadbalancer (haproxy) which controls the traffic to the services. by using haproxy we can easily take one service out of rotation, update then put it back.

I went for a simple setup that relies on notifications/webhooks in various states of the continous delivery pipeline.
once code is commited and pushed tests are automatically run on the build server (Jenkins or a thirdparty eg codeship).
If the tests pass a notification is sent to run the ansible controller which in turn runs the deployment playbook which takes servers out of rotation in a serial manner ensuring tha there's no downtime during the update.

If using containers the build server may trigger a container image build based on the code that passed the tests and then push that image to an image repo (the images may be tagged eg v1.0 and also signed for security). Since a container image is a regular tarball existing filestorage systems may be used as the repo eg S3 buckets from AWS but in the case where a spceialized one is needed third parties such as quay.io or docker hub may fit the bill. It is then trivial to adjust the ansible playbooks to pull the latest image from the repo after going through the set authentication mechanisms and then proceed to do a rolling deployment as described above.

N/B: Container orchestration systems like Kubernetes and docker Swarm also provide service creation and management where rolling updates can also be used.

I have also attached an image __workflow.png__ that shows the process flow of this setup. The only foreseable change to the existing codebase would be the addittion of Docker files to each project that did not previously use docker.

Reason why I went for Ansible.
1. Easy to setup and understand.
2. Agentless - uses SSH to manage servers hence does not rely on agents like puppet and chef which means on the infrastructure we have less to manage and monitor.

Possible alternative to ansible would be terraform which am picking up as it advocates for immutable infrastructre  thus avoiding configuration drift on the servers which can occur if you have a lot of servers 

