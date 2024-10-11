# Preternatural CLI

`preternatural` is a command line tool to help building and updating Xcode Projects, Workspaces and Swift packages. You can find the latest CLI executable binary asset under [releases](https://github.com/PreternaturalAI/CLI-release/releases/latest) with the filename `preternatural.artifactbundle.zip`.

## Installation

### via Homebrew (Recommended)

1. Install Homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
2. Add tap: `brew tap PreternaturalAI/preternatural`
3. Install CLI: `brew install preternatural`

### via Mint

1. Install Mint: `brew install mint`
2. Add Mint to path: `echo 'export PATH="$HOME/.mint/bin:$PATH"' >> ~/.zshrc && source ~/.zshrc`
3. Install CLI: `mint install PreternaturalAI/CLI-release preternatural`

Use `preternatural --help` to see available options.

## Commands

### Add Package

Add a Swift package to the Xcode project or workspace. This command will recursively search for Xcode projects and workspaces in the current working directory, and add the package to all projects and workspaces.

```
preternatural add <package-url>
```

Arguments:
- `package-url`: The URL of the Swift package to add

Example:
```
preternatural add https://github.com/Alamofire/Alamofire.git
```

### Archive

Archive and export a notarized and stapled .zip for the macOS app. Recursively searches in the current working directory for a project or workspace that contains the given target, and will archive the first one. If no target is specified, it will auto-determine the primary target of the first found project or workspace file and archive it.

```
preternatural archive [options]
```

Options:
- `--target`: The target to archive. If not specified, the primary target will be used
- `--output`: The output path for the archived .zip file. If not specified, a default path will be used
- `--team-id`: The Team ID to use while notarizing.
- `--custom-bundle-prefix`: The custom Bundle ID prefix to set when exporting the app (Example: `com.custom`)
- `--verbose`: Enable verbose logging
- `--debug`: Build the app in debug configuration. (It is built in release configuration by default)

> [!NOTE]  
> Before running the `archive` command, it is recommended to set the Apple ID and password for notarization using the `preternatural config set-notary-credentials` subcommand. If credentials have not been set before, they will be interactively asked when the command runs. Make sure that a Developer ID Application Certificate has been generated for the Team ID that you are trying to notarize with.

Example:
```
preternatural archive --target MyApp --output ./output/MyApp.zip --debug

preternatural archive --team-id TEAM_ID --custom-bundle-prefix com.custom --verbose
```

### Build

Build Xcode projects, packages and workspaces. This command builds all projects, packages and workspaces that it finds within the current working directory. It also searches in sub-directories. If a project or package is found to be referenced from a workspace, by default this command will prioritize building it from the workspace as opposed to the standalone project or package.

```
preternatural build [options]
```

Options:
- `--derived-data-path <path>`: Path to the derived data folder
- `--build-all-platforms`: Builds for all supported platforms
- `--verbose`: Enable verbose logging
- `--isolated`: Prioritises building standalone Xcode projects instead of the referenced projects in an Xcode Workspace
- `--update-developer-team`: Autoconfigure the developer team for Xcode projects. Warning - this option updates the Xcode project with a new developer team
- `--attempt-automatic-fixes`: If build fails for a project or workspace, attempts to fix the build by updating code signing and dependencies. This does not update the original Xcode project or workspace, it makes a temporary copy and tries updating and building the temporary copy
- `--architectures <architectures>`: Comma-separated list of architectures to build for (e.g., 'arm64,x86_64')
- `--configuration <configuration>`: Build configuration (debug or release). Default is debug

Example:
```
preternatural build --build-all-platforms --update-developer-team --architectures arm64,x86_64 --configuration release
```

### Clone

Clone an Xcode workspace or project.

```
preternatural clone <input> <output>
```

Arguments:
- `input`: The input workspace or project file path. Can be a relative or full path to an .xcworkspace or .xcodeproj file. Optionally, you can specify a target using the format: <file path>.xcodeproj/<target> or <file path>.xcworkspace/<target>
- `output`: The output directory path where the cloned project will be saved

Example:
```
preternatural clone ./MyProject.xcodeproj ./ClonedProject
```

### Config

#### Set Notary Credentials

The `config set-notary-credentials` command allows you to set notarization credentials to be used with the `archive` subcommand. These credentials are securely stored in the keychain and are used by the `archive` subcommand when exporting the application archive.

Options:
- `--apple-id`: Your App Store Connect Apple ID to be used for notarization
- `--password`: Your app-specific password to be used for notarization. See how to generate an app-specific password [here](https://support.apple.com/en-us/102654)
- `--team-id`: The Team ID to use while notarizing. Make sure that a Developer ID Application Certificate has been generated for this Team ID

Example:
```
preternatural config set-notary-credentials --apple-id user@apple.com --password your_password --team-id TEAM_ID
```

> [!NOTE]  
> You can store multiple credentials for different Team IDs. The appropriate stored credential will be found by the `archive` command by matching the `--team-id` that you provide.

#### Set GitHub Access Token

The `config set-github-access-token` command allows you to store GitHub access tokens securely in the keychain. These tokens can be used by other `preternatural` subcommands that require GitHub authentication.

Options:
- `--name`: A name to identify the GitHub access token
- `--token`: The GitHub access token to store

Example:
```sh
preternatural config set-github-access-token --name my_token --token your_github_token
```

This command will store the GitHub access token securely in the keychain with the identifier "Preternatural_Github_Access_Token_my_token".

### Find

Find packages that depend on a given package. The command will search for packages in your GitHub repositories and return a list of packages that depend on the specified input package. In addition to that, it will also clone and cache the dependent packages locally.

```
preternatural find [options]
```

Options:
- `--input`: The package to search for
- `--target`: (Optional) The target of the search (currently only supports 'package-dependants')
- `--github-token-name`: The name of the GitHub token to use. This should have been set using the `preternatural config set-github-access-token` command.

Example:
```
preternatural find --input "Alamofire" --target package-dependants --github-token-name my_token
```

> [!NOTE]  
> Before using the `find` command, make sure to set up a GitHub access token using the `preternatural config set-github-access-token` command. This token is required for authenticating with GitHub and accessing repository information.

The command will output a list of packages that depend on the specified input package, including their remote URL and local cache URL.

### Fix Codesigning

Fixes codesigning by fetching and applying codesigning certificates from the keychain.

```
preternatural fix codesigning [input]
```

Arguments:
- `input`: Path to the project or workspace file to be fixed. If not specified, codesigning fixes will be applied to all projects and workspaces in the current directory

Example:
```
preternatural fix codesigning ./MyProject.xcodeproj
```

### Generate Workspace

This command searches for an Xcode project within the current working directory, and acts on the first project that it finds. It will generate an Xcode workspace, clone all remote dependencies of the Xcode project in a folder called `Dependencies` and link them as local references in the Workspace.

```
preternatural generate workspace [name]
```

Arguments:
- `name`: Name of the workspace to generate (default: All)

Example:
```
preternatural generate workspace MyWorkspace
```

### Update

Update the dependencies of Xcode projects, packages and workspaces.

```
preternatural update [options]
```

Options:
- `--derived-data-path <path>`: Path to the derived data folder
- `--verify`: Verify the update process. Builds any projects / packages / workspaces that had changes
- `--verbose`: Enable verbose logging
- `--build-all-platforms`: Builds for all supported platforms
- `--isolated`: Prioritises building standalone Xcode projects instead of the referenced projects in an Xcode Workspace
- `--update-developer-team`: Autoconfigure the developer team for Xcode projects. Warning - this option updates the Xcode project with a new developer team
- `--architectures <architectures>`: Comma-separated list of architectures to build for (e.g., 'arm64,x86_64')
- `--configuration <configuration>`: Build configuration (debug or release). Default is debug

Example:
```
preternatural update --verify --build-all-platforms --architectures arm64,x86_64 --configuration release
```

## Additional Information

For more detailed information on each command and its options, you can use the `--help` flag with any command or subcommand:

```
preternatural --help
preternatural build --help
preternatural generate workspace --help
```

This will provide you with a detailed description of the command and all available options.
