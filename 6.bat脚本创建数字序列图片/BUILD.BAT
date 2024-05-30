FOR /D %%d IN (*) DO (
    CD "%%d"
    DEL *.png
    "%%d.bat" >"BUILD.LOG" 2>&1
    CD ..
)