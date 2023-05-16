{ pkgs, ... }:

{
  # https://devenv.sh/packages/
  packages = [
    pkgs.terraform_1
  ];

  # https://devenv.sh/pre-commit-hooks/
  pre-commit.hooks.shellcheck.enable = false;
}
