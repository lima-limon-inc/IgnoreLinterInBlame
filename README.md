# Formateador de Java
Pequeno shell script que te formatea el codigo java usando la herramienta (astyle). 
Ademas, te anade los hashes del commit de formateo a git-blame-ignore-revs para que puedas usar git blame tranquilo. 

Podes pasar la flag que te ignore los commits cada vez que corres el `git blame` o podes configurarlo para que lo haga automaticamente:
```console
git config --global blame.ignoreRevsFile .git-blame-ignore-revs
```

Asegurate de correrlo a la misma altura de donde se encuentra la carpeta `.git`
