.PHONY: help get analyze test clean run-dev run-prod build-dev build-prod build-dev-ios build-prod-ios

FLUTTER ?= flutter

help:
	@printf '%s\n' \
		'make get              Install Flutter dependencies' \
		'make analyze          Run Dart analysis' \
		'make test             Run the test suite' \
		'make dev              Run the development flavor' \
		'make prod             Run the production flavor' \
		'make build-dev        Build the development Android APK' \
		'make build-prod       Build the production Android APK' \
		'make build-dev-ios    Build the development iOS app' \
		'make build-prod-ios   Build the production iOS app' \
		'make clean            Remove Flutter build artifacts'

get:
	$(FLUTTER) pub get

analyze:
	$(FLUTTER) analyze

test:
	$(FLUTTER) test

dev:
	$(FLUTTER) run --flavor development --dart-define=FLAVOR=development

prod:
	$(FLUTTER) run --flavor production --dart-define=FLAVOR=production

build-dev:
	$(FLUTTER) build apk --flavor development --dart-define=FLAVOR=development

build-prod:
	$(FLUTTER) build apk --flavor production --dart-define=FLAVOR=production

build-dev-ios:
	$(FLUTTER) build ios --flavor development --dart-define=FLAVOR=development

build-prod-ios:
	$(FLUTTER) build ios --flavor production --dart-define=FLAVOR=production

clean:
	$(FLUTTER) clean
