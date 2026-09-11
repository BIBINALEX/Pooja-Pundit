# Acharya

## Flavors

The app has separate development and production flavors. Each flavor loads its
own file from `env/` at runtime:

- development: `env/.env.development`, displayed as `Acharya Dev`
- production: `env/.env.production`, displayed as `Acharya`

Run development:

```sh
flutter run --flavor development --dart-define=FLAVOR=development
```

The same workflows are available through the root `Makefile`:

```sh
make dev
make prod
make build-dev
make build-prod
```

Run production:

```sh
flutter run --flavor production --dart-define=FLAVOR=production
```

Build Android:

```sh
flutter build apk --flavor production --dart-define=FLAVOR=production
```

Build iOS:

```sh
flutter build ios --flavor production --dart-define=FLAVOR=production
```

Copy `env/.env.example` to each flavor file and replace the placeholder values
before using a new checkout. The flavor files are intentionally ignored by
git because they contain environment-specific configuration.
