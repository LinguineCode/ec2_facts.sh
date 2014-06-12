ec2_facts.sh
============

For use with Puppet's Facter software on AWS EC2 instances. Created as a workaround to this bug: https://tickets.puppetlabs.com/browse/FACT-185.

Install at `/etc/facter/facts.d/ec2_facts.sh`. Below is an example of Hiera YAML to install it using Puppet. It requires the puppetlabs-vcsrepo module.


```
file:
 '/opt/myOrg':
  ensure: directory
 '/etc/facter/facts.d/ec2_facts.sh':
  ensure: link
  target: '/opt/myOrg/ec2_facts.git/ec2_facts.sh'
```

```
vcsrepo:
 '/opt/myOrg/ec2_facts.git':
  ensure: present
  provider: git
  source: 'https://github.com/nixmore/ec2_facts.sh.git'
  revision: 'master'
  require:
   - 'Package[git]'
```

Test it with "`sudo facter | grep ec2`"
