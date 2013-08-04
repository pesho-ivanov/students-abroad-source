SITE_PATH=../students-abroad

compile:
	nanoc compile
	nanoc prune --yes

copy_output:
	cd $(SITE_PATH); find . -mindepth 1 -not -path "./.git*" -not -path "./CNAME" -not -path "./.nojekyll" -delete
	cp -r output/* $(SITE_PATH)/
	cd $(SITE_PATH); git add * && git commit -a && git push

publish: compile copy_output
