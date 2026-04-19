# Heart Check — Heart Disease Risk Prediction App

Heart Check is a Flutter application that collects key cardiovascular indicators, sends them to a prediction API, and returns an easy-to-understand risk profile with explainability and actionable recommendations.

---

## ✨ Features

- **Guided onboarding flow**
  - Two-step onboarding for first-time users.
  - Automatically skipped on future launches.

- **Smart health input form**
  - Captures clinically relevant fields such as age, blood pressure, cholesterol, chest pain type, ECG category, ST metrics, and more.
  - Includes inline validation (range and numeric checks) for safer, cleaner submissions.

- **Interactive field walkthroughs**
  - Built-in showcase/tutorial overlays explain medical inputs directly in the form UI.
  - Guide is shown once and persisted locally.

- **ML/API-powered risk prediction**
  - Sends structured input to a backend `POST /api/predict/` endpoint.
  - Handles loading, success, and API/network errors with clear user feedback.

- **Insightful result screen**
  - Risk gauge with probability and predicted risk status.
  - Input summary cards for quick review.
  - **Top contributing factors** visualization based on model feature impact.
  - Context-aware recommendation cards for both high-risk and lower-risk outputs.

- **Production-friendly app architecture**
  - Feature-first structure.
  - `flutter_bloc` state management.
  - `go_router` navigation with animated transitions.
  - `get_it` dependency injection.
  - Centralized networking using Dio.

---

## 🧱 Tech Stack

- **Framework:** Flutter (Dart)
- **State management:** `flutter_bloc`
- **Navigation:** `go_router`
- **Networking:** `dio`
- **Dependency injection:** `get_it`
- **Local persistence:** `shared_preferences`
- **Responsive UI:** `flutter_screenutil`
- **Environment config:** `flutter_dotenv`
- **UI polish:** `lottie`, `showcaseview`, custom theming/components

---

## 📱 App Flow

1. **Onboarding** → Introduction and app usage context.
2. **Health Input** → User enters personal + medical indicators.
3. **Prediction Call** → App posts payload to backend API.
4. **Results** → Risk score + interpretable factors + recommendations.

---

## 🧾 Input Fields Captured

- Age
- Sex
- Resting blood pressure (`trestbps`)
- Cholesterol (`chol`)
- Max heart rate (`thalch`)
- ST depression (`oldpeak`)
- Number of major vessels (`ca`)
- Chest pain type (`cp`)
- ST slope (`slope`)
- Thalassemia (`thal`)
- Fasting blood sugar > 120 mg/dl (`fbs`)
- Resting ECG result (`restecg`)
- Exercise-induced angina (`exang`)

---

## ⚙️ Setup & Run

### 1) Prerequisites

- Flutter SDK (stable channel)
- Dart SDK (via Flutter)
- Android Studio / Xcode / Chrome tooling (depending on target platform)

### 2) Clone and install

```bash
git clone <your-repo-url>
cd heart-disease-prediction
flutter pub get
```

### 3) Configure environment

Create a `.env` file at the project root:

```env
BASE_URL=https://your-api-domain.com
```

> The app reads `BASE_URL` and calls `POST /api/predict/`.

### 4) Run

```bash
flutter run
```

---

## 🔌 API Contract (expected)

### Request body

```json
{
  "age": 45,
  "trestbps": 130,
  "chol": 220,
  "thalch": 150,
  "oldpeak": 1.2,
  "ca": 0,
  "cp": "non-anginal",
  "slope": "flat",
  "thal": "normal",
  "sex": "Male",
  "fbs": false,
  "restecg": "normal",
  "exang": false
}
```

### Response body

```json
{
  "prediction": 0,
  "probability": 0.23,
  "top_features": [
    { "feature": "normal_num__trestbps", "impact": 0.41 },
    { "feature": "skewed_num__chol", "impact": -0.18 }
  ]
}
```

- `prediction = 1` → higher-risk classification
- `prediction = 0` → lower-risk classification
- `top_features` drives the “Contributing Factors” visualization

---

## 📁 Project Structure

```text
lib/
├── core/
│   ├── di/                 # Service locator setup
│   ├── networking/         # Dio factory + API constants + error handling
│   ├── routing/            # go_router routes + transitions
│   ├── helper/             # Validation, local prefs, form helpers
│   ├── utils/              # Theme, colors, styles, assets
│   └── widgets/            # Shared UI components
├── features/
│   ├── onboarding/         # Intro screens
│   ├── prediction/         # Input form, Cubits, models, repo
│   ├── guide/              # Input field showcase guides
│   └── result/             # Gauge, factors, recommendations
└── main.dart               # App bootstrap + global config
```

---

## ✅ Validation Rules (current)

- Age: `1–120`
- Resting BP: `50–250 mmHg`
- Cholesterol: `100–600 mg/dl`
- Max heart rate: `50–250 bpm`
- ST depression: `0–10`

---

## 🧠 Notes

- This app is for **educational/prototyping** use and is **not medical advice**.
- Model quality depends on backend training data, preprocessing, and evaluation.
- For production health use-cases, include proper compliance, model monitoring, and clinical validation.

---

## 🤝 Contributing

Contributions are welcome. Feel free to open issues and pull requests for:
- UI/UX improvements
- Better explainability visuals
- Enhanced validation and accessibility
- Test coverage and CI improvements

---

## 📄 License

Add your preferred license (MIT, Apache-2.0, etc.) in a `LICENSE` file.
