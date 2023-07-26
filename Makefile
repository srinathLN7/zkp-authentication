# START: begin
GITHUB_BACKUP_PATH=${HOME}/go/src/github.com/srinathLN7/gitbackup/zkp-authentication

.PHONY: compile
compile:
	protoc api/v2/proto/*.proto \
		--go_out=. \
		--go-grpc_out=. \
		--go_opt=paths=source_relative \
		--go-grpc_opt=paths=source_relative \
		--proto_path=.


.PHONY: test
test:
	go test -race -parallel=1 -count=1 ./...


.PHONY: gitbackup
gitbackup:
	sudo cp -rf ./.git  ${GITHUB_BACKUP_PATH}

# END: begin