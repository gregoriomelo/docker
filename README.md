docker cookbook
========================
Cookbook for [docker](http://docker.io)

Requirements
------------

#### packages
- `lxc wget bsdtar curl linux-image-extra-<kernel_version>`

Usage
-----
#### docker::default
Just include `docker` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[docker]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. ...
3. Submit a Pull Request using Github
