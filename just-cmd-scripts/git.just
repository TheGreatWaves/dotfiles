[no-cd]
gcmsg MESSAGE:
  @git commit -m {{ MESSAGE }}

[no-cd]
gitc BRANCH:
  @git checkout {{ BRANCH }}

[no-cd]
gitm:
  @git checkout master

[no-cd]
gcf:
  @git commit --amend --no-edit

[no-cd]
gcfm MESSAGE:
  @git commit --amend --message

[no-cd]
gpmf:
  @git push origin HEAD:$(git_main_branch) --force-with-lease
