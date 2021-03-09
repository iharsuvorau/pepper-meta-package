PACKAGE_NAME := pepper-$(VERSION)
RELEASE_DIR := build/release/$(PACKAGE_NAME)
ARCHIVE_PATH := $(RELEASE_DIR).zip

.PHONY: update release

update:
	git submodule foreach "git checkout master && git pull"

release: update
	mkdir -p $(RELEASE_DIR);
	cp start.bat $(RELEASE_DIR)

	# making server
	mkdir -p $(RELEASE_DIR)/server;
	cd garlic && go get . && cd ..;
	cd ./garlic && GOOS=windows GOARCH=amd64 go build -o ../$(RELEASE_DIR)/server/ . && cd ..;
	cp -r data $(RELEASE_DIR)/server;

	# making site
	cd garlic-client && npm install && npm run build;
	cp -r garlic-client/public $(RELEASE_DIR)/site;
	cp caddy_windows_amd64_custom.exe $(RELEASE_DIR)/site

	# archiving
	cd $(RELEASE_DIR); cd ..; zip -re $(PACKAGE_NAME).zip $(PACKAGE_NAME); cd ../..

	# publishing
	rsync $(ARCHIVE_PATH) ims.ut.ee:/home/ihar/public_html/pepper_releases/
	echo "The latest release is availabe at https://ims.ut.ee/~ihar/pepper_releases/$(PACKAGE_NAME).zip"
