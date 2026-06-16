# Training Academy Codex Guide

This file defines the default project conventions Codex should follow in this repository unless the user explicitly asks for a different approach.

## Goal

Preserve a feature-first Flutter architecture with clear separation between UI, state, repository, remote data source, and shared core utilities.

## Tech Stack

- Flutter with Material 3
- `flutter_bloc` using Cubit
- `go_router` for navigation
- Supabase REST/RPC access through `Dio`
- `dart_either` for success/error return values
- Localization through `AppLocalizations`

## Non-Negotiable Rules

- Match the existing project package/import name `training_acedamy` unless the user explicitly asks to rename it.
- Reuse existing core utilities before introducing new abstractions.
- Keep changes scoped to the feature being edited.
- Do not introduce a new architecture style in one feature if the rest of the project uses a different one.
- Prefer extending current patterns over creating parallel patterns.

## Feature Structure

When creating a new feature under `lib/features/<feature_name>`, prefer this structure:

```text
lib/features/<feature_name>/
  data/
    data_source/
      remote_data_source/
    models/
    repository/
  domain/
    entity/
    enums/
  presentation/
    controllers/
    ui/
      pages/
      widgets/
```

Use only the folders the feature actually needs. Do not create empty layers just for ceremony.

## Architecture Responsibilities

### Presentation

- Pages and widgets render UI and delegate actions.
- Cubits manage UI state transitions and light input validation.
- UI should not perform networking directly.
- UI should not parse transport payloads.

### Cubit / State Flow

- Emit loading, success, and failure states explicitly.
- Keep Cubit methods focused on one user action.
- Perform simple form validation in the Cubit when it directly supports the screen flow.
- Return user-facing errors through `ApiErrorModel`-backed failure states instead of throwing to the UI.

### Repository

- Repositories coordinate feature logic.
- Repositories interpret remote payloads and map them into models/entities.
- Repositories may combine validation, mapping, and backend result interpretation.
- Repositories should not contain widget or navigation logic.

### Remote Data Source

- Remote data sources stay thin.
- They are responsible for request construction, endpoint paths, query parameters, headers, and calling shared Dio handlers.
- Avoid duplicating error handling if the shared Dio handler already converts failures to `ApiErrorModel`.
- Return `Either<ApiErrorModel, dynamic>` when following the current project pattern.

### Core

- Shared network, theme, routing, extensions, helpers, and reusable widgets belong in `lib/core`.
- If logic is feature-specific, keep it inside the feature instead of moving it to `core` too early.

## Core Widget Usage

Prefer the shared widget layer in `lib/core/widgets/` before introducing a new UI primitive in a feature.

- `CustomScaffold`: use for screen-level pages that need the app background, safe area, padding, and optional floating action button.
- `CustomAppBar`: use for simple page headers with a centered title and optional back navigation.
- `CustomFloatingActionButton`: use for any floating or primary action button shown on a screen.
- `CustomTextButton`: use for reusable primary action buttons, especially inside dialogs and compact form actions.
- `CustomDialog`: use for standard confirmation, alert, and information dialogs with optional submit/cancel actions.
- `CustomLoadingIndicator`: use for loading overlays and in-flight loading states.
- `BannerSvgHandler`: use for banner, hero, or header SVG assets that should scale responsively.
- `CustomSwitch`: use for all toggle rows and settings switches.
- `CustomCheckBox`: use for custom checkbox visuals when the native checkbox needs a shared style.
- `HorizontalDivider`: use for thin full-width separators between sections or items.
- `HorizontalSpacer` and `VerticalSpacer`: use for layout gaps instead of raw `SizedBox` in feature UI.
- `CustomFormField`, `CustomTextField`, and `CustomTextFieldWithTitle`: use for form inputs and titled input blocks.
- `CustomBottomNavigationBar`: use for module-based bottom navigation surfaces.
- `CustomDrawer`: use for module-based side navigation surfaces.
- `NumberTabBuilder`: use for numbered tab, card, or status selectors where the selected item is rendered with a count and label.
- `CustomGridViewBuilder`: use for responsive item layouts where the number of items per row should adapt to screen width.

Preference rules:

- Prefer `CustomFloatingActionButton` over raw `FloatingActionButton`.
- Prefer `NumberTabBuilder` for any numbered tab or status card selector.
- Prefer `CustomSwitch` for any switch or toggle control.
- Prefer spacer widgets for layout gaps instead of scattered `SizedBox` usage.
- Prefer `CustomScaffold` for any page scaffold unless the screen truly needs a different structure.
- Prefer `CustomLoadingIndicator` for loading states.
- Prefer `BannerSvgHandler` for SVG banners and hero art.
- Prefer `CustomGridViewBuilder` over `GridView.builder` when rendering a small-to-medium responsive grid of cards or items and the row/column count should change with screen width.

Exception:

- Use raw Flutter primitives only when the shared widget does not fit the UX requirement, such as when virtualization, advanced scrolling behavior, or a highly custom layout is required.

## Naming Conventions

- File names: `snake_case.dart`
- Classes/enums: `PascalCase`
- Variables/methods: `camelCase`
- Prefer descriptive names over short names.
- Name widgets by purpose, for example `ClientProfileHeader` instead of generic names like `CustomContainerTwo`.

## Comments Style

- Do not add comments for obvious code.
- Add short comments only when a block has non-obvious intent, a business rule, or an important constraint.
- Prefer clear naming over heavy commenting.
- Keep doc-style comments for reusable public methods when they clarify behavior, inputs, or return shape.
- Do not add decorative banner comments unless the file already follows that convention and consistency matters.

## Error Handling Flow

Follow this direction:

1. Network/Dio layer captures transport errors.
2. `ErrorHandler` converts errors into `ApiErrorModel`.
3. Remote data source returns `Either<ApiErrorModel, dynamic>`.
4. Repository interprets payload and maps business cases.
5. Cubit emits failure states with `ApiErrorModel`.
6. UI displays localized or user-friendly error feedback.

Additional rules:

- Do not throw raw Dio errors into the presentation layer.
- Prefer centralized error mapping through `ErrorHandler`.
- Keep transport errors, business-rule failures, and UI messages clearly separated.
- Reuse existing `DataSource` and `ApiErrorModel` patterns where possible.

## Networking Rules

- Prefer shared handlers in `lib/core/network/`.
- Keep Supabase filters explicit and readable near the request.
- Store Supabase table and collection names in `lib/core/network/supbapase_constants.dart` instead of duplicating them in models.
- Prefer RPC helpers for database functions when the backend already exposes them.
- Avoid response-shape assumptions in the UI layer.

## Routing Rules

- Define route paths in `lib/core/routing/routes.dart`.
- Keep routing setup in the routing layer, not in feature widgets.
- Route decisions based on account/user type should come from shared enums or centralized logic.

## Core Enum Patterns

- Enums under `lib/core/enums/programs/` are built as lightweight domain enums with getters, not helper classes.
- When adding any new enum under `lib/core/enums/`, follow the same pattern unless the user explicitly asks for a different structure:
  - use `appMainNavigatorKey.currentContext!` to resolve `AppLocalizations`
  - expose a `disPlayName` getter that reads localized UI text from the app navigator context
  - expose a `databaseName` getter for backend payload values
- Keep the enum values and their `switch` mappings in sync so the UI label and database value always match the same case.
- Prefer this enum shape for future core enums instead of introducing custom enum wrappers or inconsistent access patterns.

## Theme Controls

- Theme and language controls should use the shared `ThemeCubit` state as the source of truth.
- UI settings widgets should read `ThemeCubit.isDarkMode` and `ThemeCubit.isEnglish` through the `SettingsCubit`, then call the cubit toggle methods directly from switch callbacks.
- Do not keep a second local theme state inside dialogs or settings widgets when the existing theme flow already persists and broadcasts the current app mode.
- For app-wide dialogs or controls that need localized labels, resolve strings from the active `BuildContext` and respect the current theme colors from `core/theme`.

## Theme Usage

- When building or modifying any UI, use the `lib/core/theme/` helpers directly before introducing new colors, text styles, or light/dark conditionals.
- Prefer `AppCustomColor` for theme-aware colors, `AppTextStyles` for typography, and `SvgImageModel` for light/dark image switching.
- Use `AppColors` only for the base palette or when adding a new shared token that should be wrapped by `AppCustomColor`.
- Avoid hardcoding raw color values or duplicate style definitions in feature widgets when an equivalent theme helper already exists.
- Keep responsive sizing aligned with `AppSizeCheckpointsManager` and the shared `sp` extension pattern already used in the theme layer.

## Localization Rules

- User-facing strings should go through localization when the surrounding feature already supports it.
- Avoid hardcoding new UI text in pages when localized alternatives are appropriate.
- Internal logs, developer notes, and non-user-facing identifiers do not need localization.

## UI and Widget Rules

- Reuse widgets from `lib/core/widgets` when possible.
- Keep pages focused on composition.
- Extract repeated feature-specific UI into local `presentation/ui/widgets/`.
- Respect the existing theme and spacing patterns before introducing new ones.
- For clickable text or lightweight tap targets, prefer `GestureDetector` over `InkWell` unless the user explicitly wants ripple feedback.
- Do not create or build test widgets unless the user explicitly asks for them.

## Form Validation Rules

- Use `Form` with a `GlobalKey<FormState>` for login, signup, and other user-input screens.
- Keep reusable validator functions in a shared helper such as `lib/core/helpers/form_validator.dart` instead of duplicating inline validation logic across pages.
- Trigger submission actions only after `formKey.currentState?.validate()` returns true.
- Pass validators down through reusable field widgets rather than bypassing them with raw `TextFormField` usage in pages.
- Keep presentation-layer validation focused on form completeness and format; leave async/backend validation in the Cubit, repository, and network layers.

## Testing Expectations

- Add or update tests when behavior changes materially and the surrounding area is testable.
- Prefer focused tests over broad snapshot-style coverage.
- Do not invent test infrastructure that the repo does not already use unless the user asks for it.
- Do not add, generate, or modify any testing code unless the user explicitly asks for it.

## When Unsure

- Follow existing nearby code first.
- Prefer consistency with `authentication`, `core/network`, and current routing/state patterns.
- If two valid approaches exist, choose the one that minimizes architectural drift.

## Optional Specialized Roles

- Repo-local Codex role files live in `.codex/agents/`.
- Use them for focused responsibilities such as remote data sources or feature generation.
- The existing `remote-data-source` role should be treated as a specialization, not a replacement for this repo-wide guide.
