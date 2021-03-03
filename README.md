# ELK-Project

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Network Diagram](https://github.com/iknowanastasiya/ELK-Project/blob/main/Images/NetworkDiagram.png)


These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

[ELK Install](https://github.com/iknowanastasiya/ELK-Project/blob/main/Ansible/install-elk.yml)

[DVWA](https://github.com/iknowanastasiya/ELK-Project/blob/main/Ansible/dvwa-playbook.yml)

[Filebeat](https://github.com/iknowanastasiya/ELK-Project/blob/main/Ansible/filebeat-playbook.yml)

[Metricbeat](https://github.com/iknowanastasiya/ELK-Project/blob/main/Ansible/metricbeat-playbook.com)

This document contains the following details:

- Description of the Topology
- Access Policies
- ELK Configuration
- Beats in Use
- Machines Being Monitored
- How to Use the Ansible Build

### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting inbound access to the network.  

Load balancers distribute network traffic across multiple servers. Traffic distribution ensures that no single server is being overloaded. It improves application responsiveness and increases application availability. Load balancers also protect servers from denial of service attacks.

Jump box provide single point access to remote network from a specific IP via SSH. It protects virtual machines on a private network from public access. Single point of access is easier to monitor and ensure that environment is secure.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log and system traffic.

- Filebeat monitors log files or specified location and sends results to Elasticsearch.

- Metricbeat collects metrics and statistics from operating system and from services running on servers and send them to Elasticsearch.

  
  

The configuration details of each machine may be found below.


| Name | Function | IP Address | Operating System|
|--------|----------|------------|-------------|
| Jump Box | Gateway | 10.0.0.5 | Linux|
| Web-1 | Server | 10.0.0.6 | Linux |
| Web-2 | Server | 10.0.0.7 | Linux |
| Web-3 | Server | 10.0.0.8 | Linux |
| Elk | ElkStack | 10.1.0.4 | Linux |

### Access Policies

The machines on the internal network are not exposed to the public Internet.

Only the jump box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:

- 71.56.19.108

Machines within the network can only be accessed by jump box or servers in the private network via SSH.

Jump box connects to web servers and ELK server via SSH. Web servers send log to the Elk server.

A summary of the access policies in place can be found in the table below.

| Name | Publicly Accessible | Allowed IP Addresses |
|------|----------------|---------------------|
| Jump Box | Yes | 71.56.19.108 |
| Web-1 | No | 10.0.0.5 |
| Web-2 | No | 10.0.0.5 |
| Web-3 | No | 10.0.0.5 |
| Web LB | Yes | 71.56.19.108 |
| Elk | Yes | 10.0.0.5/71.56.19.108 |

### ELK Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because Ansible allows to automate installation of configurations. Installation is quick and runs on all web server without user errors.

The playbook implements the following tasks:
- Install Docker
- Install python3-pip
- Install Docker python module
- Set the vm.max_map_count to 262144
- Download and launch elk container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![ELK Docker PS](https://github.com/iknowanastasiya/ELK-Project/blob/main/Images/docker_ps_output.png)

### Target Machines & Beats

This ELK server is configured to monitor the following machines:
- 10.0.0.6
- 10.0.0.7
- 10.0.0.8

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:

- Filebeat monitors log files. We use filebeat to monitor web servers log data like who log in into the system.

- Metricbeat collects metrics and statistics from operating system and from servers running on the system. We get data on docker containers such as CPU usage, disk I/O, memory usage, and network I/O.
  
### Using the Playbook

In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned:

SSH into the control node and follow the steps below:
 - Run the following command to download and save the playbook to /etc/ansible: 

		curl https://raw.githubusercontent.com/iknowanastasiya/ELK-Project/main/Ansible/install-elk.yml > /etc/ansible/install-elk.yml

- Update the host file to include list of IPs of web and elk servers. Ansible installs ELK on elk server. Filebeat and Metricbeat are installed on the specified web servers.

		 [webservers]	
		 10.0.0.6 ansible_python_interpreter=/usr/bin/python3
		 10.0.0.7 ansible_python_interpreter=/usr/bin/python3
		 10.0.0.8 ansible_python_interpreter=/usr/bin/python3
	
		 [elk]
		 10.1.0.4 ansible_python_interpreter=/usr/bin/python3

- Use the following command to run the playbook:

			ansible-playbook /etc/ansible/install-elk.yml
- Check your installation by going to 
				
		http://[your_elk_server_ip]:5601/app/kibana.
![Kibana](https://github.com/iknowanastasiya/ELK-Project/blob/main/Images/Kibana.png)

For filebeat and metricbeat installation save configuration files to /etc/ansible/files. Scroll thru the file and replace the IP addresses with the IP address of your ELK machine. 
 
 Installing Filebeats:

- Run the following command to download and save the playbook to /etc/ansible 
								
		curl https://raw.githubusercontent.com/iknowanastasiya/ELK-Project/main/Ansible/filebeat-playbook.yml > /etc/ansible/filebeat_playbook.yml

- Use the following command to run the playbook:
	
		ansible-playbook /etc/ansible/filebeat-playbook.yml

![Filebeat](https://github.com/iknowanastasiya/ELK-Project/blob/main/Images/Filebeat.png)

 Installing Metricbeat:

- Run the following command to download and save the playbook to /etc/ansible 
								
		curl https://raw.githubusercontent.com/iknowanastasiya/ELK-Project/main/Ansible/metricbeat-playbook.yml > /etc/ansible/metricbeat_playbook.yml

- Use the following command to run the playbook:
	
		ansible-playbook /etc/ansible/metric-playbook.yml
![Metricbeat](https://github.com/iknowanastasiya/ELK-Project/blob/main/Images/Metricbeat.png)
