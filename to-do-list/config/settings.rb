module Settings 
  TASK_STATUS = {
    new: 0,
    in_progress: 1,
    done: 2
  }

  OUTPUT_MESSAGES = {
    task_created: "Task '%s' created successfully",
    task_completed: "Task '%s' marked as completed",
    task_in_progress: "Task '%s' marked as in progress",
    task_not_found: "Task '%s' not found. Did you write it correctly?",
    invalid_option: "Invalid option"
  }

  MENU_OPTIONS = {
    add_task: "1. Add new task",
    mark_completed: "2. Mark task as 'Completed'",
    mark_in_progress: "3. Mark task as 'In progress'",
    view_tasks: "4. View tasks",
    exit: "5. Exit"
  }



end