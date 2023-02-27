# Read, Write, Delete Test

This container "saimonsl/write-test:0.0.2" helps you do a write test to a specified destination in the environment variable called `TEST_PATH`  
This is useful if you want to test and see if you can successfully write to a NFS is SMB service.  
By looking at the output log you should see something like this

```
TEST_PATH is set to: /nfs_share/test
total 14
drwxr-xr-x 2 nobody nogroup 4096 Feb 27 10:06 .
drwxr-xr-x 3 nobody nogroup 4096 Feb 26 12:03 ..

Create folder test...
mkdir: created directory '/nfs_share/test/write-folder-test'

Delete folder test...
removed directory '/nfs_share/test/write-folder-test'

Create file test...

Write file test...

Read file test...
cat: /nfs_share/test/write-test.tmp: No such file or directory

Delete file test...

Leaving proof

File Test Complete
```

## Usage

### Docker Compose

Notice in `TEST_PATH` I specified which folder to test on.

```yml
version: '3.6'

services:
  writetest:
    image: saimonsl/write-test:0.0.2
    environment:
      TEST_PATH: /nfs_share/test
    volumes:
      - test-docker:/nfs_share
    deploy:
      mode: replicated
      replicas: 1
      restart_policy:
        condition: none
    healthcheck:
      disable: true

volumes:
  test-docker:
    driver: local
    driver_opts:
      type: "nfs4"
      o: "addr=10.0.0.49,nolock,soft,rw"
      device: ":/nfs_share/docker"
```

## Proof

After a successful run you should see a file called "proof.txt"  
Read that file and you should see something like this:
```
Mon Feb 27 09:58:35 UTC 2023
All test succeed
```
