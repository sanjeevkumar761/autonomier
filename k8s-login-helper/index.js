const express = require('express')
const shell = require('shelljs');

const app = express()
const port = 3000


app.get('/token', function(req, res){
  shell.exec("sudo kubectl get secret $(kubectl get serviceaccount kubeapps-operator -o jsonpath='{range .secrets[*]}{.name}{end}' | grep kubeapps-operator-token) -o jsonpath='{.data.token}' -o go-template='{{.data.token | base64decode}}' && echo", function(code, stdout, stderr) {
    console.log('command Exit code:', code);
    console.log('command output:', stdout);
   
    if(stderr){
      console.log('command stderr:', stderr);
      res.json({"error": stderr});
    }
    //res.json({"token": stdout});
    res.send(stdout);
  })

});

app.listen(port, () => console.log(`Login helper app listening at http://localhost:${port}`))