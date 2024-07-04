# Git Configuration Script and SSH Setup

This repository contains a script to switch between personal and work git configurations and instructions on setting up SSH for multiple identities.

## Git Configuration Script

### Usage

This script allows you to set local git credentials for either work or personal use.


### Running the Script

To set the git configuration for work, in your local directory corresponding to the git repo you wish to work on type:

```bash
./set_git_config.sh --work
```

To set the git configuration for personal use:

```bash
./set_git_config.sh --personal
```

## SSH Configuration

To manage multiple SSH identities (e.g., for GitHub or Gitlab), you need to set up your `~/.ssh/config` file.

### Generate SSH Keys

Generate separate SSH keys for personal and work use if you haven't already:

```bash
# For personal use
ssh-keygen -t rsa -b 4096 -C "your_personal_email@domain.com" -f ~/.ssh/id_rsa_personal

# For work use
ssh-keygen -t rsa -b 4096 -C "your_work_email@domain.com" -f ~/.ssh/id_rsa_work
```


### SSH Config File

Create or edit your `~/.ssh/config` file with the following content:

```plaintext
# Personal GitHub account
Host github-personal
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_rsa_personal
    IdentitiesOnly yes

# Work GitHub account
Host :github-work
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_rsa_work
    IdentitiesOnly yes
```

### Using the Configured Hosts in Git (__IMPORTANT__)

Update the remote URL for your Git repositories to use the appropriate SSH alias.

For a personal repository:

```bash
git remote set-url origin git@github-personal:username/repository.git
```

Note the change from the typical `git@github.com/` to `git@github-personal` (You can set up whatever name you want but make sure it corresponds with the Host attribute in your .ssh/config file)

Similarly,  For a work repository:

```bash
git remote set-url origin git@github-work:username/repository.git
```

