

# Flutter Naming Conventions

## Folder Naming

| Pattern | Example | Rule |
| --- | --- | --- |
| Feature folders | `lib/features/branch/`, `lib/features/lead_purpose/` | `snake_case`, singular nouns |
| Sub-folders | `widgets/`, `constants/`, `controllers/`, `screens/`, `services/`, `models/`, `utils/` | lowercase, plural nouns |
| Shared sub-folders | `crud/`, `layout/`, `drawers/` | `snake_case`, plural |
| Legacy/Core folders | `lib/core/widgets/`, `lib/core/theme/` | lowercase, plural |

### Feature Folder Examples

```
lib/features/branch/              -- Simple CRUD feature
lib/features/facebook_view_leads/ -- Multi-word snake_case
lib/features/lead_generation_api/ -- Compound feature name
lib/features/deal_additional_fields/ -- Descriptive feature

```

---

## File Naming

> 📌 **Dart Rule:** All file names must be `snake_case`.

| File Type | Pattern | Examples |
| --- | --- | --- |
| Screen components | `snake_case` + `_screen` suffix | `branch_screen.dart`, `login_screen.dart`, `dashboard_screen.dart` |
| Flutter widgets | `snake_case` | `admin_table.dart`, `page_header.dart`, `settings_tabs.dart` |
| State/Controllers | `snake_case` + state manager suffix | `branch_notifier.dart`, `auth_controller.dart`, `crud_bloc.dart` |
| Constants | `snake_case` + `_constants` suffix optional | `action_labels.dart`, `navigation.dart`, `auth_constants.dart` |
| Services | `snake_case` + `_service` suffix | `auth_service.dart`, `api_service.dart` |
| Models | `snake_case` + `_model` suffix | `branch_model.dart`, `user_model.dart` |
| Utils | `snake_case` | `date_formatter.dart`, `validators.dart` |
| Config files | `snake_case` or standard config style | `pubspec.yaml`, `analysis_options.yaml` |

---

## Widget (Component) Naming

### Screen Widgets (Pages)

```dart
class <Domain>Screen extends StatelessWidget {}

```

* Example: `BranchScreen`, `LoginScreen`, `SettingsScreen`, `LeadPurposeScreen`
* Each route gets exactly one screen widget.
* Located in `features/<feature>/screens/<feature>_screen.dart`

### Shared Widgets

```dart
class <Category><Purpose> extends StatelessWidget {}

```

* Example: `AdminTable`, `AdminFormDrawer`, `PageHeader`, `DashboardLayout`
* Located in `core/widgets/<category>/` or `shared/widgets/<category>/`

### Feature Widgets

```dart
class <Feature><SpecificPurpose> extends StatelessWidget {}

```

* Example: Feature-specific widgets nested under `features/<feature>/widgets/`

---

## State Management & Logic Naming (Replacing Hooks)

Flutter uses State Management (Riverpod, BLoC, Cubit, or ChangeNotifier) instead of React Hooks.

```
<Domain><Pattern>

```

* `CrudNotifier` or `CrudBloc` — Full CRUD state management
* `SearchFilterController` — Search/filter logic
* `TablePaginationNotifier` — Pagination state

### State Rules

* Feature-specific state/controllers live in `features/<feature>/controllers/` or `features/<feature>/providers/`
* Global shared state lives in `core/providers/` or `shared/controllers/`

---

## Constant Naming

### Enum-like & Class Constants

> 📌 **Dart Rule:** Dart prefers `camelCase` for constant identifiers within classes or enums, but `UPPER_SNAKE_CASE` is acceptable if migrating legacy mindsets. Standard Dart linting enforces `camelCase`.

```dart
// Preferred Dart Style
abstract class AuthRoutes {
  static const login = '/login';
  static const forgotPassword = '/forgot-password';
  static const resetPassword = '/reset-password';
  static const dashboard = '/dashboard';
}

abstract class AuthStorageKeys {
  static const token = 'crm_token';
  static const user = 'crm_user';
}

enum Status { active, inactive, pending }

```

### Configuration Constants

```dart
const defaultRowsPerPage = 10;
const rowsOptions = [10, 20, 50, 100];

```

---

## Model & Data Naming

### Models (Replacing Interfaces/Types)

```dart
class <Domain>Model {}

```

```dart
class BranchModel {
  final int id;
  final String name;
  final String createdBy;
  final String status;

  const BranchModel({
    required this.id,
    required this.name,
    required this.createdBy,
    required this.status,
  });
}

```

### Form/Configuration Data

```dart
class FormFieldConfig {
  final String name;
  final String label;
  final String type;
  final bool isRequired;
  final String? placeholder;

  const FormFieldConfig({
    required this.name,
    required this.label,
    required this.type,
    this.isRequired = false,
    this.placeholder,
  });
}

```

---

## Identifier Naming

| Identifier | Convention | Example |
| --- | --- | --- |
| Variables | `camelCase` | `final filteredData = ...` |
| Functions / Methods | `camelCase` | `void handleSave()` |
| Parameters | `camelCase` | `(BranchModel item)` |
| Classes / Mixins | `PascalCase` | `class AdminTable extends ...` |
| Private variables/methods | `_camelCase` (prefix with underscore) | `final _isLoading = false;` |
| Event handlers | `camelCase` + `on` or `handle` prefix | `onAddTap`, `handleSave`, `onDeletePressed` |
| Boolean vars | `is`/`has`/`should` prefix | `isAuthenticated`, `hasPermission`, `shouldShow` |

---

## Import Order Convention

Flutter uses `flutter format` and standard linter sorting, which organizes imports into three distinct groups separated by blank lines.

```
1. Flutter / Dart core packages
2. Third-party packages (dio, flutter_riverpod, google_fonts, etc.)
3. Project absolute/relative imports (models, widgets, controllers)

```

```dart
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:your_app/core/widgets/page_header.dart';
import 'package:your_app/features/branch/widgets/admin_table.dart';
import '../constants/branch_constants.dart';

```