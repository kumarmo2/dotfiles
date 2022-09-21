### Better Man Pages
    - [Makier](https://www.mankier.com/)


### suspend/hibernate
    - suspend/hibernate sometimes goes to a black screen. Run below commands in that case. [Source](https://bbs.archlinux.org/viewtopic.php?id=271933)
        ```
        $ sudo systemctl disable nvidia-{resume,hibernate,suspend}.service
        $ sudo systemctl stop nvidia-{resume,hibernate,suspend}.service  # for good measure, although they should be stopped
        ```

### User management
    - 
