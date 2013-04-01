docker-cookbook Cookbook
========================
Cookbook for [docker](http://docker.io)

Requirements
------------

#### packages
- `lxc wget bsdtar curl linux-image-extra-<kernel_version>`

Usage
-----
#### docker-cookbook::default
Just include `docker-cookbook` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[docker-cookbook]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. ...
3. Submit a Pull Request using Github
