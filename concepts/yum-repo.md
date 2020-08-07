#### *yum-config-manager to Add, Enable and disable yum repositories.*

###### Resources
- `https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/deployment_guide/sec-managing_yum_repositories`
- `https://man7.org/linux/man-pages/man1/yum-config-manager.1.html`

---

1. **Adding a yum repo.**

- You can add a new repository in either `/etc/yum.conf` or create a `.repo` to `/etc/yum.repos.d/{example}.repo`. Yum reads `.repo` files and its better to add to `/etc/yum.repos.d/`.
- Always add verified and trusted sources in the repos.
- `yum-config-manager --add-repo {http://www.example.com/example.repo}`. This command will add a .repo in `/etc/yum.repos.d`

2. **Enable / Disable the repo.**
- `yum-config-manager --enable repository` to enable the repo. To check all the available repos, run `yum repolist all`.
- `yum-config-manager --disable repository` to disable the repo.

---

Note: If a proxy is used to connect to Repo source, and if its blocking to connect, then disable the poxy by either setting it in `/etc/yum.conf` or `/etc/yum.repos.d/{example.repo}` like this: 
`proxy=_none_` - https://superuser.com/questions/393099/how-to-specify-that-yum-should-not-use-proxy-for-specific-domain

Other Yum commands to manage repos and packages.
https://access.redhat.com/sites/default/files/attachments/rh_yum_cheatsheet_1214_jcs_print-1.pdf





