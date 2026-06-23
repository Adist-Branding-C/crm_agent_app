feat(tasks): implement task filtering on Tasks screen

- Add filter button next to the plus button in TasksHeader.
- Implement filter modal bottom sheet displaying choices for:
  - Task Type (multi-select choice chips)
  - Date Range (Today, Tomorrow, Last Week, and Custom date pickers)
  - Priority selectors with ColoredDot indicators (High, Medium, Low)
- Introduce a 'dueDate' DateTime field to the Task model to enable precise date range filtering.
- Update repository mock data to instantiate tasks with valid DateTime objects.
- Decompose UI widgets into small sub-components to strictly respect the 80-line file length limit.