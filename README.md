# Flutter Exploration

The Flutter sample is a public repository with example projects built using Flutter. It serves as a starting point for customers and developers interested in exploring cross-platform development. The repository also demonstrates how to integrate and use the Backbase headless platform.

> ⚠️ **Important Note:**
>
> - **Incomplete Samples:** Please be aware that the provided code samples are **incomplete** and do not cover all potential error handling or edge cases. Additional development is required to ensure robustness in various scenarios.
>
> - **Platform-Specific Development Only:** Backbase strictly supports **native platform development**. Cross-platform solutions are not supported, and all deliverables must be written in the **native language** for the respective platform (e.g., Swift for iOS, Kotlin for Android).

---

## Samples
Every sample lives on its own branch.

[Flutter Only](https://github.com/Backbase/flutter-exploration/tree/main)
* The code is written entirely in Dart, with no native libraries used.

[Adopting Foundational SDK (Android)](https://github.com/Backbase/flutter-exploration/tree/adopting-foundational-sdk-android)
* This branch adopts the Backbase I-MSDK in a Flutter project.

[Adopting Journey (Android)](https://github.com/Backbase/flutter-exploration/tree/adopting-Journey-android)
* This branch adopts Backbase authentication journey in a Flutter project.

## 💻 Getting started
This project depends on artifacts published to repositories on [Backbase Repo](https://repo.backbase.com). You must have read access to these repositories to build this project. The project also requires a specific keystore in order for the app to communicate with the backend.
In order to configure the project, please follow this [guide on Backbase.io](https://backbase.io/developers/documentation/mobile-devkit/getting-started/set-up-android-development/).

Note that this project connects to the EBP Sandbox Environment, for which you need to request an API key as mentioned [here](https://backbase.io/developers/documentation/api-sandbox/).
Add the key to the [config.json](android/app/src/main/assets/backbase/config.json) file in the asset's folder.

> **Note:** For the [Flutter Only](https://github.com/Backbase/flutter-exploration/tree/main), add the API key [here](lib/core/domain/use_case_config.dart)

### 📱 Login
In order to login, you can find user credentials at [user-credentials page](https://backbase.io/ebp-sandbox/user-credentials?experience=retail).