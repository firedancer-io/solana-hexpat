This branch contains binary release artifacts for CI jobs.

plcli
-----

Path: artifacts/plcli

Build environment: Linux RHEL 8

<details>
<summary>Build Log</summary>

```
$ gh repo clone WerWolv/PatternLanguage
Cloning into 'PatternLanguage'...
remote: Enumerating objects: 5948, done.
remote: Counting objects: 100% (1580/1580), done.
remote: Compressing objects: 100% (526/526), done.
remote: Total 5948 (delta 1092), reused 1322 (delta 972), pack-reused 4368
Receiving objects: 100% (5948/5948), 1.48 MiB | 14.31 MiB/s, done.
Resolving deltas: 100% (3600/3600), done.

$ cd PatternLanguage

$ git rev-parse HEAD
9fe6b2bd4b428f6e31473cbd83e66a5e04d4a045

$ git submodule update --init --recursive
Submodule 'external/cli11' (https://github.com/CLIUtils/CLI11) registered for path 'external/cli11'
Submodule 'external/fmt' (https://github.com/fmtlib/fmt) registered for path 'external/fmt'
Submodule 'external/libwolv' (https://github.com/WerWolv/libwolv) registered for path 'external/libwolv'
Cloning into '/home/ripatel/PatternLanguage/external/cli11'...
Cloning into '/home/ripatel/PatternLanguage/external/fmt'...
Cloning into '/home/ripatel/PatternLanguage/external/libwolv'...
Submodule path 'external/cli11': checked out 'faea921e4004af91763b8fde905de3baf24d3945'
Submodule path 'external/fmt': checked out 'a0b8a92e3d1532361c2f7feb63babc5c18d00ef2'
Submodule path 'external/libwolv': checked out 'd02e65c1357b25327b6fe2d02f470788e9e537e6'

$ cmake -G Ninja \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX="$PWD/install" \
  -DCMAKE_C_FLAGS="-fuse-ld=lld" \
  -DCMAKE_CXX_FLAGS="-fuse-ld=lld" \
  -DLIBPL_ENABLE_TESTS=OFF \
  -DLIBPL_ENABLE_CLI=ON \
  -DCMAKE_C_COMPILER=clang \
  -DCMAKE_CXX_COMPILER=clang++ \
  ..
-- Version: 10.0.0
-- Build type: Release
-- libpl static library is being created
-- Could NOT find CLI11 (missing: CLI11_DIR)
-- Configuring done
-- The C compiler identification is Clang 15.0.7
-- The CXX compiler identification is Clang 15.0.7
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /bin/clang - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /bin/clang++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Version: 10.0.0
-- Build type:
-- Performing Test HAS_NULLPTR_WARNING
-- Performing Test HAS_NULLPTR_WARNING - Success
-- libpl static library is being created
-- Could NOT find CLI11 (missing: CLI11_DIR)
-- Configuring done
-- Generating done
-- Build files have been written to: /home/ripatel/PatternLanguage/build

$ ninja
[34/34] Linking CXX executable cli/plcli

$ strip cli/plcli
```

</details>
