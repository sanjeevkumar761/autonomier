# Deploy Autonomier on Azure
*You agree to the dislaimer mentioned at the bottom of this page, when you proceed further with the details and steps given below.*

This creates infrastructure on Microsoft Azure and installs Autonomier framework which is based on Apollo autonomous vehicle platform and Kubeapps framework.  

It takes about 30 minutes for full deployment process to complete. Please follow the steps mentioned below:    

## Getting ready:  
Create Service Principal using Azure Cloud Shell /AZ CLI with command "az ad sp create-for-rbac". Save details as you'll need those later.    
If you use exitsing Service Principal, please make sure to copy appId and password/secret correctly.  

## To deploy Autonomier on Azure, Click the button below:  

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://raw.githubusercontent.com/sanjeevkumar761/autonomier/master/azure-deploy-init/azuredeploy.json)  

Altrenatively, yon can initiate the deployment using Azure CLI. 

## How to check installation progress:   
1\) Wait for initial deployment to complete in Azure portal. You'll see the message "Your deployment is complete" in Azure portal. It deploys a jumpbox on Azure  
2\) Go to your Resource Group in Azure portal, locate the VM named "jumpboxlinux" and look for its Public IP address  
3\) *Wait for about 10 minutes* for installation monitoring layer inside jumpboxlinux VM to be ready \(It prepares automatically in background\)   
4\) Now, you can check installation progress on URL http://\<public IP of your jumpboxlinux VM\>:3000  \(you need to refresh the page manually to check progress until the Deployment progress reaches 100% which takes about 40-50 minutes)  
5\) You can check detailed installation logs on URL http://\<public IP of your jumpboxlinux VM\>:9001  


## Advanced - How to check detailed installation trace:     
1\) You can login to jumpbox VM as soon as it is shows Running state in Azure portal  
2\) You can switch to root by using "sudo su" and change directory to waagent using "cd /var/lib/waagent/custom-script/download/0"  
3\) Now you can check "stdout" and "stderr" files.  


## IMPORTANT DISCLAIMER    
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  

This source code is just an example and it does not represent any software or product or service from my employer Microsoft. It is not an official Microsoft artifact or product and it is not endorsed in any way by Microsoft. You should exercise your own judgement and prudence before using it. There is no one who is actively maintaining or supporting this project.  
