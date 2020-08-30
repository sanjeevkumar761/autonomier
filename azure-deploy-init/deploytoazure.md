# Deploy autonomier on Azure
This is the repository for autonomier framework. The current release of autonomier automates the deployment of Apollo autonomous vehicle platform for software simulation (only for software based silmulation, not to be used in real vehicles) on Azure.   

*You agree to the dislaimer mentioned at the bottom of this page, when you proceed further with the details and steps given below.*

This creates infrastructure on Microsoft Azure and installs Autonomier framework which is based on open source repositories from Apollo autonomous vehicle platform, LG fork of Apollo autonomous vehicle platform 3.5, LG Automotive Simulator, nvidia-docker and Kubeapps framework.   

It uses a fork of [Apollo](https://github.com/ApolloAuto/apollo/) maintained by the LG Electronics Silicon Valley Lab here [LG Silicon Valley Lab Apollo 3.5 Fork](https://github.com/lgsvl/apollo-3.5/) which has modified and configured to facilitate use with LG's Automotive Simulator.

You agree to license requirements of various open source tools which are used in autonomier repository. 

It takes about 45-60 minutes for full deployment process to complete. Please follow the steps mentioned below:    

## Getting ready:  
Create Service Principal using Azure Cloud Shell /AZ CLI with command "az ad sp create-for-rbac". Save details as you'll need those later.    
If you use exitsing Service Principal, please make sure to copy appId and password/secret correctly.  

## To deploy autonomier on Azure, Click the button below:  

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fsanjeevkumar761%2Fautonomier%2Fmaster%2Fazure-deploy-init%2Fazuredeploy.json)  

Altrenatively, yon can initiate the deployment using Azure CLI. 

## How to check installation progress:   
1\) Wait for initial deployment to complete in Azure portal. You'll see the message "Your deployment is complete" in Azure portal. It deploys a jumpbox on Azure  
2\) Go to your Resource Group in Azure portal, locate the VM named "jumpboxlinux" and look for its Public IP address  
3\) *Wait for about 40 minutes* for installation inside jumpboxlinux VM to be ready \(It prepares automatically in background\)   
4\) You can use Dreamview on URL http://\<public IP of your jumpboxlinux VM\>:8888  


## Advanced - How to check detailed installation trace:     
1\) You can login to jumpbox VM as soon as it is shows Running state in Azure portal  
2\) You can switch to root by using "sudo su" and change directory to waagent using "cd /var/lib/waagent/custom-script/download/0"  
3\) Now you can check "stdout" and "stderr" files.  


## IMPORTANT DISCLAIMER    
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.    

The software and source code in this repository are intended only for use for software simulation for learning purpose and must not be used in a real vehicle.  

The data, software and code provided or developed on this repository are strictly shared with you for software simulation, learning and testing purposes. By using the repository, you acknowledge that it is to be used on an “as is” basis and that it does not provide any warranty or guarantee of any kind, whether expressed or implied, or arising by trade custom, usage or otherwise, as to the accuracy or completeness or the absence or presence of errors or defects with respect to the code.  

In no event, shall author be liable for any loss, expense or direct, indirect, incidental, punitive damage, of any type or nature arising out of the use of, or inability to use the code or program, including, but not limited to, claims, suits or causes of action involving alleged infringement of copyrights, patents, trademarks, trade secrets, or unfair competition.  

This source code is just an example and it does not represent any software or product or service from my employer Microsoft. It is not an official Microsoft artifact or product and it is not endorsed in any way by Microsoft. You should exercise your own judgement and prudence before using it. There is no one who is actively maintaining or supporting this project.    
