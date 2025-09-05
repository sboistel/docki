---
title: "Git"
description: "Git tips and tricks"
tags: ["git", "version control", "collaboration"]
---

Here are somes git tips & tricks

## Using Git

The following commands can be helpful for working with `git`.

| git command | Comment |
| - | - |
| **git init**                         | Initialize a directory as git managed repository |
| **git clone <repo_url>**             | Clone a remote repository to your local client |
| **git status**                       | Shows uncommited changes, new files etc. |
| **git add <wildcard_or_filename>**   | Stage an updated / new file to the next commit |
| **git rm <wildcard_or_filename>**    | Remove a file and stage the removal for the next commit |
| **git commit -m "<commit message">** | Commit staged changes under a new commit |
| **git commit**                       | Will open an editor to write more descriptive commit messages.<br> See [here](https://cbea.ms/git-commit/) for a guide on good commit messages |
| **git checkout <branch_name>**       | Switch to another branch |
| **git branch**                       | Shows a list of existing branches |
| **git branch <branch_name>**         | Creates a new branch (from the currently checked out branch) |
| **git merge <branch_name>**          | Merge changes from `branch_name` to the currently checked out branch |
| **git push**                         | Push commited changes to the remote repository |
| **git pull**                         | Pull current state from the remote repository to your local repo |

### Working with git-flow

Git-flow assists you by combining multiple steps of `git` commands to one `git-flow` command
which will do a workflow of steps. Although `git-flow` makes live easier in some cases,
it makes it also more complex sometimes and you need to execute some steps before or after using
a `git-flow` command as regular `git` command. (See below)

As an example, here is the comparison between the regular `git` commands and the appropriate
`git-flow` command for creating a release.

| git-flow command | git command |
| - | - |
| **git-flow feature start <feature_name>** | `git checkout -b feature/<feature_name> develop` |
| **git-flow feature finish <feature_name> [--squash]** | `git checkout develop` |
| | **git merge [--squash] --no-ff feature/<feature_name>** |
| | **git branch -d feature/<feature_name>** |

Another `git-flow` cheat sheet can be found [here](https://danielkummer.github.io/git-flow-cheatsheet/).

## Config

## Username

Add the username to your profile

```bash
git config --global user.name "sboistel"
```

### Email

Add your email to your profile

```bash
git config --global user.email "[sboistel@mail.com](mailto:sboistel@mail.com)"
```

### Credentials

Store your repository login credentials

```bash
git config credential.helper store
```

## Branches

List branches

```bash
git branch
```

### Checkout

Check which branch you are currently on

```bash
git checkout
```

Switch branches:

```bash
git checkout nom_branche
```

## Manage

### Push

Push to a branch other than master

```bash
git push -u origin nom_branche
```

### Merge

Switch to the master (main) branch, then

```bash
git merge nom_branche
```

Don't forget to push afterwards

```bash
git push
```

### Stash

Stash allows you to keep local changes without propagating them.

You can check what can be saved:

```bash
git stash list
```

Clear the stash list

```bash
git stash clear
```

Apply or commit a stash

```bash
git stash apply
git stash pop
```

## Rebase branch

Go to the main/master branch

```bash
git checkout main
```

Pull changes

```bash
git pull
```

Go back to your branch

```bash
git checkout yourbranchname
```

Let's rebase it

```bash
git rebase main
```

Then open your file and resolve any conflicts.

Finally, continue the rebase

```bash
git rebase --continue
```

Upload

```bash
git push --force
```
