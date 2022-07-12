## jobvalley Domain Events

Dieses Repository enthält alle Domain Events die für Geschäftsprozesse bei jobvalley relevant sind.

## Erklärung der Events und Anleitung zum Erstellen eines Events

https://github.com/STUDITEMPS/domain-events/wiki

## Automatische Systemlandschaft

![Systemlandschaft](/docs/system_landscape/overview_landscape.svg)

## Integrations Beispiele

### Git Subtree (aktuell für alle Teams die beste Lösung)

Bsp. für `spec/fixtures/domain-events`:  Fügt das gesamte repo in `spec/fixtures/domain-events` hinzu.
Dabei darf `spec/fixtures/domain-events` nicht existieren (ggf. gelöschter Ordner muß auch gepushed sein).

```
git subtree add --prefix spec/fixtures/domain-events https://github.com/STUDITEMPS/domain-events.git main --squash -m "[Update] Pulls domain events."
```
Damit liegen die Dateien dann im Repo. Um das zu updaten, macht man den gleichen befehl mit einem pull. Phteinpferd hat dafür zum Beispiel ein Script hinterlegt im Repo:

```
▶ cat bin/pull-domain-events
#!/bin/sh

git subtree pull --prefix spec/fixtures/domain-events https://github.com/STUDITEMPS/domain-events.git main --squash -m "[Update] Pulls domain events."
```

Das Updaten sollte immer aus dem main Branch passieren.


### Git Subrepo

Siehe auch https://github.com/ingydotnet/git-subrepo

- Code liegt im "Container" Repo und das Script sorgt dafür das die Daten ausgetauscht werden.
- Solange man nichts mit den Events macht muß man nichtmal wissen das es ein "subrepo" ist.

```
# Clonen der Events in ein Verzeichnis
git subrepo clone https://github.com/STUDITEMPS/domain-events.git spec/fixtures/domain-events

# Updaten mit Änderungen (am besten in develop oder man bekommt nach dem Merge den unteren Fehler.)
git subrepo pull spec/fixtures/domain-events

# Nachdem man Änderungen im "Container" Repo commited hat.
git subrepo push spec/fixtures/domain-events
```

#### Known Problems

Es kann ab und zu mal passieren das man so einen Fehler bekommt: (Siehe auch: https://github.com/ingydotnet/git-subrepo/issues/348)

```
git-subrepo: Command failed: 'git branch subrepo/spec/fixtures/domain-events '.
fatal: Not a valid object name: ''.
```
Die einfachste Lösung ist in `spec/fixtures/domain-events/.gitrepo` den `parent` zu ändern.
Beim `parent` handelt es sich um einen SHA aus dem aktuellen Repo. Ich nehm einfach den aktuellen aus meinem Branch und das hat bis jetzt geklappt.

### Git Submodules

https://medium.com/@porteneuve/mastering-git-submodules-34c65e940407

