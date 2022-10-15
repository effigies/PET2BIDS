# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = source
BUILDDIR      = build


# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# add a dependency, this is an alias for poetry add that also updates the requirements.txt file
add:
	@scripts/add_python_dependency $(ARGUMENTS)

# copies metadata to path included in pypet2bids project to enable packaging of those files w/ poetry
buildpackage:
	@cp -R metadata/ pypet2bids/pypet2bids/metadata
	@cp pypet2bids/pyproject.toml pypet2bids/pypet2bids/pyproject.toml
	@cd pypet2bids && poetry build

# installs latest package
installpackage:
	@scripts/installpackage

testphantoms:
	@scripts/testphantoms