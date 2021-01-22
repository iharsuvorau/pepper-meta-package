PACKAGE_NAME := pepper-$(VERSION)
RELEASE_DIR := build/release/$(PACKAGE_NAME)
ARCHIVE_PATH := $(RELEASE_DIR).tar.gz

.PHONY: update release

update:
	git submodule foreach "git checkout master && git pull"

release: update
	mkdir -p $(RELEASE_DIR);
	cp start.bat $(RELEASE_DIR)

	# making server
	mkdir -p $(RELEASE_DIR)/server;
	cd garlic && go get . && cd ..;
	GOOS=windows GOARCH=amd64 go build -o $(RELEASE_DIR)/server/ ./garlic;
	cp -r data $(RELEASE_DIR)/server;

	# making site
	cd garlic-client && npm install && npm run build;
	cp -r garlic-client/public $(RELEASE_DIR)/site

	# archiving
	tar -czf $(ARCHIVE_PATH) -C build/release $(PACKAGE_NAME)

	# publishing
	rsync $(ARCHIVE_PATH) ims.ut.ee:/home/ihar/public_html/pepper_releases/
	echo "The latest release is availabe at https://ims.ut.ee/~ihar/pepper_releases/$(PACKAGE_NAME).tar.gz"
