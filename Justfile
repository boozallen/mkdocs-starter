# the output directory for the documentation
docsDir  := "site"

# describes available recipes
help: 
  just --list --unsorted

# wipe local caches
clean: 
  rm -rf {{docsDir}}

############################
# Documentation Recipes
############################

# builds the jte docs builder image
docsImage := "jte-docs-builder"
buildDocsImage:
  docker build docs -t {{docsImage}}

# Build the jte documentation
docs: buildDocsImage
  docker run --rm -v $(pwd):/docs {{docsImage}} build

# serve the docs locally for development
serve: buildDocsImage
  docker run --rm -p 8000:8000 -v $(pwd):/docs {{docsImage}} serve -a 0.0.0.0:8000

lint-docs: lint-prose lint-markdown

# use Vale to lint the prose of the documentation
lint-prose:
  docker run -v $(pwd):/app -w /app jdkato/vale docs

# use markdownlit to lint the docs
lint-markdown: 
  docker run -v $(pwd):/app -w /app davidanson/markdownlint-cli2:0.3.1 "docs/**/*.md"

# update current docs
update-docs: buildDocsImage
    #!/usr/bin/env bash
    version=$(./gradlew -q printJTEVersion)
    docker run --rm -v ~/.git-credentials:/root/.git-credentials -v $(pwd):/app -w /app --entrypoint=mike jte-docs-builder deploy -f --push $version
    echo "INFO     -  Published version '$version' to GitHub Pages"

###################
# Aggregate Tasks
###################

# Lint code and docs
lint: lint-docs

