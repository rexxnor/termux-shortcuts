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


The flags are all documented in the [Android API reference](https://developer.android.com/reference/android/content/Intent#FLAG_ACTIVITY_BROUGHT_TO_FRONT)

| **Flag Option**                          | **Description**                                                                                     | **Hexadecimal Value** |
|------------------------------------------|-----------------------------------------------------------------------------------------------------|------------------------|
| **FLAG_ACTIVITY_NEW_TASK**               | Starts the activity in a new task.                                                                  | **0x10000000**         |
| **FLAG_ACTIVITY_CLEAR_TOP**              | If the activity is already running, all activities on top will be closed.                          | **0x04000000**         |
| **FLAG_ACTIVITY_SINGLE_TOP**             | If the activity is at the top of the stack, it will receive the intent instead of being launched again. | **0x20000000**         |
| **FLAG_ACTIVITY_CLEAR_TASK**             | Clears any existing task associated with the activity before launching it.                         | **0x00080000**         |

We just need to specify the new task flag. 

> [!HELPFUL]
> Installing can be done by copying the script into `~/.shortcuts/` and then
> run via the `Termux:Widget` app. 
