# IgnoreLinterInBlame

Pequeno shell script pensado para que git ignore los commits que implicaron formateo.
Despues de ejecutar el comando pasado como argumento (el formateador), el script crea un archivo `.git-blame-ignore-revs` con
el historial de los hashes, su autor y la fecha.
Asi, podes usar el git blame sin que el formateador "corrompa" el historial.

Antes de correr el script, tenes que correr el siguiente comando. Esto le dice a git de ignorar los commits presentes en el archivo `.git-blame-ignore-revs`.
```console
git config --local blame.ignoreRevsFile .git-blame-ignore-revs
```


Ejemplo de uso del sctipt clang format (para c++):
```console
formatear.sh "clang-format --style=file -i *.cpp *.h"
```

Output:
```
Formatee 8 archivos
Hago el commit de los archivos formateos
[main 85da88e] Commit de formateo, nada de codigo cambiando
 8 files changed, 272 insertions(+), 280 deletions(-)
Hago el commit de lo anadido al archivo .git-blame-ignore-revs
[main 87a3add] Anado hash a .git-blame-ignore-revs
 1 file changed, 3 insertions(+)
 create mode 100644 .git-blame-ignore-revs`
```

PS: Si el script detecta que nada fue formateado, no realiza ningun commit
