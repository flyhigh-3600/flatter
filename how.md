This file explains how the code is structured.

# General flutter stuff
Flutter is made to work on all devices. That's why there is a directory for each os.

In these directories is platform specific code and other stuff. With a really basic flutter app, you don't have to write into these directories.

Most of the relevant code and all of the cross-platform code is inside of the lib directory.

# Structure
| Directory    | What's inside?                                                                     |
|--------------|------------------------------------------------------------------------------------|
| assets       | Assets                                                                             | 
| home         | All UI (except settings)                                                           |
| player       | Player logic<br/>Player (& queue) control logic<br/>Audio Activity & Session logic |
| Repositories | SSOT of Queue                                                                      |
| Riverpod     | ALl Riverpod logic (State management)                                              |
| Services     | All network request logic (currently only Subsonic Service)                        |
| settings     | Settings logic<br/>Settings UI                                                     |
| storage      | Database logic                                                                     |
