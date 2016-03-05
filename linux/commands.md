Get a complete list of packages for use in scripts.

```
dpkg --get-selections | cut -f1
```

Find all installed packages that aren't required.

```
dpkg -s $(dpkg --get-selections | cut -f1) | \
  grep --regex "Priority: [^r]" -B 2 -A 8 | \
  grep --regex "Depends\|Priority\|Package"
```
