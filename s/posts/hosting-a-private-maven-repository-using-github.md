---
title: 'Hosting a private Maven repository using Github'
date: '2013-06-05'
description:
categories: ["coding"]
tags: ["github", "java", "maven"]
permalink: '/coding/:title'
---
For whatever reason, Maven seems to be the "market leader" when it comes to Java build tools. Resigning ourselves to this, the demo application we have built on top of our SDK has been (painfully) architected to use maven. At first, we hacked the dependencies using a system dependency. Now that there are other devs working with the demo app, I had to tackle a real maven repository.

Our SDK is not open source, so the difficulty in managing a maven repository immediately skyrockets. As we are using Github for source control and, more importantly, controlling access to the demo app, I went down the path of using Github to host our maven repo. I created a new repository on Github and gave read access to the [team][1] representing developers who have access to the SDK.

With some quick Googling, I found [a post by Chas Emerick][2] which accomplishes what I wanted - mostly. The missing piece of the puzzle, however, is relatively straightforward. I tested raw access to the repository using cURL to confirm HTTP auth works. Then, I had to configure maven to use HTTP auth for this repository.

First, generate a master password:

	mvn -emp <master password>

Paste the output into `~/.m2/settings-security.xml`:

	<settingsSecurity>
		<master>encrypted master password</master>
	</settingsSecurity>

Now, encrypt your Github password:

	mvn -ep <github password>
    
Add the repository to your `~/.m2/settings.xml`:

	<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
	http://maven.apache.org/xsd/settings-1.0.0.xsd">
		<servers>
			<server>
				<id>my-mvn-repo</id>
				<username>username</username>
				<password>encrypted Github password</password>
				<configuration>
					<authenticationInfo>
					<userName>auth-user</userName>
					<password>auth-pass</password>
					</authenticationInfo>
				</configuration>
			</server>
		</servers>
	</settings>

With the instructions in Chas' blog post for adding the server to your project, you'll have a simple, access-controlled maven repository.

Note that I don't care about automatically pushing artifacts to this repo. I have a [Jenkins nightly job][3] to build the snapshots, check them in, and push them. It also removes all old snapshots for the current version to keep the repo clean.

Another, very important, note: **Maven 3.0.5 uses Wagon 2.4 which, in turn, allegedly fixes some SSL bugs**. This update resulted in maven not being able to talk to Github over SSL. I dug into it a bit, but I saw no error from maven/wagon (even with -X and -e), so I have reverted to 3.0.4 until such a time as we want to waste resources on this.

 [1]: https://help.github.com/articles/how-do-i-set-up-a-team
 [2]: http://cemerick.com/2010/08/24/hosting-maven-repos-on-github/
 [3]: http://jenkins-ci.org/
