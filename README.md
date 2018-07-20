README for BiocNimfa
=====


## One strategy

- DESCRIPTION:PythonRequirements: lists python version and packages.
- BiocNimfa/python-requirements.txt contains output of pip freeze
- build system creates a `~/.virtualenvs/<BiocPkgName>` virtual
  environment (could be anywhere) with python and packages

		virtualenv -p python3.5 ~/.virtualenvs/<BiocPkgName>

- activate virtualenv

	source ~/.virtualenvs/<BiocPkgName>/bin/activate

- install python requirements

	pip install -r python-requirements.txt

- deactviate virtualenv

	deactivate

- build system sets

		export RETICULATE_PYTHON=~/.virtualenvs/<BiocPkgName>/bin/python

- `R -e "reticulate::import('nimfa')"` works!

## Second strategy

Installation Commands

	virtualenv ~/.virtualenvs/BiocNimfa
	source ~/.virtualenvs/BiocNimfa/bin/activate
	pip install -r BiocNimfa/python_requirements.txt
	deactivate

Shell + R commands

shell:

Activate virtualenv before using reticulate or starting R.

	source ~/.virtualenv/BiocNimfa/bin/activate

R:

Load BiocNimfa and import the module with function `nimfa()`

	library(BiocNimfa)
	nimfa = nimfa()

R:

Run test cases included in BiocNimfa

	devtools::test()
