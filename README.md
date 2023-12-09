# Install QRes
It's included in the repository but you can download it from [here](https://www.majorgeeks.com/files/details/qres.html) if you don't trust me (fair enough).

# Edit the script
Find the two calls to QRes:

```ExecuteCommand "C:\Windows\System32\QRes.exe /r:60"```

Change QRes.exe path and parameters as needed.

# Place the script in some startup folder

I personally use:
```C:\Users\YOUR_USER_NAME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup```

There are some other Startup folders in windows you may consider.