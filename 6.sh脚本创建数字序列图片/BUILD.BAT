FOR /D %%d IN (*) DO (
    CD "%%d"
    DEL *.png
    "BUILD.bat"
    CD ..
)