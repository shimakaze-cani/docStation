repo_path="/volume1/docker/mkdocs/docs"
cd "$repo_path"
echo "cd to "$PWD
git fetch --all
git reset --hard origin/main
echo "Git repo refreshed"
exit 0