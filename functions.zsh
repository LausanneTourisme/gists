Zsh() {
	source ~/.zshrc;
	echo "Zsh refreshed!";
}

Zshrc() {
	vim ~/.zshrc;
	Zsh;
}

Dk() {
	cd ~/Code/Docker/"$@";
}

laradk(){
	Dk laradock;
}

projects()
{
	Dk projects;
	for folder in "$@"; do
		cd "$folder";
	done;

}

dc() {
	laradk;
	docker-compose "$@";
	cd -;
}

fixPerms() {
	sudo chown -R "`whoami`":"`whoami`" ./;
}

