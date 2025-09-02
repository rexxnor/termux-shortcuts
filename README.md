# Termux Helpful Scripts

> [!HELPFUL]
> This repository contains some snippets of code to enable applications and
> switch to an important view, then watch for the end of an activity to freeze
> the app again.

## SBB Mobile

Does not use traditional views and instead uses a dictionary and the main view
with parameters. To launch an activity with the correct tab selected the flags
`0x10000000` needs to be specified.

```bash
am start \
    -n ch.sbb.mobile.android.b2c/ch.sbb.mobile.android.vnext.main.MainActivity # component name
    -a ch.sbb.mobile.android.b2c_TAB                                           # action name
    --ei ch.sbb.mobile.android.b2c_FANCY_TAB 3                                 # value of tab selector
    -f 0x10000000                                                              # required flag 
```

Overall the following flags exist:


| **Flag Option**                          | **Description**                                                                                     | **Hexadecimal Value** |
|------------------------------------------|-----------------------------------------------------------------------------------------------------|------------------------|
| **FLAG_ACTIVITY_NEW_TASK**               | Starts the activity in a new task.                                                                  | **0x10000000**         |
| **FLAG_ACTIVITY_CLEAR_TOP**              | If the activity is already running, all activities on top will be closed.                          | **0x20000000**         |
| **FLAG_ACTIVITY_SINGLE_TOP**             | If the activity is at the top of the stack, it will receive the intent instead of being launched again. | **0x04000000**         |
| **FLAG_ACTIVITY_CLEAR_TASK**             | Clears any existing task associated with the activity before launching it.                         | **0x00008000**         |
| **FLAG_ACTIVITY_NEW_DOCUMENT**           | Starts a new document in a new task.                                                                | **0x00040000**         |
| **FLAG_ACTIVITY_MULTIPLE_TASK**          | Allows multiple instances of the same activity to be created.                                       | **0x00020000**         |
| **FLAG_ACTIVITY_REORDER_TO_FRONT**       | Moves the existing instance of the activity to the front of the task.                              | **0x00000002**         |
| **FLAG_ACTIVITY_NO_HISTORY**             | The activity will not be kept in the history stack.                                                | **0x00000001**         |
| **FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS**   | The activity will not appear in the list of recent activities.                                     | **0x00000800**         |
| **FLAG_ACTIVITY_LAUNCHED_FROM_HISTORY**  | Indicates that the activity is being launched from the history stack.                              | **0x00001000**         |
| **FLAG_ACTIVITY_RESET_TASK_IF_NEEDED**   | If the activity is being launched in a new task, it will reset the task if needed.                 | **0x00004000**         |
| **FLAG_ACTIVITY_CLEAR_WHEN_TASK_RESET**  | If the task is reset, the activity will be cleared.                                               | **0x00002000**         |

We just need to specify the new task values.
