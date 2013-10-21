SITE_PATH=../students-abroad

compile:
	nanoc compile
	nanoc prune --yes

copy_commit_push:
	cd $(SITE_PATH) && find . -mindepth 1 -not -path "./.git*" -not -path "./CNAME" -not -path "./.nojekyll" -delete 
	cp -r output/* $(SITE_PATH)/ 
	cd $(SITE_PATH) && git add * && git commit -a && git push -f

secure_copy:
	if [ -d "$(SITE_PATH)/.git" ]; then $(MAKE) copy_commit_push ; \
	else echo "Incorrect site directory: " $(SITE_PATH) "(no .git/ there)" ; fi

view:
	nanoc view

aco:
	guard &

publish: compile secure_copy

run: aco view

