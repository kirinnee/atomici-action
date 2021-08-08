# Commit Conventions

This project uses [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/) loosely as the specification
for our commits.

Commit message will be in the format:

```
type(scope): title

body
```

This page will document the types and scopes used.

# Types

| Type                  | Description                                               |
| --------------------- | --------------------------------------------------------- |
| [fix](#fix)           | Fixes bug in repository                                   |
| [feat](#feat)         | Adds a new feature into the action                        |
| [remove](#remove)     | Remove or deprecated features from the action             |
| [docs](#docs)         | Add documentation                                         |
| [ci](#ci)             | Changed the CI pipeline                                   |
| [release](#release)   | Initiate a release (machine initiated)                    |
| [config](#config)     | Update configuration of the repository                    |
| [refactor](#refactor) | Refactor the action                                       |
| [chore](#chore)       | Any chores, uncategorized, or small mistakes (like typos) |

## fix

Fixes bug in repository

| **V.A.E**       | V.A.E values                                                                     |
| --------------- | -------------------------------------------------------------------------------- |
| verb            | fix                                                                              |
| application     | when this commit is applied, it will _fix_ `<title>`                             |
| example         | fix: action wrongly retrieving env var                                           |
| example applied | when this commit is applied, it will _fix_ **action wrongly retrieving env var** |

| Scope    | Description                                  | Bump    |
| -------- | -------------------------------------------- | ------- |
| default  | Generic fixes not under `action` or `config` | `patch` |
| `action` | Fixes in the GitHub action                   | `patch` |
| `config` | Fixes in configuration                       | `nil`   |

## feat

Adds a new feature into the action

| **V.A.E**       | V.A.E values                                                                                      |
| --------------- | ------------------------------------------------------------------------------------------------- |
| verb            | add                                                                                               |
| application     | when this commit is applied, it will _add_ `<title> to the GitHub action`                         |
| example         | feat: generators for random numbers                                                               |
| example applied | when this commit is applied, it will _add_ **generators for random numbers** to the GitHub action |

| Scope   | Description                               | Bump    |
| ------- | ----------------------------------------- | ------- |
| default | Adds a new feature into the GitHub action | `minor` |

## remove

Remove or deprecated features from the action

| **V.A.E**       | V.A.E values                                          |
| --------------- | ----------------------------------------------------- |
| verb            | remove                                                |
| application     | when this commit is applied, it will _remove_ `title` |
| example         | remove: generators for random numbers                 |
| example applied | when this commit is applied, it will _remove_ title   |

| Scope   | Description                                      | Bump    |
| ------- | ------------------------------------------------ | ------- |
| default | Removed or deprecated a features from the action | `major` |

## docs

Add documentation

| **V.A.E**       | V.A.E values                                                                     |
| --------------- | -------------------------------------------------------------------------------- |
| verb            | document                                                                         |
| application     | when this commit is applied, it will _document_ `<title>`                        |
| example         | docs(dev): how to setup dev environment                                          |
| example applied | when this commit is applied, it will _document_ **how to setup dev environment** |

| Scope   | Description                                                 | Bump  |
| ------- | ----------------------------------------------------------- | ----- |
| default | Adds a generic documentation not related to `dev` or `user` | `nil` |
| `user`  | Adds a user-side documentation                              | `nil` |
| `dev`   | Adds a developer-side (contributing) documentation          | `nil` |

## ci

Changed the CI pipeline

| Scope   | Description             | Bump  |
| ------- | ----------------------- | ----- |
| default | Update CI configuration | `nil` |

## release

Initiate a release (machine initiated)

| Scope   | Description               | Bump  |
| ------- | ------------------------- | ----- |
| default | Machine initiated release | `nil` |

## config

Update configuration of the repository

| **V.A.E**       | V.A.E values                                                                                |
| --------------- | ------------------------------------------------------------------------------------------- |
| verb            | configure                                                                                   |
| application     | when this commit is applied, it will _configure_ `<title>`                                  |
| example         | config(lint): shellcheck to ignore SC2015 for run.sh                                        |
| example applied | when this commit is applied, it will _configure_ **shellcheck to ignore SC2015 for run.sh** |

| Scope    | Description                                                                  | Bump    |
| -------- | ---------------------------------------------------------------------------- | ------- |
| default  | Updates the configuration of the repository, not related to the other scopes | `nil`   |
| `lint`   | Add, update or remove linters                                                | `nil`   |
| `fmt`    | Add, updatge or remove formatters                                            | `nil`   |
| `build`  | Add, update or change build pipelines and generators                         | `patch` |
| `env`    | Add, update or change environment                                            | `patch` |
| `ignore` | Add, update or change ignore configurations                                  | `nil`   |

## refactor

Refactor the action

| **V.A.E**       | V.A.E values                                                                                         |
| --------------- | ---------------------------------------------------------------------------------------------------- |
| verb            | refactor                                                                                             |
| application     | when this commit is applied, it will _refactor_ `<title>`                                            |
| example         | refactor: install nix and cachix into a single faster step                                           |
| example applied | when this commit is applied, it will _refactor_ **install nix and cachix into a single faster step** |

| Scope   | Description             | Bump    |
| ------- | ----------------------- | ------- |
| default | Refactor the dockerfile | `patch` |

## chore

Any chores, uncategorized, or small mistakes (like typos)

| Scope   | Description | Bump  |
| ------- | ----------- | ----- |
| default | chores      | `nil` |

# Special Scopes

| Scope        | Description                    | Bump  |
| ------------ | ------------------------------ | ----- |
| `no-release` | Prevent release from happening | `nil` |
