# Git
Here are somes git tips & tricks

## Using Git

The following commands can be helpful for working with `git`.

| git command                        | Comment                                                                                                                                        |
| ---------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| `git init`                         | Initialize a directory as git managed repository                                                                                               |
| `git clone <repo_url>`             | Clone a remote repository to your local client                                                                                                 |
| `git status`                       | Shows uncommited changes, new files etc.                                                                                                       |
| `git add <wildcard_or_filename>`   | Stage an updated / new file to the next commit                                                                                                 |
| `git rm <wildcard_or_filename>`    | Remove a file and stage the removal for the next commit                                                                                        |
| `git commit -m "<commit message">` | Commit staged changes under a new commit                                                                                                       |
| `git commit`                       | Will open an editor to write more descriptive commit messages.<br> See [here](https://cbea.ms/git-commit/) for a guide on good commit messages |
| `git checkout <branch_name>`       | Switch to another branch                                                                                                                       |
| `git branch`                       | Shows a list of existing branches                                                                                                              |
| `git branch <branch_name>`         | Creates a new branch (from the currently checked out branch)                                                                                   |
| `git merge <branch_name>`          | Merge changes from `branch_name` to the currently checked out branch                                                                           |
| `git push`                         | Push commited changes to the remote repository                                                                                                 |
| `git pull`                         | Pull current state from the remote repository to your local repo                                                                               |

### Working with git-flow

Git-flow assists you by combining multiple steps of `git` commands to one `git-flow` command
which will do a workflow of steps. Although `git-flow` makes live easier in some cases,
it makes it also more complex sometimes and you need to execute some steps before or after using
a `git-flow` command as regular `git` command. (See below)

As an example, here is the comparison between the regular `git` commands and the appropriate
`git-flow` command for creating a release.

| git-flow command                                    | git command                                           |
| --------------------------------------------------- | ----------------------------------------------------- |
| `git-flow feature start <feature_name>`             | `git checkout -b feature/<feature_name> develop`      |
| `git-flow feature finish <feature_name> [--squash]` | `git checkout develop`                                |
|                                                     | `git merge [--squash] --no-ff feature/<feature_name>` |
|                                                     | `git branch -d feature/<feature_name>`                |

Another `git-flow` cheat sheet can be found [here](https://danielkummer.github.io/git-flow-cheatsheet/).

## Config

## Username
Ajout le nom d'utilisateur au profil 
> git config --global user.name "sboistel"

### Mail
Ajout le mail du profil 
> git config --global user.email "[sboistel@mail.com](mailto:sboistel@mail.com)"

### Credentials
Garder en mémoire les données de connexion au repo : 
> git config credential.helper store

## Branches
Lister les Branches 
> git branche

### Checkout
Vérifier quel est la branche sur laquelle nous sommes:
> git checkout

Changer de branche : 
> git checkout nom_branche

## Manage

### Push
Push vers vers une autre branche que Master :
> git push -u origin nom_branche

### Merge
Se positionner sur la branche master (principale..), et ensuite
> git merge nom_branche

Ne pas omettre de push ensuite ;) 
> git push

### Stash
Le stash permet de garder les modifications faites en local sans les propager.
On pourra vérifier ce qu'il est possible de save :
> git stash list

Clear la liste stash 
> git stash clear

Commiter un stash 
> git stash pop

## Rebase branch
Go to main/master branch
> git checkout main

Pull changes
> git pull

Go back to your branch
> git checkout yourbranchname

Let rebase it
> Git rebase main

Then open your file and solve the conflict.

Finaly, continue the rebase
> git rebase --continue

Upload
> git push --force

