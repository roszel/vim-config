# GitHub Repository + SSH kulcs beállítás

## Cél

HTTPS helyett SSH kulccsal szeretnénk GitHub-ra push-olni, hogy ne kérjen
jelszót vagy PAT (Personal Access Token [személyes hozzáférési token]) minden alkalommal.

---

# 1. Ellenőrzés: van-e már SSH kulcs?

```bash
eza -la ~/.ssh
```

Ha látsz ilyet:

```text
id_ed25519
id_ed25519.pub
```

akkor már van kulcsod.

Ha csak ez van:

```text
known_hosts
known_hosts.old
```

akkor még nincs.

---

# 2. SSH kulcs generálása

```bash
ssh-keygen -t ed25519 -C "roszel@t495"
```

Példa:

```text
Generating public/private ed25519 key pair.
Enter file in which to save the key:
/home/roszel/.ssh/id_ed25519
```

Nyomj Entert.

Ha passphrase-t kér:

```text
Enter passphrase:
```

adhatsz meg jelszót vagy hagyhatod üresen.

---

# 3. Ellenőrzés

```bash
eza -la ~/.ssh
```

Elvárt eredmény:

```text
id_ed25519
id_ed25519.pub
known_hosts
known_hosts.old
```

---

# 4. Public key megjelenítése

```bash
cat ~/.ssh/id_ed25519.pub
```

Példa:

```text
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAA... roszel@t495
```

Az EGÉSZ sort másold ki.

---

# 5. Kulcs felvétele GitHub-on

GitHub:

Settings # NEM project-szintű Settings, hanem /user/setting

↓

SSH and GPG keys

↓

New SSH key

Title:

```text
FreeBSD_t495
```

Key:

```text
ssh-ed25519 AAAA....
```

↓

Add SSH key

---

# 6. Kapcsolat tesztelése

```bash
ssh -T git@github.com
```

Első alkalommal:

```text
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```

válasz:

```text
yes
```

Siker esetén:

```text
Hi roszel! You've successfully authenticated,
but GitHub does not provide shell access.
```

---

# 7. Repository létrehozása GitHub-on

GitHub weboldalon:

```text
New Repository
```

Például:

```text
vim-config
```

---

# 8. Lokális repository inicializálása

Projektkönyvtárban:

```bash
git init
git branch -M main
```

---

# 9. Első commit

```bash
git add .
git commit -m "Initial commit"
```

---

# 10. GitHub remote hozzáadása (SSH)

Új repository esetén:

```bash
git remote add origin git@github.com:roszel/vim-config.git
```
# és NEM HTML-alapú: 
# git remote add origin https://github.com/yourusername/projectname.git

---
                                           ^
# 11. Ha véletlenül HTTPS remote került be |

Ellenőrzés:

```bash
git remote -v
```

Ha ezt látod:

```text
https://github.com/roszel/vim-config.git
```

akkor cseréld: kuk@cossra

```bash
git remote set-url origin git@github.com:roszel/vim-config.git
```

Ismét ellenőrizd:

```bash
git remote -v
```

Most már ezt kell mutatnia:

```text
origin  git@github.com:roszel/vim-config.git
origin  git@github.com:roszel/vim-config.git
```

---

# 12. Első push

```bash
git push -u origin main
```

Siker esetén:

```text
[new branch] main -> main
branch 'main' set up to track 'origin/main'
```

---

# Napi használat

## Állapot

```bash
git status
```

## Új fájlok hozzáadása

```bash
git add .
```

## Commit

```bash
git commit -m "Rövid leírás"
```

## Feltöltés GitHub-ra

```bash
git push
```

## Frissítés GitHub-ról

```bash
git pull
```

---

# Hasznos hibakeresés

## Kapcsolat teszt

```bash
ssh -T git@github.com
```

## Remote URL ellenőrzés

```bash
git remote -v
```

## Aktuális branch

```bash
git branch
```

## Commit előzmények

```bash
git log --oneline
```

---

# Sikeres állapot

Ha ez működik:

```bash
ssh -T git@github.com
```

és ezt mutatja:

```text
Hi roszel! You've successfully authenticated...
```

valamint:

```bash
git push
```

nem kér jelszót,

akkor az SSH alapú GitHub kapcsolat helyesen van beállítva.
