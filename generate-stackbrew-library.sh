#!/bin/bash
set -e

defaultVersion=4.1-jdk8

versions=( 4.0-jdk7 4.1-jdk8 )
url='git://github.com/aws/aws-eb-glassfish'

for version in "${versions[@]}"; do
	commit="$(git log -1 --format='format:%H' -- "$version")"
	
	glassfishVersion="${version%%-*}"
	jdkVersion="${version#*-}" # "jdk7"
	
	versionAliases=( $glassfishVersion-$jdkVersion $glassfishVersion) # 4.0-jdk7 4.0
	
	if [ "$glassfishVersion-$jdkVersion" = "$defaultVersion" ]; then
		versionAliases+=( latest )
	fi
	
	echo
	for va in "${versionAliases[@]}"; do
		echo "$va: ${url}@${commit} $version"
	done
done
