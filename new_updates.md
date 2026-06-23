feat(tasks): implement task filtering on Tasks screen
view : https://drive.google.com/file/d/1lhKkNWGo7PZ27JXittTUxo2tIJHT0gTM/view?usp=sharing

- Add filter button next to the plus button in TasksHeader.
- Implement filter modal bottom sheet displaying choices for:
  - Task Type (multi-select choice chips)
  - Date Range (Today, Tomorrow, Last Week, and Custom date pickers)
  - Priority selectors with ColoredDot indicators (High, Medium, Low)
- Introduce a 'dueDate' DateTime field to the Task model to enable precise date range filtering.
- Update repository mock data to instantiate tasks with valid DateTime objects.
- Decompose UI widgets into small sub-components to strictly respect the 80-line file length limit.

feat(theme): implement responsive text sizing across all screens

Add width-proportional text scaling infrastructure and migrate all
hardcoded TextStyle(fontSize:) to theme-driven responsive sizes.

Infrastructure:
  - Create AppTextScaler utility (referenceWidth=375, clamp 0.8-1.2)
  - Create ScaledText extension on BuildContext for context.scaleFont()
  - Add scaledTextTheme(context) to AppTextTheme with 6 scaled styles
  - Add scaled variants for button, input, and appBar themes
  - Add scaledLightTheme(context) to AppTheme assembling all sub-themes
  - Apply scaled theme in MaterialApp.router builder via Theme widget
  - Add scaleText flag to MyApp for test opt-out

Migration (~80 files):
  - Replace all hardcoded fontSize: values in shared widgets (17 files)
  - Replace all hardcoded fontSize: in feature widgets (23 screens, ~60 files)
  - Remove fontSize overrides from Theme.of(context).copyWith() calls
  - Fix Row overflow in DealPipelineStageHeader with Flexible widget

Testing:
  - Fix test helper to pass scaleText: false to prevent off-screen issues
  - All 42 tests pass, flutter analyze clean
  - No file exceeds 80-line limit

  fix(attendance): resolve ProviderNotFoundException for AttendanceBloc

- Register AttendanceBloc globally in buildBlocProviders so it is available to the DashboardHeader.
- Remove duplicate local BlocProvider from AttendanceScreen to inherit the global bloc context.
- Trigger LoadAttendance immediately on startup to initialize status indicators.