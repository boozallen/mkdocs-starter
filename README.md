# mkdocs-starter

A template repository for a [MkDocs](https://mkdocs.org) site with best practices baked in.

## Theme

This site uses [Material for MkDocs](squidfunk.github.io/mkdocs-material) theme.

Run `just serve` to check it out locally. 

## Structure

It's recommended that projects adhere to the [Divio System for Documentation](https://documentation.divio.com).


|                   |  Oriented To  |            Must            |            Form            |
| ----------------: | :-----------: | :------------------------: | :------------------------: |
|      **Concepts** | understanding |          explain           |         an article         |
|     **Reference** |  information  |     describe specifics     |  no-fluff specifications   |
|     **Tutorials** |   learning    | help new users get started |     a hands-on lesson      |
| **How-To Guides** |    a goal     |  solve a specific problem  | a step-by-step walkthrough |


Within the `docs` directory you'll find subdirectories for each of these types of documentation.

## Tooling

| Capability       | Tool                                                       | Description                                                                           |
|------------------|------------------------------------------------------------|---------------------------------------------------------------------------------------|
| Site Generator   | [MkDocs](https://mkdocs.org)                               | Generates the HTML site from the `docs` directory                                     |
| Prose Linting    | [Vale](https://github.com/errata-ai/vale)                  | Enforces consistent writing style in alignment with the Microsoft Writing Style Guide |
| Markdown Linting | [markdownlint](https://github.com/DavidAnson/markdownlint) | Enforces consistent markdown structure and syntax                                     |