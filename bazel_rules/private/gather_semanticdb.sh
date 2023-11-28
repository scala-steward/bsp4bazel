#!/usr/bin/env bash

# Each argument is a Jar to be unzipped. 
files=({INPUT_JARS})
out_dir="$BUILD_WORKSPACE_DIRECTORY/{OUT_DIR}"

mkdir -p "$out_dir"

for file in "${files[@]}"
do
    mkdir -p $(dirname "$file")
    echo "file $file"
    cp -v --update=older "$file" "$out_dir"
    # sha_file="$out_dir/META-INF/semanticdb/$jar.sha"
    # if sha256sum -c "$sha_file"; then
    #     echo "skipping $jar, already up to date"
    # else
    #     unzip -o "$jar" "META-INF/*" -d "$out_dir"
    #     sha256sum $jar > "$sha_file"
    # fi 
done