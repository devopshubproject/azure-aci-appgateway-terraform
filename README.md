# azure-containerinstance-appgateway-terraform

This project is to demonstrate and help one to deploy a container instance inside _Azure_

As part of provisioning the script will place the _ACI_ in a Private subnet and an application gateway in Public subnet.

So, we'll have two subnets: one public and one private.
The container will be deployed on the private subnet, where nothing outside the vnet can access it (the network security group takes care of that).
On the public subnet, the application gateway will be deployed, which will route traffic to our container thus making it reachable while still protected from direct external access.

An external computer will make a request to the public IP on port 80. The application gateway will take the request, forward it to the container instance, get the response and send it back to the requestor.

<img src ='https://sp-ao.shortpixel.ai/client/to_webp,q_glossy,ret_img/https://godatadriven.com/wp-content/images/azure-container-instance-example/architecture.png'>


## Tools and Services(Azure) Used:
- Terraform
- Docker
- Azure
- Services: Vnet, Subnet, ACI, PIP, Application Gateway, Network Profile, NSG, RG.

## List of items to be taken care:

[**Inputs and Outputs**](./docs/inputs.nd)



## <font color = "red"> Follow-Me </font>

[![Portfolio](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/premkumar-palanichamy)

<p align="left">
<a href="https://linkedin.com/in/premkumarpalanichamy" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/linked-in-alt.svg" alt="premkumarpalanichamy" height="25" width="25" /></a>
</p>

[![youtube](https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://www.youtube.com/channel/UCJKEn6HeAxRNirDMBwFfi3w)