SHELL := bash -o pipefail

.github.env: .github.env.gpg
	gpg --decrypt --batch --passphrase "$(GPG_PASSPHRASE)" .github.env.gpg >.github.env

github-env: .github.env
	sed 's/^export //' <.github.env >>"$(GITHUB_ENV)"
