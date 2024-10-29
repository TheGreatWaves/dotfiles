[no-cd]
ls DIR=".":
  @eza {{ DIR }}

[no-cd]
ll DIR=".":
  @exa -alh {{ DIR }}

[no-cd]
tree DIR=".":
  @exa --tree {{ DIR }}
