# Heart Check

A Flutter app for estimating heart disease risk from common clinical indicators. The app collects patient-style health inputs, sends them to a prediction API, and presents a readable risk profile with probability, contributing factors, and lifestyle recommendations.

> This project is for educational and decision-support purposes only. It is not a medical diagnosis tool and should not replace advice from a qualified healthcare professional.

## Features

- Onboarding flow with a first-run redirect after completion.
- Guided health input form with field explanations using ShowcaseView.
- Heart disease prediction through a REST API.
- Result screen with risk probability, visual gauges, metric cards, top contributing factors, and recommendations.
- Light and dark themes with persisted theme preference.
- Responsive mobile-first UI using `flutter_screenutil`.


## Tech Stack

- Flutter `3.38.5`
- Dart `3.10.4`
- `flutter_bloc` and `hydrated_bloc` for state management and persistence
- `go_router` for navigation
- `dio` for API calls
- `get_it` for dependency injection
- `shared_preferences` for lightweight local flags
- `flutter_dotenv` for environment configuration
- `lottie` and `flutter_native_splash` for startup and animation assets

## Project Structure

```text
lib/
  core/
    di/                 Dependency injection setup
    helper/             Validators, preferences, form helpers, messages
    networking/         Dio client, API constants, error handling
    routing/            App routes and GoRouter configuration
    theme/              Light/dark theme, styles, theme cubit
    widgets/            Shared UI widgets
  features/
    onboarding/         Intro screens and how-it-works flow
    prediction/         Health input form, cubits, request/response models, repo
    guide/              Showcase explanations for medical input fields
    result/             Prediction result UI, gauges, metrics, recommendations
assets/
  fonts/                Inter and Manrope font files
  images/               App images and splash assets
  lottie/               Heart animation assets
```
